document.addEventListener("DOMContentLoaded", function () {
    
  function show_coice_local_cinema(element) {
    
    const choice_local = element.getAttribute("name");
    const filteredArray = in_sssss.filter(item => item['로컬'] === choice_local);

    
    console.log(filteredArray);
    
  }
});

