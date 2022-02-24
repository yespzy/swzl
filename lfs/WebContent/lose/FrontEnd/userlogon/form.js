var usernameObj;
var passwordObj;
var nameObj;
var QQObj;
var EmailObj;
var PhoneObj;
var AcademyObj;
var MajorObj;
var ClassObj;

var usernameMsg;
var passwordMsg;
var nameMsg;
var QQMsg;
var EmailMsg;
var PhoneMsg;
var AcademyMsg;
var MajorMsg;
var ClassMsg;

window.onload = function() {	// 页面加载之后, 获取页面中的对象
	usernameObj = document.getElementById("Username");
	passwordObj = document.getElementById("Password");
	nameObj = document.getElementById("name");
	QQObj = document.getElementById("QQ");
	EmailObj = document.getElementById("Email");
	PhoneObj = document.getElementById("phone");
	AcademyObj = document.getElementById("academy");
	MajorObj = document.getElementById("major");
	ClassObj = document.getElementById("classes");
	
	usernameMsg = document.getElementById("usernameMsg");
	passwordMsg = document.getElementById("passwordMsg");
	nameMsg = document.getElementById("nameMsg");
	QQMsg = document.getElementById("QQMsg");
	EmailMsg = document.getElementById("EmailMsg");
	PhoneMsg = document.getElementById("phoneMsg");
	AcademyMsg = document.getElementById("academyMsg");
	MajorMsg = document.getElementById("majorMsg");
	ClassMsg = document.getElementById("classMsg");
};

function check() {// 验证整个表单
	var bUsername = checkUsername();
	var bPassword = checkPassword();
	var bName = checkName();
	var bQQ = checkQQ();
	var bEmail = checkEmail();
	var bPhone = checkPhone();
	var bAcademy = checkAcademy();
	var bMajor = checkMajor();
	var bClass = checkClass();
	return bUsername && bPassword && bName && bQQ && bEmail && bPhone && bAcademy && bMajor && bClass;	// return false后, 事件将被取消
};

function checkUsername() {// 验证账号
	var regex = /^[a-zA-Z_]\w{0,9}$/;	// 字母数字下划线1到10位, 不能是数字开头
	var value = usernameObj.value;// 获取usernameObj中的文本
	var msg = "";						// 最后的提示消息, 默认为空
	if (!value)							// 如果账号没填, 填了就是一个字符串可以当作true, 没填的话不论null或者""都是false
		msg = "账号必须填写：";			// 提示消息
	else if (!regex.test(value))		// 如果用户名不能匹配正则表达式规则
		msg = "用户名不合法：";			// 改变提示消息
	usernameMsg.innerHTML = msg;		// 将提示消息放入SPAN
	usernameObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";	// 根据消息结果改变tr的颜色
	return msg == "";					// 如果提示消息为空则代表没出错, 返回true
};

function checkPassword() {// 验证密码
	var regex = /^.{6,16}$/;
	var value = passwordObj.value;
	var msg = "";
	if (!value)
		msg = "密码必须填写：";
	else if (!regex.test(value))
		msg = "错误：";
	passwordMsg.innerHTML = msg;
	passwordObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
};

function checkName(){//验证姓名
	var regex = /^[\u4e00-\u9fa5]{2,3}$/;
	var value = nameObj.value;
	var msg = "";
	if (!value)							
		msg = "姓名必须填写：";			
	else if (!regex.test(value))		
		msg = "错误：";			
	nameMsg.innerHTML = msg;		
	nameObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";	
	return msg == "";					
};

function checkQQ() {// 验证QQ
	var regex = /^[0-9]{6,10}$/;
	var value = QQObj.value;
	var msg = "";
	if (!value)							
		msg = "";			
	else if (!regex.test(value))		
		msg = "错误：";			
	QQMsg.innerHTML = msg;		
	QQObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";	
	return msg == "";					
};

function checkEmail() {// 验证邮箱
	var regex = /^[\w-]+@([\w-]+\.)+[a-zA-Z]{2,4}$/;
	var value =EmailObj.value;
	var msg = "";
	if (!value)
		msg = "";
	else if (!regex.test(value))
		msg = "错误：";
	EmailMsg.innerHTML = msg;
	EmailObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";	
};

function checkPhone() {// 验证联系号码
	var regex = /^1[3-9]\d{9}$/;
	var value =PhoneObj.value;
	var msg = "";
	if (!value)
		msg = "";
	else if (!regex.test(value))
		msg = "错误：";
	PhoneMsg.innerHTML = msg;
	PhoneObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
};

function checkAcademy(){//验证学院
	var regex =  /^[\u4e00-\u9fa5]+$/;
	var value = AcademyObj.value;
	var msg = "";
	if (!value)							
		msg = "";			
	else if (!regex.test(value))		
		msg = "错误：";			
	AcademyMsg.innerHTML = msg;		
	AcademyObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";	
	return msg == "";					
};

function checkMajor(){//验证专业
	var regex =  /^[\u4e00-\u9fa5]+$/;
	var value = MajorObj.value;
	var msg = "";
	if (!value)							
		msg = "";			
	else if (!regex.test(value))		
		msg = "错误：";			
	MajorMsg.innerHTML = msg;		
	MajorObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";	
	return msg == "";					
};

function checkClass(){//验证班级
	var regex =  /^[\u4e00-\u9fa5]+[0-9-\u4e00-\u9fa5]+$/;
	var value = ClassObj.value;
	var msg = "";
	if (!value)							
		msg = "";			
	else if (!regex.test(value))		
		msg = "错误：";			
	ClassMsg.innerHTML = msg;		
	ClassObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";	
	return msg == "";					
};
