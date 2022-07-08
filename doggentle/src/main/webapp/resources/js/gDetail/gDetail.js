   $(document).ready(function(){
            //-- Click on detail
            $("ul.gmenu-items > li").on("click",function(){
                $("ul.gmenu-items > li").removeClass("gactive");
                $(this).addClass("gactive");
            });

            $(".attr,.attr2").on("click",function(){
                var clase = $(this).attr("class");

                $("." + clase).removeClass("active");
                $(this).addClass("active");
            });

            //-- Click on QUANTITY
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