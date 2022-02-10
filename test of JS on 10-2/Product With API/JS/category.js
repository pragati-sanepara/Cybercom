// #region    ----- GLOBAL DECLARATION -----

const _baseURL = 'https://fakestoreapi.com/';//set base URL
var _tableBody;// store tableBody content

// #endregion    ----- GLOBAL DECLARATION -----

// handal API call

// GET request
const _getCategoryDetails = new Promise((resolve, reject) => {
    fetch(_baseURL + `products/categories`).then((response) => {
        // check if response object is not null/undefined
        if (response && response.status) {
            // handle different response code status scenirio
            if (response.status == 200) {
                resolve(response);
                console.log("sucessfully get all categories");
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

// list Products by GET method 
_getCategoryDetails
    .then((apiResponse) => apiResponse.json())
    .then((data) => { console.log(data);
        intializeTable(); // clear table content before binding to avoid data overwritten issue
        data.forEach(prepareCategorysTableView); // bind table data
    });

// view all product for specific category
function viewProducts(category) {
    //store the category name
    sessionStorage.setItem("categoryName", category);
    //redirect to view product table
    window.open("./viewProduct.html", "_self");
}

// #region  ----- TABLE MODIFICATION -----

function intializeTable() {
    _tableBody = document.getElementById('categoryTable');
    _tableBody.innerHTML = '';
}

function prepareCategorysTableView(item) {
    let tr = document.createElement('tr');

    let nameRow = document.createElement('td');
    nameRow.appendChild(document.createTextNode(item));
    tr.appendChild(nameRow);

    let viewRow = document.createElement('td');
    viewRow.appendChild(
        createButtonElement(`View`, `btn btn-info`, viewProducts, item)
    );
    tr.appendChild(viewRow);

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