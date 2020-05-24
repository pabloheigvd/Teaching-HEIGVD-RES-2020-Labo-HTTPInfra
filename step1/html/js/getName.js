// début du bloc JQuery
$(() => {
  function getPerson() {
    // on veut récuperer nos personnes (au format JSON) à l'URL /persons/
    $.getJSON("/persons/", function(response) {
        console.log(response);
        let value = "Johne Does";

        if (response.length > 0){
          value = `${response[0].fname} ${response[0].lname}`;
        }
        // Ici on va altérer l'éléments de notre DOM qui possède la class person
        $( ".person" ).text(value);
    });

  }
  // on va ré-éxécuter notre fonction toute les 2 secondes 
  setInterval(getPerson,2000);
});
