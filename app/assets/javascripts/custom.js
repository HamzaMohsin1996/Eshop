function myFunction(pId,pointer){
	var val = $(pointer).is(":checked");
   	$.ajax({
        url: "/carts/manage_product",
      	dataType: 'json',
        data : {product_id: pId, type: val},
        method: 'POST'
  });

}
