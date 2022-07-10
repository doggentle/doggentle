$(document).ready(function(){
	$('#gPanel').css('display', 'none');
	$('.w3-select').not('#cate1').css('display', 'none');
	
	$('.w3-select').not('#cate3').change(function(){
		var sno = $(this).val();
		var tarr = {
				'cate2': '카테고리2',
				'cate3': '카테고리3'
		};
		
		var el = $(this).parent().next().find('.w3-select');
		$(el).css('display', 'none');
		
		var tname = $(el).attr('id');
		if(tname == 'cate2'){
			$('#cate3').css('display', 'none');
		}
		
		$(el).html('<option disabled selected>' + tarr[tname] + '</option>');
		$.ajax({
			url: '/www/cateList.dog',
			type: 'post',
			dataType: 'json',
			data: {
				cano: sno
			},
			success: function(arr){
				if(arr.length != 0){
					for(var i = 0 ; i < arr.length ; i++ ){
						$(el).append('<option value="' + arr[i].cano + '">' + arr[i].caname + '</option>');
					}
					$(el).css('display', 'block');
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
			}
		});
	});
	
	$('#cate3').change(function(){
		// 할일...
		// 기존 내용 지우고
		$('#pPanel').css('display', 'none');
		$('#pPanel').html('');
		
		// 분류 번호 가져오고...
		var sno = $(this).val();
		
		$.ajax({
			url: '/productList.dog',
			type: 'post',
			dataType: 'json',
			data: {
				cano: sno
			},
			success: function(arr){
				if(arr.length > 0){
					for(var i = 0 ; i < arr.length ; i++ ){
						var stag = '<div class="w3-half w3-center pdAll5 product" id="' + arr[i].gno + '">' +
									'<div class="w3-col w3-card-4 pdAll10">' +
									'<img src="' + (arr[i].dir + arr[i].sname ) + '" alt="Product" style="width:100%">' +
									'<div class="w3-col" style="height: 92px;"><h3>' + arr[i].gname + '</h3></div>' + 
									'<p>가 격 : ' + arr[i].price + '</p>' + 
									'</div>' +
									'</div>';
						
						$('#gPanel').append(stag);
					}
					$('#gPanel').css('display', 'block');
				}
			},
			error: function(){
			
				alert('### 통신 오류 ###');
			}
		});
	});
	
	$('#gPanel').on('click', '.Product', function(){
		// 할일
		// 상품번호 알아내고
		var sno = $(this).attr('id');
	
		// post 방식 전송
		$(document.frm.gno).val(sno);
		$('#frm').submit();
	});
});