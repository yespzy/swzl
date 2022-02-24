var newObj;
var renewObj;

var newMsg;
var renewMsg;

window.onload = function() {	// 页面加载之后, 获取页面中的对象
	newObj = document.getElementById("newpassword");
	renewObj = document.getElementById("repassword");
	
	newMsg = document.getElementById("newMsg");
	renewMsg = document.getElementById("renewMsg");
};

function check() {// 验证整个表单
	var bnewpassword = checkNew();
	var brenewpassword = checkreNew();
	return bnewpassword && brenewpassword;	// return false后, 事件将被取消
};


function checkNew() {// 验证新密码
	var regex = /^.{6,16}$/;
	var value = newObj.value;
	var msg = "";
	if (!value)
		msg = "密码必须填写";
	else if (!regex.test(value))
		msg = "错误：密码请设置6-16位字符";
	newMsg.innerHTML = msg;
	newObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
};

function checkreNew() {// 验证确认密码
	var value = renewObj.value;
	var value1 = newObj.value;
	var msg = "";
	if (!value)
		msg = "确认密码必须填写";
	else if (value != value1)
		msg = "错误：两次密码不一致";
	renewMsg.innerHTML = msg;
	renewObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
};