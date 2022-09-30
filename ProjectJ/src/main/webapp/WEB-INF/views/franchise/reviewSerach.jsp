<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>


<div>
	<form action="/franchise/reviewSerach" method="get">
		<table>
			<tr>
				<td><a>${comName }으로 검색한 결과입니다.</a></td>
			</tr>
			<tr>
				<td>
					찾기 : <input type="text" name="comName" value="${comName }"> <input type="submit" value="검색">
				</td>
			</tr>
		</table>
	</form>
</div>
<div>


</div>





<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>