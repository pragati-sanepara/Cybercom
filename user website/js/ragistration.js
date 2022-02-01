        function validationForm() {
            var firstName = document.forms["userForm"]["uname"];
            var emailID = document.forms["userForm"]["email"];
            var Password = document.forms["userForm"]["psw"];
            var rePassword = document.forms["userForm"]["psw-repeat"];
            var City = document.forms["userForm"]["city"];
            var State = document.forms["userForm"]["state"];
            var Term = document.forms["userForm"]["term"]; 

            if (firstName.value == "") {
                alert("Please enter firstName....!");
                return false;
            }
            if (emailID.value == "") {
                alert("Please enter email id ....!");
                return false;
            }
            if (Password.value == "") {
                alert("Please enter Password....!");
                return false;
            }
            if (rePassword.value == "") {
                alert("Please enter rePassword....!");
                return false;
            }
            if (City.value == "") {
                alert("Please select city....!");
                return false;
            }
            if (State.value == "") {
                alert("Please select state....!");
                return false;
            }
            if ((rePassword.value != "") && (Password.value != rePassword.value)) {
                alert("Please enter same Repeat Password....!");
                return false;
            }
            if(Term.checked == false){
                alert("Please accept the term and condition....!");
                return false;
            }
            storeAdmin();
        }


function storeAdmin(){
    alert('hello admin');
    var data = JSON.parse(localStorage.getItem('adminData'));
    // console.log(data);
    // console.log(localStorage.getItem);
     Name = document.getElementById('uname').value,
     Email = document.getElementById('email').value,
     Password = document.getElementById('psw').value,
     City = document.getElementById('city').value,
     State = document.getElementById('state').value

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