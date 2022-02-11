function store() {
    var data = JSON.parse(localStorage.getItem('userData')) ?? [];

    var Name = document.getElementById('name').value;
    var Email = document.getElementById('email').value;
    var Password = document.getElementById('psw').value;
    var date = document.getElementById('date').value;

    if (!Name || !Email || !Password || !date) {
        alert("field is empty..");
        return false;
    }

    var atposition = data.indexOf("@");
    var dotposition = data.lastIndexOf(".");
    if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= x.length) {
        alert("Please enter a valid e-mail address \n atpostion:" + atposition + "\n dotposition:" + dotposition);
        return false;
    }

    var isUser = data.find((e) => e.Email == Email);
    if (isUser) {
        alert("user alredy exist..")
        return false;
    }
    var isUserName = data.find((e) => e.Name == Name);
    if (isUserName) {
        alert("This name's user is already exit. please give valid UserName..");
        return false;
    }

    var bdate = new Date(date);
    var month_diff = Date.now() - bdate;
    // console.log(month_diff);
    var age_dt = new Date(month_diff);
    var year = age_dt.getUTCFullYear();
    var age = Math.abs(year - 1970);
    if (age < 18) {
        alert("age is less then 18..");
        return false;
    }

    if (!data)
        data = [];
    var storedData = {
        Name: Name,
        Email: Email,
        Password: Password,
        date: date
    }

    data.push(storedData);
    localStorage.setItem('userData', JSON.stringify(data));
}
window.onload = () => {

    var userName = JSON.parse(sessionStorage.getItem("isLogged"));
    if (!userName) {
        window.open("./Login.html", "_self");
    }

    var userName = JSON.parse(sessionStorage.getItem("isLogged"));
    var user = document.getElementById('userName');
    user.innerHTML = "Hello" + " " + userName.Name;

    console.log(localStorage.getItem('userData'));
    if (localStorage.getItem('userData')) {
        var output = document.querySelector('tbody');
        // console.log(output);
        // output.innerHTML == "";
        JSON.parse(localStorage.getItem('userData')).forEach((userData, index) => {
            var bdate = new Date(userData.date);
            var month_diff = Date.now() - bdate;
            // console.log(month_diff);
            var age_dt = new Date(month_diff);
            var year = age_dt.getUTCFullYear();
            var age = Math.abs(year - 1970);

            output.innerHTML += `
            <tr>
            <td>${userData.Name}</td>
            <td>${userData.Email}</td>
            <td>${userData.Password}</td>
            <td>${userData.date}</td>
            <td> ${age}</td>
            <td class="auto" ><input type="button" onclick="edit(${index})" value="Edit"></td>
            <td ><input type="button" onclick="delete2(${index})" value="delete"></td>
            </tr>
            `;
        });
    }
}
function edit(id) {

    sessionStorage.setItem("userId", `${id}`);
    var update = document.getElementById('add');
    update.innerHTML = "Update User";
    var updateBtn = document.getElementById('btn');
    document.getElementById('btn').style.visibility = 'hidden';
    document.getElementById("updateBtn").style.visibility = 'visible';

    var userdata1 = JSON.parse(localStorage.getItem('userData'));
    document.getElementById('name').value = userdata1[id].Name;
    document.getElementById('email').value = userdata1[id].Email;
    document.getElementById('psw').value = userdata1[id].Password;
    document.getElementById('date').value = userdata1[id].date;

    localStorage.setItem('userData', JSON.stringify(userdata1));

}
function updateUser() {
    var id = JSON.parse(sessionStorage.getItem('userId'));
    console.log(id);
    var userdata1 = JSON.parse(localStorage.getItem('userData')) ?? [];
    var Name = document.getElementById('name').value;
    var Email = document.getElementById('email').value;
    var Password = document.getElementById('psw').value;
    var date = document.getElementById('date').value;

    var isUserNameId = userdata1.findIndex((e) => e.Name === Name);
    if (isUserNameId != -1 && isUserNameId != id) {
        alert("This name's user is already exit. please give valid UserName..");
        return false;
    }

    var isUserId = userdata1.findIndex((e) => e.Email == Email);
    if (isUserId == -1 || isUserId == id) {
        alert("user updated..");
    }
    else {
        alert("user already exit..");
        return false;
    }

    var bdate = new Date(date);
    var month_diff = Date.now() - bdate;
    // console.log(month_diff);
    var age_dt = new Date(month_diff);
    var year = age_dt.getUTCFullYear();
    var age = Math.abs(year - 1970);
    if (age < 18) {
        alert("age is less then 18..");
        return false;
    }

    var upadte = {
        Name: Name,
        Email: Email,
        Password: Password,
        date: date
    }
    if (Name && Email && Password && date) {
        userdata1[id] = upadte;
    }
    else {
        alert("field is empty");
    }
    localStorage.setItem('userData', JSON.stringify(userdata1));
};
function delete2(id) {
    // const id = e.parentNode.id;
    var userdata1 = JSON.parse(localStorage.getItem('userData'));
    confirm('Are you sure to delete the userdetail of' + userdata1[id].Name);

    var userName = JSON.parse(localStorage.getItem("sessionTime"));
    var findUser = userName.find((e) => e.Name == userdata1[id].Name);
    var index = userName.indexOf(findUser);

    userName.splice(index, 1);
    localStorage.setItem('sessionTime', JSON.stringify(userName));

    userdata1.splice(id, 1);
    localStorage.setItem('userData', JSON.stringify(userdata1));
}


function logOut() {
    sessionStorage.setItem("isLogged", null);
}