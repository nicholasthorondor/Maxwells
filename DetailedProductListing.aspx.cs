using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DeatiledProductListing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Only creates session object if one does not exist.
        if (Session["userShoppingSession"] == null)
        {
            ArrayList productArray = new ArrayList();
            Session["userShoppingSession"] = productArray;
        }

        // Sets page title dynamically
        Page.Title = "Maxwells | " + Request.QueryString["productName"];

        //----------------------
        // Page Population Logic
        //----------------------

        // Populates page according to data sent in query string.
        string productImage = Request.QueryString["image"];
        string productName = Request.QueryString["productName"];
        string productCode = Request.QueryString["code"];
        string productPrice = Request.QueryString["price"];
        string productDescription = Request.QueryString["description"];
        imgProduct.ImageUrl = "Images/" + productImage;
        lblProductName.Text = productName;
        lblProductCode.Text = productCode;
        lblProductPrice.Text = "$" + productPrice;
        lblDescription.Text = productDescription;
    }

    //-----------------------
    // Event Handler Methods.
    //-----------------------

    // Captures query string for category the user came from and uses that for input into the back button.
    protected void BackButton_Click(object sender, EventArgs e)
    {
        string previousCategory = Request.QueryString["fromCategory"];
        Response.Redirect("CategoryProductList.aspx?category=" + previousCategory);
    }

    // Creates a product object with specified parameters and adds to a session object.
    // Substrings on some parameters are for skipping extraneous information, like dollar signs.
    protected void btnCart_Click(object sender, EventArgs e)
    {
        int quantity = Int32.Parse(dropList.SelectedValue);
        double price = double.Parse(lblProductPrice.Text.Substring(1));
        Product newProduct = new Product(lblProductName.Text, price, quantity, imgProduct.ImageUrl.Substring(7), lblDescription.Text, lblProductCode.Text, Request.QueryString["fromCategory"]);

        // Extracts array from session object.
        ArrayList productArray = (ArrayList)Session["userShoppingSession"];

        // Loops through product array to check if the product being added is already present. If so it will increment the quantity by 1.
        for (int i = 0; i < productArray.Count; i++) {
            Product comparisonProduct = (Product)productArray[i];
            if (comparisonProduct.GetName() == newProduct.GetName())
            {
                comparisonProduct.SetQuantity(comparisonProduct.GetQuantity() + quantity);
                Response.Redirect("ShoppingCart.aspx");
            }
        }
        // Adds product object to the array and adds the array back to the session object.
        productArray.Add(newProduct);
        Session.Add("userShoppingSession", productArray);
        Response.Redirect("ShoppingCart.aspx");
    }
}