using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ShoppingCart : System.Web.UI.Page
{
    private double total = 0; // For calculating order total.

    protected void Page_Load(object sender, EventArgs e)
    {
        // Only creates session object if one does not exist.
        if (Session["userShoppingSession"] == null)
        {
            ArrayList productArray = new ArrayList();
            Session["userShoppingSession"] = productArray;
        }

        //----------------------
        // Page population Logic
        //----------------------

        else
        {
            // Creates a product object based on query string info passed in when the user clicked the add too cart button ->
            // on the category listings, rather than the detailed product listing. Only does this if a query string is present.
            if (Request.QueryString["productName"] != null) {
                string productImage = Request.QueryString["image"];
                string productName = Request.QueryString["productName"];
                string productCode = Request.QueryString["code"];
                string productPrice = Request.QueryString["price"];
                string productDescription = Request.QueryString["description"];
                string productCategory = Request.QueryString["fromCategory"];

                double price = double.Parse(productPrice);
                Product newProduct = new Product(productName, price, 1, productImage, productDescription, productCode, productCategory);

                // Extracts array from session object.
                ArrayList tempProductArray = (ArrayList)Session["userShoppingSession"];

                // Loops through product array to check if the product being added is already present. If so it will increment the quantity by 1.
                for (int i = 0; i < tempProductArray.Count; i++)
                {
                    Product comparisonProduct = (Product)tempProductArray[i];
                    if (comparisonProduct.GetName() == newProduct.GetName())
                    {
                        comparisonProduct.SetQuantity(comparisonProduct.GetQuantity() + 1);
                        Response.Redirect("ShoppingCart.aspx");
                    }
                }
                // Adds product object to the array and adds the array back to the session object.
                tempProductArray.Add(newProduct);
                Session.Add("userShoppingSession", tempProductArray);
                Response.Redirect("ShoppingCart.aspx");
            }

            // Extracts array from session object. To allow processing of data for page controls.
            ArrayList productArray = (ArrayList)Session["userShoppingSession"];
            int arrayLength = productArray.Count;

            // Logic for Empty Cart
            if (arrayLength <= 0)
            {
                Label lblEmptyCart = new Label();
                lblEmptyCart.Text = "Your shopping cart is empty";
                controlsContainer.Controls.Add(lblEmptyCart);
                lblGrandTotal.Visible = false;
                lblShipping.Visible = false;
                btnCheckout.Visible = false;
            }

            // Populates cart with items in product array.
            else
            {
                for (int i = 0; i < arrayLength; i++)
                {
                    // Examines product object at each index of the array.
                    Product product = (Product)productArray[i];

                    // Container
                    HtmlGenericControl itemContainer = new HtmlGenericControl("div");
                    itemContainer.ID = "itemContainer" + i;

                    // Product Image
                    ImageButton imgProduct = new ImageButton();
                    imgProduct.ID = "imgProduct" + i;
                    imgProduct.ImageUrl = "Images/" + product.GetImage();
                    imgProduct.CssClass = "cartImg";
                    imgProduct.PostBackUrl = "DetailedProductListing.aspx?productName=" + product.GetName() + "&image=" + product.GetImage() + "&price=" + product.GetPrice().ToString("f2") + "&code=" + product.GetCode() + "&description=" + product.GetDescription() + "&fromCategory=" + product.GetCategory();

                    // Product Name
                    HyperLink lblProductName = new HyperLink();
                    lblProductName.ID = "lblProductName" + i;
                    lblProductName.Text = product.GetName();
                    lblProductName.CssClass = "cartItems" + " " + "cartItemName";
                    lblProductName.NavigateUrl = "DetailedProductListing.aspx?productName=" + product.GetName() + "&image=" + product.GetImage() + "&price=" + product.GetPrice().ToString("f2") + "&code=" + product.GetCode() + "&description=" + product.GetDescription() + "&fromCategory=" + product.GetCategory();

                    // Product Price
                    Label lblProductPrice = new Label();
                    lblProductPrice.ID = "lblProductPrice" + i;
                    double itemTotal = product.GetPrice() * product.GetQuantity();
                    lblProductPrice.Text = itemTotal.ToString("C2");
                    lblProductPrice.CssClass = "cartItems" + " " + "cartItemPrice";

                    // Product Quantity
                    TextBox txtBoxQuantity = new TextBox();
                    txtBoxQuantity.ID = "txtBoxQuantity" + i;
                    txtBoxQuantity.Text = product.GetQuantity().ToString();
                    txtBoxQuantity.CssClass = "cartQuantity";

                    // Update Quantity Link.
                    LinkButton updateQuantity = new LinkButton();
                    updateQuantity.ID = "updateQuantity" + i;
                    updateQuantity.Text = "Update";
                    updateQuantity.CssClass = "cartUpdateQuantity";
                    updateQuantity.Click += (s, ev) => updateQuantity_Click(s, ev, product.GetName(), productArray); // Allows eventhandler to accept 2 additional parameters.

                    // Remove Product from Cart Button.
                    ImageButton btnRemoveItem = new ImageButton();
                    btnRemoveItem.ID = "btnRemoveItem" + i;
                    btnRemoveItem.ImageUrl = "Images/cross.png";
                    btnRemoveItem.CssClass = "cartItems removeBtn";
                    btnRemoveItem.Click += (s,ev) => btnRemoveItem_Click(s, ev, product.GetName(), productArray); // Allows eventhandler to accept 2 additional parameters.

                    // Populates page with controls.
                    controlsContainer.Controls.Add(itemContainer);
                    itemContainer.Controls.Add(imgProduct);
                    itemContainer.Controls.Add(lblProductName);
                    itemContainer.Controls.Add(txtBoxQuantity);
                    itemContainer.Controls.Add(updateQuantity);
                    itemContainer.Controls.Add(lblProductPrice);
                    itemContainer.Controls.Add(btnRemoveItem);
                }

                // Calculates order total, including flat rate shipping cost of $9.99;
                for(int i = 0; i < productArray.Count; i++) {
                    Product product = (Product)productArray[i];
                    total += product.GetPrice() * product.GetQuantity() + 9.99;
                }
                lblGrandTotal.Text += total.ToString("C2");
            }
        }
    }

    //--------------------------------
    // On Click Event Handler Methods
    //--------------------------------

    // Searches through product array, removes product from the array if it has the same name as the entry the user removed, and reloads the page to refresh display.
    void btnRemoveItem_Click(object sender, EventArgs e, string name, ArrayList array) {
        for (int i = 0; i < array.Count; i++) {
            Product product = (Product)array[i];
            if (product.GetName() == name) {
                array.RemoveAt(i);
            }
        }
        Session["userShoppingSession"] = array;
        Response.Redirect("ShoppingCart.aspx");
    }

    // Searches through the product array, updates product quantity for the specified product in the array and reloads the page to refesh display.
    void updateQuantity_Click(object sender, EventArgs e, string name, ArrayList array) {
        for (int i = 0; i < array.Count; i++)
        {
            Product product = (Product)array[i];
            TextBox quantity = (TextBox)shoppingCartForm.FindControl("itemContainer" + i).FindControl("txtBoxQuantity" + i); // Finds textbox containing quantity count.
            
            // Makes sure value entered in quantity text box is a number.
            int newQuantity;
            if (int.TryParse(quantity.Text, out newQuantity))
            {
                newQuantity = Int32.Parse(quantity.Text);
                if (product.GetName() == name)
                {
                    product.SetQuantity(newQuantity);
                    Response.Redirect("ShoppingCart.aspx");
                }        
            }
            // If value is not a number changes textbox style to red.
            else {
                quantity.Style["border"] = "2px solid red";
                quantity.Style["background-color"] = "rgba(255,0,0,0.5)";
                lblGrandTotal.Text = "Total: " + total.ToString("C2");
            }
        }
        
    }

    // Redirects to the checkout page, and validates data fields (NOT YET IMPLEMENTED).
    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Checkout.aspx");
    }

    // Redirects to the category page that the final product in the product array belongs to. If no product is in the cart redirects to home page.
    protected void btnContShop_Click(object sender, EventArgs e)
    {
        // Extracts array from session object.
        ArrayList tempProductArray = (ArrayList)Session["userShoppingSession"];
        if (tempProductArray.Count > 0)
        {
            int finalIndex = tempProductArray.Count - 1;
            Product lastProduct = (Product)tempProductArray[finalIndex];
            Response.Redirect("CategoryProductList.aspx?category=" + lastProduct.GetCategory());
        }
        else {
            Response.Redirect("Home.aspx");
        }
    }
}