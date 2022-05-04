import {
          LightningElement,
          api,
          wire
} from 'lwc';
import getFieldAndRecords from '@salesforce/apex/FieldsetCustomTableController.getFieldAndRecords';
export default class NewTestingCom extends LightningElement {
          @api recordId;
          @api SFDCobjectApiName;
          @api fieldSetName;
          columns;
          tableData;

          connectedCallback() {

                    let firstFieldAPI;
                    console.log('Hiii',this.SFDCobjectApiName);
                    getFieldAndRecords({
                                        objectApiName: this.SFDCobjectApiName,
                                        fieldSetName: this.fieldSetName
                              }) // calling to fetch records
                              .then(data => {
                                        //get the entire map
                                        let objStr = JSON.parse(data);
                                        let listOfFields = JSON.parse(Object.values(objStr)[1]); // getting 1st feild from object
                                        let listOfRecords = JSON.parse(Object.values(objStr)[0]); // getting record from objrct database

                                        let items = [];
                                        listOfFields.map(element => {
                                                  firstFieldAPI = element.fieldPath;
                                                  items = [...items, {
                                                            label: element.label, // getting path and name of the feilds in item variable
                                                            fieldName: element.fieldPath
                                                  }];

                                        });
                                        this.columns = items;
                                        this.tableData = listOfRecords;

                                        console.log('listOfRecords and fields', listOfRecords);

                                        this.tableData = listOfRecords.map(item => {
                                                  this.SFDCobjectApiName + '/' + item.Id + '/view'; //getting path and data from object database 
                                                  return {
                                                            ...item
                                                  };
                                        });
                                        this.tableData = this.tableData.filter(item => item.fieldPath != firstFieldAPI);

                                        console.log('WHAT KIND OF DATA', this.tableData);
                              })
                              .catch(error => {
                                        this.error = error; //if error is there means no data is assingend to tabledata that means no records will appear  
                                        console.log('error', error);
                                        this.tableData = undefined;

                              })
          }
}