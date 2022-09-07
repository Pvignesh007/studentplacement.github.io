function validate(){
    var username =document.getElementById("username");
    var password =document.getElementById("password");
    if(username.value=="" && password.value=="")
    {
        // alert("Enter your validate username and password")
        swal({
            title: "Enter your Username and Password",
          });
        return false;
    }
    if(username.value=="")
    {
        if(username)
        swal({
            title: "Enter Your Username",
          });
        //alert("Enter your username");
        return false;
    }
    if(password.value=="")
    {
        swal({
            title: "Enter your password",
          });
       // alert("Enter your password");
        return false;
    }

}
