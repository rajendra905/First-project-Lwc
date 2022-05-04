public class PicklistController {
    
    public  List<SelectOption> country{get;set;}
    public  List<SelectOption> state{get;set;}
    public  List<SelectOption> city{get;set;}
    public string getcountry{get;set;}
    public string getstate{get;set;}
    public string getcity{get;set;}
    public string pincode{get;set;}
    
    public PicklistController() {
        country = new List<SelectOption>();
        country.add(new SelectOption('', '--None--'));
        country.add(new SelectOption('india', 'India'));
        country.add(new SelectOption('australia', 'Australia'));
        country.add(new SelectOption('england', 'England')); 
    }
    
    public void Addcountry() {
        state = new List<SelectOption>();
        if(getcountry == 'india') {
            state.add(new SelectOption('rajasthan', 'Rajasthan'));
            state.add(new SelectOption('panjab', 'Panjab'));
            state.add(new SelectOption('telangana', 'Telangana'));
        } else if(getcountry == 'australia') {
            state.add(new SelectOption('new south wales','New South Wales'));
            state.add(new SelectOption('northern territory','Northern Territory'));
            state.add(new SelectOption('south australia','South Australia'));
        }
        else{
            state.add(new SelectOption('Northern ireland','Northern Ireland'));
            state.add(new SelectOption('scotland','Scotland'));
            state.add(new SelectOption('wales','Wales'));
        }
        
    }
    
    public void Addstate() {
        
        city =new List<SelectOption>();
        if(getstate=='rajasthan'){
            city.add(new SelectOption('kota','Kota')); //
            city.add(new SelectOption('jaipur','Jaipur')); //
            city.add(new SelectOption('udaipur','Udaipur'));//
        }
        else if(getstate=='panjab'){
            city.add(new SelectOption('ludhiana','Ludhiana'));//
            city.add(new SelectOption('amritsar','Amritsar'));
            city.add(new SelectOption('jalandhar','Jalandhar'));
        }
        else if(getstate=='telangana'){
            city.add(new SelectOption('hyderabad','Hyderabad'));
            city.add(new SelectOption('warangal','Warangal'));
            city.add(new SelectOption('nizamabad','Nizamabad'));
        }
        else if(getstate=='new south wales'){
            city.add(new SelectOption('sydney ','Sydney'));
            city.add(new SelectOption('newcastle','Newcastle'));
            city.add(new SelectOption('ballina','Ballina'));
        }
        else if(getstate=='northern territory'){
            city.add(new SelectOption('darwin','Darwin'));
            city.add(new SelectOption('alice springs','Alice Springs'));
            city.add(new SelectOption('palmerston','Palmerston'));
        }
        else if(getstate=='south australia'){
            city.add(new SelectOption('adelaide','Adelaide'));
            city.add(new SelectOption('gawler','Gawler'));
            city.add(new SelectOption('mount gambier','Mount Gambier'));
        }
        else if(getstate=='northern ireland'){
            city.add(new SelectOption('belfast','Belfast'));
            city.add(new SelectOption('derry','Derry'));
            city.add(new SelectOption('newtownabbey','Newtownabbey'));
        }
        else if(getstate=='scotland'){
            city.add(new SelectOption('glasgow','Glasgow'));
            city.add(new SelectOption('edinburgh','Edinburgh'));
            city.add(new SelectOption('berdeen','Aberdeen'));
        }
        else{
            city.add(new SelectOption('bangor','Bangor'));
            city.add(new SelectOption('cardiff','Cardiff'));
            city.add(new SelectOption('newport','Newport'));
        }
        
        
        
        
        
    }
    
    public void AddCity() {
        
        
        if(getcity == 'kota') {
            pincode='kota123';
        }else if(getcity == 'jaipur') {
            pincode='jaipur123';
        }
        else if(getcity == 'udaipur') {
            pincode='udaipur123';
        }
        else if(getcity == 'ludhiana') {
            pincode='ludhiana123';
        }
        else if(getcity=='amritsar') {
            pincode='amritsar123';
        }
        else if(getcity=='jalandhar') {
            pincode='jalandhar123';
        }
        else if(getcity=='hyderabad') {
            pincode='hyderabad123';
        }
        else if(getcity=='warangal') {
            pincode='Warangal123';
        }
        else if(getcity=='nizamabad') {
            pincode='nizamabad123';
        }
        else if(getcity=='sydney') {
            pincode='sydney123';
        }
        else if(getcity=='newcastle') {
            pincode='newcastle123';
        }
        else if(getcity=='ballina') {
            pincode='ballina123';
        }
		 else if(getcity=='darwin') {
            pincode='darwin123';
        }
        else if(getcity=='alice springs') {
            pincode='alice springs123';
        }
        else if(getcity=='palmerston') {
            pincode='palmerston123';
        }        
	
		 else if(getcity=='adelaide') {
            pincode='adelaide123';
        }
        else if(getcity=='gawler') {
            pincode='gawler123';
        }
        else if(getcity=='mount gambier') {
            pincode='mount gambier123';
        }                
        
         else if(getcity=='belfast') {
            pincode='belfast123';
        }
        else if(getcity=='derry') {
            pincode='derry123';
        }
        else if(getcity=='newtownabbey') {
            pincode='newtownabbey123';
        }   
        
         else if(getcity=='glasgow') {
            pincode='glasgow123';
        }
        else if(getcity=='edinburgh') {
            pincode='edinburgh123';
        }
        else if(getcity=='berdeen') {
            pincode='berdeen123';
        }   
         
         else if(getcity=='bangor') {
            pincode='bangor123';
        }
        else if(getcity=='cardiff') {
            pincode='cardiff123';
        }
        else  {
            pincode='newport123';
        }   
        
        
        
        
    }
    
}