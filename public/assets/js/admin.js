function addOnChangeListenerToCells() {
    let cells = document.getElementsByTagName("td");
    //console.log("________", cells);
    let dest = document.getElementById("resultat");
    //console.log("________", dest);
    for (let i = 0; i < cells.length; i++) {
        let changeDetected = false;
        cells[i].addEventListener("input", () => {
            changeDetected = true;
            //console.log("__change detected____");
        });

        cells[i].addEventListener("focusout", () => {
            let path = cells[i].id;
            let chars = path.split('-');
            let id = chars[1];
            console.log(id)
            let column = chars[0];
            dest.innerText = "id[" + id + "] column[" + column + "] value[" + cells[i].innerText + "]";
            if (changeDetected) {
                console.log("__change detected and value updated____");
                changeDetected = false;
                updateDataToDb("/Administration/updateDataBySrcAjax", id, column, cells[i].innerText);

            }
        });
    }
}


function btnDeletePartsManagement() {

    var params = "";
    let idKeepers = document.getElementsByName("idKeeper");
    idKeepers.forEach(function (idkeeper) {
        let id = idkeeper.value;
        console.log("id : ", id);
        var http = new XMLHttpRequest();
        http.open('POST', "/Administration/isDeletablePart/" + id, true);
        http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        http.onreadystatechange = function () {//Call a function when the state changes.
            if (http.readyState == 4 && http.status == 200) {
                returnValue = http.responseText;
                //console.log("Return value avant fin du  tratement : ", returnValue);
                if (returnValue == "true") {
                    let btnKeeper = document.getElementById("btnDeletePart" + id);
                    btnKeeper.setAttribute('disabled', "disabled");
                    btnKeeper.setAttribute('class', "gc-btn-delete-disabled");
                    console.log(btnKeeper);
                }
            }
        }
        http.send(params);
    });
}

function addListenerToUploadButton() {
    // recuperer tous les objets modal
    const modals = document.getElementsByName("gc-modal-part");
    console.log("modals ------",modals);
    // pour chaque modal  ajouter un listener qui affiche le modal  avec le bon id

    modals.forEach( (item) =>{
        const destImg = item.querySelector("#gc-modal-part-visual-new");
        console.log("destImg ------", destImg);
        const imgFile = item.querySelector("#imgFile");
        console.log("imgFile ------", imgFile);

        imgFile.addEventListener("change", (e) => {
            const file = imgFile.files[0];
            const src = (window.URL || window.webkitURL).createObjectURL(file);
            destImg.src = src;
        });
    });



}


function updateDataToDb(url, id, column, value) {
    var http = new XMLHttpRequest();

    var params = "id=" + id + "&column=" + column + "&value=" + value;
    var url2 = url + params;
    http.open('POST', url, true);

//Send the proper header information along with the request
    http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    http.onreadystatechange = function () {//Call a function when the state changes.
        if (http.readyState == 4 && http.status == 200) {
            // todo traitement du code retour du  serveur ==> contenue dans  http.responseText;
        }
    }
    http.send(params);
    // http.send(params);
}


function controlIsPartDeletable(url) {
    var http = new XMLHttpRequest();
    var params = "";
    http.open('POST', url, true);
    let returnValue = null;
//Send the proper header information along with the request
    http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    http.onreadystatechange = function () {//Call a function when the state changes.
        if (http.readyState == 4 && http.status == 200) {
            returnValue = http.responseText;
            console.log("Return value avant fin du  tratement : ", returnValue);
            return returnValue;
            // todo traitement du code retour du  serveur ==> contenue dans  http.responseText;
        }
    }
    http.send(params);


}




