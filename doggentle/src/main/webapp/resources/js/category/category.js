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
		$('#gPanel').css('display', 'none');
 		$('#gPanel').html('');
		
		// 분류 번호 가져오고...
		var sno = $(this).val();
		
		$.ajax({
			url: '/www/productList.dog',
			type: 'post',
			dataType: 'json',
			data: {
				cano: sno
			},
			success: function(arr){
			
				if(arr.length > 0){
					for(var i = 0 ; i < arr.length ; i++ ){
						if(arr[i].dir) {
							var stag1 = 
								
								'<div class="w3-center w3-quarter product w3-padding" id="' + arr[i].gno + '">' +
								'<div class="w3-margin-bottom w3-col w3-border">' +
								'<img class="gbtn" src="' + (arr[i].dir + arr[i].savename) + '" alt="Product" style="width:30%; height: 100px; cursor: pointer;">' +
								'<div class="w3-col" style="height: 92px;"><p>Code:' + arr[i].gno + ' </p><p>상품명 : ' + arr[i].gname + '</p><p>가 격 : ' + arr[i].price + '</p></div>' + 
								'</div>' +
								'</div>' ;
							
							$('#gPanel').append(stag1);
							} else {							
							
							var stag2 = 

								'<div class="w3-center w3-quarter product w3-padding" id="' + arr[i].gno + '">' +
								'<div class="w3-margin-bottom w3-col w3-border">' +
								'<img class="gbtn" src="' + (arr[i].savename) + '" alt="Product" style="width:30%; height: 100px; cursor: pointer;">' +
								'<div class="w3-col" style="height: 92px;"><p>Code:' + arr[i].gno + ' </p><p>상품명 : ' + arr[i].gname + '</p><p>가 격 : ' + arr[i].price + '</p></div>' + 
								'</div>' +
								'</div>' ;
							
							$('#gPanel').append(stag2);
							
							}
					}
					$('#gPanel').css('display', 'block');
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
			}
		});
	});
	
	$('#gPanel').on('click', '.product', function(){
		// 할일
		// 상품번호 알아내고
		var sno = $(this).attr('id');
	
	$(document.frm.gno).val(sno);
		$('#frm').submit();
	}); 
	

});