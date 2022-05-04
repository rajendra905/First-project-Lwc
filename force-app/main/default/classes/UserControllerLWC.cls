/**
	Name		: userControllerLWC
	Date		: 20 oct, 2021
	Author		: Rajendra Singh Solanki
	Description 	: find user detail using Lwc
				  -----
				  ------
*/
public  class UserControllerLWC {
    @AuraEnabled(cacheable = true)
    public static List<User> userList(){
        return [select Id, Name, Email, MediumPhotoUrl  from User];
    }
}