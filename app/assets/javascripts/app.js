$(document).ready(function() {
	$("#name_dropdown").change(function() {
		window.location.href = "http://localhost:3000/" + $(this).val();
	});	
});