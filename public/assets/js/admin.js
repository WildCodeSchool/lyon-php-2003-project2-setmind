
function addOnChangeListenerToCells(){
    let cells = document.getElementsByTagName("td");
    //console.log("________", cells);
    let dest = document.getElementById("resultat");
    //console.log("________", dest);
    for(let i = 0 ; i<cells.length;i++){
        let changeDetected = false;
        cells[i].addEventListener("input", () =>{
            changeDetected =true;
            //console.log("__change detected____");
        });

        cells[i].addEventListener("focusout", () =>{
            let path = cells[i].id;
            let chars = path.split('-');
            let id=chars[1] ;
            console.log(id)
            let column=chars[0];
            dest.innerText = "id[" + id + "] column[" + column + "] value[" + cells[i].innerText + "]";
            if(changeDetected){
                console.log("__change detected and value updated____");
                changeDetected=false;
                updateDataToDb("/Administration/updateDataBySrcAjax",id,column,cells[i].innerText);

            }
        });
    }

}



function updateDataToDb(url,id,column,value) {


    var http = new XMLHttpRequest();

    var params = "id=" +id + "&column=" + column + "&value=" + value;
    var url2 = url +params ;
    http.open('POST', url, true);

//Send the proper header information along with the request
    http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    http.onreadystatechange = function() {//Call a function when the state changes.
        if(http.readyState == 4 && http.status == 200) {
            // todo traitement du code retour du  serveur ==> contenue dans  http.responseText;
        }
    }
    http.send(params);
    // http.send(params);
}


