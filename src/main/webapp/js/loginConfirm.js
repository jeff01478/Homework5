document.getElementById('loginForm').addEventListener('submit', event => {
    // 阻止表單的默認提交行為
    event.preventDefault();
    
    // 創建XHR對象 
    let xhr = new XMLHttpRequest();
    xhr.open('POST', 'lottery/ajax-login-confirm', true);
   	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    
    // 處理伺服器返回的結果
    xhr.onload = function() {
        if (xhr.status === 200) {
            if (xhr.responseText == "GOOD") {
                console.log("登入成功");
				window.location.replace("lottery/lottery");
			} else {
				document.getElementById("loginError").innerHTML="帳號或密碼有誤!!";
			}
        } else {
            console.log("NMSL");
        }
    };

    // 構建表單數據
    let formData = new FormData(document.getElementById('loginForm'));
    let urlEncodedData = new URLSearchParams(formData).toString();

    // 發送請求
    xhr.send(urlEncodedData);
});