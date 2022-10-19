function printError(elemId, hintMsg)
{
    document.getElementById(elemId).innerHTML = hintMsg;
}
function validate()
{
    var name = document.contactForm.name.value;
    var email = document.contactForm.email.value;
    var createpassword = document.contactForm.createpassword.value;
    var confirmpassword = document.contactForm.confirmpassword.value;

let nameErr = emailErr = crpErr = copErr = true;
if(name.trim() === "")
{
printError("nameErr", "Please enter your name");
}
else
{
var regex = /^[a-zA-Z\s]+$/;
if(regex.test(name) === false)
{
printError("nameErr", "Please enter a valid name");
}
else
{
printError("nameErr", "");
nameErr = false;
} }
if(email.trim() === "")
{
printError("emailErr", "Please enter your email address");
}
else
{
var regex = /^\S+@\S+\.\S+$/;
if(regex.test(email) === false)
{
printError("emailErr", "Please enter a valid email address");
}else
{
printError("emailErr", ""); emailErr = false;
} }
if(createpassword==="")
{
    printError("crpErr", "Please enter your password");

}
else
{
    var regex = /^(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    if(regex.test(createpassword) === false)
    {
       
        printError("copErr", "password should contain 8 characters");

    }
    else
    {
        printError("crpErr", ""); crpErr = false;
    }
}
if(confirmpassword==="")
{
    printError("copErr", "Confirm Password is Empty");

}
else
{
   
    if (createpassword !== confirmpassword)
    {
        printError("copErr", "Password should be same");
       
    }
    else
    {
        printError("copErr", ""); copErr = false;
    }
}

if(nameErr || emailErr || crpErr || copErr)
{
    return false;
}
else
{
    console.log(nameErr , emailErr , crpErr , copErr);
    return true;
}
}