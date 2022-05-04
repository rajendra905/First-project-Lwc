import { LightningElement, api, wire } from 'lwc';
import { fireEvent, registerListener } from 'c/pubSub';
import NOIMAGE from '@salesforce/resourceUrl/NoImage';
import { CurrentPageReference } from 'lightning/navigation';
export default class ProductChildComponent extends LightningElement {
          @api productdata;
          noImage = NOIMAGE;
          @wire(CurrentPageReference) pageRef;
          handelProduct(){
                    console.log(this.productdata.Id);
                    //fireEvent(this.pageRef,"sendProductDetail",this.productdata);
          }
          
}