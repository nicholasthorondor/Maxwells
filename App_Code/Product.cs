using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Product
{
    // Product Variables
    private string productName;
    private string productImage;
    private double productPrice;
    private int productQuantity;
    private string productDescription;
    private string productCode;
    private string productCategory;

    // Base Constructor
    public Product() { }
    
    // Primary Constructor
    public Product(string name, double price, int quantity, string img, string description, string code, string category)
	{
        productName = name;
        productImage = img;
        productPrice = price;
        productQuantity = quantity;
        productCode = code;
        productDescription = description;
        productCategory = category;
	}

    //------------------
    // Accessor Methods
    //------------------

    public string GetName() 
    {
        return productName;
    }

    public string GetImage()
    {
        return productImage;
    }

    public double GetPrice()
    {
        return productPrice;
    }

    public int GetQuantity()
    {
        return productQuantity;
    }

    public string GetCode()
    {
        return productCode;
    }

    public string GetDescription()
    {
        return productDescription;
    }

    public string GetCategory()
    {
        return productCategory;
    }

    //------------------
    // Set Value Methods
    //------------------

    public void SetName(string name)
    {
        productName = name;
    }

    public void SetImage(string img)
    {
        productImage = img;
    }

    public void SetPrice(double price)
    {
        productPrice = price;
    }

    public void SetQuantity(int quantity)
    {
        productQuantity = quantity;
    }

    public void SetCode(string code)
    {
        productCode = code;
    }

    public void SetDescription(string description)
    {
        productDescription = description;
    }

    public void SetCategory(string category)
    {
        productCategory = category;
    }
}