<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Category.aspx.vb" Inherits="Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-md-3">
            <div class="left-sidebar">
                <a href="Category.aspx?MainCatID=<% = Request.QueryString("MainCatID")%>&MainCatName=<% = Request.QueryString("MainCatName")%>">
                    <asp:Label ID="lblMainCategoryName" runat="server" Text=""></asp:Label></a>
                <asp:SqlDataSource ID="SqlDSSubCategory" runat="server"
                    SelectCommand=""
                    ConnectionString="<%$ ConnectionStrings:OnlineStoreConnectionString %>"></asp:SqlDataSource>
                <asp:DataList ID="dlMainCategory" runat="server" DataSourceID="SqlDSSubCategory" DataKeyField="Id">
                    <ItemTemplate>
                        <a href="Category.aspx?MainCatId=<% = Request.QueryString("MainCatID")%>&MainCatName=<%  = Request.QueryString("MainCatName")%>&SubCatId=<%# Eval("Id")%>&SubCatName = <%# Eval("CategoryName")%>"><%# Eval("CategoryName")%></a>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>


        <div class="col-md-9">
            <div class="product">
                <asp:SqlDataSource ID="SqlDSProductList" runat="server"
                    SelectCommand=""
                    ConnectionString="<%$ ConnectionStrings:OnlineStoreConnectionString %>"></asp:SqlDataSource>
                <asp:Panel ID="pnlFeaturedProduct" runat="server">
                    <asp:DataList ID="dlFeatureProduct" runat="server" DataSourceID="SqlDSProductList"
                        RepeatDirection="horizontal">
                        <ItemTemplate>
                            <p>
                                <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>">
                                    <img src="image/product/<%# Trim(Eval("ProductNo"))%>.jpg" alt="" class="img-responsive"/></a>
                                <div class="name">
                                    <p><a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>"><%# Eval("ProductNo")%></a><br />
                                        <%# Eval("ProductName")%></p>
                                </div>
                                <div class="price">
                                    <p>$<%# Eval("ProductPrice")%></p>
                                </div>
                                <div class="addcart">
                                    <a href="">Add to cart</a>
                                </div>
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
                <asp:Panel ID="pnlProductList" runat="server" Visible="false">
                    <asp:DataList ID="dlProductList" runat="server" DataSourceID="SqlDSProductList"
                        RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <p>
                                <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>">
                                    <img src="image/product/<%# Trim(Eval("ProductNo"))%>.jpg" alt="" /></a>
                                <div class="name">
                                    <p>
                                        <a href="ProductDetail.aspx?ProductID=<%# Eval("ProductID")%>"><%# Eval("ProductNo")%></a><br />
                                        <%# Eval("ProductName")%>
                                    </p>
                                </div>
                                <div class="price">
                                    <p>$<%# Eval("ProductPrice")%></p>
                                </div>
                                <div class="addcart">
                                    <a href="">Add to cart</a>
                                </div>
                        </ItemTemplate>
                    </asp:DataList>
                </asp:Panel>
                
            </div>
        </div>
    </div>
</asp:Content>

