function store() {
    var data = JSON.parse(localStorage.getItem('userData'));
    // console.log(data);
    // console.log(localStorage.getItem);
     Name = document.getElementById('name').value,
     Email = document.getElementById('email').value,
     Password = document.getElementById('psw').value,
     date = document.getElementById('date').value

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

    console.log(localStorage.getItem('userData'));
    if (localStorage.getItem('userData')) {
        var output = document.querySelector('tbody');
        // console.log(output);
        // output.innerHTML == "";
        JSON.parse(localStorage.getItem('userData')).forEach((userData,index) => {
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
            <td> edit </td>
            <td id="${index}"><input type="button" onclick="delete2(this)" value="delete">delete</td>
            </tr>
            `;
        });
    }
}
function delete2(e) {
    const id = e.parentNode.id;
    // alert(id);
    var userdata1 = JSON.parse(localStorage.getItem('userData'));
    alert(userdata1[0].Name);
    userdata1.splice(id);
    localStorage.setItem('userData', JSON.stringify(userdata1));
}