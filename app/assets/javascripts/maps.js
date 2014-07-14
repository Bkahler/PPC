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

        _.each(data.parcels,function(item){
          parcels.push(item.geojson);
        });

        _.each(data.streets,function(item){

          streets.push(item.geojson);
        });

        parcelLayer = L.geoJson(parcels, {style: function(feature) { return feature.properties; } });

        steeetLayer = L.geoJson(streets);
        parcelLayer.addTo(map);

      }); //end of ajax call
    } //end of initialize_map


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



