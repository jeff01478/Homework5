document.getElementById('registerForm').addEventListener('input', registerConfirm);
document.getElementById('registerForm').addEventListener('click', registerConfirm);


function registerConfirm(event) {
	// 阻止表單的默認提交行為
	//event.preventDefault();

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
			userName.innerHTML = responseJson["userNameMsg"];
			userName.style.color = responseJson["userNameColor"];
			password.innerHTML = responseJson["passwordMsg"];
			password.style.color = responseJson["passwordColor"];
			document.getElementById("passwordMsg").innerHTML = responseJson["passwordMsg"];
	    } else {
			alert("GG");
		}
	};

	xhr.onerror = () => {
		alert("NMSL");
	}

	// 構建表單數據
	var formData = new FormData(document.getElementById('registerForm'));
	var urlEncodedData = new URLSearchParams(formData).toString();

	// 發送請求
	xhr.send(urlEncodedData);
}