@isTest
public class DreamControllerTest {
	@isTest
    public static void addCity(){
        DreamController dreamController = new DreamController();
        dreamController.citynameText= 'ajmer';
        dreamController.cityname = 'ajmer';
        dreamController.city.add(dreamController.citynameText);
        dreamController.city.add(dreamController.cityname);
        dreamController.addCity();
        
        dreamController.citynameText= '';
        dreamController.cityname = 'ajmer';
        dreamController.addCity();
        if(string.isBlank(dreamController.citynameText)){
            dreamController.city.add(dreamController.cityname);
        }
        
     	dreamController.citynameText= 'ajmer';
        dreamController.cityname = '';
        dreamController.addCity();
        if(string.isBlank(dreamController.cityname)){
            dreamController.city.add(dreamController.citynameText);
        }
    }
    @isTest 
    public static void removeRow(){
         DreamController dreamController = new DreamController();
        dreamController.citynameText= 'ajmer';
        dreamController.cityname = '';
        dreamController.addCity();
        if(string.isBlank(dreamController.cityname)){
            dreamController.city.add(dreamController.citynameText);
            dreamController.rowNo = 1;
        }
        dreamController.removeCity();
        dreamController.city.remove(dreamController.rowNo);
    }
}