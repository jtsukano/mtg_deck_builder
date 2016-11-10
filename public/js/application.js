$(document).ready(function(){
  mapboxgl.accessToken = 'pk.eyJ1Ijoia2luZ2JhcnV0YW4iLCJhIjoiY2l2N2V6NjhiMDAwZzJ0bTh0MTAyemd2aSJ9.p0Bd1_I8cUYWmAp7TQjtWQ';
  var map = new mapboxgl.Map({
      container: 'map', // container id
      style: 'mapbox://styles/mapbox/light-v9', //stylesheet location
      center: [-122.397463, 37.784596], // starting position
      zoom: 15 // starting zoom
  });
});
