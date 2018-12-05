using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

// Class that handles the customer details related to the billing address
public class Customer
{
    // Customer variables
    private string title;
    private string firstName;
    private string middleName;
    private string surname;
    // Address variables
    private string streetNumber;
    private string streetName;
    private string streetType;
    private string suburb;
    private string propertyName;
    private string city;
    private string state;
    private string postcode;
    private string country;
    // Contact variables
    private string email;
    private string countrycode;
    private string areaCode;
    private string landline;
    private string mobile;
    // Payment Details
    private string cardType;
    private string nameOnCard;
    private string cardNumber;
    private string expMonth;
    private string expYear;
    private string cvn;

    // Default Constructor
	public Customer() {}

    // Sets customers name
    // param t is title
    // param fn is first name
    // param mn is middle name
    // param sn is surname
    public void setName(string t, string fn, string mn, string sn) {
        title = t;
        firstName = fn;
        middleName = mn;
        surname = sn;
    }

    // Sets address
    // param snum is street number
    // param sn is street name
    // param st is street type
    // param sub is suburb
    // param pn is property name
    // param c is city
    // param s is state
    // param pc is postcode
    // param co is country
    public void setAddress(string snum, string sn, string st, string sub, string pn, string c, string s, string pc, string co) {
        streetNumber = snum;
        streetName = sn;
        streetType = st;
        suburb = sub;
        propertyName = pn;
        city = c;
        state = s;
        postcode = pc;
        country = co;
    }

    // Sets contact details
    // param e is email
    // param cc is country code
    // param ac is area code
    // param ll is landline
    // param m is mobile
    public void setContact(string e, string cc, string ac, string ll, string m) {
        email = e;
        countrycode = cc;
        areaCode = ac;
        landline = ll;
        mobile = m;
    }

    // Sets card type for payment details
    // param ct is card type
    // param n is name on the card
    // param num is the card number
    // param ed is the expiration day
    // param em is the expiration month
    // param cv is the cvn
    public void setPaymentDetails(string ct, string n, string num, string em, string ey, string cv) {
        cardType = ct;
        nameOnCard = n;
        cardNumber = num;
        expMonth = em;
        expYear = ey;
        cvn = cv;
    }

    // Returns strings related to the customers name
    public string getFullName() {
        return title + " " + firstName + " " + middleName + " " + surname; 
    }

    public string getTitle() {
        return title;
    }

    public string getFirstName() {
        return firstName;
    }

    public string getMiddleName() {
        return middleName;
    }

    public string getSurname() {
        return surname;
    }

    // Returns strings relating to the customers address
    public string getFullAddress() {
        return propertyName + "<br>" + streetNumber + " " + streetName + " " + streetType + " " + suburb + "<br>" + city + " " + state + " " + postcode + "<br>" + country;
    }

    public string getPropertyName() {
        return propertyName;
    }

    public string getStreetNumber() {
        return streetNumber;
    }

    public string getStreetName() {
        return streetName;
    }

    public string getStreetType() {
        return streetType;
    }

    public string getSuburb() {
        return suburb;
    }

    public string getCity() {
        return city;
    }

    public string getState() {
        return state;
    }

    public string getCountry() {
        return country;
    }

    public string getPostCode() {
        return postcode;
    }

    // Returns strings relating to the customers contact details
    public string getFullContact() {
        return "<b>" + "Email: " + "</b>" + email + "<br>" + "<b>" + "Landline: " + "</b>" + countrycode + " (" + areaCode + ")" + landline + "<br>" + "<b>" + "Mobile: " + "</b>" + mobile;
    }
    
    public string getEmail() {
        return email;
    }

    public string getMobile() {
        return mobile;
    }

    public string getCountryCode() {
        return countrycode;
    }

    public string getAreaCode() {
        return areaCode;
    }

    public string getLandline() {
        return landline;
    }

    // Returns strings relating to the credit card used by the customer
    public string getCardType() {
        return cardType;
    }

    public string getNameOnCard() {
        return nameOnCard;
    }

    public string getCardNumber() {
        return cardNumber;
    }

    public string getCardExp() {
        return expMonth + "/" + expYear;
    }

    public string getCardExpMonth() {
        return expMonth;
    }

    public string getCardExpYear() {
        return expYear;
    }

    public string getCardCvn() {
        return cvn;
    }
}