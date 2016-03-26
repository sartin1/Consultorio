$(document).ready(function() {
	$.ajax({
		url: "index.php?page=im_chat",
		success: function(data) {

			if (data.match("Acceso denegado")) {
				/* Si la pagina contiene acceso denegado, no debemos cargar el chat */
				//alert("No tienes acceso al Chat");
			} else {
				$('body').append(data);

				$(".selector-toggle a").click(function() {
					$("#styleSelector").toggleClass("open");
				})
			}
		},
		dataType: 'html'
	});
});
