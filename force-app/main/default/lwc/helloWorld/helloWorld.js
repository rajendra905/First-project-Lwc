import {
          LightningElement
} from 'lwc';

export default class HelloWorld extends LightningElement {
          handleClick() {
                    fetch("https://google-translate1.p.rapidapi.com/language/translate/v2", {
	"method": "POST",
	"headers": {
		"content-type": "application/x-www-form-urlencoded",
		"accept-encoding": "application/gzip",
		"x-rapidapi-host": "google-translate1.p.rapidapi.com",
		"x-rapidapi-key": "3e9edee5a2msh1f36ce1757c4ec9p14dd0fjsnf7ccf986002b"
	},
	"body": {
		"q": "Hello, world!",
		"target": "hi",
		"source": "en"
	}
})
.then(response => {
	console.log(response);
})
.catch(err => {
	console.error(err);
});
          }
}