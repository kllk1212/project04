<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>
	

	<h1> 프랜차이즈 조건으로 검색? 찾기? 추천?? </h1>
	</br></br></br>
	<div>
		<form method="get">
			<table>
				<tr>
					<td>
						<a>테마</a>
						<select class="selbox" name="type" id="type">
						    <option value="" disabled>지역선택</option>
						    <option value="치킨">치킨</option>
						    <option value="피자">피자</option>
						    <option value="커피">커피</option>
						    <option value="음료">음료</option>

						</select>
					</td>
					<td>
						<a>지역</a>
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
						<a>조건선택</a>
						<select class="selbox" name="constraint" id="constraint"><!--제약조건 -->
						    <option value="" disabled>조건선택</option>
						    <option value="1">매출높은순</option>
						    <option value="2">점포많은순</option>
						    <option value="3">가맹부담비낮은순</option>
						</select>
					</td>
					<td>
						<button type="button" id="searchBtn">선택완료</button>
					</td>
				</tr>							
			</table>
		</form>
	</div>
	<div>
		<table style="height: auto;" id="comNameList"> 
			<!-- 검색한 결과값이 담길 테이블 -->
		</table>
	</div>
	
	
	<script>
	$(document).ready(function(){
		$("#searchBtn").on("click",function(e){
			let type = $("#type").val();
			let areaName = $("#areaName").val();
			let constraint = $("#constraint").val();
			let comNameListDiv = $("#comNameList");
			console.log("type : " +type);
			console.log("areaName : " +areaName);
			console.log("constraint : " +constraint);
			$.ajax({
				type: "GET",
				url: "/search/searchDataConstraint",
				data: {"type" : type,"areaName" : areaName,"constraint" : constraint},
				contentType: "application/json;charset=utf-8",
				success: function(result){
					console.log("요청 성공!!!!!");
					console.log(result);
					console.log(result.length);
					let str= "";
					//str += "<tr><td><a> 검색된 결과 수 : "+result.length +"</a></td></tr>";
					str += "<tr><td><a> 상위 프랜차이즈 5곳</a></td></tr>";
					for(let i = 0; i < 5; i++){ //result.length 일단 5개까지만
						
						str+= "<tr><td>"+ result[i].l_comName +"</td><td>";
						str+= "<label class='agree fx alc'>";	// 수정한거
						//str+= "<label class='agree fx alc' id='"+ result[i].l_comName +"'>"; 원래꺼
						str+= "<input type='checkbox' value='"+ result[i].l_comName +"' class='resultBtn' id='"+ result[i].l_comName +"' name='"+result[i].l_comName+"'onclick='clickCheck(this)''><span class='chkbox'></span></label></td></tr>";
					}
					str +="<td><input type='text' name='comName'><button type='submit'>(으)로 상세검색</button></td>";
					comNameListDiv.html(str); // table에 tr td 넣기
					
				},
				error: function(e) {
	            	console.log("요청 에러......");
	                console.log(e);
	                str += "<tr><td><a> 검색된 결과가 없습니다</a></td></tr>";
	                comNameListDiv.html(str); // table에 tr td 넣기
				}
			}); //ajax				
		});// $("#searchBtn") 서치버튼 클릭시 !
		/*
		$(".comName").on("click",function(e){
			let dd = $("#comName").val();
			log.info(dd);
		});*/
		
	});//$(document). 시작부분
	function clickCheck(target) { // 체크박스 여러개 체크하지 않게 !!! onclick 이벤트 
	    document.querySelectorAll(`input[type=checkbox]`)
	        .forEach(el => el.checked = false);
	    target.checked = true;
		console.log("이벤트실행");
		if(event.target.checked)  {
		    let result = event.target.value;
			console.log(result);
			$('input[name=comName').attr('value',result);
		    
		}


	}
	</script>
	
	
	
	
<!-- footer 복붙 -->        
<%@ include file="../includes/footer.jsp" %>