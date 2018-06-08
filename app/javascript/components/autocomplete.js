function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    const mealsAddress = document.getElementById('input');

    if (mealsAddress) {
      var autocomplete = new google.maps.places.Autocomplete(mealsAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(mealsAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
