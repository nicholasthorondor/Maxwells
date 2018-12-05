<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ThanksForShopping.aspx.cs" Inherits="ThanksForShopping" %>

<%@ Register Src="~/Header and Footer/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Header and Footer/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Styling/AppCSSStyling.css" />
    <title>Maxwells | Thanks</title>
</head>
<body>
    <form id="ThanksForShoppingForm" runat="server">
        <uc1:Header runat="server" ID="Header" />
        <div class="shoppingCartTopSpacer">
        </div>
        <div id="shoppingCompleteContainer" runat="server">
            <asp:Label ID="lblThanksMessage1" runat="server" Text="Thank you for shopping at Maxwells." CssClass="companyName message"></asp:Label>
            <asp:Label ID="lblThanksMessage2" runat="server" Text="Your order will be on the way shortly." CssClass="companyStatement message secondaryMessage"></asp:Label>
            <asp:Button ID="btnBackToHome" runat="server" Text="Back To Home Page" CssClass="infoButton cartButton" OnClick="btnBackToHome_Click" />
        </div>
        <uc1:Footer runat="server" ID="Footer" />
    </form>
</body>
</html>
