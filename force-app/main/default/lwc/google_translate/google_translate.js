import { LightningElement,wire } from 'lwc';
import getLanguage from '@salesforce/apex/GoogleTranslateApi.getLanguage';
import getTranslate from '@salesforce/apex/GoogleTranslateApi.getTranslate';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class Google_translate extends LightningElement {
          languageOption = [];
          selectedLanguage;
          translateText;
          enterText = true;
          
          @wire(getLanguage) getLanguage({data, error}){
                    if(data){
                              console.log('data',data);
                              for(var lang in data){
                                                            this.languageOption = [...this.languageOption,{
                                                                                          label :data[lang].name,
                                                                                          value :data[lang].language
                                                                                }]
                                                  }
                    }else if(error) {
                              console.log('error ',error)
                    }
          }

          handelLanguage(event){
                   this.selectedLanguage = event.target.value;
          }

          handelTranslate(){
                    var text = this.template.querySelector('.forInput').value;
                    console.log(text); 
                    if(text != ''){
                              getTranslate({
                                        word : text,
                                        target : this.selectedLanguage
                              }).then(result => {
                                       this.translateText = result.translatedText;
                              }).catch(error => {
                                        console.log('error',error);
                                        const toastEvent = new ShowToastEvent({
                                                  title   : 'Google Translate',
                                                  message : error.body.message,
                                                  stacktrace : error.body.stackTrace,
                                                  variant : 'warning',
                                              })
                                              this.dispatchEvent(toastEvent);
                              });
                    }else{
                              const toastEvent = new ShowToastEvent({
                                        title   : 'Google Translate',
                                        message : 'Please enter the text',
                                        variant : 'warning',
                                    })
                                    this.dispatchEvent(toastEvent);
                    }
          }

          hnadelSelectedLanguge(){
                    this.enterText = false ; 
          }

}