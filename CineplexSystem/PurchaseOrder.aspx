<%@ Page Title="Purchase Order" Language="C#" MasterPageFile="~/Master_Pages/Main.Master" AutoEventWireup="true" CodeBehind="PurchaseOrder.aspx.cs" Inherits="CineplexSystem.PurchaseOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><%: Title %></h1>
    <table>
        <tr>
            <td>
                <img src="/Images/logo.png" alt="Company Logo" /><br />
                Cineplex
            </td>
            <td>
                <h1>Purchase Order</h1>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>Date:&nbsp;<asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>PO#:&nbsp;<asp:Label ID="lblPurchaseOrderNo" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Vendor</td>
            <td>Ship To</td>
        </tr>
        <tr>
            <td>Cineplex
            </td>
            <td>
                <asp:Label ID="lblFullName" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Darren Bailey
            </td>
            <td></td>
        </tr>
        <tr>
            <td>24 Hicks St
                Gosnells, WA 6110
            </td>
            <td>
                <asp:Label ID="lblAddress1" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>PO Box 1110
                Gosnells, WA 6110
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>Phone:&nbsp;5559345000</td>
            <td>Phone:&nbsp;<asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Email:&nbsp;admin@cineplex.com.au</td>
            <td>Email:&nbsp;<asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    <table>
        <tr>
            <th>Shipping Method</th>
            <th>Delivery Date</th>
            <th>Terms</th>
        </tr>
        <tr>
            <td>Online Delivery</td>
            <td>
                <asp:Label ID="lblDeliveryDate" runat="server" Text="" />
            </td>
            <td>Delivery in 5 days</td>
        </tr>
    </table>
    <asp:ListView ID="lvPOItems" runat="server">
        <ItemTemplate>
            <tr runat="server">
                <td>
                    <asp:Label ID="lblItem" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' />
                </td>
                <td>
                    <asp:Label ID="lblQuantity" runat="server" Text='1' />
                </td>
                <td>
                    <asp:Label ID="lblUnitPrice" runat="server" Text='<%# String.Format("{0:C2}",
                         Eval("Price")) %>' />
                </td>
                <td>
                    <asp:Label ID="lblTotal" runat="server" Text='<%# String.Format("{0:C2}",
                         Eval("Total")) %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table>
                <tr runat="server">
                    <th runat="server">Item Name</th>
                    <th runat="server">Description</th>
                    <th runat="server">Quantity</th>
                    <th runat="server">Unit Price</th>
                    <th runat="server">Total</th>
                </tr>
                <tr runat="server" id="itemPlaceholder" />
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <table>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>SubTotal:</td>
            <td style="text-align: right;">
                <asp:Label ID="lblSubTotal" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>Tax Rate:</td>
            <td>10%</td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>Tax:</td>
            <td>
                <asp:Label ID="lblTax" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td>Total:<br />
                <hr />
            </td>
            <td>
                <asp:Label ID="lblNetTotal" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>
