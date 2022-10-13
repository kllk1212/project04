<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>

	<h1 id="titleConstraint"> 프랜차이즈 찾기 <button class="turnBtn leeActive" id="returnSearchBtn">조건검색</button><button class="turnBtn leeActive" id="normalSearchBtn">일반검색</button>  </h1>
	</br></br></br>
	<div class="searchBox center-m" id="normalDiv">
	    <input placeholder="기업명을 입력해주세요" type="text" name="comName" value="" id="search">
	    <!-- <input placeholder="되도록 정확한 기업명을 입력해주세요" type="text" name="comName" value="${comName }" id="search"> -->
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
	    <button id="normalSearch" type="submit">찾기</button>
	</div>
	<div id="constraintDiv"><!-- Constraint 제약이라는 뜻이라함  -->
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
						    <option value="주점">주점</option>

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
						    <option value="" disabled>****조건선택****</option>
						    <option value="1">매출높은순</option>
						    <option value="2">점포많은순</option>
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
		<form>
			<table style="height: auto;" id="comNameList"> 
				<!-- 검색한 결과값이 담길 테이블 -->
			</table>
		</form>
	</div>


	
	
	<script>
	$(document).ready(function(){
		
		// 첨에 들어오면 조건검색버튼 파랑색 , 일반검색버튼 회색
		$("#normalSearchBtn").removeClass("turnBtn leeActive");
		$("#normalSearchBtn").addClass("turnBtn");
		
		//returnSearchBtn - 조건검색 버튼 
		

		
		
		$("#normalDiv").hide();		// 그냥 검색하는인풋태그div 숨김
		// 일반 검색 클릭시 
		$("#normalSearchBtn").on("click",function(e){
			$("#normalSearchBtn").removeClass("turnBtn");
			$("#normalSearchBtn").addClass("turnBtn leeActive");
			$("#returnSearchBtn").removeClass("turnBtn leeActive");
			$("#returnSearchBtn").addClass("turnBtn");
			$("#constraintDiv").hide();	// 조건검색창 숨기기
			$("#comNameList").hide();	// 조건검색 결과창 숨기기
			//$("#returnSearchBtn").show();	// 돌아갈래요 버튼 보이기
			$("#normalDiv").show();		//일반검색 인풋태그div 보이게
		});
		// 조건검색 버튼 클릭시
		$("#returnSearchBtn").on("click",function(e){
			$("#returnSearchBtn").removeClass("turnBtn");
			$("#normalSearchBtn").addClass("turnBtn leeActive");
			$("#normalSearchBtn").removeClass("turnBtn leeActive");
			$("#normalSearchBtn").addClass("turnBtn");
			$("#constraintDiv").show(); // 조건검색창 보이기
			$("#comNameList").hide(); 	// 조건검색 결과창 보이기
			//$("#normalSearchBtn").show();	// 일반검색 버튼 보이기
			$("#normalDiv").hide();		//일반검색 인풋태그div 숨김
		});
		
		// 검색 버튼 클릭시
		$("#searchBtn").on("click",function(e){
			$("#comNameList").show();
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
						str+= "<input type='checkbox' value='"+ result[i].l_comName +"' class='resultBtn' id='"+ result[i].l_comName +"'onclick='clickCheck(this)''><span class='chkbox'></span></label></td></tr>";
					}
					str +="<td><input type='text' name='comName' class='inputTrigger' readonly><button type='button' onclick='targetFunction();'>(으)로 상세검색</button></td>";
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
		$("#normalSearch").on("click",function(e){
			$("#comNameList").show();
			console.log("들어옴");
			let search = $("#search").val();
			let comNameListDiv = $("#comNameList");
			console.log("서치한거 : "+search); // 여기까지 담김

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
						str += "<tr><td><span class='commentBox'> 검색된 결과 수 : "+result.length +"</span></td></tr>";
						for(let i = 0; i < result.length; i++){ //result.length 일단 5개까지만

							str+= "<tr><td>"+ result[i].s_comName +"</td><td>";
							str+= "<label class='agree fx alc je' id='"+ result[i].s_comName +"'>";
							str+= "<input type='checkbox' value='"+ result[i].s_comName +"' class='resultBtn' id='"+ result[i].s_comName +"' name='"+result[i].s_comName+"'onclick='clickCheck(this)''><span class='chkbox'></span></label></td></tr>";
						}
							//str +="<td><input type='text' name='comName' class='inputTrigger'><button type='button' id='detail'>(으)로 상세검색</button></td>";
							str +="<td><input type='text' name='comName' class='inputTrigger' readonly><button type='button' onclick='targetFunction();'>(으)로 상세검색</button></td>";
						comNameListDiv.html(str); // table에 tr td 넣기

					},
					error: function(e) {
		            	console.log("요청 에러......");
		                console.log(e);
		                str += "<tr><td><a> 검색된 결과가 없습니다</a></td></tr>";
		                comNameListDiv.html(str); // table에 tr td 넣기
					}
				}); //ajax
		});// $("#normalSearch") 		
	});//$(document). 시작부분
	function clickCheck(target) { // 체크박스 여러개 체크하지 않게 !!! onclick 이벤트 
	    document.querySelectorAll(`input[type=checkbox]`)
	        .forEach(el => el.checked = false);
	    target.checked = true;
		console.log("이벤트실행");
		if(event.target.checked)  {
		    let result = event.target.value;
			let areaName = $("#areaName").val();		    
			console.log(result);
			$('input[name=comName').attr('value',result);
			//window.location='../diagnosis/diagnosisResult?comName='+result+'&areaName='+areaName; // 체크박스 클릭시 바로 페이지이동
		}
	}
	function targetFunction() {
		let areaName = $("#areaName").val();
		let comName = $(".inputTrigger").val();
		console.log("areaName : " + areaName);
		console.log("comName : " + comName);
		window.location='../diagnosis/diagnosisResult?comName='+comName+'&areaName='+areaName;
	}
	</script>
<!-- footer 복붙 -->        
<%@ include file="../includes/footer.jsp" %>