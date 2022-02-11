function validationForm() {
    var firstName = document.forms["userForm"]["uname"].value;
    var emailID = document.forms["userForm"]["email"].value;
    var Password = document.forms["userForm"]["psw"].value;
    var rePassword = document.forms["userForm"]["psw-repeat"].value;
    var City = document.forms["userForm"]["city"].value;
    var State = document.forms["userForm"]["state"].value;
    var Term = document.forms["userForm"]["term"].value;

    if (firstName == "") {
        alert("Please enter firstName....!");
        return false;
    }
    if (emailID == "") {
        alert("Please enter email id ....!");
        return false;
    }
    if (Password == "") {
        alert("Please enter Password....!");
        return false;
    }
    if (rePassword == "") {
        alert("Please enter rePassword....!");
        return false;
    }
    if (City == "") {
        alert("Please select city....!");
        return false;
    }
    if (State == "") {
        alert("Please select state....!");
        return false;
    }
    if ((rePassword != "") && (Password != rePassword)) {
        alert("Please enter same Repeat Password....!");
        return false;
    }
    if (Term.checked == false) {
        alert("Please accept the term and condition....!");
        return false;
    }
    storeAdmin();
}


function storeAdmin() {
    var data = JSON.parse(localStorage.getItem('adminData')) ?? [];
    // console.log(data);
    // console.log(localStorage.getItem);
    Name = document.getElementById('uname').value,
        Email = document.getElementById('email').value,
        Password = document.getElementById('psw').value,
        City = document.getElementById('city').value,
        State = document.getElementById('state').value

    var userdata = JSON.parse(localStorage.getItem('userData')) ?? [];
    var admindata = JSON.parse(localStorage.getItem('adminData')) ?? [];

    var atposition = Email.indexOf("@");
    var dotposition = Email.lastIndexOf(".");
    if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= Email.length) {
        alert("Please enter a valid e-mail address \n atpostion:" + atposition + "\n dotposition:" + dotposition);
        return false;
    }

    var isUser = userdata.find((e) => e.Email == Email);
    var isAdmin = admindata.find((e) => e.Email == Email);

    if (isAdmin || isUser) {
        alert("user or admin alredy exist..")
        return false;
    }
    else{
        window.open("./Login.html", "_self");
    }

    if (!data)
        data = [];
    var storedData = {
        Name: Name,
        Email: Email,
        Password: Password,
        City: City,
        State: State
    }
    data.push(storedData);
    localStorage.setItem('adminData', JSON.stringify(data));
}
        // function loginuser(){
        //     alert('hii');
        //     var UserName = document.forms["personForm"]["uname"];
        //     alert('UserName.value');
        //     var Name = UserName.value;
        //     alert(Name);

        //     document.write('<html><body><h3>')
        //     document.write("hello" + " ");
        //     document.write(Name);
        //     document.write('</h3></body></html>');
        // }