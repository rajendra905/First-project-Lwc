import { LightningElement, wire, track } from 'lwc';
import getProductList from '@salesforce/apex/productController.getProductList';

export default class ProductParentComponent extends LightningElement {
          @track productList;
          @wire(getProductList)
          getProductData({error, data}){
                    if(data){
                              this.productList = data;
                              
                    }else if(error) {
                              console.log('error',error);
                    }

          };

          handelProductName(event){
                    let name = event.currentTarget.dataset.productname;
                    alert(name);
          }
}