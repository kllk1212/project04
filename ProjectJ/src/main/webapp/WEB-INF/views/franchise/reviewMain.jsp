<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>
	
	
	<h1>리뷰 메인페이지 기업의 이름을 끌고 와야함 s_comName</h1>
	
	<div>
		<form action="/franchise/reviewSearch" method="get">
			<table>
				<tr>
					<td>
						찾기 : <input type="text" name="comName">
						<input type="submit" value="검색">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	
	
	
	
	
	
<!-- footer 복붙 -->        
<%@ include file="../includes/footer.jsp" %>