<%@ Page Title="Movies" Language="C#" MasterPageFile="~/Master_Pages/Main.master" AutoEventWireup="true" CodeBehind="Movies.aspx.cs" Inherits="CineplexSystem.Movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1><%: Title %></h1>
    <br />
    <asp:ListView ID="lvMovies" runat="server" EnablePersistedSelection="True" DataSourceID="odsMovies" DataKeyNames="MovieId">
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server" style="">
                    <th>Select</th>
                    <th runat="server">MovieId</th>
                    <th runat="server">Name</th>
                    <th runat="server">Duration</th>
                    <th runat="server">Genre</th>
                    <th runat="server">Rating</th>
                    <th runat="server">Price</th>
                    <th runat="server">Description</th>
                </tr>
                <tr id="itemPlaceholder" runat="server" />


                <tr runat="server">
                    <td runat="server" style="" colspan="6">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                    <td colspan="2">
                        <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" OnClick="btnAddToCart_Click" />
                        <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" />
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:CheckBox runat="server" ID="SelectCategoryButton"
                        Text="" />
                </td>
                <td>
                    <asp:Label ID="MovieIdLabel" runat="server" Text='<%# Eval("MovieId") %>' />
                </td>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="DurationLabel" runat="server" Text='<%# Eval("Duration") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreLabel" runat="server" Text='<%# Eval("Genre") %>' />
                </td>
                <td>
                    <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
                </td>
                <td>
                    <asp:Label ID="PriceLabel" runat="server" Text='<%#  String.Format("{0:C2}",
                         Eval("Price")) %>' />
                </td>
                <td>
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="MovieIdTextBox" runat="server" Text='<%# Bind("MovieId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DurationTextBox" runat="server" Text='<%# Bind("Duration") %>' />
                </td>
                <td>
                    <asp:TextBox ID="GenreTextBox" runat="server" Text='<%# Bind("Genre") %>' />
                </td>
                <td>
                    <asp:TextBox ID="RatingTextBox" runat="server" Text='<%# Bind("Rating") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>There are no movies available.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="MovieIdTextBox" runat="server" Text='<%# Bind("MovieId") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DurationTextBox" runat="server" Text='<%# Bind("Duration") %>' />
                </td>
                <td>
                    <asp:TextBox ID="GenreTextBox" runat="server" Text='<%# Bind("Genre") %>' />
                </td>
                <td>
                    <asp:TextBox ID="RatingTextBox" runat="server" Text='<%# Bind("Rating") %>' />
                </td>
                <td>
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:CheckBox runat="server" ID="SelectCategoryButton"
                        Text="" />
                </td>
                <td>
                    <asp:Label ID="MovieIdLabel" runat="server" Text='<%# Eval("MovieId") %>' />

                </td>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="DurationLabel" runat="server" Text='<%# Eval("Duration") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreLabel" runat="server" Text='<%# Eval("Genre") %>' />
                </td>
                <td>
                    <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
                </td>
                <td>
                    <asp:Label ID="PriceLabel" runat="server" Text='<%#  String.Format("{0:C2}",
                         Eval("Price")) %>' />
                </td>
                <td>
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td></td>
                <td>
                    <asp:Label ID="MovieIdLabel" runat="server" Text='<%# Eval("MovieId") %>' />
                </td>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="DurationLabel" runat="server" Text='<%# Eval("Duration") %>' />
                </td>
                <td>
                    <asp:Label ID="GenreLabel" runat="server" Text='<%# Eval("Genre") %>' />
                </td>
                <td>
                    <asp:Label ID="RatingLabel" runat="server" Text='<%# Eval("Rating") %>' />
                </td>
                <td>
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# String.Format("{0:C2}",
                         Eval("Price")) %>' />
                </td>
                <td>
                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:ObjectDataSource ID="odsMovies" runat="server" SelectMethod="GetAllRecords" TypeName="CineplexSystem.MovieModel"></asp:ObjectDataSource>
    <br />
    <br />
    <asp:Label ID="lblStatus" runat="server" Text="Status Bar:" ForeColor="Green"></asp:Label>
</asp:Content>

