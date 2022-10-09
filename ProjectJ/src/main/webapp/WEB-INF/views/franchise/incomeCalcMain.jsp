<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>

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
						str+= "<label class='agree fx alc je' id='"+ result[i].s_comName +"'>";
						str+= "<input type='checkbox' value='"+ result[i].s_comName +"' class='resultBtn' id='"+ result[i].s_comName +"' name='"+result[i].s_comName+"'onclick='clickCheck(this)''><span class='chkbox'></span></label></td></tr>";
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
		$("#getBtn").on("click",function(e){
			let size = $("#size").val();
			let areaName = $("#areaName").val();
			let comName= $("input:checkbox[class=resultBtn]:checked").val();

			//let comNameListDiv = $("#comNameList");
			console.log(search); // 여기까지 담김

				$.ajax({
					type: "GET",
					url: "/search/getResultSales",
					data: {"size" : size, "areaName" : areaName,"comName" : comName },
					contentType: "application/json;charset=utf-8",
					success: function(data){
						console.log("요청 성공!!!!!");
						console.log(data);
						$("#resultSales").val(data.resultSalesSize);
						$("#payRatio").val(Math.floor((data.i_payRatio/100)*data.resultSalesSize));
						$("#workPayMonth").val(Math.floor((data.i_workPayMonth/100)*data.resultSalesSize));
						$("#monthlyRent").val(Math.floor((data.i_monthlyRent/100)*data.resultSalesSize));
						$("#etcPay").val(Math.floor((data.i_etcPay/100)*data.resultSalesSize));
						$("#salesFee").val(Math.floor((data.i_salesFee/100)*data.resultSalesSize));

						$("#realResult").val(data.resultSalesSize - Math.floor((data.i_payRatio/100)*data.resultSalesSize) - Math.floor((data.i_workPayMonth/100)*data.resultSalesSize) - Math.floor((data.i_monthlyRent/100)*data.resultSalesSize) - Math.floor((data.i_etcPay/100)*data.resultSalesSize) - Math.floor((data.i_salesFee/100)*data.resultSalesSize));
					},
					error: function(e) {
		            	console.log("요청 에러......");
		                console.log(e);
					}
				});

		});  // $("#getBtn")
	}); // $(document).

	function clickCheck(target) { // 체크박스 여러개 체크하지 않게 !!! onclick 이벤트
	    document.querySelectorAll(`input[type=checkbox]`)
	        .forEach(el => el.checked = false);
	    target.checked = true;
		$("#hidden").remove();// 기존의 히든태그가 있다면 삭제 (중복히든태그문제 해결)
		var valueById = $("input:checkbox[class=resultBtn]:checked").val(); // 체크한 상호의 value 값 담김
		//var valueById = $(".resultBtn").val(); // 체크한 상호의 value 값 담김
		console.log(".resultBtn 벨류값 : " +valueById );
		let resultForm = $("#resultForm");
		let str="";
		str="<input type='hidden' id='hidden' name='comName' value='"+valueById  +"'>";
		$("#resultForm").find('table').append(str);
		$("#getResultSalesForm").find('table').append(str);
	}


	</script>
		<div>
		<table>
			<tr>
				<td>
					검색 : <input placeholder="되도록 정확한 기업명을 입력해주세요" type="text" name="comName" value="${comName }" id="search"> <button id="searchBtn" type="submit">검색하기</button>
				</td>
			</tr>
		</table>
		</div>
		<div>
			<table style="background-color:gold; padding:10px; margin: 0 auto; width:300px; height: auto;" id="comNameList">
				<!-- 검색한 결과값이 담길 테이블 -->
			</table>
		</div>

	</br></br>

	<form id="getResultSalesForm">
		<table>
			<tr>
				<td>
					<a>희망지역</a>
					<select class="selbox" name="areaName" id="areaName">
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
					<select class="selbox" name="size" id="size">
						<option value="" disabled>선택</option>
						<option value="1">1평</option><option value="2">2평</option><option value="3">3평</option><option value="4">4평</option><option value="5">5평</option>
						<option value="6">6평</option><option value="7">7평</option><option value="8">8평</option><option value="9">9평</option><option value="10">10평</option>
						<option value="11">11평</option><option value="12">12평</option><option value="13">13평</option><option value="14">14평</option><option value="15">15평</option>
						<option value="16">16평</option><option value="17">17평</option><option value="18">18평</option><option value="19">19평</option><option value="20">20평</option>
						<option value="21">21평</option><option value="22">22평</option><option value="23">23평</option><option value="24">24평</option><option value="25">25평</option>
					</select>
				</td>
				<td><button type="button" id="getBtn">매출가져오기</button> </td>
			</tr>
		</table>
	</form>

	<form action="/franchise/incomeCalcResult" method="get" id="resultForm">
		<table>
			<tr>
				<td><a>예상 총매출 </a><input type="number" name="resultSales" id="resultSales"></td>
			</tr>
			<tr>
				<td><a>원가</a><input type="number" name="payRatio" id="payRatio"></td>
			</tr>
			<tr>
				<td><a>직원 급여</a><input type="number" name="workPayMonth" id="workPayMonth"></td>
			</tr>
			<tr>
				<td><a>임대료</a><input type="number" name="monthlyRent" id="monthlyRent"></td>
			</tr>
			<tr>
				<td><a>관리비</a><input type="number" name="etcPay" id="etcPay"></td>
			<tr>
			<tr>
				<td><a>판매수수료</a><input type="number" name="salesFee" id="salesFee"></td>
			</tr>
			<tr>
				<td> 순이익 (월)<input type="number" id="realResult"/> </td>
			</tr>
			<tr>
				<td> <button type="submit">무슨버튼?</button>  <button type="button">초기화</button></td>
			</tr>
		</table>
	</form>


<script>
</script>

<!-- footer 복붙 -->
<%@ include file="../includes/footer.jsp" %>
