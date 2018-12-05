using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Header : System.Web.UI.UserControl
{
    // Keeps track of how many items are in the user's cart by displaying a small dynamic label near the cart icon.
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userShoppingSession"] != null)
        {
            ArrayList tempArray = (ArrayList)Session["userShoppingSession"];
            int arrayLength = tempArray.Count;
            lblItemCount.Text = "(" + arrayLength.ToString() + ")";
        }
    }

    protected void CategoryTools_Click(object sender, EventArgs e)
    {
        Response.Redirect("CategoryProductList.aspx?category=Tools");
    }

    protected void CategoryHardware_Click(object sender, EventArgs e)
    {
        Response.Redirect("CategoryProductList.aspx?category=Hardware");
    }

    protected void CategoryGardening_Click(object sender, EventArgs e)
    {
        Response.Redirect("CategoryProductList.aspx?category=Gardening");
    }

    protected void CartImageButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ShoppingCart.aspx");
    }
    protected void LogoImageButton_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}