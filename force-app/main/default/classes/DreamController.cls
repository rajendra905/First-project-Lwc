public class DreamController {
    public String cityname {get;set;}
    public String citynameText {get;set;}
    public Integer rowNo {get;set;}
    public  List<String> city{get;set;}
    
    public  DreamController() {
        city =new List<String>();
        
    }
    public void addCity() {
        if(String.isBlank(citynameText) == True){
        city.add(cityname);
         cityname='';
        }else if(String.isBlank(cityname) == True){
             city.add(citynameText);
            	citynameText='';
        }
        else{
             city.add(cityname);
            city.add(citynameText);
            cityname='';
            citynameText='';
        }
        
    }
    public void removeCity() {
       // rowNo=rowNo-1;
        city.remove(rowNo - 1);
        
    }
}