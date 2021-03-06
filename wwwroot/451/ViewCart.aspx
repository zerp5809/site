﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ViewCart.aspx.vb" Inherits="ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <div class="col-md-12">
            <h2>Shopping Cart</h2>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="cart-info">
                <section id="cart_items">
                    <div class="container">
                        <div class="breadcrumbs">
                            <ol class="breadcrumb">
                                <li><a href="#">Home</a></li>
                                <li class="active">Shopping Cart</li>
                            </ol>
                        </div>
                        <div class="table-responsive cart_info">
                            <asp:SqlDataSource ID="SqlDSCart1" runat="server"
                                ConnectionString='<%$ ConnectionStrings:OnlineStoreConnectionString %>'
                                SelectCommand=""
                                DeleteCommand="DELETE FROM [Cart] WHERE ([CartID] = @CartID AND [ProductNo] = @ProductNo)"
                                UpdateCommand="UPDATE [Cart] SET [Quantity] = @Quantity WHERE ([CartID] = @CartID AND [ProductNo] = @ProductNo)">
                                <DeleteParameters>
                                    <asp:Parameter Name="CartID" Type="String" />
                                    <asp:Parameter Name="ProductNo" Type="String" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Quantity" Type="int32" />
                                    <asp:Parameter Name="CartID" Type="String" />
                                    <asp:Parameter Name="ProductNo" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False"
                                DataSourceID="SqlDSCart1" AllowPaging="True" PageSize="3" DataKeyNames="CartID,ProductNo"
                                AutoGenerateDeleteButton="True" AutoGenerateEditButton="True"
                                EmptyDataText="Your Cart is empty.">
                                <Columns>
                                    <asp:BoundField DataField="ProductNo" HeaderText="ProductNo" InsertVisible="False" ReadOnly="true"
                                        SortExpression="ProductNo" />
                                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" InsertVisible="False" ReadOnly="true"
                                        SortExpression="ProductName" />
                                    <asp:BoundField DataField="Quantity" HeaderText="Quantity"
                                        SortExpression="Quantity" />
                                    <asp:BoundField DataField="ProductPrice" HeaderText="Price" SortExpression="ProductPrice" InsertVisible="False" ReadOnly="true" />
                                    <asp:TemplateField HeaderText="Subtotal">
                                        <ItemTemplate>
                                            <asp:Label ID="TotalLabel1" runat="server" Text='<%#CalculateSubTotal(Eval("Quantity"), Eval("ProductPrice"))%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                            </asp:GridView>

                            <asp:SqlDataSource ID="SqlDSCart2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:OnlineStoreConnectionString %>"></asp:SqlDataSource>
                            <asp:ListView ID="lvCart" runat="server" DataSourceID="SqlDSCart2"
                                OnItemCommand="lvCart_OnItemCommand" CellPadding="3" DataKeyField="ID"
                                CellSpacing="0" RepeatColumns="2" DataKeyNames="CartID">
                                <LayoutTemplate>
                                    <div style="float: right; margin: 0 30px 5px 0;">
                                        <asp:Label ID="lblPage" runat="server" Text="" Font-Size="14px"></asp:Label>
                                    </div>
                                    <br />
                                    <table>
                                        <thead>
                                            <tr>
                                                <tr class="cart_menu">
                                                    <td class="image">Item</td>
                                                    <td class="description">Product</td>
                                                    <td class="price">Price</td>
                                                    <td class="quantity">Quantity</td>
                                                    <td class="total">Total</td>
                                                    <td></td>
                                                </tr>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <asp:PlaceHolder runat="server" ID="groupPlaceHolder" />
                                        </tbody>
                                    </table>
                                </LayoutTemplate>
                                <GroupTemplate>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                                </GroupTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td class="image"><a href="#">
                                            <img alt="" width="150" src="image/product/<%# Trim(Eval("ProductNo"))%>.jpg"></a></td>
                                        <td class="description"><a href="#"><strong><%# Eval("ProductNo")%></strong></a><br />
                                            <%# Eval("ProductName")%></td>
                                        <td class="price">$<%# Eval("ProductPrice")%></td>
                                        <td class="quantity">
                                            <asp:TextBox ID="tbQuantity" Text='<%# Eval("Quantity")%>' Width="50px" runat="server" MaxLength="10" onblur="return fixedlength(this, event, 10);" onkeypress="return fixedlength(this, event, 10);" onkeyup="return fixedlength(this, event, 10);"></asp:TextBox>
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
                                            <asp:LinkButton runat="server" ID="lbUpdate" Text='Update'
                                                CommandName="cmdUpdate" CommandArgument='<%# Eval("ProductNo")%>' />
                                            <asp:LinkButton runat="server" ID="lbDelete" Text='Delete'
                                                CommandName="cmdDelete" CommandArgument='<%# Eval("ProductNo")%>' />
                                        </td>
                                        <td class="total">
                                            <itemtemplate>
                        <asp:Label ID="TotalLabel1" runat="server" Text='<%#CalculateSubTotal(Eval("Quantity"), Eval("ProductPrice"))%>'></asp:Label>
                    </itemtemplate>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                            <div style="padding: 8px; width: 100%; text-align: center;">
                                <div style="display: inline-block; margin-top: 5px">
                                    <asp:Button runat="server" Text="&laquo;" ID="show_prev" CssClass="show_prevx"></asp:Button>
                                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvCart" PageSize="2">
                                        <Fields>
                                            <asp:NumericPagerField NextPageText='&raquo;' PreviousPageText='&laquo;' ButtonCount="5"
                                                ButtonType="Button" NextPreviousButtonCssClass="next_prevx" NumericButtonCssClass="numericx"
                                                CurrentPageLabelCssClass="currentx" RenderNonBreakingSpacesBetweenControls="False" />
                                        </Fields>
                                    </asp:DataPager>
                                    <asp:Button runat="server" Text="&raquo;" ID="show_next" CssClass="show_nextx"></asp:Button>
                                </div>
                            </div>



                        </div>
                    </div>
                </section>
                <!--/#cart_items-->
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-12">
            <h3>Cart Totals</h3>
            <div class="cart-totals">
                <table class="table">
                    <tr>
                        <th>Cart Subtotal</th>
                        <td>
                            <asp:Label ID="lblSubtotal" runat="server" Text="$0.00"></asp:Label></td>
                    </tr>
                    <tr>
                        <th><span>Order Total</span></th>
                        <td>
                            <asp:Label ID="lblTotal" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                </table>
                <p>
                    <asp:Button ID="emptyCart" runat="server" Text="Remove All Items From Cart" CssClass="btn btn-primary" Height="43px" Width="307px" />
                    <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" CssClass="btn btn-primary" Height="43px" Width="307px" />
                    
                    
                </p>
                <p>
                    &nbsp;
                </p>
            </div>

        </div>

    </div>

</asp:Content>

