var usernameObj;
var passwordObj;
var repasswordObj;

var usernameMsg;
var passwordMsg;
var repasswordMsg;

window.onload = function() {	// 页面加载之后, 获取页面中的对象
	usernameObj = document.getElementById("username");
	passwordObj = document.getElementById("password");
	repasswordObj = document.getElementById("repassword");
	
	usernameMsg = document.getElementById("usernameMsg");
	passwordMsg = document.getElementById("passwordMsg");
	repasswordMsg = document.getElementById("repasswordMsg");
};

function check() {// 验证整个表单
	var busername = checkusername();
	var bpassword = checkpassword();
	var brepassword = checkrepassword();
	return bpassword && busername && brepassword;	// return false后, 事件将被取消
};

function checkusername() {// 验证用户名
	var regex = /^[a-zA-Z_]\w{0,9}$/;	// 字母数字下划线1到10位, 不能是数字开头
	var value = usernameObj.value;// 获取usernameObj中的文本
	var msg = "";						// 最后的提示消息, 默认为空
	if (!value)							// 如果账号没填, 填了就是一个字符串可以当作true, 没填的话不论null或者""都是false
		msg = "用户名必须填写";			// 提示消息
	else if (!regex.test(value))		// 如果用户名不能匹配正则表达式规则
		msg = "错误：字母数字下划线,不能是数字开头";			// 改变提示消息
	usernameMsg.innerHTML = msg;		// 将提示消息放入SPAN
	usernameObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";	// 根据消息结果改变tr的颜色
	return msg == "";					// 如果提示消息为空则代表没出错, 返回true
};

function checkpassword() {// 验证密码
	var regex = /^.{6,16}$/;
	var value = passwordObj.value;
	var msg = "";
	if (!value)
		msg = "密码必须填写";
	else if (!regex.test(value))
		msg = "错误：密码请设置6-16位字符";
	passwordMsg.innerHTML = msg;
	passwordObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
};

function checkrepassword() {// 验证确认密码
	var value = repasswordObj.value;
	var value1 = passwordObj.value;
	var msg = "";
	if (!value)
		msg = "确认密码必须填写";
	else if (value != value1)
		msg = "错误：两次密码不一致";
	repasswordMsg.innerHTML = msg;
	repasswordObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
};