
 function createCookie(name){
	console.log(name);
	const date = new Date();
	date.setDate(date.getDate()+1);
	let cookie = '';
	cookie += name + '=true;';
	cookie += 'path=/;';
	cookie += 'expires=' + date.toUTCString();
	document.cookie = cookie;
	console.log('쿠키생성함수 종료');
}	
	


 function getCookie(name){
		const cookies = document.cookie.split(';');
		
		for(let c of cookies) {
			if(c.search(name) !== -1){
				console.log('쿠키 찾음');
				return true;
			}
		}
	}