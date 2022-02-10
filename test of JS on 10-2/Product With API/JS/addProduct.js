// #region    ----- GLOBAL DECLARATION -----

const _baseURL = 'https://fakestoreapi.com/';//set base URL

// #endregion    ----- GLOBAL DECLARATION -----

// #region  ------- VALIDATION -------

//this function called when clicked on save button
function validationForm() {

    var Title = document.getElementById('title').value;
    var Price = document.getElementById('price').value;
    var Description = document.getElementById('des').value;
    var Category = document.getElementById('selectCategory').value;
    var UploadFile = document.getElementById('fileUpload').value;

    if (Title == "") {
        alert('Title field is empty!');
        Title.focus();
        return false;
    }
    //price is only in numaric value
    if (Price == "" || isNaN(Price)) {
        alert('Price field is empty! or Enter Numeric value only');
        Price.focus();
        return false;
    }
    if (Description == "") {
        alert('Description field is empty!');
        Description.focus();
        return false;
    }
    if (Category == "" || Category == 'Choose a category') {
        alert('Category field is empty!');
        Category.focus();
        return false;
    }
    if (UploadFile == "") {
        alert('UploadFile field is empty!');
        UploadFile.focus();
        return false;
    }
    // call function for add product details in API
    addProductDeatils();
}

// #endregion  ------- VALIDATION -------

// #region  -------- CRUD OPARATION --------

// handal API call

// GET method for get all categories in dropdown
const _getCategory = new Promise((resolve, reject) => {
    fetch(_baseURL + `products/categories`).then((response) => {
        // check if response object is not null/undefined
        if (response && response.status) {
            // handle different response code status scenirio
            if (response.status == 200) {
                resolve(response);
                console.log("sucessfully get");
                return true;
            }
            else {
                throw ('invalid request!');
            }
        }
        else {
            throw ('invalid request!');
        }
    });
});
_getCategory
    .then((apiResponse) => apiResponse.json())
    .then((data) => {
        let select = document.getElementById("selectCategory");
        //for loop for get all categories
        for (let i = 0; i < data.length; i++) {
            let categoryName = data[i];
            // create option for dropdown value
            let optionInDropDown = document.createElement("option");
            optionInDropDown.textContent = categoryName;
            optionInDropDown.value = categoryName;
            //append all categories
            select.appendChild(optionInDropDown);
        }
    });

// POST method for add product
function addProductDeatils() {
    var title = document.getElementById('title').value;
    var price = document.getElementById('price').value;
    var description = document.getElementById('des').value;
    var category = document.getElementById('selectCategory').value;
    var uploadFile = document.getElementById('fileUpload').value;

    const addProduct = new Promise((resolve, reject) => {

        fetch(_baseURL + `products`, {
            // Adding method type

            method: "POST",

            // Adding body or contents to send
            body: JSON.stringify({
                title: title,
                price: price,
                description: description,
                image: uploadFile,
                category: category
            }),

            // Adding headers to the request
            headers: {
                "Content-type": "application/json; charset=UTF-8",
                'Accept': 'application/json'
            }
        }).then((response) => {
            // check if response object is not null/undefined
            if (response && response.status) {
                // handle different response code status scenirio
                if (response.status == 200) {
                    resolve(response);
                    console.log("sucessfully add");
                    return true;
                } else {
                    throw ('invalid request!');
                }
            } else {
                throw ('invalid request!');
            }
        });
        alert("addind product...")
    });
}

// PUT method for edit product details
function editProductDetail(id) {
    var title = document.getElementById('title').value;
    var price = document.getElementById('price').value;
    var description = document.getElementById('des').value;
    var category = document.getElementById('selectCategory').value;
    var uploadFile = document.getElementById('fileUpload').value;
    // check price is numeric or not
    if (isNaN(price)) {
        alert("Enter numeric value only!");
        return false;
    }
    //check any field is not empty
    if (!title || !price || !description || !category || !uploadFile || (category == 'Choose a category')) {
        alert("field is empty!");
        return false;
    }
    //if fields are not not empty and valid information contain
    else {
        const _editUserDeatils = new Promise((resolve, reject) => {

            fetch(_baseURL + `products/${id}`, {

                // Adding method type
                method: "PUT",

                // Adding body or contents to send
                body: JSON.stringify({
                    title: title,
                    price: price,
                    description: description,
                    image: uploadFile,
                    category: category
                }),

                // Adding headers to the request
                headers: {
                    "Content-type": "application/json; charset=UTF-8",
                    'Accept': 'application/json'
                }
            }).then((response) => {
                // check if response object is not null/undefined
                if (response && response.status) {

                    // handle different response code status scenirio
                    if (response.status == 200) {
                        resolve(response);
                        alert("sucessfully edit");
                        return true;
                    } else {
                        throw alert('invalid request!');
                    }
                } else {
                    throw alert('invalid request!');
                }
            });
            alert("editing product.......")
        });
    }
}

// #endregion  -------- CRUD OPARATION --------

// store id for get all details of product, which is you want to edit 
var id = sessionStorage.getItem("id");

// check id
if (id != null) {
    //call function for get deatils in form
    editProduct(id);

    //add button display none 
    document.getElementById('add').style.display = 'none';

    //show update button
    let updateBtn = document.getElementById("update")
    updateBtn.removeAttribute('hidden');

    //click on update button edit product
    updateBtn.addEventListener("click", function (e) {
        //call function for edit product details by API
        editProductDetail(id);
    });

    //Once produt updated storage clear
    sessionStorage.clear();

    // function for redirect all specific product details in form
    async function editProduct(id) {
        //get product details by id
        const reqUrl = await fetch(_baseURL + `products/${id}`);
        //convert data into json
        var jsonData = await reqUrl.json();

        document.getElementById('title').value = jsonData.title;
        document.getElementById('price').value = jsonData.price;
        document.getElementById('des').value = jsonData.description;
        document.getElementById('selectCategory').value = jsonData.category;
        document.getElementById('fileUpload').file = jsonData.image;
    }
}