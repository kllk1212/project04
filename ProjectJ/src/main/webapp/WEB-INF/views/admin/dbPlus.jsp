<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<!-- header 복붙 -->
	<%@ include file="../includes/header.jsp" %>
<!-- 
	업종 외식 종류 15개 
	
	한식 A1		갯수 = 3238	pageNum = 324 
	분식 B1		갯수 = 688	pageNum = 69 
	중식 C1		갯수 = 274	pageNum = 28
	일식 D1		갯수 = 442	pageNum = 45
	서양식 E1	갯수 = 297	pageNum = 30 
	기타외국식 F1	갯수 = 297	pageNum = 30 
	패스트푸드 G1	갯수 = 171	pageNum = 18 
	치킨 H1         갯수 = 718	pageNum = 72 ** 선택1 **       
	피자 I1		갯수 = 252	pageNum = 26 ** 선택2 **
	제과제빵 J1	갯수 = 269	pageNum = 27 
	아이스크림 K1	갯수 = 64	pageNum = 7  ******* DB연습넣기 좋음 64개!!
	커피 L1		갯수 = 815	pageNum = 82 ** 선택3 **
	음료 M1		갯수 = 114	pageNum = 12
	주점 N1		갯수 = 451	pageNum = 46 ** 선택4 ** 
	
	기타외식 O1	갯수 = 1487	pageNum = 149 
	(고깃집,횟집 등등)
 -->

	<table>
		<tr>
			<td> <h1>공정거래 위원회 정보공개서 DB로 가져오기</h1> </td>
		</tr>
		<tr>
			<td> 1. 테마선택 </td>
		</tr>
		<tr>
			<td> 2. db에 추가하고 싶은 외식업 TYPE 셀렉트에서 선택 </td>
		</tr>

		<tr>
			<td> 3. DB에저장하기 클릭하면 크롬창이 하나 켜지는데 크롬창이 수십번 켜졌다 꺼졌다를 반복 기다리면 추가 완료 </td>
			<td> * 약 1시간소요 종료가 되었다는 팝업창이 뜰때까지 크롬창을 절대 종료하지마세요. </td>
		</tr>
	</table>


	<form action="dbPlusPro" method="get">
		<table>
			<tr>	
				<td>
				<select id="menu" name="type" required>
				    <option value="" disabled selected>메뉴</option>
				    <option value="A1">한식</option>
				    <option value="B1">분식</option>
				    <option value="C1">중식</option>
				    <option value="D1">일식</option>
				    <option value="E1">서양식</option>
				    <option value="F1">기타외국식</option>
				    <option value="G1">패스트푸드</option>
				    <option value="H1">치킨</option>
				    <option value="I1">피자</option>
				    <option value="J1">제과제빵</option>
				    <option value="K1">아이스크림</option>
				    <option value="L1">커피</option>
				    <option value="M1">음료(커피외)</option>
				    <option value="N1">주점</option>
				</select>
				<input type="submit" value="DB에저장하기" > </td>
			</tr>
		</table>
	</form>
	<br/>
	<h1>DB 중복 검사</h1>
	
	<form action="check" method="get">
		<table>
			<tr>
				<td>검색어 : <input type="text" name="comName"> </td>
				<td><input type="submit" value="찾기"> </td>
			</tr>
		</table>
	</form>
	
	
	
   	<!-- footer 복붙 -->        
	<%@ include file="../includes/footer.jsp" %>
