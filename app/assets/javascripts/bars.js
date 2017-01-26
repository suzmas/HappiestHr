// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


function scrollListings() {
  var viewResults = $('#listings').offset(),
    destination = viewResults.top;
  $(document).scrollTop(destination);
}

function placeMakers(dataFromServer, markers) {
  console.log(dataFromServer);
  markers = handler.addMarkers(dataFromServer);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
}

function showLocations(dataFromServer) {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
        dataFromServer[dataFromServer.length] = {
        lat: position.coords.latitude,
        lng: position.coords.longitude,
        infowindow: "You!"
      };
      placeMakers(dataFromServer, markers);
    });
  } else {
    alert("Geolocation is not available");
    placeMakers(dataFromServer, markers)
  }
}

function createGmap(dataFromServer) {
  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: {},
    internal: {id: 'bar_map'}
  },
  function() {
    showLocations(dataFromServer);
    markers = handler.addMarkers(dataFromServer);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
};

function createGmaps(dataFromServer) {
  handler = Gmaps.build('Google');
  handler.buildMap({
    provider: {},
    internal: {id: 'bars_map'}
  },
  function() {
    showLocations(dataFromServer);
    markers = handler.addMarkers(dataFromServer);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  }
);
};

function loadAndCreateGmap() {
  if ($("#bar_map").length > 0) {
    var barId = $('#bar_map').attr('data-bar-id');

    $.ajax({
      dataType: 'json',
      url: '/bars/' + barId + '/map_location',
      method: 'GET',
      success: function(dataFromServer) {
        createGmap(dataFromServer);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

function loadAndCreateGmaps() {
  if ($("#bars_map").length > 0) {
    var myurl = "/bars/map_locations";
    if ($("#search").val()) {
        myurl += "?search=" + $("#search").val();
    };


    $.ajax({
      dataType: 'json',
      url: myurl,
      method: 'GET',
      success: function(dataFromServer) {
        createGmaps(dataFromServer);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

$(document).on('ready', loadAndCreateGmap);
$(document).on('turbolinks:load', loadAndCreateGmap);
$(document).on('ready', loadAndCreateGmaps);
$(document).on('turbolinks:load', loadAndCreateGmaps);
