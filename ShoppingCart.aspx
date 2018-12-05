<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="ShoppingCart" %>

<%@ Register Src="~/Header and Footer/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Header and Footer/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Styling/AppCSSStyling.css" />
    <title>Maxwells | Shopping Cart</title>
</head>
<body>
    <form id="shoppingCartForm" runat="server">
        <uc1:Header runat="server" ID="Header" />
        <div class="shoppingCartTopSpacer">
        </div>
        <div id="controlsContainer" runat="server">
            <asp:Label ID="lblCartTitle" runat="server" Text="Shopping Cart"></asp:Label>
        </div>
        <asp:Label ID="lblShipping" runat="server" Text="Shipping (flat rate): <b>$9.99</b>"></asp:Label>
        <asp:Label ID="lblGrandTotal" runat="server" Text="Total: "></asp:Label>
        <div id="checkoutBtnDiv">
            <asp:Button ID="btnContShop" runat="server" Text="Continue Shopping" CssClass="infoButton cartButton" OnClick="btnContShop_Click" />
            <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="infoButton cartButton" OnClick="btnCheckout_Click" />
        </div>
        <uc1:Footer runat="server" ID="Footer" />
    </form>
</body>
</html>
