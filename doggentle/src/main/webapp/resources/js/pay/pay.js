$(document).ready(function(){
	$('#confirm').click(function(){
		$.ajax({
			url:'/www/kakao/pay.blp',
			dataType:'json',
			success:function(data){
				alert(data.tid);
				var box = data.next_redirect_pc_url;
				window.open(box);
			},
			error:function(error){
				alert(error);
			}
		});
	});
});