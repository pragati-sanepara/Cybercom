let binarySearch = function (arr, x) {
  
    let l=0, r=arr.length-1;
         
    while (l<=r){
 
        let mid=Math.round((l + r)/2);
        if (arr[mid]===x) 
            return true;
        else if (arr[mid] < x)
             l = mid + 1;
        else
             r = mid - 1;
    }
  
    return false;
}
  
let arr = [1, 3, 5, 6, 7, 8, 8, 8, 13];
let x = 15;
  
if (binarySearch(arr, x, 0, arr.length-1))
{
    let index = arr.findIndex( ele => ele == x);
    let j = index;
    let l = index;
    while(j < arr.length){
        if((arr[j+1]) == (arr[index])){
            l = j+1;
            j++;
        }
        else{j++;}
    }

    console.log([index, l]);
}
else console.log([-1, -1]);
  
// x = 8;
  
// if (binarySearch(arr, x, 0, arr.length-1))
// console.log(mid);

// else console.log('[-1, -1]');

// const readline = require('readline');
// const r1 = readline.createInterface({input: process.stdin,
//     output: process.stdout});

// const ps = require("prompt");
// ps.start();

// let array = [];
// ps.get([`size`, `array[i]`], function(num, ele){
//     console.log(`Command-line input received:`)
//     console.log(`no of element :`, size.num);
//     for(let i = 0; i<= num; i++){
//         console.log(res.array[i]);
//     }
//   })

// r1.question(`no of element in arary ? :`,  (userInput)=>{
//     console.log(userInput);
//     r1.close();
// });

// r1.question(`element ? :`,  (userInput)=>{
//     for(let i =0; i<= userInput; i++){
//         let ele = r1.question(`ele ?`, (userInput)=>{console.log(userInput); r1.close;});

//         array[i] = ele;
//         console.log(array[i])
//     }
//     r1.close();
// });

