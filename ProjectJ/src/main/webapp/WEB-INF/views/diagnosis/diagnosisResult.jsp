<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>

<h1>검색 결과 페이지</h1>
	
	<div>
		<table>
			<tr>
				<td> 
					${areaName}지역의  총 점포수는 (총점포수) 개 입니다.
				</td>			
			</tr>
			<tr>
				<td> 
					 ${ areaName}지역의 ${comName}점포수는 총 점포수는 (총점포수)
				</td>			
			</tr>
			<tr>
				<td> 
					 ${ areaName}지역의 ${comName} 매장들의  평균 매출액은 (평균매출액)
				</td>			
			</tr>
			<tr>
				<td> 
					 ${ areaName}(은)는 다른 동종매장보다  평균 매출액이 (전체 치킨프차매출액- bhc매출액)만원 더 높습니다.
				</td>			
			</tr>
		</table>
	</div>
	
	
<!-- footer 복붙 -->        
<%@ include file="../includes/footer.jsp" %>
