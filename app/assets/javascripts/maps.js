$(".container.properties.show").ready(function(){
  // for isotope call and to allow see all page to appear
  // on pageload check to see if map div is on current page
  // if so initialize map into #map div

  if($('#map').length > 0){
    initialize_map();
  }

  $( "#toggleParcels" ).click(function() {
    removeParcel();
  });

  $( "#toggleSteets" ).click(function() {
    removeStreets();
  });




  var map = L.mapbox.map('map', 'examples.map-y7l23tes').setView([37.76, -122.5], 15);
  var parcels = [];
  var parcelLayer;
  var streets =[];

    function initialize_map(){
      $.get('/properties/'+gon.property_id+'.json').done(function(data){

        _.each(data,function(item){
          if(item.id == 64){
            _.each(item.geojson.features,function(feature){
              if(feature.properties.GEO_ID == gon.property_id){
                parcels.push(feature);
              }
            });
          }
          else if (item.id ==60){
            _.each(item.geojson.features,function(feature){
              // if(feature.properties.GEO_ID == gon.property_id){
              streets.push(feature);
              // }
            });
          }
        });
        parcelLayer = L.geoJson(parcels);
        steeetLayer = L.geoJson(streets);
        parcelLayer.addTo(map);
        steeetLayer.addTo(map);
      });
    }


    function removeParcel(){
      if (map.hasLayer(parcelLayer)) {
        map.removeLayer(parcelLayer);
      } else {
        map.addLayer(parcelLayer);
        }
    }


    function removeStreets(){
      if (map.hasLayer(steeetLayer)){
        map.removeLayer(steeetLayer);
      } else{
        map.addLayer(steeetLayer);
      }
    }


});



