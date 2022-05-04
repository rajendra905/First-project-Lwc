import { LightningElement,wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';
import { reduceErrors } from 'c/ldsUtils';
/*import FirstName_FIELD from '@salesforce/schema/Contact.FirstName';
import LastName_FIELD from '@salesforce/schema/Contact.LastName';
import Email_FIELD from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';

const COLUMNS = [
          { label: 'First Name', fieldName: FirstName_FIELD.fieldApiName, type: 'text' },
          { label: 'Last Revenue', fieldName: LastName_FIELD.fieldApiName, type: 'text' },
          { label: 'Email', fieldName: Email_FIELD.fieldApiName, type: 'Email' }
      ];
*/
export default class ContactList extends LightningElement {
         /* columns = COLUMNS;
    @wire(getContacts)
    contacts;*/
    @wire(getContactList)
    contacts;

    get errors() {
        return this.contacts.error ? reduceErrors(this.contacts.error) : [];
    }
    
}