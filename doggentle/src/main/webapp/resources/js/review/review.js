// STAR RATING
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
	alert(score);
}