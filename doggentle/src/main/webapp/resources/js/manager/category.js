$(document).ready(function(){
	$('#bbtn').click(function() {
		window.history.back();
	});
	
	$('#cate2').css('display', 'none');
	$('#cate3').css('display', 'none');
	
	var large = $('#large').val();
	var middle = $('#cate2').parent().attr('id');
	var small = $('#cate3').parent().attr('id');
			
	if(large) {
		$.ajax({
			url: '/www/manager/cateList.dog',
			type: 'post',
			dataType: 'json',
			data: {
				cano: large
			},
			success: function(arr){
				$('#cate2').css('display', 'none').html('<option value="" disabled selected># 중분류 #</option>');

				if(arr.length != 0){
					for(var i = 0 ; i < arr.length ; i++ ){
						if(arr[i].cano == middle) {
							$('#cate2').append('<option value="' + arr[i].cano + '" selected>' + arr[i].caname + '</option>');
						} else {
							$('#cate2').append('<option value="' + arr[i].cano + '">' + arr[i].caname + '</option>');
						}
					}
					$('#cate2').show();
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
			}
		});
		$.ajax({
			url: '/www/manager/cateList.dog',
			type: 'post',
			dataType: 'json',
			data: {
				cano: middle
			},
			success: function(arr){
				$('#cate3').css('display', 'none').html('<option value="" disabled selected># 소분류 #</option>');

				if(arr.length != 0){
					for(var i = 0 ; i < arr.length ; i++ ){
						if(arr[i].cano == small) {
							$('#cate3').append('<option value="' + arr[i].cano + '" selected>' + arr[i].caname + '</option>');
						} else {
							$('#cate3').append('<option value="' + arr[i].cano + '">' + arr[i].caname + '</option>');
						}
					}
					$('#cate3').show();
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
			}
		});
	}
	
	$('#cate1').change(function() {
		var sno = $(this).val();
				
		$('#cate2').css('display', 'none');
		$('#cate3').css('display', 'none');
		$.ajax({
			url: '/www/manager/cateList.dog',
			type: 'post',
			dataType: 'json',
			data: {
				cano: sno
			},
			success: function(arr){
				$('#cate2').css('display', 'none').html('<option value="" disabled selected># 중분류 #</option>');

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
				$('#cate3').css('display', 'none').html('<option value="" disabled selected># 소분류 #</option>');

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
		$('.picbox').show();

		if(!str){
			$('.picbox').hide();
			return;
		}
		var path = URL.createObjectURL(evt.target.files[0]);
		$('#img').attr('src', path);
		
		$('#previewbox').css('display', 'block');
	});
	
	$('#addbtn').click(function() {
		$('#frm').submit();		
	});


});