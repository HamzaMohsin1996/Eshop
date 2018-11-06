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


                

      <!-- /.container -->
        <% if user_signed_in? %>
                    <li class="nav-item">
                      <a class="nav-link">
                    <%= button_to('Logout', destroy_user_session_path, method: :delete ,  class: 'btn btn-info') %> 
                        </a>       
                    </li>
                  <% else %>
                      <li class="nav-item">
                        <a class="nav-link">
                      <%= button_to "Log In", new_user_session_path, :method => "get",  class: 'btn btn-info' %>
                        </a>
                      </li>
                    </div>
              <%end%>

                 <li class="nav-item">
                <a class="nav-link">
                  <%=button_to"My Cart",carts_path(@cart),:method => "get",  class: 'btn btn-info'%>
                </a>
               </li>



                 <p class="card-text">
                              <%# =check_box_tag "Products", "#{product.id}", false, class: 'product-checkboxes', id: 'product'+ "#{product.id}",:onclick => "myFunction(#{product.id},this)"%>
                            </p>  



                                <div class="main_wrapper">
   <div class="container">
        <% if notice %>
            <div id="notice_wrapper">
               <p class="notice"><%=notice%></p>
            </div>
        <%elsif alert%>
            <div id="alert_wrapper">
                <p class="alert"><%=alert%></p>
            </div>
        <%end%>
   </div>