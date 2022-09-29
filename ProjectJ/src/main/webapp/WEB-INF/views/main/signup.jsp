<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<h1>회원가입 페이지</h1>

<form action="">
	<table>
		<tr>
			<td>아이디 :<input type="text"  name ="m_id" id="m_id" required><span id = "idCheck"></span></td>
		</tr>	
	</table>
</form>

<!--
<tr><th>아이디</th>
<td><input type="text"  name ="m_id" id="m_id" required>
<span id = "idCheck"></span></td></tr>
  -->

<script>
$(function(){
	$("#m_id").on('keyup',emailcheck);
})
function emailcheck(){
    var m_id = $("#m_id").val();
    var sendData = {"m_id":m_id}
    console.log(sendData);
    $.ajax({
        method : 'POST',
        url : 'idCheck',
        data : sendData,
        success : function(resp){
            if(resp=='fail'){
                $('#idCheck').css('color','red')
                $('#idCheck').html("사용할 수 없는 아이디입니다.")
                flag=false;
  
            }else{
                $('#idCheck').css('color','blue')
                $('#idCheck').html("사용할 수 있는 아이디입니다.")
                flag=true;
            }}
    })	
}
</script>


<!-- 
	<div>
		<form action="signup" method="post">
			<table>
				<tr>
					<td>아이디 : <input type="text" name="m_id"> </td>
				</tr>
				<tr>
					<td>비밀번호 : <input type="text" name="m_pw"> </td>
				</tr>
				<tr>
					<td>이메일 : <input type="text" name="m_email"> </td>
				</tr>
				<tr>
					<td>휴대폰번호 : <input type="text" name="m_num"> </td>
				</tr>
				<tr>
					<td> 유용한 창업정보를 sms로 받겠습니다 <input type="checkbox" name="m_ping"> </td>
				</tr>
				<tr>
					<td><input type="submit" value="회원가입완료" checked="checked"> </td>
				</tr>

			</table>
		</form>
</div>
-->





<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>