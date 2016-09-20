<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="productdetail.aspx.vb" Inherits="productdetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

		<div class="row product-info">
		    <div class="col-md-6">
					
<%--				<div class="image"><a class="cloud-zoom" rel="adjustX: 0, adjustY:0" id='zoom1' href="image/product/" title="Nano"><img src="products/dress1.jpg" title="Nano" alt="Nano" id="image" /></a></div>--%>
                <div class="image">

                    <asp:Image ID="imgProductDetail" runat="server" />

                </div>
                <%--<div class="image-additional">
					<a title="Dress" rel="useZoom: 'zoom1', smallImage: 'products/dress6.jpg'" class="cloud-zoom-gallery" href="products/dress6.jpg"><img alt="Dress" title="Dress" src="products/dress6.jpg"></a>
					<a title="Dress" rel="useZoom: 'zoom1', smallImage: 'products/dress7.jpg'" class="cloud-zoom-gallery" href="products/dress7.jpg"><img alt="Dress" title="Dress" src="products/dress7.jpg"></a>
					<a title="Dress" rel="useZoom: 'zoom1', smallImage: 'products/dress3.jpg'" class="cloud-zoom-gallery" href="products/dress3.jpg"><img alt="Dress" title="Dress" src="products/dress3.jpg"></a>
					<a title="Dress" rel="useZoom: 'zoom1', smallImage: 'products/dress1.jpg'" class="cloud-zoom-gallery" href="products/dress1.jpg"><img alt="Dress" title="Dress" src="products/dress1.jpg"></a>
				  </div>--%>
  			</div>
		    <div class="col-md-6">
				<h1><asp:Label ID="lblProductName" runat="server" Text="Label"></asp:Label></h1>
				    <div class="line"></div>
						<ul>
							<li><span>Brand:</span> <a href="#">Shop Online</a></li>
							<li><span>Product Number:</span><asp:Label ID="LblNo" runat="server" Text="Label"></asp:Label></li>
							<li><span>Availability: </span>In Stock</li>
						</ul>
					<div class="price">
						Price <span><asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label></span> 
					</div>
						<%--<span class="price-tax">Ex Tax: $400.00</span>--%>
						    <div class="control-group">
									<label class="control-label">Color<span class="required">*</span></label>
					            <div class="controls">
									<select>
										<option>Please Select...</option>
										<option>Blue</option>
										<option>Red</option>
										<option>Black</option>
									</select>
								</div>
							</div>
						    
					<div class="line"></div>
					<%--<form class="form-inline">--%>
                        <label>Qty:</label>
                        <asp:TextBox ID="tbQuantity" runat="server" MaxLength="10" onblur="return fixedlength(this, event, 10);" onkeypress="return fixedlength(this, event, 10);" onkeyup="return fixedlength(this, event, 10);"></asp:TextBox>
                        <script language="javascript" type="text/javascript">
                            function fixedlength(textboxID, keyEvent, maxlength) {
                                //validation for digits upto 'maxlength' defined by caller function
                                if (textboxID.value.length > maxlength) {
                                    textboxID.value = textboxID.value.substr(0, maxlength);
                                }
                                else if (textboxID.value.length < maxlength || textboxID.value.length == maxlength) {
                                    textboxID.value = textboxID.value.replace(/[^\d]+/g, '');
                                    return true;
                                }
                                else
                                    return false;
                            }
                        </script>
                        <asp:Button ID="btnAddToCart" cssclass="btn btn-fefault cart" runat="server" Text="Add 2 Cart" />
                    <%--</form>--%>
					<div class="tabs">
					<ul class="nav nav-tabs" id="myTab">
						<li class="active"><a href="#home">Description</a></li>
						<li><a href="#profile">Specification</a></li>
						<li><a href="#messages">Reviews</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="home">When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then </div>
						<div class="tab-pane" id="profile">
							<table class="table specs">
									<tr>
										<th>Color</th>
										<th>Size</th>
										<th>Weight</th>
									</tr>
									<tr>
										<td>Blue</td>
										<td>XS</td>
										<td>1.00</td>
									</tr>
									<tr>
										<th>Composition</th>
										<th>Sleeve</th>
										<th>Care</th>
									</tr>
									<tr>
										<td>100% Cotton</td>
										<td> Long Sleeve</td>
										<td>IRON AT 110ºC MAX</td>
									</tr>								
					        </table>
						</div>
						<div class="tab-pane" id="messages">
						    <p>There are no reviews yet, would you like to <a href="#review_btn .btn-default">submit yours?</a></p>
							<h3>Be the first to review “Blue Dress” </h3>
						<form>
							<fieldset>
								<label>Name<span class="required">*</span></label>
								<input type="text" placeholder="Name">
								<label>Email<span class="required">*</span></label>
								<input type="text" placeholder="Email">		
								<label class="rating">Rating</label>
                                <img alt="rating" src="image/stars-5.png">								
							</fieldset>
						</form>
							<label>Your Review<span class="required">*</span></label>
							<textarea rows="3"></textarea>
						<p id="review_btn .btn-default">
							<button class="btn .btn-default" type="button">Submit Review</button>
						</p>
						</div>
					</div>
					</div>
			</div>
		</div>


</asp:Content>

