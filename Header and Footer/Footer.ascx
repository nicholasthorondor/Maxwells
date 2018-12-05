<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Footer.ascx.cs" Inherits="Footer" %>
<footer>
    <table>
        <tr>
            <td class="footerCell">
                <asp:Label ID="lblCopyright" runat="server" Text="&copy; 2017 Maxwells Hardware Store"></asp:Label>
            </td>
            <td class="navSpacer"></td>
            <td class="footerCell">
                <asp:Label ID="lblAddressTitle" runat="server" Text="Address" CssClass="footerTitle"></asp:Label>
                <asp:Label ID="lblAddress" runat="server" Text="4 Abbey Road, Liverpool"></asp:Label>
            </td>
            <td class="footerCell">
                <asp:Label ID="lblPhoneTitle" runat="server" Text="Phone" CssClass="footerTitle"></asp:Label>
                <asp:Label ID="lblPhone" runat="server" Text="(02) 1234 5678"></asp:Label>
            </td>
            <td class="navSpacer"></td>
            <td class="footerCell">
                <asp:Label ID="lblEmailTitle" runat="server" Text="Email" CssClass="footerTitle"></asp:Label>
                <asp:Label ID="lblEmail" runat="server" Text="contact@maxwells.com.au"></asp:Label>
            </td>
        </tr>
    </table>
</footer>