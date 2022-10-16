$(function(){
    // ============================================================
    // ============ Header ========================================
    // ============================================================

    // 메뉴 마우스 오버시 디자인 나타나기
    $('.gnb > li').hover(function(){
        $(this).addClass('active');
    },function(){
        $(this).removeClass('active');
    });
    // 하위메뉴 있는 메뉴에 마우스 오버시 하위 메뉴 나타나기
    $('.depth').hover(function(){
        $(this).find('div').fadeIn();
    },function(){
        $(this).find('div').fadeOut();
    });

    var pageName = $(".page").attr("data-id");

	//console.log(pageName);
    $("#gnb a").each(function(i, e) {

        var gnbSplit = $(this).attr("href").split("/");
        var slice = gnbSplit.slice(1,2);
        var gnbDeco = String(slice);

        // 헤더 밑줄확인~
        console.log(slice);
        console.log(pageName);
        console.log(gnbDeco);
        if(slice == gnbDeco){
            $(this).closest("li").addClass("active");
        }

    });

    // ============================================================
    // ============ form ==========================================
    // ============================================================

    // form 내부에서 엔터를 눌러야하는 곳에선 엔터눌렀을 때 submit 동작시키기
    $('.inputTrigger').on('keypress', function(e){
        if(e.keyCode == '13'){
            $(this).closest('form').find('[type="submit"]').tigger('click');
        }
    });

    $('#resultForm input[type="number"]').each(function(){
        $(this).closest('td').addClass('pr');
        $(this).after('<span class="unit-money">만원</span>');
    })

});
