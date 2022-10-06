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
<<<<<<< HEAD
					console.log(result);
					console.log(result.length);
=======
					console.log(typeof(result));
					console.log(nowPage);

					 tmpDatabase2 = new Object();
	                    j = 0;
	                    for(i=0; i<result.length; i++){
	                        tmpDatabase2[j] = result[i].s_comName;
	                        if(Object.keys(tmpDatabase2).length==5){
	                        	//console.log(i+'if');
	                        	//console.log(tmpDatabase2);
	                        	//console.log(tmpDatabase);

	                            tmpDatabase[parseInt(((i+1)/5)-1)] = tmpDatabase2;

	                            tmpDatabase2 = new Object();
	                           // console.log(j+'if');
	                            j=0;
	                           // console.log('if');
	                        }else{
	                            j++;
	                           // console.log(j+'else');
	                           // console.log('else');
	                        }
	                        //tmpDatebase[0] = {tmpDatebase2[0],tmpDatebase2[1],tmpDatebase2[2],tmpDatebase2[3],tmpDatebase2[4]}
	                        //tmpDatebase[1] = {tmpDatebase2[5],tmpDatebase2[6],tmpDatebase2[7],tmpDatebase2[8],tmpDatebase2[9]}
	                    }

					console.log(tmpDatabase[0][0]);
					console.log(tmpDatabase[0][1]);
					console.log(tmpDatabase[0][2]);
					console.log("*******************");
                    //console.log(tmpDatabase[1]);
					//console.log(tmpDatabase);
>>>>>>> branch 'main' of https://github.com/kllk1212/project04.git
					let str= "";
<<<<<<< HEAD
					str += "<tr><td><a> 검색된 결과 수 : "+result.length +"</a></td></tr>";
					for(let i = 0; i < result.length; i++){ //result.length 일단 5개까지만
						
						str+= "<tr><td>"+ result[i].s_comName +"</td><td>";
						str+= "<label class='agree fx alc' id='"+ result[i].s_comName +"'>";
						str+= "<input type='checkbox' value='"+ result[i].s_comName +"' class='resultBtn' id='"+ result[i].s_comName +"' name='"+result[i].s_comName+"'onclick='clickCheck(this)''><span class='chkbox'></span></label></td></tr>";
=======

					for(let i = 0; i < Object.keys(tmpDatabase2).length; i++){ //result.length 일단 5개까지만
						str+= "<tr><td>"+ tmpDatabase[0][i] +"</td><td>";
						str+= "<label class='agree fx alc' id='"+ tmpDatabase[0][i] +"'>";
						str+= "<input type='checkbox' class='resultBtn' id='"+ tmpDatabase[0][i] +"' name='"+tmpDatabase[0][i]+"'onclick='clickCheck(this)''><span class='chkbox'></span></td></tr></label>";
>>>>>>> branch 'main' of https://github.com/kllk1212/project04.git
						//str+= "<tr><td>"+ result[i].s_comName +"<button type='button' id='resultCheckBtn'>선택</button></td></tr>"
<<<<<<< HEAD
=======
						// for()
>>>>>>> branch 'main' of https://github.com/kllk1212/project04.git
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
		$("#hidden").remove();// 기존의 히든태그가 있다면 삭제 (중복히든태그문제 해결)
		var valueById = $("input:checkbox[class=resultBtn]:checked").val(); // 체크한 상호의 value 값 담김
		//var valueById = $(".resultBtn").val(); // 체크한 상호의 value 값 담김
		console.log(".resultBtn 벨류값 : " +valueById );
		let resultForm = $("#resultForm");
		let str="";
		str="<input type='hidden' id='hidden' name='comName' value='"+valueById  +"'>";
		$("#resultForm").find('table').append(str);
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

	</br></br>
	
	<form action="/franchise/incomeCalcResult" method="get" id="resultForm">
	
		<table>
			<tr>
				<td>
					<a>희망지역</a>			
					<select class="selbox" name="areaName">
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
					<select class="selbox" name="size">
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
						<option value="300">300만원</option>
						<option value="400">400만원</option>
						<option value="500">500만원</option>
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
						<option value="300">300만원</option>
						<option value="400">400만원</option>
						<option value="500">500만원</option>
						<option value="direct">직접입력</option>
					</select>
				</td>
				<td>
					<a>기타비용</a>
					<select class="selbox" name="etcPay">
						<option value="" disabled>선택</option>
						<option value="50">50만원</option>
						<option value="100">100만원</option>
						<option value="200">200만원</option>
						<option value="250">250만원</option>
						<option value="300">300만원</option>
						<option value="400">400만원</option>
						<option value="500">500만원</option>
						<option value="direct">직접입력</option>
					</select>
				</td>
				<td>
					<a>매출대비원가율</a>
					<select class="selbox" name="payRatio">
						<option value="" disabled>선택</option>
						<option value="10">10%</option>
						<option value="20">20%</option>
						<option value="30">30%</option>
						<option value="40">40%</option>
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