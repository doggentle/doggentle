   $(document).ready(function(){
   
   //물건 클릭 했을때
   	$('.gbtn').click(function(){
		var sgno = $(this).attr('id');
		$('#gno').val(sgno);
		$('#frm').submit();
	});
   
   
            //-- 물품상세 설명 띄우기
            $("ul.gmenu-items > li").on("click",function(){
                $("ul.gmenu-items > li").removeClass("gactive");
                $(this).addClass("gactive");
            });

            $(".attr,.attr2").on("click",function(){
                var clase = $(this).attr("class");

                $("." + clase).removeClass("active");
                $(this).addClass("active");
            });

            //-- 수량버튼 이벤트처리
            $(".btn-minus").click(function(){
                var now = $('#quantity').val();
                if ($.isNumeric(now)){
                    if (parseInt(now) -1 > 0){ now--;}
                    $('#quantity').val(now);
                }else{
                    $('#quantity').val("1");
                }
            });          
              
            $(".btn-plus").click(function(){
                var now = $('#quantity').val();
                if ($.isNumeric(now)){
                    $('#quantity').val(parseInt(now)+1);
                }else{
                    $('#quantity').val("1");
                }
            });                        
        }); 