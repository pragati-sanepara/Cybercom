window.onload = () => {
    var userName = JSON.parse(sessionStorage.getItem("isLogged"));
    if (!userName) {
        window.open("./Login.html", "_self");
    }

    var userName = JSON.parse(sessionStorage.getItem("isLogged"));
    var user = document.getElementById('userName');
    user.innerHTML = "Hello" + " " + userName.Name;

    const d = new Date();
    var getMonth = d.getMonth() + 1;
    function month() {
        if (getMonth.toString().length == 1) {
            return "0" + getMonth;
        }
        else {
            return getMonth;
        }
    };
    var getDate = d.getDate();
    function date() {
        if (getDate.toString().length == 1) {
            return "0" + getDate;
        }
        else {
            return getDate;
        }
    };
    var toDay = month() + "-" + date();
    var userdata = JSON.parse(localStorage.getItem('userData')) ?? [];
    var place = document.getElementById('bday');

    for (let i = 0; i < userdata.length; i++) {
        var bday = userdata[i].date;
        var dayMon = bday.substring(bday.length - 5);
        if (dayMon == toDay) {
            place.innerHTML = "Today " + userdata[i].Name + "'s Birthday";
        }
    }
    userCount();
}

function logOut() {
    sessionStorage.setItem("isLogged", null);
}

function userCount() {
    var userdata = JSON.parse(localStorage.getItem('userData'));

    const d = new Date();
    var getYear = d.getFullYear();

    var up18 = getYear - 18;
    var below50 = getYear - 50;

    var userdata = JSON.parse(localStorage.getItem('userData')) ?? [];

    var countAbove18 = 0;
    for (let i = 0; i < userdata.length; i++) {
        var bday = userdata[i].date;
        var years = bday.slice(0, 4);
        if ((years <= up18) && (years >= below50)) {
            countAbove18++;
        }
    }
    var count = document.getElementById('age18+');
    count.innerHTML = countAbove18;

    var countAbove50 = 0;
    for (let i = 0; i < userdata.length; i++) {
        var bday = userdata[i].date;
        var years = bday.slice(0, 4);
        if (years < below50) {
            countAbove50++;
        }
    }
    var count = document.getElementById('age50+');
    count.innerHTML = countAbove50;
}