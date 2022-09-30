<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp"%>


<div>
	<form action="/franchise/reviewSearch" method="get">
		<table>
			<tr>
				<td><a>${comName}(으)로 검색한 결과입니다.</a></td>
			</tr>
			<tr>
				<td>
					찾기 : <input type="text" name="comName" value="${comName }"> <input type="submit" value="검색">
				</td>
			</tr>
		</table>
	</form>
</div>
	<table>
	<tr>
		<td>상호명</td>
		<td>별점</td>
	</tr>
	<c:forEach var="comNameList" items="${resultList}" varStatus="status">
		<tr>
			<td>
				${comNameList.s_comName }
			</td>
			<td>
				${comNameList.starAvg }
				</td>
		</tr>


	</c:forEach>
	</table>

<div>


</div>





<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp"%>