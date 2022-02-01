    function validationForm() {
      var Email = document.forms["userForm"]["email"];
      var Password = document.forms["userForm"]["psw"];

        var userdata = JSON.parse(localStorage.getItem('userData'));
        var admindata = JSON.parse(localStorage.getItem('adminData'));
          let i= 0;
          // let email = "";
          while( i < userdata.length){
          if((Email.value == (userdata[i].Email)) || (Email.value == (admindata[i].Email))){
            alert("you are not the member of this site..")
            // email = Email.value;
            return true;
          }
          i++;
          // alert(email);
          }
        // else{
        //   alert("u r not a member..");
        //   return false;
        // };
      if (Email.value == "") {
        alert("Please enter Email....!");
        return false;
      }
      if (Password.value == "") {
        alert("Please enter Password....!");
        return false;
      }
      sessionStorage.setItem("user",Email.value);
      }
