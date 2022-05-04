import { LightningElement } from 'lwc';
const columns = [
          { label: 'Opportunity name', fieldName: 'opportunityName', type: 'text' },
          {
              label: 'Confidence',
              fieldName: 'confidence',
              type: 'percent',
              cellAttributes: {
                  iconName: { fieldName: 'trendIcon' },
                  iconPosition: 'right',
              },
          },
          {
              label: 'Amount',
              fieldName: 'amount',
              type: 'currency',
              typeAttributes: { currencyCode: 'EUR', step: '0.001' },
          },
          { label: 'Contact Email', fieldName: 'contact', type: 'email' },
          { label: 'Contact Phone', fieldName: 'phone', type: 'phone' },
      ];
      
      const data = [
          {
              id: 'a',
              opportunityName: 'Cloudhub',
              confidence: 0.2,
              amount: 25000,
              contact: 'jrogers@cloudhub.com',
              phone: '2352235235',
              trendIcon: 'utility:down',
          },
          {
              id: 'b',
              opportunityName: 'Quip',
              confidence: 0.78,
              amount: 740000,
              contact: 'quipy@quip.com',
              phone: '2352235235',
              trendIcon: 'utility:up',
          },
      ];
      
export default class TestingDataTable extends LightningElement {
          data = data;
    columns = columns;

    getSelectedName(event) {
        let selectedRows = event.detail.selectedRows;
        let selectedEmails = [];
        if(selectedRows.length != 0){
            console.log('selectedRows[i].opportunityName',JSON.parse(JSON.stringify(selectedRows)));
            selectedRows.forEach(selectedObj => {
                selectedEmails.push(selectedObj.contact);
            });
            console.log('selectedEmails',selectedEmails);
        }
       
        // Display that fieldName of the selected rows
        // for (let i = 0; i < selectedRows.length; i++) {
        //     //alert('You selected: ' + selectedRows[i].opportunityName);
        //     console.log('selectedRows[i].opportunityName',selectedRows);

        //     console.log('selectedRows[i].opportunityName',selectedRows[i].opportunityName);
        // }
    }
}