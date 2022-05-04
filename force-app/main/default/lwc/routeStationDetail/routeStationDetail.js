import {
          LightningElement,
          api
} from 'lwc';

export default class RouteStationDetail extends LightningElement {

          iconName;
          speed;
          routeDetail=[];

          @api
          getValueFromParent(data) {
                    this.routeDetail=[];
                    for (var i in data) {
                              
                          this.routeDetail = [...this.routeDetail,{
                              Route:data[i].Main_Route__r.Name,
                              Distance:data[i].Distance__c, 
                              Hour: Math.floor(data[i].Distance__c/(this.speed)), 
                              Minutes:Math.floor((data[i].Distance__c/(this.speed) - Math.floor(data[i].Distance__c/(this.speed)) )*60),  
                          }]    
                    }
                    console.log(this.routeDetail);
          }

          @api
          getvichleData(data) {
                    this.iconName = data.iconName;
                    this.speed = data.speed;


          }
}