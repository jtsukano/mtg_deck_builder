$(document).ready(function(){
  // mapbox access token
  mapboxgl.accessToken = 'pk.eyJ1Ijoia2luZ2JhcnV0YW4iLCJhIjoiY2l2N2V6NjhiMDAwZzJ0bTh0MTAyemd2aSJ9.p0Bd1_I8cUYWmAp7TQjtWQ';
  // creating new instance of map to be displayed
  var map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/light-v9',
      center: [-122.397463  , 37.784596],
      zoom: 13
  });

  // add search bar for map
  map.addControl(new mapboxgl.Geocoder());
  // add location pointers on the map
  map.point
});
