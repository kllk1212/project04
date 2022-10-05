<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>
<script type="text/javascript" src="/resources/skin/jquery.twbsPagination.min.js"></script>
	<h1>월 매출예상 계산기</h1>
	<script>

	$(document).ready(function() {
		
		$("#searchBtn").on("click",function(e){
		let search = $("#search").val();
		let comNameListDiv = $("#comNameList");
		console.log(search); // 여기까지 담김


		    
			$.ajax({
				type: "GET",
				url: "/search/searchData",
				data: {"comName" : $("#search").val() },
				contentType: "application/json;charset=utf-8",
				success: function(result){
					console.log("요청 성공!!!!!");
					console.log(result);
					console.log(result.length);
					let str= "";
					str += "<tr><td><a> 검색된 결과 수 : "+result.length +"</a></td></tr>";

					for(let i = 0; i < result.length; i++){ //result.length 일단 5개까지만
						
						str+= "<tr><td>"+ result[i].s_comName +"</td><td>";
						str+= "<label class='agree fx alc' id='"+ result[i].s_comName +"'>";
						str+= "<input type='checkbox' class='resultBtn' id='"+ result[i].s_comName +"' name='"+result[i].s_comName+"'onclick='clickCheck(this)''><span class='chkbox'></span></label></td></tr>";
						//str+= "<tr><td>"+ result[i].s_comName +"<button type='button' id='resultCheckBtn'>선택</button></td></tr>"
					}
					comNameListDiv.html(str); // table에 tr td 넣기
					
					
				},
				error: function(e) {
	            	console.log("요청 에러......");
	                console.log(e);
	                str += "<tr><td><a> 검색된 결과가 없습니다</a></td></tr>";
	                comNameListDiv.html(str); // table에 tr td 넣기
				}
			}); //ajax					
		}); // $("#searchBtn").		


	}); // $(document).
	
	function clickCheck(target) { // 체크박스 여러개 체크하지 않게 !!! onclick 이벤트 
	    document.querySelectorAll(`input[type=checkbox]`)
	        .forEach(el => el.checked = false);
	    target.checked = true;
	}
	
	</script>
		<table>
			<tr>
				<td>
					검색 : <input type="text" name="comName" value="${comName }" id="search"> <button id="searchBtn" type="submit">검색하기</button>
				</td>
			</tr>
		</table>
		<div>
			<table id="comNameList"> 
				<!-- 검색한 결과값이 담길 테이블 -->
			</table>
		</div>

	</br></br>
	
	<form action="/franchise/incomeCalcResult" method="get">
		<table>
			<tr>
				<td>
					<a>희망지역</a>			
					<select class="selbox" name="l_areaName">
					    <option value="" disabled>지역선택</option>
					    <option value="서울">서울</option>
					    <option value="부산">부산</option>
					    <option value="대구">대구</option>
					    <option value="인천">인천</option>
					    <option value="광주">광주</option>
					    <option value="대전">대전</option>
					    <option value="울산">울산</option>
					    <option value="세종">세종</option>
					    <option value="경기">경기</option>
					    <option value="강원">강원</option>
					    <option value="충북">충북</option>
					    <option value="충남">충남</option>
					    <option value="전북">전북</option>
					    <option value="전남">전남</option>
					    <option value="경북">경북</option>
					    <option value="경남">경남</option>
					    <option value="제주">제주</option>
					</select>
				</td>
				<td>
					<a>희망평수</a>
					<select class="selbox" name="area">
						<option value="" disabled>선택</option>
						<option value="5">5평</option>
						<option value="6">6평</option>
						<option value="8">7평</option>
						<option value="9">8평</option>
						<option value="10">9평</option>
						<option value="11">10평</option>
						<option value="12">11평</option>
						<option value="13">12평</option>
						<option value="direct">직접입력</option>
					</select>
				</td>
				<td>
					<a>월세</a>
					<select class="selbox" name="monthlyRent">
						<option value="" disabled>선택</option>
						<option value="50">50만원</option>
						<option value="100">100만원</option>
						<option value="200">200만원</option>
						<option value="250">250만원</option>
						<option value="direct">직접입력</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<a>인건비</a>
					<select class="selbox" name="workPayMonth">
						<option value="" disabled>선택</option>
						<option value="50">50만원</option>
						<option value="100">100만원</option>
						<option value="200">200만원</option>
						<option value="250">250만원</option>
						<option value="direct">직접입력</option>
					</select>
				</td>
				<td>
					<a>기타비용</a>
					<select class="selbox" name="ectPay">
						<option value="" disabled>선택</option>
						<option value="50">50만원</option>
						<option value="100">100만원</option>
						<option value="200">200만원</option>
						<option value="250">250만원</option>
						<option value="direct">직접입력</option>
					</select>
				</td>
				<td>
					<a>매출대비원가율</a>
					<select class="selbox" name="payRatio">
						<option value="" disabled>선택</option>
						<option value="10">10%</option>
						<option value="20%">20%</option>
						<option value="30%">30%</option>
						<option value="40%">40%</option>
						<option value="direct">직접입력</option>
					</select>
				</td>
			</tr>
			<tr>
				<td> <button type="submit">결과조회</button> </td>
			</tr>
		</table>
	</form>


<script>

</script>
	
<!-- footer 복붙 -->        
<%@ include file="../includes/footer.jsp" %>