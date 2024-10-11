document.getElementById('registerForm').addEventListener('input', registerConfirm);
document.getElementById('registerForm').addEventListener('click', registerConfirm);


function registerConfirm() {

	// 創建XHR對象 
	var xhr = new XMLHttpRequest();
	xhr.open('POST', 'register-confirm', true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.responseType = "json";

	// 處理伺服器返回的結果
	xhr.onload = function() {
	    if (xhr.status === 200) {
			let responseJson = xhr.response
			let userName = document.getElementById("userNameMsg");
			let password = document.getElementById("passwordMsg");
			console.log(responseJson);
			console.log(responseJson["userNameColor"])
			userName.style.color = responseJson["userNameColor"];
			userName.innerHTML = responseJson["userNameMsg"];
			password.innerHTML = responseJson["passwordMsg"];
			password.style.color = responseJson["passwordColor"];
	    }
	};

	// 構建表單數據
	var formData = new FormData(document.getElementById('registerForm'));
	var urlEncodedData = new URLSearchParams(formData).toString();

	// 發送請求
	xhr.send(urlEncodedData);
}