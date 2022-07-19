$(document).ready(function(){
	$('#bbtn').click(function() {
		window.history.back();
	});
	
	$('#cate2').css('display', 'none');
	$('#cate3').css('display', 'none');
	
	$('#cate1').change(function() {
		var sno = $(this).val();
				
		$('#cate2').css('display', 'none');
		$.ajax({
			url: '/www/manager/cateList.dog',
			type: 'post',
			dataType: 'json',
			data: {
				cano: sno
			},
			success: function(arr){
				$('#cate2').css('display', 'none').html('<option disabled selected># 중분류 #</option>');

				if(arr.length != 0){
					for(var i = 0 ; i < arr.length ; i++ ){
						$('#cate2').append('<option value="' + arr[i].cano + '">' + arr[i].caname + '</option>');
					}
					$('#cate2').show();
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
			}
		});
		
	});
	
	$('#cate2').change(function() {
		var sno = $(this).val();
				
		$.ajax({
			url: '/www/manager/cateList.dog',
			type: 'post',
			dataType: 'json',
			data: {
				cano: sno
			},
			success: function(arr){
				$('#cate3').css('display', 'none').html('<option disabled selected># 소분류 #</option>');

				if(arr.length != 0){
					for(var i = 0 ; i < arr.length ; i++ ){
						$('#cate3').append('<option value="' + arr[i].cano + '">' + arr[i].caname + '</option>');
					}
					$('#cate3').show();
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
			}
		});
		
	});
	
	$('#filebox').on('change', '.upfile', function(evt){
		var str = $(this).val();
		var index = $(this).index();
		var tmp = $('.upfile');
		var max = tmp.length;
		if(!str){
			$(this).remove();
			$('.picbox').eq(index).remove();
			return;
		}
		var path = URL.createObjectURL(evt.target.files[0]);
		var el = $('.upfile');
		if((index + 1) != el.length){
			$('.infoAvtBox').eq(index).attr('src', path);
		}
		
		if(index == max - 1){
			$('#filebox').append('<input type="file" name="file" class="w3-input w3-border w3-margin-bottom upfile">');
			$('#preview').append('<div class="inblock pdAll10 picbox w3-card"><div class="w3-col w3-border w3-margin-right" style="width: 100px; height: auto; overflow: hidden;">' +
							'<img src="' + path + '" class="infoAvtBox">' + 
						'</div></div>');
		}
		$('#previewbox').css('display', 'block');
	});
});