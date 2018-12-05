<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register src="Header and Footer/Header.ascx" tagname="Header" tagprefix="uc1" %>

<%@ Register src="Header and Footer/Footer.ascx" tagname="Footer" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Styling/AppCSSStyling.css" />
    <title>Maxwells Hardware Store</title>
</head>
<body>
    <form id="HomeForm" runat="server">
        <uc1:Header ID="Header" runat="server" />
        <asp:Image ID="HeroImage" runat="server" CssClass="heroImg" ImageUrl="Images/banner.jpg" />
        <div id="companyInfo">
            <asp:Label ID="lblCompanyName" runat="server" Text="Maxwells" CssClass="companyName"></asp:Label>
            <asp:Label ID="lblCompanyStatement1" runat="server" Text="Since 1987 Maxwells has been serving individuals and businesses that are in need of quality hardware goods. Maxwells prides itself on it's customer service and quality range of goods. Whether you are a tradesman, a DIYer or somewhere in between, Maxwells can provide you with what you need." CssClass="companyStatement"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblCompanyStatement2" runat="server" Text="With almost 30 years experience in the hardware business Maxwells' staff have the knowledge to assist with any questions or queries you may have. Regardless of whether you drop into the local store, or purchase your goods online, Maxwells will ensure you get the best service available." CssClass="companyStatement"></asp:Label>
        </div>
        <uc2:Footer ID="Footer" runat="server" />
    </form>
</body>
</html>
