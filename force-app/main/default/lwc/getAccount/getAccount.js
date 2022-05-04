import {LightningElement,api} from 'lwc';
import getAccountList from '@salesforce/apex/DeveloperTestApexController.getAccountList';
// import communityId from '@salesforce/community/Id';
export default class GetAccount extends LightningElement {
          accountList = [];
          @api flexipageRegionWidth;
          accountListShow = false;
          connectedCallback(){
           
          //    if(communityId.length > 0){
          //           this.flexipageRegionWidth = 'community';
          //    }
             console.log('flexipageRegionWidth', this.flexipageRegionWidth);
          }

          handleAccounts() {
                    getAccountList().then(result => {
                              if (result) {
                                        this.accountList = result;

                                        if (this.accountList.length > 0) {
                                                  this.accountListShow = true;
                                        } else {
                                                  this.accountListShow = false;
                                        }
                                        
                              }
                    }).catch();
          }
}