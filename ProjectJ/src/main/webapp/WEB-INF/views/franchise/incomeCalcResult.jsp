<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>
	
<script>
	let l_areaAvgSales = "${result.l_areaAvgSales}";
	let l_year = "${result.l_year}";
	let l_areaName = "${result.l_areaName}";
	let l_comName = "${result.l_comName}";
	if (l_areaAvgSales == 0) {
		alert(l_comName + "은(는) " + l_year + "기준 " + l_areaName+ " 지역에 점포가 없습니다.");
		location.replace("/franchise/incomeCalcMain");
	}
</script>



<table>
	<tr>
	<tr>
		<td>
			<h1>파라미터로 넘어온 데이터 !!!!!</h1>
		</td>
	</tr>
	<tr>
		<td>프랜차이즈명 : ${param.comName}</td>
	</tr>
	<tr>
		<td>지역 : ${param.areaName}</td>
	</tr>
	<tr>
		<td>월세 : ${param.monthlyRent }</td>
	</tr>
	<tr>
		<td>희망평수 : ${param.size}</td>
	</tr>
	<tr>
		<td>인건비 : ${param.workPayMonth}</td>
	</tr>
	<tr>
		<td>기타비용 : ${param.etcPay}</td>
	</tr>
	<tr>
		<td>매출대비원가율 : ${param.payRatio}</td>
	</tr>
</table>
<table>
	<tr>
		<td> <h1>DB에서 검색해서 가져온 데이터!!!! </h1></td>
	</tr>
	<tr>
		<td>1평당 매출 : ${result.l_areaAvgSales*1000}원</td>
	</tr>
	<tr>
		<td>프랜차이즈명 : ${result.l_comName}</td>
	</tr>
	<tr>
		<td>자료기준 : ${result.l_year}</td>
	</tr>
	<tr>
		<td>지역 : ${result.l_areaName}</td>
	</tr>
</table>

<h1>계산기에서 보여줘야할 데이터들!!!!!!!</h1>
<table>
	<tr>
		<td>프랜차이즈명 : ${param.comName}</td>
	</tr>
	<tr>
		<td>지역 : ${param.areaName}</td>
	</tr>
	<tr>
		<td>총매출 : (월)  ${monthSales}만원 (1평당해당지역매출평균 * 유저고른평수 / 12개월)</td>
		<td></td>
	</tr>
	<tr>
		<td>월세 : ${param.monthlyRent }만원</td>
	</tr>
	<tr>
		<td>희망평수 : ${param.size} 평</td>
	</tr>
	<tr>
		<td>인건비 : ${param.workPayMonth}만원</td>
	</tr>
	<tr>
		<td>기타비용 : ${param.etcPay}만원</td>
	</tr>
	<tr>
		<td>매출대비원가율 : ${param.payRatio}%</td>
	</tr>
	<tr>
		<td>총매출 - 매출대비원가비율 : ${monthSales_payRatio}만원 </td>
	</tr>
	<tr>
		<td> <h1>순이익 예상(월): ${netIncome}만원 </h1> </td>
	</tr>
</table>

<form>
	<button onclick="window.location='/franchise/incomeCalcMain'"> 다시 하기 </button>
</form>



<!-- footer 복붙 -->        
<%@ include file="../includes/footer.jsp" %>