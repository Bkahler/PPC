$(".container.properties.show").ready(function(){
  // for isotope call and to allow see all page to appear
  // on pageload check to see if map div is on current page
  // if so initialize map into #map div
  // if($('#map').length > 0){
    initialize_map();
  // }
});


function initialize_map(){

  var map = L.mapbox.map('map', 'examples.map-y7l23tes').setView([37.7, -122.4], 1);

  $.get('/properties.json').done(function(data){

    _.each(data,function(item){

      if(item.id == gon.property_id){
        var thing = L.geoJson(item.geojson).addTo(map);
      }

    });
  });
}