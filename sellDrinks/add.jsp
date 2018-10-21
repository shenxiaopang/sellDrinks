<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${path}/js/jquery-3.1.1.js"></script>
<script type="text/javascript">
       if($.trim("${admin}") == "") {
			alert("请先登录再执行管理操作");    	   
             top.location.href="login.jsp";
       }
  </script>
</head>
<body>
	<form action="${path }/Admin/add" method="get">
		新增的商品名称：<input type="text" name="drinksName"><br>
		新增的商品数量：<input type="text" name="count"><br>
		新增的商品单价：<input type="text" name="price"><br>
		<button>提交</button>
	</form>
</body>
</html>