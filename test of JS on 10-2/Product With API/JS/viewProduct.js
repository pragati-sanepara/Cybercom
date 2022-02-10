// #region    ----- GLOBAL DECLARATION -----

const _baseURL = 'https://fakestoreapi.com/';//set base URL
var _tableBody;// store tableBody content
var _categoryName = sessionStorage.getItem("categoryName"); // store category name

// #endregion    ----- GLOBAL DECLARATION -----

//check category name if not then redirect to category page
if (!_categoryName) {
    window.open("./category.html", "_self");
}

// check category is not null
if (_categoryName != null) {

    // handal API call

    // GET request
    const _getProductDetails = new Promise((resolve, reject) => {
        fetch(_baseURL + `products/category/${_categoryName}`).then((response) => {
            // check if response object is not null/undefined
            if (response && response.status) {
                // handle different response code status scenirio
                if (response.status == 200) {
                    resolve(response);
                    console.log("sucessfully get all product");
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
    // sessionstorage clear
    sessionStorage.clear();

    // list Products by GET method in table
    _getProductDetails
        .then((apiResponse) => apiResponse.json())
        .then((data) => {
            intializeTable(); // clear table content before binding to avoid data overwritten issue
            data.forEach(prepareProductTableView); // bind table data
        });

    // #region  ----- TABLE MODIFICATION -----

    function intializeTable() {
        _tableBody = document.getElementById('ProductsTable');
        _tableBody.innerHTML = '';
    }

    function prepareProductTableView(item) {
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

        _tableBody.appendChild(tr);
    }

    // #endregion  ----- TABLE MODIFICATION -----
}