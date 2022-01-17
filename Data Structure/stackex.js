const { Console, trace } = require('console');
const fs = require('fs');
let text = fs.readFileSync("tastdata.html", "utf-8");

var array1 = text.split('<');
console.log(array1);



let tagarr = [];
// console.log(array1);
console.log(array1[1][array1[1].length - 1]);
for (let i = 0; i < array1.length; i++) {
    if ((array1[i][array1[i].length - 1] == '>') || (array1[i][array1[i].length - 3] == '>')) {
        tagarr.push(array1[i]);
    }
}
console.log(tagarr);


let items = [];
for (let i = 0; i < tagarr.length; i++) {
    if ((tagarr[i][0] != '/') && ((tagarr[i][tagarr[i].length - 3] == '>') || (tagarr[i][tagarr[i].length - 1] == '>'))) {
        // push element into the items
        items.push(tagarr[i]);
    }
}
console.log(items);

let enditems=[];
for(let k=0;k<tagarr.length;k++){
    console.log(tagarr[k][0]);
}
for (let i = 0; i < tagarr.length; i++) {

    if ((tagarr[i][0] == '/') || (tagarr[i] == "br>\r\n")) {
        let taggg1 = tagarr[i];
        var tag2 = taggg1.split('/');
        // console.log(taggg1);
        for (let j = -1; j <= items.length; j++) {
            // console.log(2222222);

            if ((items[j] == tag2[0]) || (items[j] == tag2[1])) {
                // console.log(111);

                items.pop(items[j]);
            }
        }
    }
}
console.log(items);

if (items == null) {
    console.log("your code structure is ready");
}
else {
    console.log('your code structure is not ready');
}



