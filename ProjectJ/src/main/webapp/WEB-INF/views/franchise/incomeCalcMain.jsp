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
					let str= "";
					for(let i = 0; i < result.length; i++){
						str+= "<div>"+ result[i].s_comName +"</div>"
					}
					comNameListDiv.html(str);
				},
				error: function(e) {
	            	console.log("요청 에러......");
	                console.log(e);
				}
			}); //ajax
			
			
		}); // $("#searchBtn").
	}); // $(document).
	
	
	</script>

		<table>
			<tr>
				<td>
					검색 : <input type="text" name="comName" value="${comName }" id="search"> <button id="searchBtn" type="submit">검색하기</button>
				</td>
			</tr>
		</table>
		<div id="comNameList">
			<div>회사명 : </div>
		</div>
		
	</br></br>
	
	<form action="" method="get">
		<table>
			<tr>
				<td>
					희망지역 : 				
					<select class="selbox" name="지역">
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
					희망평수 : 
					<select class="selbox" name="평수">
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
					<select class="selbox" name="월세">
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
					<select class="selbox" name="인건비">
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
					<select class="selbox" name="기타비용">
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
					<select class="selbox" name="기타비용">
						<option value="" disabled>선택</option>
						<option value="10">10%</option>
						<option value="20%">20%</option>
						<option value="30%">30%</option>
						<option value="40%">40%</option>
						<option value="direct">직접입력</option>
					</select>					
				</td>
			</tr>
		</table>
	</form>


<script>

</script>
	
<!-- footer 복붙 -->        
<%@ include file="../includes/footer.jsp" %>