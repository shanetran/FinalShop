$(function() {

	//add wishlist
	$("body").on("click", ".add-wishlist", function() {
		var user_id = $(this).attr("data-user");
		var product_id = $(this).attr("data-product");
		$.ajax({
			url : "/add_product",
			data : {
				"user_id" : user_id,
				"product_id" : product_id
			},
			dataType : "json",
			type : "POST",
			success : function(data) {
				console.log("success");
				$.notify("Add product to wishlist success. ", "success");
				var html1 = "";
				html1 += "<button type='button' data-user='" + user_id + "' data-product='" + product_id + "' class='btn btn-primary rv-wishlist'>";
				html1 += "Remove From Wishlist";
				html1 += "</button>";
				$(".actions-wishlist").html(html1);
			},
			error : function() {
				console.log("error");
			}
		});
		return false;
	});
	//end

	// remove Wislish
	$("body").on("click", ".rv-wishlist", function() {
		var user_id = $(this).attr("data-user");
		var product_id = $(this).attr("data-product");
		$.ajax({
			url : "/remove_product",
			data : {
				"user_id" : user_id,
				"product_id" : product_id
			},
			dataType : "json",
			type : "POST",
			success : function(data) {
				console.log("success");
				$.notify("Remove product from wishlist success. ", "success");
				var html = "";
				html += "<button type='button' data-user='" + user_id + "' data-product='" + product_id + "' class='btn btn-primary add-wishlist'>";
				html += "Add To Wishlist";
				html += "</button>";
				$(".actions-wishlist").html(html);
			},
			error : function() {
				console.log("error");
			}
		});
		return false;
	});
	// end

});
