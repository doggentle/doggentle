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
						var stag = 

									'<div class="w3-center w3-quarter product" id="' + arr[i].gno + '">' +
									'<div class="w3-col w3-margin-bottom">' +
									'<img class="gbtn" src="/www' + (arr[i].dir + arr[i].savename ) + '" alt="Product" style="width:30%;cursor: pointer;">' +
									'<div class="w3-col" style="height: 92px;"><p>Code:' + arr[i].gno + ' </p><p>상품명 : ' + arr[i].gname + '</p><p>가 격 : ' + arr[i].price + '</p></div>' + 
									'</div>' +
									'</div>' ;
						
						$('#sPanel').append(stag);
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