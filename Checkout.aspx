<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<%@ Register Src="~/Header and Footer/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Header and Footer/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="Styling/AppCSSStyling.css" />
    <title>Maxwells | Checkout</title>
</head>
<body>
    <form id="CheckoutForm" runat="server">
       <uc1:Header runat="server" ID="Header" />
       <div class="shoppingCartTopSpacer">
       </div>
      <div id="pageContainer" runat="server">
       <div id="controlsContainerCheckout" runat="server">
            <asp:Label ID="lblCartTitle" runat="server" Text="Checkout"></asp:Label>
           <asp:Label ID="lblRequiredFieldMessage" runat="server" Text="* Indicates required field." CssClass="formText"></asp:Label>
        </div>

        <!-- Payment Section -->
        <div id="paymentDetailsContainer" runat="server">
            <asp:Label ID="lblPaymentDetails" runat="server" Text="Payment Details" CssClass="formHeaders"></asp:Label>
            <br />
            <br />

            <asp:Label ID="lblCardType" runat="server" Text="Card Type*"></asp:Label>
            <asp:DropDownList ID="ddlCreditCardType" runat="server">
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem>Visa</asp:ListItem>
                <asp:ListItem>MasterCard</asp:ListItem>
                <asp:ListItem>American Express</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCardType" runat="server" ErrorMessage="Required Field." ControlToValidate="ddlCreditCardType" EnableClientScript="False" Text="Required Field." Display="Dynamic" ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="lblNameOnCard" runat="server" Text="Name on Card*"></asp:Label>
            <asp:TextBox ID="txtBoxName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNameOnCard" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxName" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revNameOnCard" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxName" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z\s]+" CssClass="errorMessage"></asp:RegularExpressionValidator>
            <br />
            <br />

            <asp:Label ID="lblCardNumber" runat="server" Text="Card Number*"></asp:Label>
            <asp:TextBox ID="txtBoxCardNumber" runat="server"></asp:TextBox>
            <asp:Label ID="lblCardFormat" runat="server" Text="No spaces or dashes."></asp:Label>
            <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxCardNumber" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revCardNumber" runat="server" ErrorMessage="Credit card numbers must contain numerical data in the format xxxxxxxxxxxx" EnableClientScript="False" ControlToValidate="txtBoxCardNumber" ValidationGroup="AllValidators" Text="Credit card numbers must contain numerical data in the format 0000111122223333" Display="Dynamic" ValidationExpression="^[0-9]{16}$" CssClass="errorMessage"></asp:RegularExpressionValidator>
            <br />
            <br />

            <asp:Label ID="lblExpiry" runat="server" Text="Expiry Date*"></asp:Label>
            <asp:DropDownList ID="ddlExpiryMonth" runat="server">
                <asp:ListItem Text="Month" Value=""></asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
                <asp:ListItem>13</asp:ListItem>
                <asp:ListItem>14</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>16</asp:ListItem>
                <asp:ListItem>17</asp:ListItem>
                <asp:ListItem>18</asp:ListItem>
                <asp:ListItem>19</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>21</asp:ListItem>
                <asp:ListItem>22</asp:ListItem>
                <asp:ListItem>23</asp:ListItem>
                <asp:ListItem>24</asp:ListItem>
                <asp:ListItem>25</asp:ListItem>
                <asp:ListItem>26</asp:ListItem>
                <asp:ListItem>27</asp:ListItem>
                <asp:ListItem>28</asp:ListItem>
                <asp:ListItem>29</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>31</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvExpiryMonth" runat="server" ErrorMessage="Required Field." ControlToValidate="ddlExpiryMonth" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>

            <asp:DropDownList ID="ddlExpiryYear" runat="server">
                <asp:ListItem Text="Year" Value=""></asp:ListItem>
                <asp:ListItem>17</asp:ListItem>
                <asp:ListItem>18</asp:ListItem>
                <asp:ListItem>19</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>21</asp:ListItem>
                <asp:ListItem>22</asp:ListItem>
                <asp:ListItem>23</asp:ListItem>
                <asp:ListItem>24</asp:ListItem>
                <asp:ListItem>25</asp:ListItem>
                <asp:ListItem>26</asp:ListItem>
                <asp:ListItem>27</asp:ListItem>
                <asp:ListItem>28</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvExpiryYear" runat="server" ErrorMessage="Required Field." ControlToValidate="ddlExpiryYear" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="lblCVN" runat="server" Text="CVN*"></asp:Label>
            <asp:TextBox ID="txtBoxCVN" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCvn" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxCVN" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revCvn" runat="server" ErrorMessage="CVN must be 3 digits long." EnableClientScript="False" ControlToValidate="txtBoxCVN" ValidationGroup="AllValidators" Text="CVN must be 3 digits long." Display="Dynamic" ValidationExpression="^[0-9]{3}$" CssClass="errorMessage"></asp:RegularExpressionValidator>
        </div>

        <!-- Biling Section -->
        <div id="billingDetailsContainer" runat="server">
            <div class="leftColumn">
            <asp:Label ID="lblBillingDetails" runat="server" Text="Billing Details" CssClass="formHeaders"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="lblBillingAddress" runat="server" Text="Address" CssClass="formSubHeaders"></asp:Label>
            <br />
            <br />
        
            <asp:Label ID="lblBillingTitle" runat="server" Text="Title*"></asp:Label>
            <asp:DropDownList ID="ddlBillingTitle" runat="server">
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem>Mr</asp:ListItem>
                <asp:ListItem>Mrs</asp:ListItem>
                <asp:ListItem>Ms</asp:ListItem>
                <asp:ListItem>Dr</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvBillingTitle" runat="server" ErrorMessage="Required Field." ControlToValidate="ddlBillingTitle" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="lblBillingFirstName" runat="server" Text="First Name*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingFirstName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingFirstName" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingFirstName" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingFirstName" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxBillingFirstName" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>
            <br />
            <br />

            <asp:Label ID="lblBillingMiddleName" runat="server" Text="Middle Name"></asp:Label>
            <asp:TextBox ID="txtBoxBillingMiddleName" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revBillingMiddleName" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxBillingMiddleName" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>
            <br />
            <br />

            <asp:Label ID="lblBillingSurname" runat="server" Text="Surname*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingSurname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingSurname" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingSurname" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingSurname" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxBillingSurname" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>
            <br />
            <br />

            <asp:Label ID="lblBillingPropertyName" runat="server" Text="Property Name"></asp:Label>
            <asp:TextBox ID="txtBoxBillingPropertyName" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revBillingPropertyName" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxBillingPropertyName" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblBillingStreetNumber" runat="server" Text="Street/Unit Number*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingStreetNumber" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingStreetNumber" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingStreetNumber" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingStreetNumber" runat="server" ErrorMessage="Must only contain numbers." EnableClientScript="False" ControlToValidate="txtBoxBillingStreetNumber" ValidationGroup="AllValidators" Text="Only numbers allowed." Display="Dynamic" ValidationExpression="[0-9]+" CssClass="errorMessage"></asp:RegularExpressionValidator>
            <br />
            <br />

            <asp:Label ID="lblBillingStreetName" runat="server" Text="Street Name*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingStreetName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingStreetName" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingStreetName" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingStreetName" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxBillingStreetName" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblBillingStreetType" runat="server" Text="Street Type*"></asp:Label>
            <asp:DropDownList ID="ddlBillingStreetType" runat="server">
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem>Street</asp:ListItem>
                <asp:ListItem>Lane</asp:ListItem>
                <asp:ListItem>Court</asp:ListItem>
                <asp:ListItem>Road</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvBillingStreetType" runat="server" ErrorMessage="Required Field." ControlToValidate="ddlBillingStreetType" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="lblBillingSuburb" runat="server" Text="Suburb"></asp:Label>
            <asp:TextBox ID="txtBoxBillingSuburb" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revBillingSuburb" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxBillingSuburb" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblBillingCity" runat="server" Text="Town/City*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingCity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingCity" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingCity" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingCity" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxBillingCity" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblBillingState" runat="server" Text="State*"></asp:Label>
            <asp:DropDownList ID="ddlBillingState" runat="server">
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem>QLD</asp:ListItem>
                <asp:ListItem>VIC</asp:ListItem>
                <asp:ListItem>NSW</asp:ListItem>
                <asp:ListItem>ACT</asp:ListItem>
                <asp:ListItem>TAS</asp:ListItem>
                <asp:ListItem>NT</asp:ListItem>
                <asp:ListItem>WA</asp:ListItem>
                <asp:ListItem>SA</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvBillingState" runat="server" ErrorMessage="Required Field." ControlToValidate="ddlBillingState" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="lblBillingPostCode" runat="server" Text="PostCode*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingPostCode" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingPostCode" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingPostCode" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingPostCode" runat="server" ErrorMessage="Must only contain numbers." EnableClientScript="False" ControlToValidate="txtBoxBillingPostCode" ValidationGroup="AllValidators" Text="Only numbers allowed." Display="Dynamic" ValidationExpression="[0-9]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblBillingCountry" runat="server" Text="Country*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingCountry" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingCountry" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingCountry" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingCountry" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxBillingCountry" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            </div>

            <div class="rightColumn">
            <br />
            <br />
            <br />
            <asp:Label ID="lblBillingContact" runat="server" Text="Contact" CssClass="formSubHeaders"></asp:Label>
            <br />
            <br />

            <asp:Label ID="lblBillingEmail" runat="server" Text="Email*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingEmail" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingEmail" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingEmail" runat="server" ErrorMessage="Email must be in the format name@domain.xyz" EnableClientScript="False" ValidationGroup="AllValidators" Text="Email must be in the format name@domain.xyz" Display="Dynamic" ControlToValidate="txtBoxBillingEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblBillingCountryCode" runat="server" Text="Country Code"></asp:Label>
            <asp:DropDownList ID="ddlBillingCountryCode" runat="server">
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem Value="61">61 (Australia)</asp:ListItem>
                <asp:ListItem Value="00">00 (International)</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />

            <asp:Label ID="lblBillingAreaCode" runat="server" Text="Area Code*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingAreaCode" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvBillingAreaCode" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingAreaCode" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingAreaCode" runat="server" ErrorMessage="Must be a 2 digit number." EnableClientScript="False" ValidationGroup="AllValidators" Text="Must be a 2 digit number." Display="Dynamic" ControlToValidate="txtBoxBillingAreaCode" ValidationExpression="^[0-9]{2}$" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblBillingLandline" runat="server" Text="Landline*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingLandline" runat="server"></asp:TextBox>
            <asp:Label ID="lblBillingLandlineFormat" runat="server" Text="No spaces or dashes."></asp:Label>
            <asp:RequiredFieldValidator ID="rfvBillingLandline" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingLandline" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingLandline" runat="server" ErrorMessage="Must only contain numbers." EnableClientScript="False" ValidationGroup="AllValidators" Text="Must be a number." Display="Dynamic" ControlToValidate="txtBoxBillingLandline" ValidationExpression="[0-9]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblBillingMobile" runat="server" Text="Mobile*"></asp:Label>
            <asp:TextBox ID="txtBoxBillingMobile" runat="server"></asp:TextBox>
            <asp:Label ID="lblBillingMobileFormat" runat="server" Text="No spaces or dashes."></asp:Label>
            <asp:RequiredFieldValidator ID="rfvBillingMobile" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxBillingMobile" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revBillingMobile" runat="server" ErrorMessage="Must only contain numbers." EnableClientScript="False" ValidationGroup="AllValidators" Text="Must be a number." Display="Dynamic" ControlToValidate="txtBoxBillingMobile" ValidationExpression="[0-9]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
        </div>
      </div>

         <!-- Shipping Section -->
        <div id="shippingToggleContainer" runat="server">
            <asp:Label ID="lblShippingDetails" runat="server" Text="Shipping Details" CssClass="formHeaders"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblShippingToggle" runat="server" Text="Same as Billing Details"></asp:Label>
            <asp:CheckBox ID="cbShippingToggle" runat="server" />
            <asp:Button ID="btnShippingToggle" runat="server" Text="Toggle Shipping Details" OnClick="ShippingToggle" />
        </div>

        <div id="shippingDetailsContainer" runat="server">
          <div class="leftColumn">
            <asp:Label ID="lblShippingAdress" runat="server" Text="Address" CssClass="formSubHeaders"></asp:Label>
            <br />
            <br />

            <asp:Label ID="lblShippingTitle" runat="server" Text="Title*"></asp:Label>
            <asp:DropDownList ID="ddlShippingTitle" runat="server">
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem>Mr</asp:ListItem>
                <asp:ListItem>Mrs</asp:ListItem>
                <asp:ListItem>Ms</asp:ListItem>
                <asp:ListItem>Dr</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvShippingTitle" runat="server" ErrorMessage="Required Field." ControlToValidate="ddlShippingTitle" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="lblShippingFirstName" runat="server" Text="First Name*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingFirstName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingFirstName" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingFirstName" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShippingFirstName" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxShippingFirstName" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingMiddleName" runat="server" Text="Middle Name"></asp:Label>
            <asp:TextBox ID="txtBoxShippingMiddleName" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revShippingMiddleName" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxShippingMiddleName" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingSurname" runat="server" Text="Surname*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingSurname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingSurname" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingSurname" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShippingSurname" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxShippingSurname" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingPropertyName" runat="server" Text="Property Name"></asp:Label>
            <asp:TextBox ID="txtBoxShippingPropertyName" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revShippingPropertyName" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxShippingPropertyName" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingStreetNumber" runat="server" Text="Street/Unit Number*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingStreetNumber" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingStreetNumber" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingStreetNumber" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShippingStreetNumber" runat="server" ErrorMessage="Must only contain numbers." EnableClientScript="False" ValidationGroup="AllValidators" Text="Must be a number." Display="Dynamic" ValidationExpression="[0-9]+" ControlToValidate="txtBoxShippingStreetNumber" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingStreetName" runat="server" Text="Street Name*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingStreetName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingStreetName" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingStreetName" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShippingStreetName" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxShippingStreetName" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingStreetType" runat="server" Text="Street Type*"></asp:Label>
            <asp:DropDownList ID="ddlShippingStreetType" runat="server">
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem>Street</asp:ListItem>
                <asp:ListItem>Lane</asp:ListItem>
                <asp:ListItem>Court</asp:ListItem>
                <asp:ListItem>Road</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvShippingSteetType" runat="server" ErrorMessage="Required Field." ControlToValidate="ddlShippingStreetType" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="lblShippingSuburb" runat="server" Text="Suburb"></asp:Label>
            <asp:TextBox ID="txtBoxShippingSuburb" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revShippingSuburb" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxShippingSuburb" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingCity" runat="server" Text="Town/City*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingCity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingCity" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingCity" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShippingCity" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxShippingCity" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingState" runat="server" Text="*State"></asp:Label>
            <asp:DropDownList ID="ddlShippingState" runat="server">
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem>QLD</asp:ListItem>
                <asp:ListItem>VIC</asp:ListItem>
                <asp:ListItem>NSW</asp:ListItem>
                <asp:ListItem>ACT</asp:ListItem>
                <asp:ListItem>TAS</asp:ListItem>
                <asp:ListItem>NT</asp:ListItem>
                <asp:ListItem>WA</asp:ListItem>
                <asp:ListItem>SA</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvShippingState" runat="server" ErrorMessage="Required Field." ControlToValidate="ddlShippingState" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <br />
            <br />

            <asp:Label ID="lblShippingPostCode" runat="server" Text="PostCode*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingPostCode" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingPostCode" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingPostCode" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShipppingPostCode" runat="server" ErrorMessage="Must only contain numbers." EnableClientScript="False" ValidationGroup="AllValidators" Text="Must be a number." Display="Dynamic" ValidationExpression="[0-9]+" ControlToValidate="txtBoxShippingPostCode" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingCountry" runat="server" Text="Country*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingCountry" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingCountry" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingCountry" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShippingCountry" runat="server" ErrorMessage="Only letters allowed." EnableClientScript="False" ControlToValidate="txtBoxShippingCountry" ValidationGroup="AllValidators" Text="Only letters allowed." Display="Dynamic" ValidationExpression="[a-zA-Z]+" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            </div>

            <div class="rightColumn">
            <asp:Label ID="lblShippingContact" runat="server" Text="Contact" CssClass="formSubHeaders"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblShippingEmail" runat="server" Text="Email*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingEmail" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingEmail" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShippingEmail" runat="server" ErrorMessage="Email must be in the format name@domain.xyz" EnableClientScript="False" ValidationGroup="AllValidators" Text="Email must be in the format name@domain.xyz" Display="Dynamic" ControlToValidate="txtBoxShippingEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingCountryCode" runat="server" Text="Country Code"></asp:Label>
            <asp:DropDownList ID="ddlShippingCountryCode" runat="server">
                <asp:ListItem Text="" Value=""></asp:ListItem>
                <asp:ListItem Value="61">61 (Australia)</asp:ListItem>
                <asp:ListItem Value="00">00 (International)</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />

            <asp:Label ID="lblShippingAreaCode" runat="server" Text="Area Code*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingAreaCode" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvShippingAreaCode" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingAreaCode" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShippingAreaCode" runat="server" ErrorMessage="Must be a 2 digit number." EnableClientScript="False" ValidationGroup="AllValidators" Text="Must be a 2 digit number." Display="Dynamic" ControlToValidate="txtBoxShippingAreaCode" ValidationExpression="^[0-9]{2}$" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingLandline" runat="server" Text="Landline*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingLandline" runat="server"></asp:TextBox>
            <asp:Label ID="lblShippingLandlineFormat" runat="server" Text="No spaces or dashes."></asp:Label>
            <asp:RequiredFieldValidator ID="rfvShippingLandline" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingLandline" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShippingLandline" runat="server" ErrorMessage="Must only contain numbers." EnableClientScript="False" ValidationGroup="AllValidators" Text="Must be a number." Display="Dynamic" ValidationExpression="[0-9]+" ControlToValidate="txtBoxShippingLandline" CssClass="errorMessage"></asp:RegularExpressionValidator>            
            <br />
            <br />

            <asp:Label ID="lblShippingMobile" runat="server" Text="Mobile*"></asp:Label>
            <asp:TextBox ID="txtBoxShippingMobile" runat="server"></asp:TextBox>
            <asp:Label ID="lblShippingMobileFormat" runat="server" Text="No spaces or dashes."></asp:Label>
            <asp:RequiredFieldValidator ID="rfvShippingMobile" runat="server" ErrorMessage="Required Field." ControlToValidate="txtBoxShippingMobile" EnableClientScript="False" Display="Dynamic" Text="Required Field." ValidationGroup="AllValidators" CssClass="errorMessage"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revShippingMobile" runat="server" ErrorMessage="Must only contain numbers." EnableClientScript="False" ValidationGroup="AllValidators" Text="Must be a number." Display="Dynamic" ValidationExpression="[0-9]+" ControlToValidate="txtBoxShippingMobile" CssClass="errorMessage"></asp:RegularExpressionValidator>            
        </div>
        </div>
      </div>
        <div id="checkoutBtnDiv">
            <asp:Button ID="btnContShop" runat="server" Text="Back To Cart" CssClass="infoButton cartButton" OnClick="btnContShop_Click" />
            <asp:Button ID="btnCheckout" runat="server" Text="Continue" CssClass="infoButton cartButton" OnClick="btnCheckout_Click" />
        </div>
        <uc1:Footer runat="server" ID="Footer" />
    </form>
</body>
</html>
