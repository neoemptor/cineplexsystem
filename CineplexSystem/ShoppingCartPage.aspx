<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Master_Pages/Main.Master" AutoEventWireup="true" CodeBehind="ShoppingCartPage.aspx.cs" Inherits="CineplexSystem.ShoppingCartPage" ClientIDMode="AutoID" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><%: Title %></h1>
    <asp:ListView ID="lvShoppingCart" runat="server" DataSourceID="odsShoppingCart" OnItemDeleted="lvShoppingCart_ItemDeleted" DataKeyNames="TempOrderID">
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td></td>
                <td>
                    <asp:TextBox ID="MovieIdTextBox" runat="server" Text='<%# Bind("MovieId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" OnClick="DeleteButton_Click" Text="Delete" />
                </td>
                <td></td>
                <td>
                    <asp:Label ID="MovieIdLabel" runat="server" Text='<%# Eval("MovieId") %>' />
                </td>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# String.Format("{0:C2}",
                         Eval("Price")) %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" OnClick="DeleteButton_Click" Text="Delete" />
                </td>
                <td></td>
                <td>
                    <asp:Label ID="MovieIdLabel" runat="server" Text='<%# Eval("MovieId") %>' />
                </td>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# String.Format("{0:C2}",
                         Eval("Price")) %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td></td>
                <td>
                    <asp:TextBox ID="MovieIdTextBox" runat="server" Text='<%# Bind("MovieId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>The shopping cart is empty.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server"></th>
                                <th runat="server">MovieId</th>
                                <th runat="server">Name</th>
                                <th runat="server">Price</th>
                                <th runat="server">Quantity</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server" style="height: 50px;">
                    <td runat="server" style="float: left;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                    <td style="float: left;">
                        <asp:Button ID="btnCheckout" PostBackUrl="~/CheckoutFolder/Checkout.aspx" runat="server" Text="Checkout" TabIndex="3" OnClick="btnCheckout_Click" />
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" OnClick="DeleteButton_Click" Text="Delete" />
                </td>
                <td></td>
                <td>
                    <asp:Label ID="MovieIdLabel" runat="server" Text='<%# Eval("MovieId") %>' />
                </td>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# String.Format("{0:C2}",
                         Eval("Price")) %>' />
                </td>
                <td>
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:ObjectDataSource ID="odsShoppingCart" runat="server" DataObjectTypeName="CineplexSystem.Models.ShoppingCartData" DeleteMethod="DeleteRecord" InsertMethod="AddRecord" SelectMethod="GetAllRecords" TypeName="CineplexSystem.ShoppingCart" UpdateMethod="UpdateRecord"></asp:ObjectDataSource>
    <br />
    <br />
    <asp:Label ID="lblTotal" runat="server" Text="Total: $0.00"></asp:Label><br />
    <asp:Label ID="lblStatus" runat="server" Text="Status Bar:" ForeColor="Green"></asp:Label>
</asp:Content>
