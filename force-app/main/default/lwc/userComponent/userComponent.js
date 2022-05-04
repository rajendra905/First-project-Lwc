import {LightningElement, track} from 'lwc';
import getUserList from '@salesforce/apex/UserComponentController.getUserList';
import fetchUsersTask from '@salesforce/apex/UserComponentController.fetchUsersTask';
export default class UserComponent extends LightningElement {
          userListData = [];
          @track initialRecords;
          @track searchText;
          isTask = false;
          allTaskList;
          userId;
          //******Connected call Back using when page load ******/
          connectedCallback() {
                    this.getUpdatedUser();
          }
          //*******Get user List with realted task detail *******/
          getUpdatedUser() {
                    getUserList().then(data => {
                              console.log('hiii', data);
                              this.userListData = data;
                              this.initialRecords = this.userListData;
                    }).catch(error => {});
          }
          //******Serarch user List By Name and Email ******/
          handleUser() {
                    this.searchText = this.template.querySelector('.forInputName').value.toLowerCase();
                    if (this.searchText) {
                              this.userListData = this.userListData.filter(user => user.userDetail.Name.toLowerCase().indexOf(this.searchText) !== -1 || user.userDetail.Email.toLowerCase().indexOf(this.searchText) !== -1)
                    } else {
                              this.userListData = this.initialRecords;
                    }
          }
          // *********** Refresh user List ****//////
          handleRefresh() {
                    this.searchText = ' ';
                    console.log('handel refresh');
                    //this.getUpdatedUser();
                    this.showTaskRefreshDetails();
                    
          }

          handleTaskList(event) {
                    console.log('jiiii%%%%%%', event.detail);
                    this.userId = event.detail;
                    this.showTaskRefreshDetails();
                    

                    
          }
          showTaskRefreshDetails(){
                    console.log('showTaskRefreshDetails');
                    fetchUsersTask({
                              userId: this.userId
                    })
                    .then(result => {
                              this.allTaskList = result;
                              this.taskChecked = false;
                              this.allTaskList.forEach((task) => {
                                        task.CreatedDate = new Date(task.CreatedDate).toDateString()
                                        if (task.IsClosed == false) {
                                                  task.showCheckbox = true;
                                                  task.rowSelected = 'whiteBackground';
                                        } else {
                                                  task.showCheckbox = false;
                                                  task.rowSelected = 'blueBackground';
                                        }
                              })
                              this.error = undefined;
                              this.isTask = true;
                    })
                    .catch(error => {
                              console.log('error', error)
                    });
          }

          handleClose(){
                    this.isTask = false
                    this.getUpdatedUser();
                }
}