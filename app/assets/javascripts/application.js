// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize-sprockets
//= require jquery_ujs
//= require Underscore
//= require gmaps/google
//= require turbolinks
//= require_tree .

function gmap_show(user) {
  if ((user.lat === null) || user.lng === null) ) { // validation check if coordinates are there
     return 0; 
  }

  handler = Gmaps.build('Google'); // map  init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    markers = handler.addMarkers({ // put marker method
        {
          "lat": user.lat,  //coordinates from paramater user
          "lng": user.lng, 
          "picture": { //setup marker icon
          "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
          "width": 32, 
          "height": 32
        },
        "infowindow": "<b>" + user.name + "</b>" + user.address 

      }
    }); 
    handler.bounds.extendWith(markers); 
    handler.fitMapToBounds(); 
    handler.getMap().setZoom(12); // set the default zoom of the map
  });
}

function gmap_form(user) {
  handler = Gmaps.build('Google'); // map init
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    if (company && user.lat && user.lng) { // statement check - new or edit view 
      markers = handler.addMarkers([ // print existent marker 
        {
          "lat": user.lat, 
          "lng": user.lng, 
          "picuture": {
            "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
            "width": 32, 
            "height": 32
          },
          "infowindow": "<b>" + user.name + "</b>" + user.address
        }
      }); 
      handler.bounds.extendWith(markers); 
      handler.fitMapToBounds();
      handler.getMap().setZoom(6); 
    }
  });

  var makerOnMap; 

  function placeMarker(location) { // simply method to put new marker on map
    if (markerOnMap) {
      markerOnMap.setPosition(location); 
    }
    else {
      markerOnMap = new google.map.Marker({
        position: location, 
        map: handler.getMap()
      });
    }
  }

  google.maps.event.addListener(handler.getMap(), 'click', function(event) {
    placeMarker(event.latlng); 
    document.getElementById("map_lat").value = event.latlng.lat();
    document.getElementById("map_lng").value = event.latlng.lng();
  });
} 