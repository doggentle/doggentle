$(document).ready(function(){
	//검색버튼
	$('#sPanel').css('display', 'none');
	
	$('#srcbtn').click(function(){
		$('#sPanel').html('');
		// 할일...
		// 기존 내용 지우고
		
		// 분류 번호 가져오고...
		var sgname = $('#keyword').val();
		
		var gname = $('#gname').val(sgname);
		
		$.ajax({
			url: '/www/srcList.dog',
			type: 'post',
			dataType: 'json',
			data: {
				gname: sgname
			},
			success: function(arr){
			
				if(arr.length > 0){
					for(var i = 0 ; i < arr.length ; i++ ){
						if(arr[i].dir) {
							var stag1 = 
								'<div class="w3-center w3-quarter product w3-padding" id="' + arr[i].gno + '">' +
								'<div class="w3-margin-bottom w3-col w3-border">' +
								'<img class="gbtn" src="' + (arr[i].dir + arr[i].savename ) + '" alt="Product" style="width:30%; height: 100px; cursor: pointer;">' +
								'<div class="w3-col" style="height: 92px;"><p>Code:' + arr[i].gno + ' </p><p>상품명 : ' + arr[i].gname + '</p><p>가 격 : ' + arr[i].price + '</p></div>' + 
								'</div>' +
								'</div>' ;
						
							$('#sPanel').append(stag1);
						} else {							
						
						var stag2 = 
								'<div class="w3-center w3-quarter product w3-padding" id="' + arr[i].gno + '">' +
								'<div class="w3-margin-bottom w3-col w3-border">' +
								'<img class="gbtn" src="' + (arr[i].savename ) + '" alt="Product" style="width:30%; height: 100px; cursor: pointer;">' +
								'<div class="w3-col" style="height: 92px;"><p>Code:' + arr[i].gno + ' </p><p>상품명 : ' + arr[i].gname + '</p><p>가 격 : ' + arr[i].price + '</p></div>' + 
								'</div>' +
								'</div>' ;
						
							$('#sPanel').append(stag2);
						}
					}
					$('#sPanel').css('display', 'block');
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
			}
		});
	});

	$('#sPanel').on('click', '.product', function(){
		// 할일
		// 상품번호 알아내고
		var gno = $(this).attr('id');	
		// post 방식 전송
	$(document.frm.gno).val(gno);
		$('#frm').submit();
	}); 
	


    });