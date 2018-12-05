<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Summary.aspx.cs" Inherits="Summary" %>

<%@ Register Src="~/Header and Footer/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Header and Footer/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Styling/AppCSSStyling.css" />
    <title>Maxwells | Order Summary</title>
</head>
<body>
    <form id="OrderSummaryForm" runat="server">
        <uc1:Header runat="server" ID="Header" />
       <div class="shoppingCartTopSpacer">
       </div>
        <div id="pageContainer" runat="server">
       <div id="controlsContainerSummary" runat="server">
            <asp:Label ID="lblExceptionHandler" runat="server" Text="" CssClass="errorMessage"></asp:Label>
            <asp:Label ID="lblCartTitle" runat="server" Text="Order Summary"></asp:Label>
        </div>
        <div>
            <asp:Label ID="lblShipping" runat="server" Text="Shipping (flat rate): <b>$9.99</b>"></asp:Label>
            <asp:Label ID="lblGrandTotal" runat="server" Text="Total: "></asp:Label>
        </div>

        <!-- Payment Section -->
        <div id="paymentDetailsContainerSum" runat="server" class="summaryContainers">
            <asp:Label ID="lblPaymentDetails" runat="server" Text="Payment Details" CssClass="formHeaders"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblCardType0" runat="server" Text="Card Type:" CssClass="summaryBoldText"></asp:Label>
            <asp:Label ID="lblCardType" runat="server" Text="Card Type"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblNameOnCard0" runat="server" Text="Name on Card:" CssClass="summaryBoldText"></asp:Label>
            <asp:Label ID="lblNameOnCard" runat="server" Text="Name on Card"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblCardNumber0" runat="server" Text="Card Number:" CssClass="summaryBoldText"></asp:Label>
            <asp:Label ID="lblCardNumber" runat="server" Text="Card Number"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblExpiry0" runat="server" Text="Expiry Date:" CssClass="summaryBoldText"></asp:Label>
            <asp:Label ID="lblExpiry" runat="server" Text="Expiry Date"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblCVN0" runat="server" Text="CVN:" CssClass="summaryBoldText"></asp:Label>
            <asp:Label ID="lblCVN" runat="server" Text="CVN"></asp:Label>
        </div>

        <!-- Biling Section -->
        <div id="billingDetailsContainerSum" runat="server" class="summaryContainers">
            <asp:Label ID="lblBillingDetails" runat="server" Text="Billing Details" CssClass="formHeaders"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblBillingAddress0" runat="server" Text="Address" CssClass="formSubHeaders"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblBillingName" runat="server" Text="Name Details"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblBillingAddress" runat="server" Text="Adress Details"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblBillingContact0" runat="server" Text="Contact" CssClass="formSubHeaders"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblBillingContact" runat="server" Text="Contact Details"></asp:Label>
        </div>

         <!-- Shipping Section -->
        <div id="shippingDetailsContainerSum" runat="server" class="summaryContainers">
            <asp:Label ID="lblShippingDetails" runat="server" Text="Shipping Details" CssClass="formHeaders"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblShippingAdress0" runat="server" Text="Address" CssClass="formSubHeaders"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblShippingName" runat="server" Text="Name Details"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblShippingAddress" runat="server" Text="Address Details"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblShippingContact0" runat="server" Text="Contact" CssClass="formSubHeaders"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblShippingContact" runat="server" Text="Contact Details"></asp:Label>
        </div>
        <div id="checkoutBtnDiv">
            <asp:Button ID="btnContShop" runat="server" Text="Back To Cart" CssClass="infoButton cartButton" OnClick="btnContShop_Click" />
            <asp:Button ID="btnCheckout" runat="server" Text="Finalise Order" CssClass="infoButton cartButton" OnClick="btnFinaliseOrder_Click" />
        </div>
        </div>
        <uc1:Footer runat="server" ID="Footer" />
    </form>
</body>
</html>
