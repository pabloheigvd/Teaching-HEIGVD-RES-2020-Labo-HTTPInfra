// test ajax request

$(() => {
  function getPerson() {
    $.getJSON("/persons/", function(response) {
        console.log(response);
        let value = "Johne Does";

        if (response.length > 0){
          value = `${response[0].fname} ${response[0].lname}`;
        }
        $( ".person" ).text(value);
    });

  }

   setInterval(getPerson,2000);
});
