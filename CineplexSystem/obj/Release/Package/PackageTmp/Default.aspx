<%@ Page Title="Home" Language="C#" MasterPageFile="~/Master_Pages/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CineplexSystem.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1><%: Title %></h1>
    <div class="opaqueBlock">
        <br />

        <br />
        <h2>Welcome to Cineplex.</h2>
        <p>
            We have a wide range of Movies that cover<br />
            all genres.
        </p>
    </div>
</asp:Content>
