    <%= link_to "Apply Discount",id: 'btn_',:method => "get",  class: 'btn btn-info'%>
 <div class="col-md-8" align="right">
            <table class="table table-hover">
            
              <thead class="thead " align="center">
                <tr>
                  <th scope="col">Select</th>
                  <th scope="col">Name</th>
                  <th scope="col">Description</th>
                  <th scope="col">Price</th>
                  <th scope="col">Image</th>
                </tr>
                
              </thead>  
              <tbody>
                <% @products.each do |product|%>
                <tr align="center"> 
                  <td scope="row"><%=check_box_tag  "#{product.id}",product.id,false,class: "product-checkbox"%></td> 
                  <td scope="row"><%= product.title %></td>
                  <td scope="row"><%= product.description%></td>
                  <td scope="row"><%= product.price%>Rs</td>
                  <td><%=  image_tag(product.image.url)%></td>
               </tr>
                <%end%>
             </tbody> 
    </table>


    <script type="text/javascript">

              $("#btn_").on('click', function () {
                  var checkbox_value = [];
                  $(":checkbox").each(function () {
                      var ischecked = $(this).is(":checked");
                      if (ischecked) {
                          checkbox_value.push($(this).val())
                      }
                  });

                 send_productIds(checkbox_value)
              });

              function send_productIds(productIds){
                 $.ajax({
                  type: "GET",
                  url:"/deals/deals_products",
                  data: {product_ids: productIds}
                });
                 alert(productIds);
              }

</script>