<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">

    <title>창업나무</title>

    <!-- <link rel="icon" href="/{=favicon}" -->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">

    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/resources/skin/css/main.css?v=<?=time()?>">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/ScrollMagic.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/debug.addIndicators.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.5/plugins/animation.gsap.js"></script>
    <script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
    <script src="/resources/skin/js/jquery.cookie.js"></script>
    <script defer src="/resources/skin/js/common.js"></script>

    <!-- <script src="https://www.youtube.com/player_api"></script> -->


</head>
<!-- ============================================================================= -->
<!-- ============================================================================= -->

<!-- 마우스드래그금지 -->
<!-- <body ondragstart="return false" onselectstart="return false"> -->

<body>
    <h1 id="Homepage" class="bld">창업나무 홈페이지</h1>
    <!-- wrap -->
    <div id="wrap">
        <!-- container -->
        <div id="container">
            <!-- ======================================== -->
            <!-- header -->
            <header id="header" class="header">
                <div class="header_wrap layout_wrap">
                    <div class="header_left">
                        <div class="header_logo">
                            <a href="../main/main">
                                <img src="/resources/skin/img/common/logo.png" alt="창업나무">
                            </a>
                        </div>
                        <nav class="nav">
                            <ul id="gnb" class="gnb">
                                <li><a href="../main/main">홈</a></li>
                                <li class="depth">
                                    <a href="">프렌차이즈 정보</a>
                                    <div>
                                        <ul class="fx">
                                            <li><a href="../franchise/reviewMain">기업평점/리뷰</a></li>
                                            <li><a href="../franchise/rankMain">순위</a></li>
                                            <li><a href="#">분석기</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li><a href="../franchise/incomeCalcMain">예상매출 계산기</a></li>
                                <li><a href="../main/siteInfo">사이트 소개</a></li>
                                <li><a href="">QnA</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="header_right">
                        <button type="button" id="headerBtn" onclick="location.href='../main/login' ">로그인 및 회원가입</button>
                    </div>
                </div>
            </header>
            <!-- //header -->
