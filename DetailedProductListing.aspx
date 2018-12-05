<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailedProductListing.aspx.cs" Inherits="DeatiledProductListing" %>

<%@ Register Src="~/Header and Footer/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Header and Footer/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Styling/AppCSSStyling.css" />
    <title>
    </title>
</head>
<body>
    <form id="DetailedProductListForm" runat="server">
        <uc1:Header runat="server" ID="Header" />
        <div class="backButtonContainer">
           <asp:Button ID="BackButton" runat="server" Text="Back To Products" OnClick="BackButton_Click" CssClass="backButton" />
        </div>
        <div class="productContainerDetail productContainer">
            <asp:Image ID="imgProduct" runat="server" CssClass="productImageLrg" />
            <div class="productBoxDetail">
                <asp:Label ID="lblProductName" runat="server" CssClass="productName"></asp:Label>
                <asp:Label ID="lblProductCode" runat="server" CssClass="productCode"></asp:Label>
                <asp:Label ID="lblProductPrice" runat="server" CssClass="productPrice"></asp:Label>
                <asp:Button ID="btnCart" runat="server" Text="Add to Cart" CssClass="cartButton" OnClick="btnCart_Click" />
                <asp:DropDownList ID="dropList" runat="server" CssClass="selectBox" DataTextField="1">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                </asp:DropDownList>
                <div class="description">
                    <hr class="horizontalRule"/>
                    <asp:Label ID="lblDescriptionTitle" runat="server" Text="Description"></asp:Label>
                    <hr class="horizontalRule"/>
                    <asp:Label ID="lblDescription" runat="server"></asp:Label>
                </div>
            </div>
        </div>
        <uc1:Footer runat="server" ID="Footer" />
    </form>
</body>
</html>
