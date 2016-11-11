$(document).ready(function(){

  // mapbox access token
  mapboxgl.accessToken = 'pk.eyJ1Ijoia2luZ2JhcnV0YW4iLCJhIjoiY2l2N2V6NjhiMDAwZzJ0bTh0MTAyemd2aSJ9.p0Bd1_I8cUYWmAp7TQjtWQ';

  // creating new instance of map to be displayed
  var map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/light-v9',
      center: [-122.397463  , 37.784596],
      zoom: 15
  });

  // add search bar for map
  // map.addControl(new mapboxgl.Geocoder());

  // mapboxgl.marker([-122.397463, 37.784596]).addTo(map);

  var geocoder = new mapboxgl.Geocoder({
    container: 'geocoder-container' // Optional. Specify a unique container for the control to be added to.
  });

  map.addControl(geocoder);

  map.on('load', function() {
      map.addSource('single-point', {
          "type": "geojson",
          "data": {
              "type": "FeatureCollection",
              "features": []
          }
      });

      map.addLayer({
          "id": "point",
          "source": "single-point",
          "type": "circle",
          "paint": {
              "circle-radius": 10,
              "circle-color": "#007cbf"
          }
      });

      // Listen for the `geocoder.input` event that is triggered when a user
      // makes a selection and add a symbol that matches the result.
      geocoder.on('result', function(ev) {
          map.getSource('single-point').setData(ev.result.geometry);
      });
  });
// add location pointers on the map
// L.marker([-122.397463  , 37.784596], {
//   icon: L.mapbox.marker.icon({
//       'marker-size': 'large',
//       'marker-symbol': 'bus',
//       'marker-color': '#fa0'
//   })
// }).addTo(map);

});
