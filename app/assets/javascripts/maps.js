$(".container.properties.show").ready(function(){
  // for isotope call and to allow see all page to appear
  // on pageload check to see if map div is on current page
  // if so initialize map into #map div

  var map = L.mapbox.map('map', 'examples.map-y7l23tes').setView([37.76, -122.5], 15);
  var parcels = [];
  var parcelLayer;
  var streets =[];

  if($('#map').length > 0){
    initialize_map();
  }

  $( "#toggleParcels" ).click(function() {
    removeParcel();
  });

  $( "#toggleSteets" ).click(function() {
    removeStreets();
  });



    function initialize_map(){
      $.get('/properties/'+gon.property_id+'.json').done(function(data){

        parcels.push(data.parcels.geojson);

        var text = "<h3> Property ID: " + data.parcels.id + "</h3>";

        _.each(data.streets,function(item){
          streets.push(item.geojson);
        });

        parcelLayer = L.geoJson(parcels,
          {style: function(feature) {return feature.properties;},
           onEachFeature:ohi
          });
        parcelLayer.bindPopup(text.toString());

        steetLayer = L.geoJson(streets);
        map.addLayer(parcelLayer);

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
      if (map.hasLayer(steetLayer)){
        map.removeLayer(steetLayer);
      } else{
        map.addLayer(steetLayer);
      }
    }


    function panMapToParcel(feature, layer) {
      map.panTo(layer._latlngs[0]);

      layer.on('click', function (e) {
        map.panTo(e.target._latlngs[0]);
      });
    }


});



