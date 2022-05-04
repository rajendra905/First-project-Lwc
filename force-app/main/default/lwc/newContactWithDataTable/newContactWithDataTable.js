import { LightningElement, wire,track } from 'lwc';
import getContactList from '@salesforce/apex/newContactWithDataTableController.getContactList';
import searchContactList from '@salesforce/apex/newContactWithDataTableController.searchContactList';
export default class NewContactWithDataTable extends LightningElement {
    
    @track conData;
    @track allContactData;
    enableSearchButton = true;
    columnTable = [
        {label:'Name',fieldName:'Name',type:'text'},
       {label:'Name',fieldName:'AccountName',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'phone'},
        {label:'Industry',fieldName:'Email',type:'Email'},
    ];
    @wire(getContactList)
    
    dataTableAcc({data, error}){
         if(data){
            this.conData = data.map(row=>{
               console.log('outpUt',row);
            return{...row, AccountName: row.Account!=undefined ? row.Account.Name : ''}
            });
            this.allContactData = this.conData;
        }
    }

    handelChangeInput(event){
        //console.log(event.keyCode);
        //console.log(event.target.value);
        let inputValue = event.target.value;
        if(inputValue.length == 0){
            this.conData = this.allContactData;
            this.enableSearchButton = true;
        }else{
            this.enableSearchButton = false;
        }

        // }else if(event.keyCode === 13){
        //     console.log('Hii');
        //     handelSearchContact();
        // }

    }
    handelSearchContact(){
        let getText = this.template.querySelector('.inputText').value;
        searchContactList({
            textValue: getText
        }).then(result => {
            console.log('result',result);
            this.conData = result;
        })
        .catch(error =>{
        
        });
    }
}