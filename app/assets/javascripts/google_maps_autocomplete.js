$(document).ready(function(){
  $('.datepicker').datepicker({
    todayHighlight: true,
    format: "yyyy-mm-dd"
  });

  var offer_address = $('#offer_address').get(0);

  if (offer_address) {
    var autocomplete = new google.maps.places.Autocomplete(offer_address, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(offer_address, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

var search_address = $('#offer_address').get(0);

function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  $('#offer_address').trigger('blur').val(components.address);
  $('#offer_zip_code').val(components.zip_code);
  $('#offer_city').val(components.city);
  if (components.country_code) {
    $('#offer_country').val(components.country_code);
  }
}

function getAddressComponents(place) {
  // If you want lat/lng, you can look at:
  // - place.geometry.location.lat()
  // - place.geometry.location.lng()

  var street_number = null;
  var route = null;
  var zip_code = null;
  var city = null;
  var country_code = null;
  for (var i in place.address_components) {
    var component = place.address_components[i];
    for (var j in component.types) {
      var type = component.types[j];
      if (type == 'street_number') {
        street_number = component.long_name;
      } else if (type == 'route') {
        route = component.long_name;
      } else if (type == 'postal_code') {
        zip_code = component.long_name;
      } else if (type == 'locality') {
        city = component.long_name;
      } else if (type == 'country') {
        country_code = component.short_name;
      }
    }
  }

  return {
    address: street_number == null ? route : (street_number + ' ' + route),
    zip_code: zip_code,
    city: city,
    country_code: country_code
  };
}
