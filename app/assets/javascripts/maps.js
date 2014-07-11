$(".container.properties.show").ready(function(){
  // for isotope call and to allow see all page to appear
  // on pageload check to see if map div is on current page
  // if so initialize map into #map div
  if($('#map').length > 0){
    initialize_map();
  }
});


function initialize_map(){

  var map = L.mapbox.map('map', 'examples.map-y7l23tes').setView([37.76, -122.5], 15);
  var parcels = []

  $.get('/properties/'+gon.property_id+'.json').done(function(data){

    _.each(data,function(item){
      _.each(item.geojson.features,function(feature){
        if(feature.properties.GEO_ID == gon.property_id){
          parcels.push(feature);
        };
      })

    });
    L.geoJson(parcels).addTo(map);

  });
}