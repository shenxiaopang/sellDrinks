<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${path}/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
       if($.trim("${admin}") == "") {
			alert("请先登录再执行管理操作");    	   
             top.location.href="login.jsp";
       }
  </script>
<title>管理员界面</title>
<script src="${path}/js/jquery-3.1.1.js"></script>
<script>
	$.ajax({
		   type: "POST",
		   url: "${path}/user/getData",
		   dataType:"json",
		   success: function(data){
			   var str = "";
			   for(var i=0;i<data.length;i++){
				   str +=	"商品名：<input name='drinksName[]' type='text' value='"+data[i].drinksName+"'>"
					+"库存：<input name='count[]' type='text' value='"+data[i].count+"'>瓶"
					+"价格：<input name='price[]' type='text' value='"+data[i].price+"'>元"
					
				   str +="<br/>"
			   }
			   str += "<button>提交</button>"
		    	$("#list").html(str);
		   }
		});	
</script>

</head>
<body>
<form action="${path }/Admin/edit" method="get" id="list">
</form>

</body>
</html>