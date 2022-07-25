// STAR RATING
var star;
var ck = false;

function add(ths, score) {
	for (var i = 1; i <= 5; i++) {
		var cur = document.getElementById("star" + i)
		cur.className = "far fa-star"
	}
	for (var i = 1; i <= score; i++) {
		var cur = document.getElementById("star" + i)
		if (cur.className == "far fa-star") {
			cur.className = "fas fa-star"
		}
	}
	$('#score').val(score);
}

$(document).ready(function() {

	   $('#filebox').on('change', '.upfile', function(evt){
	      var str = $(this).val();
	      $('.picbox').show();
	      
	      if(!str){
	         $('.picbox').hide();
	         ck = false;
	         return;
	      }
	      var path = URL.createObjectURL(evt.target.files[0]);
	      $('#img').attr('src', path);
	      
	      $('#previewbox').css('display', 'contents');
	      ck = true;
	      
	   });
	   
	   $('#reviewbtn').click(function() {
		   var tit = $('#title').val()
		   var bod = $('#body').val()
		   		   
		   if(!ck) {
			   $('#file').attr('disabled', true);
		   }		   
		   $('#frm').submit();
	   });
	 
});