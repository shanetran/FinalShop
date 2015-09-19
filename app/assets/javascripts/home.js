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

	//Like
	$(".like-lk").click(function() {
		var user = $(this).attr("data-user");
		var product = $(this).attr("data-product");
		var data_like = $(this).attr("data-like");
		$.ajax({
			url : "/like",
			data : {
				"user_id" : user,
				"product_id" : product,
				"data_like" : data_like
			},
			dataType : "Json",
			type : "POST",
			success : function(data) {
				console.log("like success");
				location.reload();
				$.notify("You liked product.", "success");
			},
			error : function() {
				console.log("like fail");
			}
		});
		return false;
	});
	//end

	//Unlike
	$(".unlike-lk").click(function() {
		var user = $(this).attr("data-user");
		var product = $(this).attr("data-product");
		var data_like = $(this).attr("data-like");
		$.ajax({
			url : "/unlike",
			data : {
				"user_id" : user,
				"product_id" : product,
				"data_like" : data_like
			},
			dataType : "Json",
			type : "POST",
			success : function(data) {
				console.log("like success");
				$.notify("You unlike product", "success");
				location.reload();
			},
			error : function() {
				console.log("like fail");
			}
		});
		return false;
	});
	//end

	// expand - collapse Contact form
	$(".lk-contact").click(function() {
		$(".group-contact").toggle(function() {
			console.log("toggle");
			($(".icon-contact").children("i").hasClass("fa-plus")) ? $(".icon-contact").html("<i class='fa fa-minus'></i>") : $(".icon-contact").html("<i class='fa fa-plus'></i>");
		});
	});
	//end

	//add ajax cart
	$(".add-ajax-cart").click(function() {
		var id = $(this).attr("data-id");
		$.ajax({
			url : "/carts/add_cart_ajax",
			data : {
				"id" : id
			},
			type : "post",
			dataType : "JSON",
			success : function(data) {
				var count = 0;
				console.log("success");
				console.log(data);
				$.each(data, function(index, item) {
					count += parseInt(item);
				});
				if (count > 99) {
					$(".cart-total").html("<label class='cart-amount-larger'>99+</label>");
				} else if (count > 9) {
					$(".cart-total").html("<label class='cart-amount-medium'>" + count + "</label>");
				} else {
					$(".cart-total").html("<label class='cart-amount'>" + count + "</label>");
				}
			},
			error : function() {
				console.log("error");
			}
		});
		return false;
	});
	//

});
