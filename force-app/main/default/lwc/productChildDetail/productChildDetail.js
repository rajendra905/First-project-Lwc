import { LightningElement, wire } from 'lwc';
import { registerListener } from 'c/pubSub';
import { CurrentPageReference } from 'lightning/navigation';
export default class ProductChildDetail extends LightningElement {

          @wire(CurrentPageReference) pageRef;
          productData;
          productDetailShow = false;
          connectedCallback() {
                    registerListener("sendProductDetail",this.productDetail,this);        
                }
                
          productDetail(data){
                    this.productData = JSON.parse(JSON.stringify(data));
                    this.productDetailShow = true; 
          } 
}