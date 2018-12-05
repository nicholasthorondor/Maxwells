<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Header" %>
<header>
    <table>
        <tr>
            <td id="logoCell">
                 <asp:ImageButton ID="LogoImageButton" runat="server" ImageUrl="~/Images/maxwells_logo.png" OnClick="LogoImageButton_Click" />
            </td>
            <td class="categoryLinkCell">
                 <asp:LinkButton ID="CategoryTools" runat="server" OnClick="CategoryTools_Click" CssClass="CategoryLinkButton">Tools</asp:LinkButton>
            </td>
            <td class="categoryLinkCell">
                 <asp:LinkButton ID="CategoryHardware" runat="server" OnClick="CategoryHardware_Click" CssClass="CategoryLinkButton">Hardware</asp:LinkButton>
            </td>
            <td class="categoryLinkCell">
                 <asp:LinkButton ID="CategoryGardening" runat="server" OnClick="CategoryGardening_Click" CssClass="CategoryLinkButton">Gardening</asp:LinkButton>
            </td>
            <td class="navSpacer"></td>
            <td id="cartButtonCell">
                 <asp:ImageButton ID="CartImageButton" runat="server" OnClick="CartImageButton_Click" ImageUrl="~/Images/cart_icon.png" Height="60px" Width="60px" />
                <asp:Label ID="lblItemCount" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</header>

