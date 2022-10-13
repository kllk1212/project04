<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>

<h1>검색 결과 페이지</h1>
	<div>
	<h2>디비에 있는 ${comName}(해당프차)의 모든 정보 </h2>
		<table>
			<tr><td> 상호명 : ${cDTO.c_comTitle } </td></tr>
			<tr><td> 영업표지명 : ${cDTO.c_comName } </td></tr>
			<tr><td> 회사분류 : ${cDTO.c_type } </td></tr>	
			<tr><td> 총 점포수 : ${cDTO.c_storeCount } </td></tr>
			<tr><td> 가맹총부담금 : ${cDTO.c_totalFee*1000}원 </td></tr>
			<tr><td> 평균 매출액 : ${cDTO.c_tAvgSales*100}원 </td></tr>
			<tr><td> 1평당 평균 매출액 : ${cDTO.c_tSquareSales*100}원 </td></tr>
			<tr><td> 회사 대표 : ${cDTO.c_comBoss } </td></tr>
			<tr><td> 사업자유형 : ${cDTO.c_comBm } </td></tr>
			<tr><td> 회사 주소 : ${cDTO.c_comAddr } </td></tr>
			<tr><td> 대표 번호 : ${cDTO.c_comNum } </td></tr>
			
			<!-- 자바에서 넘어온 List데이터 for문으로 넣어둔것 거의 3번 돌아감  -->
			<c:forEach var="fDTO" items="${fDTO}" varStatus="status">
				<tr><td> 지역 : ${fDTO.f_areaName } / 년도 : ${fDTO.f_year} / 대리점수 : ${fDTO.f_franchiseeEa} / 직영점수 : ${fDTO.f_directEa}</td></tr>
			</c:forEach>
		</table>
	</div>
	


	
	<div>
		<table>
			<tr>
				<td> 
					${areaName}지역의 ${cDTO.c_type } 업종 프랜차이즈 매장수 는  ${allFchaEA }개 입니다.
				</td>			
			</tr>
			<tr>
				<td> 
					 ${ areaName}지역의 ${comName}점포수는 ${fDTO[0].f_franchiseeEa} 개 입니다. (${fDTO[0].f_year} 기준)
				</td>			
			</tr>
			<tr>
				<td> 
					 ${comName} 매장들의  평균 매출액은 ${cDTO.c_tAvgSales/100}만원 입니다.
				</td>			
			</tr>
			<tr>
				<td> 
					${areaName}지역의 ${cDTO.c_type } 업종 프랜차이즈 평균 매출은 ${avgSales}만원 입니다.
				</td>			
			</tr>
			<tr>
				<td> 
					전국 기준  ${cDTO.c_type } 업종 프랜차이즈 평균 매출은 ${avgSalesAll}만원 입니다.
				</td>			
			</tr>
		</table>
	</div>
	<div>
		<button type="button" onclick="location.href='/diagnosis/diagnosisMain';"> 다시 검색하기</button>
		<button type="button" onclick="location.href='/franchise/incomeCalcMain?comName=${comName}';"> ${comName}(으)로 예상순이익 계산해보기</button>
	</div>
	
<!-- footer 복붙 -->        
<%@ include file="../includes/footer.jsp" %>
