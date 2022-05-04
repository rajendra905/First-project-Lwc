import { LightningElement } from 'lwc';

export default class TaskNew31 extends LightningElement {
          textBoxValue;
          Result;
          firstValue;
          secondValue;
          handleClick(event){
                    let btnName =  event.target.dataset.name;
                    console.log('OUTPUT : ',btnName);
                    let firstName = this.template.querySelector('.firstName').value;
                    let lastName = this.template.querySelector('.secondName').value;
                   let date = new Date();
                   this.Result = firstName + lastName;
                   console.log('OUTPUT : ',this.Result+date);

          }
}