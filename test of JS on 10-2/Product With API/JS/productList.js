// http://localhost:3000/users

// #region    ----- GLOBAL DECLARATION -----

const _baseURL = 'https://fakestoreapi.com/'; //set base URL
var _tableBody; // store tableBody content

// #endregion    ----- GLOBAL DECLARATION -----

// handal API call

// GET request to get all product
const _getProductDetails = new Promise((resolve, reject) => {
    fetch(_baseURL + `products`).then((response) => {

        if (response && response.status) {
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

// DELETE method to delete product from API
function deleteProductDetail(id) {

    const _deleteProductDeatils = new Promise((resolve, reject) => {
        fetch(_baseURL + `products/${id}`, {
            // Adding method type
            method: "DELETE",

            // Adding headers to the request
            headers: {
                "Content-type": "application/json; charset=UTF-8",
                'Accept': 'application/json'
            }
        })
            .then((response) => {
                // check if response object is not null/undefined
                if (response && response.status) {

                    // handle different response code status scenirio
                    if (response.status == 200) {
                        resolve(response);
                        alert("sucessfully deleted");
                        return true;
                    } else {
                        throw ('invalid request!');
                    }
                } else {
                    // throw an error or display the error message on toaster.
                    throw ('invalid request!');
                }
            });
        alert("delete product...........")
    });
}

// #region  ----- CRUD OPARATION -----

// list Products by GET method 
_getProductDetails
    .then((apiResponse) => apiResponse.json())
    .then((data) => {
        intializeTable(); // clear table content before binding to avoid data overwritten issue
        data.forEach(prepareProductsTableView); // bind table data
    });

// edit product
function editProduct(productId) {
    //store id
    sessionStorage.setItem("id", productId);

    //once clicked on edit button redirect to add product page
    window.open("./addproduct.html", "_self");
}

// delete delete product
function deleteProduct(productId) {
    // conformation for delete product
    var con = confirm(`are you sure to delete ${productId} this id's product`);

    // check confim or not
    if (con == true) {
        // call function to delete the product
        deleteProductDetail(productId);
    }
}

// #endregion  ----- CRUD OPARATION -----

// #region  ----- TABLE MODIFICATION -----

function intializeTable() {
    _tableBody = document.getElementById('ProductsTable');
    _tableBody.innerHTML = '';
}

function prepareProductsTableView(item) {
    let tr = document.createElement('tr');

    let imageRow = document.createElement('td');
    imageRow.appendChild(document.createTextNode(item.image));
    tr.appendChild(imageRow);

    let titleRow = document.createElement('td');
    titleRow.appendChild(document.createTextNode(item.title));
    tr.appendChild(titleRow);

    let categoryRow = document.createElement('td');
    categoryRow.appendChild(document.createTextNode(item.category));
    tr.appendChild(categoryRow);

    let priceRow = document.createElement('td');
    priceRow.appendChild(document.createTextNode(item.price));
    tr.appendChild(priceRow);

    let actionRow = document.createElement('td');
    actionRow.appendChild(
        createButtonElement(`edit`, `btn btn-info`, editProduct, item.id)
    );
    actionRow.appendChild(
        createButtonElement(`delete`, `btn btn-danger`, deleteProduct, item.id)
    );
    tr.appendChild(actionRow);

    _tableBody.appendChild(tr);
}

// #endregion  ----- TABLE MODIFICATION -----

// #region  ----- GENERAL METHODS --------
function createButtonElement(
    buttonText,
    cssClassName,
    buttonClickFuction,
    funcArgument
) {
    let buttonElement = document.createElement('button');
    buttonElement.innerHTML = buttonText;
    buttonElement.className = cssClassName;
    buttonElement.addEventListener('click', () => {
        buttonClickFuction(funcArgument);
    });
    return buttonElement;
}

// #endregion  ----- GENERAL METHODS --------

// #region  ------ SORT PRODUCTS -------- 

//products sort in ascending order  
function sortAscProducts() {
    const _getAsc = new Promise((resolve, reject) => {

        fetch(_baseURL + `products?sort=asc`).then((response) => {
            // check if response object is not null/undefined
            if (response && response.status) {

                // handle different response code status scenirio
                if (response.status == 200) {
                    resolve(response);
                    console.log("sucessfully sorted in ascending order");
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
    _getAsc
        .then((apiResponse) => apiResponse.json())
        .then((data) => {
            console.log(data);
            intializeTable(); // clear table content before binding to avoid data overwritten issue
            data.forEach(preparePostsTableView); // bind table data
        });
}

//products sort in descending order  
function sortDescProducts() {

    const _getDesc = new Promise((resolve, reject) => {
        fetch(_baseURL + `products?sort=desc`)
            .then((response) => {
                // check if response object is not null/undefined
                if (response && response.status) {

                    // handle different response code status scenirio
                    if (response.status == 200) {
                        resolve(response);
                        console.log("sucessfully sorted in descending order");
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
    _getDesc
        .then((apiResponse) => apiResponse.json())
        .then((data) => {
            console.log(data);
            intializeTable(); // clear table content before binding to avoid data overwritten issue
            data.forEach(preparePostsTableView); // bind table data
        });
}

//variable used in call function vice versa
var callOne = true;

//function for call asc and desc function vice versa
function sortProducts() {
    //check callone is true then call for asc order
    if (callOne) sortAscProducts();
    // callone is false then call for desc order
    else sortDescProducts();
    //once any function call, it will change the value of callone variable 
    callOne = !callOne;
}

// #endregion  ------ SORT PRODUCTS -------- 
