import {LightningElement, api} from 'lwc';
import addTask from '@salesforce/apex/UserComponentController.addTask';
import taskDelete from '@salesforce/apex/UserComponentController.taskDelete';
import completeTask from '@salesforce/apex/UserComponentController.completeTask';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class TaskListDialogBox extends LightningElement {
    @api alltasklist;
    @api usersdata;
    @api userid;
    ///*******Add Task Method*****///
    handleTaskAdd() {
        console.log('hiii i am handleTask',this.userid);
        var subject = this.template.querySelector(".inputSubject").value;
        if (subject != '') {
            var task = {
                Subject: subject,
                OwnerId: this.userid,
            }
            addTask({newTask: task}).then(result => {
                    if (result == 'success') {
                        const toastEvent = new ShowToastEvent({
                            title   : 'Record',
                            message : 'Task Add SuccessFully ',
                            variant : 'success',
                        })
                        this.dispatchEvent(toastEvent);
                        this.dispatchEvent(new CustomEvent('refreshtasklist'));
                    } else {
                        console.log('error');
                    }
                })
                .catch(error => {
                    console.log('error', error)
                });
        } else {
            const toastEvent = new ShowToastEvent({
                title   : ' Task Subject',
                message : 'Please Fill subject',
                variant : 'warning',
            })
            this.dispatchEvent(toastEvent);
        }
    }

    ///*******Delete Task Method*****///
    handleTaskDelete(event) {
        taskDelete({
                taskId : event.target.value
            })
            .then(result => {
                const toastEvent = new ShowToastEvent({
                    title   : 'Record Deleted',
                    message : 'Task Deleted',
                    variant : 'error',
                })
                this.dispatchEvent(toastEvent);
                this.dispatchEvent(new CustomEvent('refreshtasklist'));
            })
            .catch(error => {
                console.log('error', error)
            });
    }

    ///*******Completed Task Method*****///
    handleTaskComplete(event) {
        completeTask({
                Id : event.target.value
            })
            .then(task => {
                const toastEvent = new ShowToastEvent({
                    title   : 'Record',
                    message : 'Task Completed',
                    variant : 'success',
                })
                this.dispatchEvent(toastEvent);

                ///*******Task List Refresh Method*****///
                this.dispatchEvent(new CustomEvent('refreshtasklist'));
            }).catch(error => {
                window.console.log('Error >>>> ' + error.body.message);
            })
    } 

    ///*******Task Model Close Method*****///
    isTaskClose() {
        this.dispatchEvent(new CustomEvent('closemodel'));
    }

    ///*******Description tool Method*****///
    handleMouse() {
        ('[data-toggle="tooltip"]').tooltip();
    }

}