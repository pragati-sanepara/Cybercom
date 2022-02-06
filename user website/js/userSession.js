
window.onload = () => {
    var userName = JSON.parse(sessionStorage.getItem("isLogged"));
    if(!userName){
        window.open("./Login.html", "_self");
    }

    var userName = JSON.parse(sessionStorage.getItem("isLogged"));
    var user = document.getElementById('userName');
    user.innerHTML = "Hello" + " " + userName.Name;

    console.log(localStorage.getItem('sessionTime'));
    if (localStorage.getItem('sessionTime')) {
        var output = document.querySelector('tbody');
        
        JSON.parse(localStorage.getItem('sessionTime')).forEach(sessionTime => {
            
            output.innerHTML += `
            <tr>
            <td>${sessionTime.Name}</td>
            <td>${sessionTime.logInTime}</td>
            <td>${sessionTime.logOutTime}</td>
            </tr>
            `;
        });
    }
};

function logOut(){
    sessionStorage.setItem("isLogged", null);
}