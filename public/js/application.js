$(document).ready(function() {
  // mapbox access token
  mapboxgl.accessToken = 'pk.eyJ1Ijoia2luZ2JhcnV0YW4iLCJhIjoiY2l2N2V6NjhiMDAwZzJ0bTh0MTAyemd2aSJ9.p0Bd1_I8cUYWmAp7TQjtWQ';
  // creating new instance of map to be displayed

    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
        console.log(pos)

      var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v9',
        center: [pos.lng  , pos.lat],
        zoom: 15
      });

      map.on('load', function () {
        map.addSource("points", {
            "type": "geojson",
            "data": {
                "type": "FeatureCollection",
                "features": [{
                    "type": "Feature",
                    "geometry": {
                        "type": "Point",
                        "coordinates": [pos.lng, pos.lat]
                    },
                    "properties": {
                        "title": "Mapbox DC",
                        "icon": "monument"
                    }
                }]
            }
        });

        map.addLayer({
            "id": "points",
            "type": "symbol",
            "source": "points",
            "layout": {
                "icon-image": "{icon}-15",
                "text-field": "{title}",
                "text-font": ["Open Sans Semibold", "Arial Unicode MS Bold"],
                "text-offset": [0, 0.6],
                "text-anchor": "top"
            }
        });
      });
    });
    }
      else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }

  var geocoder = new mapboxgl.Geocoder({
    container: 'geocoder-container' // Optional. Specify a unique container for the control to be added to.
  });
});
