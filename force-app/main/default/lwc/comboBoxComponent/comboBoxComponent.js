import { LightningElement, wire } from 'lwc';
import getCityName from '@salesforce/apex/ContactControllerLWC.getCityName';
import allcontactList from '@salesforce/apex/ContactControllerLWC.allcontactList';

export default class ComboBoxComponent extends LightningElement {
          contactCity;
          contactList;
          detailContact;
          cityNames=[];
          getCityNameValue;
          allDetailContact = true;
          singleData = false;
          @wire(getCityName) contactCity;
          @wire(allcontactList) detailContact;


          get getCityNames(){
                    this.cityNames=[];
                    for(var city in this.contactCity.data){
                              this.cityNames = [...this.cityNames,{
                                        label : this.contactCity.data[city].MailingCity,
                                        value : this.contactCity.data[city].MailingCity
                              }]

                    }
                    return this.cityNames
          }
          handelCityName(event){
                    
                    alert(event.target.value);
                    var cityName = event.target.value;
                    if (cityName) {
                              this.contactList = this.detailContact.data.filter(contact =>contact.MailingCity.indexOf(event.target.value) !== -1)
                    }
                    this.singleData = true;
                    this.allDetailContact = false;
                   
          }
}