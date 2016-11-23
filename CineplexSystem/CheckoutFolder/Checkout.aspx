<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Master_Pages/Main.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="CineplexSystem.CheckoutFolder.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><%: Title %></h1>
    <br />
    <br />
    <table>
        <tr>
            <td colspan="3">
                <h3>Payment Information</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCardType" SkinID="sknMediumWidthLabel" runat="server" Text="Card Type:"></asp:Label>

            </td>
            <td>
                <asp:DropDownList ID="ddlCardType" SkinID="sknLargeWidthDDL" runat="server" MaxLength="4" TabIndex="6" ValidationGroup="checkout" ToolTip="Enter the card type.">
                    <asp:ListItem>Choose a credit card type</asp:ListItem>
                    <asp:ListItem>AMEX</asp:ListItem>
                    <asp:ListItem>VISA</asp:ListItem>
                    <asp:ListItem>Master Card</asp:ListItem>
                </asp:DropDownList>
            </td>
            <asp:RequiredFieldValidator ID="rfvCardType" runat="server" ErrorMessage="The Card Type is required." Text="*" ControlToValidate="ddlCardType" ValidationGroup="checkout" Display="Static" InitialValue="Choose a credit card type"></asp:RequiredFieldValidator>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCreditCardNo" SkinID="sknMediumWidthLabel" runat="server" Text="Credit Card Number:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCreditCardNo" SkinID="sknLargeWidthTextBox" runat="server" MaxLength="16" TabIndex="7" ValidationGroup="checkout" ToolTip="Enter your credit card number." CausesValidation="true"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvCreditCardNo" runat="server" ErrorMessage="The Credit Card Number is required." Text="*" ControlToValidate="txtCreditCardNo" ValidationGroup="checkout" Display="Static"></asp:RequiredFieldValidator>

                <asp:CustomValidator ID="cvCreditCardNo" runat="server" ErrorMessage="Enter a valid credit card number. 15 digits for Amex and 16 for other cards." Text="*" ControlToValidate="txtCreditCardNo" ValidationGroup="checkout" Display="Static" ClientValidationFunction="ClientValidateCCType" OnServerValidate="ServerValidateCCType" EnableClientScript="true"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblExpiry" SkinID="sknSmallWidthLabel" runat="server" Text="Expiry"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblExpiryMonthYear" SkinID="sknSmallWidthLabel" runat="server" Text="Month / Year"></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:DropDownList ID="ddlExpiryMonth" SkinID="sknExpiryMonthWidthDDL" runat="server" TabIndex="8" ValidationGroup="checkout" ToolTip="Enter the month the card expires.">
                    <asp:ListItem>Choose a month</asp:ListItem>
                    <asp:ListItem>Jan</asp:ListItem>
                    <asp:ListItem>Feb</asp:ListItem>
                    <asp:ListItem>Mar</asp:ListItem>
                    <asp:ListItem>Apr</asp:ListItem>
                    <asp:ListItem>May</asp:ListItem>
                    <asp:ListItem>Jun</asp:ListItem>
                    <asp:ListItem>Jul</asp:ListItem>
                    <asp:ListItem>Aug</asp:ListItem>
                    <asp:ListItem>Sep</asp:ListItem>
                    <asp:ListItem>Oct</asp:ListItem>
                    <asp:ListItem>Nov</asp:ListItem>
                    <asp:ListItem>Dec</asp:ListItem>
                </asp:DropDownList>

                <asp:DropDownList ID="ddlExpiryYear" SkinID="sknExpiryYearWidthDDL" runat="server" MaxLength="5" TabIndex="9" ValidationGroup="checkout" ToolTip="Enter the Year the card expires.">
                    <asp:ListItem>Choose a Year</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:CustomValidator ID="cvExpiryYear" runat="server" ErrorMessage="The Expiry date has to be a future date." Text="*" ControlToValidate="ddlExpiryYear" OnServerValidate="ServerValidateExpiryDate" ClientValidationFunction="ClientValidateExpiryDate" EnableClientScript="True" Display="Static" ValidationGroup="checkout"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblCardName" runat="server" Text="Name on the card:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCardName" runat="server" MaxLength="50" TabIndex="11" ValidationGroup="checkout" ToolTip="Enter the name on the card."></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvCardName" runat="server" ErrorMessage="The card name is required." Text="*" ControlToValidate="txtCardName" ValidationGroup="checkout" Display="Static"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <h3>Registration Information</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFName" runat="server" Text="First Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFName" SkinID="sknLargeWidthTextBox" runat="server" MaxLength="50" TabIndex="12" ValidationGroup="checkout" ToolTip="Enter your First Name"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="rvfFName" runat="server" ErrorMessage="Your first name is required." Text="*" ControlToValidate="txtFName" ValidationGroup="checkout" Display="Static"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblLName" runat="server" Text="Last Name:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtLName" SkinID="sknLargeWidthTextBox" runat="server" MaxLength="50" TabIndex="13" ValidationGroup="checkout" ToolTip="Enter your last name"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="rvfLName" runat="server" ErrorMessage="Your last name is required." Text="*" ControlToValidate="txtLName" ValidationGroup="checkout" Display="Static"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblPhone" runat="server" Text="Phone:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" MaxLength="10" TabIndex="14" ValidationGroup="checkout"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="The phone number is required." Text="*" ControlToValidate="txtPhone" ValidationGroup="checkout" Display="Static"></asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="revPhone" runat="server" ErrorMessage="Enter a valid phone number of exctly 10 numbers long and only digits." Text="*" ControlToValidate="txtPhone" ValidationGroup="checkout" ValidationExpression="\d{10}" Display="Static"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" TabIndex="15" ValidationGroup="checkout" ToolTip="Enter a email address."></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="The email is required." Text="*" ControlToValidate="txtEmail" ValidationGroup="checkout" Display="Static"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server"   Text="*" ErrorMessage="The email must be in a valid email format. xxx@xxx.xxx or xxx@xxx.xxx.xx" ControlToValidate="txtEmail" ValidationGroup="checkout" Display="Static" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2">
                <asp:Button ID="btnPurchase" runat="server" Text="Purchase" ValidationGroup="checkout" TabIndex="17" OnClick="btnPurchase_Click" />
                <asp:Button ID="btnDiscard" runat="server" Text="Discard" OnClick="btnDiscard_Click" CausesValidation="False" UseSubmitBehavior="False" TabIndex="16" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <h4>Checkout Status:</h4>
                <asp:ValidationSummary ID="vsPurchase" runat="server" ValidationGroup="checkout" DisplayMode="List" ShowValidationErrors="true" ShowSummary="true" HeaderText="Form Status:" />
                <asp:Label ID="lblCheckoutStatus" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>
