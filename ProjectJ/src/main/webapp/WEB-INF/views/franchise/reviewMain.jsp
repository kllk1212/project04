<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header 복붙 -->
<%@ include file="../includes/header.jsp" %>
	
            <!-- contents -->
            <div id="contents" class="contents reviewMain page" data-id="reviewMain">
                <section class="section s-search">
                    <div class="layout_wrap">
                        <div class="countBox center-f">
                            <div class="imgBox">
                                <img src="/resources/skin/img/review/map_pin.png" alt="">
                            </div>
                            <div class="txtBox">
                                <span>등록되어있는 <br>
                                    브랜드 수 : <b>800</b></span>
                            </div>
                        </div>
                        <div class="searchBox">
                            <form action="/franchise/reviewSearch" method="get">
                                <input type="search" id="comName" name="comName" value="" placeholder="브랜드명을 입력해보세요.">
                                <button type="submit" id="search">검색</button>
                            </form>
                        </div>
                    </div>
                </section>
                <!-- reviewMain -->
                <section class="section s-swiper">
                    <div class="layout_wrap">
                        <!-- Slider main container -->
                        <div class="swiper reviewMain-swiper">
                            <!-- Additional required wrapper -->
                            <ul class="swiper-wrapper">
                                <!-- Slides (3)-->
                                <li class="swiper-slide">
                                    <div class="inwrap img_r">

                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <div class="inwrap img_r">

                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <div class="inwrap img_r">

                                    </div>
                                </li>
                            </ul>
                        </div>
                        <!-- //swiper -->
                    </div>
                </section>
            </div>
	
	
	
	
	
	
	
<!-- footer 복붙 -->        
<%@ include file="../includes/footer.jsp" %>