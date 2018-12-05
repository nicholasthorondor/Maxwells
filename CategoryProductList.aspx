<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CategoryProductList.aspx.cs" Inherits="CategoryProductList" %>

<%@ Register src="Header and Footer/Header.ascx" tagname="Header" tagprefix="uc1" %>
<%@ Register src="Header and Footer/Footer.ascx" tagname="Footer" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <form id="CategoryProductListForm" runat="server">
        <uc1:Header ID="Header" runat="server" />
        <asp:Xml ID="XmlControl" runat="server" DocumentSource="~/XML Data/ProductList.xml" TransformSource="~/Styling/ProductList.xslt"></asp:Xml>
        <uc2:Footer ID="Footer" runat="server" />
    </form>
</body>
</html>
