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
    function month(){
        if(getMonth.toString().length == 1){
            return "0"+getMonth;
        }
        else{
            return getMonth;
        }
    };
    var getDate = d.getDate();
    function date(){
        if(getDate.toString().length == 1){
            return "0"+getDate;
        }
        else{
            return getDate;
        }
    };
    var toDay = month() + "-" + date();
    var userdata = JSON.parse(localStorage.getItem('userData')) ?? [];
    var place = document.getElementById('bday');
    
    for (let i = 0; i < userdata.length; i++) {
        var bday = userdata[i].date;
        var dayMon = bday.substring(bday.length - 5); 
        if(dayMon == toDay){
            if(userdata[i].Name == userName.Name)
            place.innerHTML = "Happy Birthday";
            else place.innerHTML = "Today " + userdata[i].Name + "'s Birthday";
        }
    }
};

function logOut() {
    var today = new Date();
    var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var dateTime = date + ' ' + time;

    localStorage.setItem("outTime", dateTime);

    storeSession();

    sessionStorage.setItem("isLogged", null);
}

function storeSession(){
    alert("hii");
    var userTime = JSON.parse(localStorage.getItem('sessionTime')); 

    var Name = JSON.parse(sessionStorage.getItem("isLogged"));
    var logInTime = localStorage.getItem("inTime");
    var logOutTime = localStorage.getItem("outTime");

    if(!userTime)
        userTime = [];

    var storeTime = {
        Name : Name.Name,
        logInTime : logInTime,
        logOutTime : logOutTime
    }

    var isUser = userTime.find((e) => e.Name == Name.Name);
    if(!isUser){
    userTime.push(storeTime);
    }
    else{
        const index = userTime.findIndex( (e) => e.Name === Name.Name);
        userTime[index].logInTime = logInTime;
        userTime[index].logOutTime = logOutTime;
    }
    localStorage.setItem('sessionTime', JSON.stringify(userTime));
}
