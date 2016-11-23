function ClientValidateExpiryDate(val, args) {
    // find the controls
    var ddlExpiryYear = document.getElementById("ContentPlaceHolder1_ddlExpiryYear");
    var ddlExpiryMonth = document.getElementById("ContentPlaceHolder1_ddlExpiryMonth");
    var cvExpiryYear = document.getElementById("ContentPlaceHolder1_cvExpiryYear");


    var theMonth;
    var convertThisYear;
    var theYear;
    var currentMonth = new Date();
    var currentYear = new Date();

    // convert month and year to integer
    theMonth = parseInt(ddlExpiryMonth.selectedIndex);
    convertThisYear = parseInt(ddlExpiryYear.value);
    theYear = parseInt(convertThisYear);

    // check if the year entered is greate than the current year
    if (theYear > currentYear.getFullYear()) {
        cvExpiryYear.isvalid = true;
    } // check if the year is the same and the month chosen is greater than the current month
    else if (theYear == currentYear.getFullYear() && theMonth > currentMonth.getMonth()) {
        args.isvalid = true;
    } // invalid
    else {
        args.IsValid = false;
    }
};

function ClientValidateCCType(val, args) {
    // find the controls
    var ddlCardType = document.getElementById("ContentPlaceHolder1_ddlCardType");
    var txtCreditCardNo = document.getElementById("ContentPlaceHolder1_txtCreditCardNo");
    var ccCardType = ddlCardType.value;
    var ccNoLength = txtCreditCardNo.value.length;
    var lblCheckoutStatus = document.getElementById("ContentPlaceHolder1_lblCheckoutStatus");

    // check if no nothing entered
    if (ccNoLength == 0) {

        lblCheckoutStatus.textContent = "A card number is required.";

        args.Isvalid = false;
    } // check if an invalid character entered
    else if (isNaN(txtCreditCardNo.value)) {
        lblCheckoutStatus.textContent = "The credit card number must be 15-16 digits depending on card type";
        args.Isvalid = false;
    }    // check if Amex card and there are 15 digits
    else if (ccCardType === "AMEX" && ccNoLength == 15) {
        args.IsValid = true;
    }    // check if Amex card and there are 16 digits
    else if ((ccCardType === "VISA" || ccCardType === "Master Card") && ccNoLength == 16) {
        args.IsValid = true;
    } // invalid
    else {
        lblCheckoutStatus.textContent = "Enter a valid credit card number. 15 digits for Amex and 16 for other cards.";
        args.IsValid = false;
    }
};
