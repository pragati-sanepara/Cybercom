/***************************************
 * CODING CHALLENGE 1
 */
/*
var mark, john, BMI, higher = true;

mark = {
    Name: 'Mark',
    Mass: 90,
    Height: 5.5,
}

john = {
    Name: 'john',
    Mass: 50,
    Height: 5,
}

function calcBMI(x) {
    BMI = x.Mass / (x.Height * x.Height);
    return BMI;
}

mark.BMI = calcBMI(mark);
john.BMI = calcBMI(john);

window.onload = () => {
    if (mark.BMI > john.BMI) {
        var human = document.getElementById('ch1');
        human.innerHTML = higher;
    }
    else {
        var human = document.getElementById('ch1');
        human.innerHTML = !higher;
    }
}
*/










/*******************************
 * CODING CHALLENGE 2
 */


/*
function avgScore(x) {

    var avg = 0;

    let i = 0;
    while (i < x.length) {
        avg += x[i];
        i++;
    }
    return avg / x.length;
}

    var code = document.getElementById('cd2');
    code.innerHTML = "Coding Challenge 2";
    
    var John = [89, 120, 103];
    var Mike = [116, 94, 123];
    var Mary = [97, 134, 155];
    John[John.length] = 160;

    console.log(avgScore(John));
    console.log(avgScore(Mike));
    console.log(avgScore(Mary));

    if ((avgScore(John) > avgScore(Mike)) && (avgScore(John) > avgScore(Mary))) {
        var team = document.getElementById('ch2');
        team.innerHTML = "John is winner and his score is " + avgScore(John);
    }
    else  if((avgScore(Mary) > avgScore(Mike)) && (avgScore(Mary) > avgScore(John))){
        var team = document.getElementById('ch2');
        team.innerHTML = "Mary is winner and his score is " + avgScore(Mary);
    }
    else  if((avgScore(Mike) > avgScore(Mary)) && (avgScore(Mike) > avgScore(John))){
        var team = document.getElementById('ch2');
        team.innerHTML = "Mike is winner and his score is " + avgScore(Mike);
    }
    else if(avgScore(John) == avgScore(Mike)){
        var team = document.getElementById('ch2');
        team.innerHTML = "John and Mike both are winner and their score is " + avgScore(John);
    }
    else if(avgScore(John) == avgScore(Mary)){
        var team = document.getElementById('ch2');
        team.innerHTML = "John and Mary both are winner and their score is " + avgScore(John);
    }
    else{
        var team = document.getElementById('ch2');
        team.innerHTML = "Mary and Mike both are winner and their score is " + avgScore(Mary);
    }
*/











/******************************
 * CODING CHALLENGE 3
 */

 var code = document.getElementById('cd2');
    code.innerHTML = "Coding Challenge 3";

    var bill = [124, 48, 268];
    var tips = [];
    var billTip = [];
    var tip = 0;

    function tipCalcy(x){
        if(x < 50){
            tip = 0.2;
            return tip;
        }
        if(x > 50 && x < 200){
            tip = 0.15;
            return tip;
        }
        if(x > 200){
            tip = 0.1;
            return tip;
        }
    }

    for(let i =0; i < bill.length; i++){
        let bil = bill[i];
        tips[i] = tipCalcy(bil) * bill[i];
        billTip[i] = bill[i] + tips[i];
    }

    var payBill = document.getElementById('ch2');
    payBill.innerHTML = "You have to pay bills " + bill + `<br>` + 
                        " You have to pay tips from your calculator is " + tips + `<br>` +
                        "Now You have to pay total bill respectivaly is " + billTip;

    console.log(tips);
    console.log(billTip);

