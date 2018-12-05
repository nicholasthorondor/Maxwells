using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Checkout : System.Web.UI.Page
{
    private double total = 0; // For calculating order total.

    protected void Page_Load(object sender, EventArgs e)
    {
        // If no session object exists, redirect to home page.
        if (Session["userShoppingSession"] == null) {
            Response.Redirect("Home.aspx");
        }

        // Extracts product array from session object.
        ArrayList productArray = (ArrayList)Session["userShoppingSession"];
        int arrayLength = productArray.Count;

        // If no items are present in the cart, redirect to home page.
        if (productArray.Count <= 0) {
            Response.Redirect("Home.aspx");
        }

        //----------------------
        // Page population Logic
        //----------------------

        // Prefill form with customer data if a Customer object is saved in the Session object, to save unecessary data reentry on page reload.
        if (Session["customerDetails"] != null && !Page.IsPostBack) {
            // Extracts customer object from session object.
            Customer customer = (Customer)Session["customerDetails"];
            Customer shippingAddress = (Customer)Session["shippingAddress"];

            // Billing section
            ddlBillingTitle.SelectedValue = customer.getTitle();
            txtBoxBillingFirstName.Text = customer.getFirstName();
            txtBoxBillingMiddleName.Text = customer.getMiddleName();
            txtBoxBillingSurname.Text = customer.getSurname();
            txtBoxBillingStreetNumber.Text = customer.getStreetNumber();
            txtBoxBillingStreetName.Text = customer.getStreetName();
            ddlBillingStreetType.SelectedValue = customer.getStreetType();
            txtBoxBillingSuburb.Text = customer.getSuburb();
            txtBoxBillingPropertyName.Text = customer.getPropertyName();
            txtBoxBillingCity.Text = customer.getCity();
            ddlBillingState.SelectedValue = customer.getState();
            txtBoxBillingPostCode.Text = customer.getPostCode();
            txtBoxBillingCountry.Text = customer.getCountry();
            txtBoxBillingEmail.Text = customer.getEmail();
            ddlBillingCountryCode.SelectedValue = customer.getCountryCode();
            txtBoxBillingAreaCode.Text = customer.getAreaCode();
            txtBoxBillingLandline.Text = customer.getLandline();
            txtBoxBillingMobile.Text = customer.getMobile();

            // Shipping section
            ddlShippingTitle.SelectedValue = shippingAddress.getTitle();
            txtBoxShippingFirstName.Text = shippingAddress.getFirstName();
            txtBoxShippingMiddleName.Text = shippingAddress.getMiddleName();
            txtBoxShippingSurname.Text = shippingAddress.getSurname();
            txtBoxShippingStreetNumber.Text = shippingAddress.getStreetNumber();
            txtBoxShippingStreetName.Text = shippingAddress.getStreetName();
            ddlShippingStreetType.SelectedValue = shippingAddress.getStreetType();
            txtBoxShippingSuburb.Text = shippingAddress.getSuburb();
            txtBoxShippingPropertyName.Text = shippingAddress.getPropertyName();
            txtBoxShippingCity.Text = shippingAddress.getCity();
            ddlShippingState.SelectedValue = shippingAddress.getState();
            txtBoxShippingPostCode.Text = shippingAddress.getPostCode();
            txtBoxShippingCountry.Text = shippingAddress.getCountry();
            txtBoxShippingEmail.Text = shippingAddress.getEmail();
            ddlShippingCountryCode.SelectedValue = shippingAddress.getCountryCode();
            txtBoxShippingAreaCode.Text = shippingAddress.getAreaCode();
            txtBoxShippingLandline.Text = shippingAddress.getLandline();
            txtBoxShippingMobile.Text = shippingAddress.getMobile();
        }  
     }

    //--------------------------------
    // Event Handler Methods
    //--------------------------------

    // Shows or hides shipping details section on checkbox toggle.
    protected void ShippingToggle(object sender, EventArgs e) {
        if (cbShippingToggle.Checked == true) {
            shippingDetailsContainer.Attributes.Add("class", "detailsHide");
        }
        else {
            shippingDetailsContainer.Attributes.Remove("class");
            ddlShippingTitle.SelectedValue = "";
            txtBoxShippingFirstName.Text = "";
            txtBoxShippingMiddleName.Text = "";
            txtBoxShippingSurname.Text = "";
            txtBoxShippingStreetNumber.Text = "";
            txtBoxShippingStreetName.Text = "";
            ddlShippingStreetType.SelectedValue = "";
            txtBoxShippingSuburb.Text = "";
            txtBoxShippingPropertyName.Text = "";
            txtBoxShippingCity.Text = "";
            ddlShippingState.SelectedValue = "";
            txtBoxShippingPostCode.Text = "";
            txtBoxShippingCountry.Text = "";
            txtBoxShippingEmail.Text = "";
            ddlShippingCountryCode.SelectedValue = "";
            txtBoxShippingAreaCode.Text = "";
            txtBoxShippingLandline.Text = "";
            txtBoxShippingMobile.Text = "";
        }
    }

    protected void btnCheckout_Click(object sender, EventArgs e) {
        // Validates all controls on the page when button is clicked.
        Page.Validate("AllValidators");

            // Handles population of shipping details when checkbox is toggled and continue button is clicked.
            if (cbShippingToggle.Checked == true) {
                shippingDetailsContainer.Attributes.Add("class", "detailsHide");
                ddlShippingTitle.SelectedValue = ddlBillingTitle.SelectedValue;
                txtBoxShippingFirstName.Text = txtBoxBillingFirstName.Text;
                txtBoxShippingMiddleName.Text = txtBoxBillingMiddleName.Text;
                txtBoxShippingSurname.Text = txtBoxBillingSurname.Text;
                txtBoxShippingStreetNumber.Text = txtBoxBillingStreetNumber.Text;
                txtBoxShippingStreetName.Text = txtBoxBillingStreetName.Text;
                ddlShippingStreetType.SelectedValue = ddlBillingStreetType.SelectedValue;
                txtBoxShippingSuburb.Text = txtBoxBillingSuburb.Text;
                txtBoxShippingPropertyName.Text = txtBoxBillingPropertyName.Text;
                txtBoxShippingCity.Text = txtBoxBillingCity.Text;
                ddlShippingState.SelectedValue = ddlBillingState.SelectedValue;
                txtBoxShippingPostCode.Text = txtBoxBillingPostCode.Text;
                txtBoxShippingCountry.Text = txtBoxBillingCountry.Text;
                txtBoxShippingEmail.Text = txtBoxBillingEmail.Text;
                ddlShippingCountryCode.SelectedValue = ddlBillingCountryCode.SelectedValue;
                txtBoxShippingAreaCode.Text = txtBoxBillingAreaCode.Text;
                txtBoxShippingLandline.Text = txtBoxBillingLandline.Text;
                txtBoxShippingMobile.Text = txtBoxBillingMobile.Text;
                Page.Validate("AllValidators");
            }

            // If the page is valid store data and go to summary page. Otherwise validation error messages will be displayed and user will be required to enter necessary data to proceed.
            if (Page.IsValid) {
                // Records customer details into Customer object
                Customer customer = new Customer();
                customer.setName(ddlBillingTitle.SelectedValue, txtBoxBillingFirstName.Text, txtBoxBillingMiddleName.Text, txtBoxBillingSurname.Text);
                customer.setAddress(txtBoxBillingStreetNumber.Text, txtBoxBillingStreetName.Text, ddlBillingStreetType.SelectedValue, txtBoxBillingSuburb.Text, txtBoxBillingPropertyName.Text, txtBoxBillingCity.Text, ddlBillingState.SelectedValue, txtBoxBillingPostCode.Text, txtBoxBillingCountry.Text);
                customer.setContact(txtBoxBillingEmail.Text, ddlBillingCountryCode.SelectedValue, txtBoxBillingAreaCode.Text, txtBoxBillingLandline.Text, txtBoxBillingMobile.Text);
                customer.setPaymentDetails(ddlCreditCardType.SelectedValue, txtBoxName.Text, txtBoxCardNumber.Text, ddlExpiryMonth.SelectedValue, ddlExpiryYear.SelectedValue, txtBoxCVN.Text);

                // Records shipping details into Customer object
                Customer shippingAddress = new Customer();
                shippingAddress.setName(ddlShippingTitle.SelectedValue, txtBoxShippingFirstName.Text, txtBoxShippingMiddleName.Text, txtBoxShippingSurname.Text);
                shippingAddress.setAddress(txtBoxShippingStreetNumber.Text, txtBoxShippingStreetName.Text, ddlShippingStreetType.SelectedValue, txtBoxShippingSuburb.Text, txtBoxShippingPropertyName.Text, txtBoxShippingCity.Text, ddlShippingState.SelectedValue, txtBoxShippingPostCode.Text, txtBoxShippingCountry.Text);
                shippingAddress.setContact(txtBoxShippingEmail.Text, ddlShippingCountryCode.SelectedValue, txtBoxShippingAreaCode.Text, txtBoxShippingLandline.Text, txtBoxShippingMobile.Text);

                // Creates new session variables and adds Customer objects if they do not exist. If they do exist overwrite existing Customer objects.
                if (Session["customerDetails"] == null) {
                    Session["customerDetails"] = customer;
                }
                else {
                    Session.Add("customerDetails", customer);
                }
                if (Session["shippingDetails"] == null) {
                    Session["shippingAddress"] = shippingAddress;
                }
                else {
                    Session.Add("shippingAddress", shippingAddress);
                }

                Response.Redirect("Summary.aspx");
            }
    }

    protected void btnContShop_Click(object sender, EventArgs e) {
        Response.Redirect("ShoppingCart.aspx");
    }
}