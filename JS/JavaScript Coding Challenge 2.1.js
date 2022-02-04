/*************************
 * Write a JavaScript program to display the reading status (i.e. display book name, author name and reading status) of the following books.
 */
//array
var library = [
    {
        author: 'Bill Gates',
        title: 'The Road Ahead',
        readingStatus: true
    },
    {
        author: 'Steve Jobs',
        title: 'Walter Isaacson',
        readingStatus: true
    },
    {
        author: 'Suzanne Collins',
        title: 'Mockingjay: The Final Book of The Hunger Games',
        readingStatus: false
    }];

// read input from user
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

rl.question("What is book name? ", function (answer) {
    // to check book is available in library
    var id = library.findIndex((e) => e.title == `${answer}`);
    // if not
    if (id == -1) {
        console.log(`There is no book of ${answer} name.`);
        rl.close();
    }
    // if it is.
    else {
        console.log("Book Name: " + `${answer}`);
        console.log("Book Status : " + library[id].readingStatus);
        rl.close();
    }
});




/*********************************
* Write a JavaScript function to retrieve all the values of an object's properties. 
*/
// object 
let person = {
    0: {
        firstName: "John",
        lastName: "Doe",
        age: 50,
        eyeColor: "blue"
    },
    1: {
        firstName: "Mary",
        lastName: "Gold",
        age: 520,
        eyeColor: "gray"
    }
};
//function for getvalues of each properties of object
function getValue() {
    //convert object to array because find the length of object
    var personArr = Object.entries(person);
    let i = 0, firstName = "", lastName = "", age = "", eyeColor = "";
    // loop for get one property's multiple values
    while (i < personArr.length) {
        firstName += person[i].firstName + " ";
        lastName += person[i].lastName + " ";
        age += person[i].age + " ";
        eyeColor += person[i].eyeColor + " ";
        i++;
    }
    //print properties with all values
    console.log("properties : values");
    console.log(`firstName : ${firstName}`);
    console.log(`lastName : ${lastName}`);
    console.log(`age : ${age}`);
    console.log(`eyeColor : ${eyeColor}`);
}
getValue();



/******************************
 * Write a JavaScript function to check whether an object contains given property
 */
//object
let person1 = {
    firstName: "John",
    lastName: "Smith",
    age: 20,
    eyeColor: "blue"
}
//read user input in console
const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

rl.question("Which property you want to check? ", function (answer) {
    //it return boolean value which indicates whether the object has the specified property or not
    var isExist = person1.hasOwnProperty(`${answer}`);
    console.log(isExist);
    rl.close();
});
