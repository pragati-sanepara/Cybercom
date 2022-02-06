function validationForm() {
  var Email = document.forms["userForm"]["email"].value;
  var Password = document.forms["userForm"]["psw"].value;

  var userdata = JSON.parse(localStorage.getItem('userData')) ?? [];
  var admindata = JSON.parse(localStorage.getItem('adminData')) ?? [];

  var isUser = userdata.find((e) => e.Email == Email);
  var isAdmin = admindata.find((e) => e.Email == Email);

  if (Email == "") {
    alert("Please enter Email....!");
    return false;
  }
  if (Password == "") {
    alert("Please enter Password....!");
    return false;
  }

  var today = new Date();
  var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
  var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
  var dateTime = date + ' ' + time;

  if (isAdmin && isAdmin.Password == Password) {
    sessionStorage.setItem("isLogged", JSON.stringify(isAdmin));
    window.open("./Dashboard.html", "_self");
    return true;
  }
  if (isUser && isUser.Password == Password) {
    sessionStorage.setItem("isLogged", JSON.stringify(isUser));
    localStorage.setItem("inTime", dateTime);
    window.open("./Sub-user.html", "_self");
    return true;
  }
  alert("enter valid credentials");
}
