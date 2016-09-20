<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Category.aspx.vb" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<div class="col-sm-3">
		<div class="left-sidebar">
			<h2>Category</h2>
            <a href="Category.aspx?MainCatID=<% = Request.QueryString("MainCatID")%>&MainCatName=<% = Request.QueryString("MainCatName")%>"><asp:Label ID="lblMainCategoryName" runat="server" Text=""></asp:Label></a>
            <asp:SqlDataSource ID="SqlDSSubCategory" runat="server" 
                SelectCommand=""
                ConnectionString="<%$ ConnectionStrings:OnlineStoreConnectionString %>"></asp:SqlDataSource>
	        <asp:DataList ID="dlSubCategory" runat="server" DataSourceID="SqlDSSubCategory" 
		        RepeatDirection="Vertical">
		        <ItemTemplate>
			        <li><a href="Category.aspx?MainCatID=<% = Request.QueryString("MainCatID")%>&MainCatName=<% = Request.QueryString("MainCatName")%>&SubCatId=<%# Eval("CategoryID")%>&SubCatName=<%# Eval("CategoryName")%>"><%# Eval("CategoryName") %></a></li>                    
		        </ItemTemplate>
	        </asp:DataList>
						
		</div>
	</div>
				
	<div class="col-sm-9 padding-right">
		<div class="features_items"><!--features_items-->
			<h2 class="title text-center">Features Items</h2>
            <asp:SqlDataSource ID="SqlDSProductList" runat="server" 
                SelectCommand=""
                ConnectionString="<%$ ConnectionStrings:OnlineStoreConnectionString %>"></asp:SqlDataSource>
	        <asp:DataList ID="dlProductList" runat="server" DataSourceID="SqlDSProductList" 
		        RepeatDirection="Vertical">
		        <ItemTemplate>
			        <div class="col-sm-4">
				        <div class="product-image-wrapper">
					        <div class="single-products">
						        <div class="productinfo text-center">
							        <img src="images/product/<%# Trim(Eval("ProductNo"))%>.jpg" alt="" />
							        <h2>$<%# Eval("ProductPrice")%></h2>
							        <p><%# Eval("ProductNo")%><br /><%# Eval("ProductName")%></p>
							        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
						        </div>
						        <div class="product-overlay">
							        <div class="overlay-content">
								        <h2>$<%# Eval("ProductPrice")%></h2>
								        <p><%# Eval("ProductNo")%><br /><%# Eval("ProductName")%></p>
								        <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
							        </div>
						        </div>
					        </div>
					        <div class="choose">
						        <ul class="nav nav-pills nav-justified">
							        <li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
							        <li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
						        </ul>
					        </div>
				        </div>
			        </div>
		        </ItemTemplate>
	        </asp:DataList>


						
			<ul class="pagination">
				<li class="active"><a href="">1</a></li>
				<li><a href="">2</a></li>
				<li><a href="">3</a></li>
				<li><a href="">&raquo;</a></li>
			</ul>
		</div><!--features_items-->

	</div>     
</asp:Content>

