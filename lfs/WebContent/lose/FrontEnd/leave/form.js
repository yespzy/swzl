    var nickNameobj;
    var QQobj;
    var Emailobj;
    var phoneobj;
    var contentobj;
    
    var nickNameMsg;
    var QQMsg;
    var EmailMsg;
    var phoneMsg;
    var contentMsg;
    
    window.onload = function() {	// 页面加载之后, 获取页面中的对象
    	 nickNameobj = document.getElementById("nickname");
    	 QQobj = document.getElementById("QQ");
    	 Emailobj = document.getElementById("Email");
    	 phoneobj = document.getElementById("phone");
    	 contentobj = document.getElementById("content");
    	
    	 nickNameMsg = document.getElementById("nickNameMsg");
    	 QQMsg = document.getElementById("QQMsg");
    	 EmailMsg = document.getElementById("EmailMsg");
    	 phoneMsg = document.getElementById("phoneMsg");
    	 contentMsg = document.getElementById("contentMsg");
    };
    
    function check() {// 验证整个表单
    	var bNickname = checkNickname();
    	var bQQ = checkQQ();
    	var bEmail = checkEmail();
    	var bPhone = checkPhone();
    	var bContent = checkContent();
    	return bNickname && bQQ && bEmail && bPhone && bContent;	// return false后, 事件将被取消
    };
    
    function checkNickname() {// 验证昵称
    	var value = nickNameobj.value;// 获取nicknameobj中的文本
    	var msg = "";						// 最后的提示消息, 默认为空
    	if (!value)							// 如果账号没填, 填了就是一个字符串可以当作true, 没填的话不论null或者""都是false
    		msg = "错误：昵称必须填写";			   // 提示消息
    	nickNameMsg.innerHTML = msg;		// 将提示消息放入SPAN
    	nickNameobj.parentNode.parentNode.style.color = (msg == "") ? "black" : "red";	// 根据消息结果改变tr的颜色
    	return msg == "";					// 如果提示消息为空则代表没出错, 返回true
    };
    
    function checkQQ() {// 验证QQ
    	var regex = /^[0-9]{6,10}$/;
    	var value = QQobj.value;
    	var msg = "";
    	if (!value)							
    		msg = "";			
    	else if (!regex.test(value))		
    		msg = "错误：请输入6-10位阿拉伯数字";			
    	QQMsg.innerHTML = msg;		
    	QQobj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";	
    	return msg == "";					
    };

    function checkEmail() {// 验证邮箱
    	var regex = /^[\w-]+@([\w-]+\.)+[a-zA-Z]{2,4}$/;
    	var value =Emailobj.value;
    	var msg = "";
    	if (!value)
    		msg = "";
    	else if (!regex.test(value))
    		msg = "错误：请输入有效的邮箱地址";
    	EmailMsg.innerHTML = msg;
    	Emailobj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
    	return msg == "";	
    };

    function checkPhone() {// 验证联系号码
    	var regex = /^1[3-9]\d{9}$/;
    	var value =phoneobj.value;
    	var msg = "";
    	if (!value)
    		msg = "";
    	else if (!regex.test(value))
    		msg = "错误：请填写以1开头的11位有效数字";
    	phoneMsg.innerHTML = msg;
    	phoneobj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
    	return msg == "";
    };
    
    function checkContent() {// 验证留言内容
    	var value =contentobj.value;
    	var msg = "";
    	if (!value)
    		msg = "错误：留言内容必须填写";
    	contentMsg.innerHTML = msg;
    	contentobj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
    	return msg == "";
    };

