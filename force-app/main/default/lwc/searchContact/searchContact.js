import { LightningElement,wire } from 'lwc';
import allcontactList from '@salesforce/apex/ContactSearchController.allcontactList';
import contactList from '@salesforce/apex/ContactSearchController.contactList';


export default class SearchContact extends LightningElement {

          limitvalue = '100';
          allcontactdata;

          @wire(allcontactList) getContactList({error, data}){
                    this.allcontactdata=data;
                    console.log(this.allcontactdata);
                   
                    if(data ) {
                              this.allcontactdata = data;
                             
                            }
                    else{ console.log("##",error); }
          }
          get limitOptions() {
                    return[
                        {label:'5',value:'5'},
                        {label:'10',value:'10'},
                        {label:'15',value:'15'},
                        {label:'20',value:'20'},
                        {label:'100',value:'100'}
                    ]
                };

          handleonoption(event){
                    this.limitvalue=event.target.value;
                    //console.log('@@'+this.record);
                    contactList({recordLimit : this.limitvalue}).then((result) => {
                        this.allcontactdata=result;
                    }).catch({
            
                    });
          }
}