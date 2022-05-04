import {LightningElement, api, track} from 'lwc';
import fetchUsersTask from '@salesforce/apex/UserComponentController.fetchUsersTask';

export default class TaskComponent extends LightningElement {
    @api userdata;
    handleTask() { 
        this.dispatchEvent(new CustomEvent('taskdetail', {
            detail  : this.userdata.userDetail.Id,
        }));
    }
}