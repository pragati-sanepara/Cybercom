const jsonData= require('./test_data.json'); 

let myArray = jsonData;
// console.log(myArray);
let temp ='';
function getPath(eid){
    
    
    myArray.forEach((ele) => {
    if(ele['entity_id']==eid)
    {
        temp=ele['entity_id'] + "/" + temp;
        
        getPath(ele['parent_id']);
    }    
});
}

const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question("Enter Entity ID ? ", function(entityGetId) {
    getPath(entityGetId);
    console.log(temp);
    rl.close();
});
rl.on("close", function() {
    console.log("\n--------!!!");
    process.exit(0);
});

