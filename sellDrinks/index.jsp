<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>饮料售卖界面</title>
<script src="${path}/js/jquery-3.1.1.js"></script>

</head>
<body>
<script>
	var globle_date = null;
	$.ajax({
		   type: "POST",
		   url: "${path}/user/getData",
		   dataType:"json",
		   success: function(data){
			   var str = "";
			   for(var i=0;i<data.length;i++){
				   str += data[i].drinksName+"单价："+data[i].price+"剩余数量"+data[i].count+"瓶";
				   str +="<br/>"
			   }
			   for(var i=0;i<data.length;i++){
				   str += "需要"+data[i].drinksName+"<input name='"+(i+1)+"' type='text'>"+"瓶"+"<br>"
				   str +="<br/>"
			   }
			   str += "需要支付<span id='money'></span>元"
				+"<button id='pay'>支付</button>";
			   globle_date = data;
		    	$("#list").html(str);
		   }
		});	
</script>
	<h2>饮料售卖界面</h2>
	<form action="${pageContext.request.contextPath }/user/BuyDrinks" method="get" id="list" >
			<!-- 需要可乐(orange)<input name="1"   onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">瓶<br>
			需要咖啡(orange)<input name="2"    onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">瓶<br>
			需要橙汁(orange)<input name="3"   onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">瓶<br>
			需要支付<span id="money"></span>元
			<button id="pay">支付</button> -->
	</form>
		<script type="text/javascript">
		var money = 0;
		$("#list").on("change","input",function(){
			money = 0;
			$("input").each(function(index,item){
				if(this.value =="" )this.value = 0;
				if(this.value >globle_date[index].count ){
					alert("库存不够");
					this.value = 0;
				}
				money += this.value*globle_date[index].price;
			});
			$("#money").html(money);
		})
			$("#list").on("click","#pay",function(){
				if(money == 0){
					alert("请选择商品");
					return false;
				}
				if(confirm("确定支付"+money+"元吗")){
					return true;
				}else {
					return false;
				}
			})
			
		</script>
</body>

</html>