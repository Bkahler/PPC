//JS for Main Map

$(".container.charts.index").ready(function(){

  var map = L.mapbox.map('map', 'examples.map-y7l23tes').setView([37.76, -122.5], 17);
  var parcels = [];
  var parcelLayer;
  var streets =[];

  if($('#map').length > 0){
    initialize_map();
  }


  function initialize_map(){
    $.get('/charts.json').done(function(data){

        _.each(data.parcels,function(item){
          parcels.push(item.geojson);
        });

        _.each(data.streets,function(item){
          streets.push(item.geojson);
        });

        parcelLayer = L.geoJson(parcels,
          {style: function(feature) {return feature.properties;}
          });

        for (var key in parcelLayer['_layers']){
          var text = "<h3> Property ID: " +parcelLayer['_layers'][key]['feature']['properties']['Prop_id']+ "</h3>";
          parcelLayer['_layers'][key].bindPopup(text.toString());
        }


        streetLayer = L.geoJson(streets);
        map.addLayer(parcelLayer);
        panMapToParcel(parcelLayer);
        // map.addLayer(streetLayer);

      }); //end of ajax call
    } //end of initialize_map

    function panMapToParcel(layer) {
      var first = Object.keys(layer['_layers'])[0];
      map.panTo(layer['_layers'][first]._latlngs[0]);
    }



});



// JS for individual maps

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
           onEachFeature:panMapToParcel
          });
        parcelLayer.bindPopup(text.toString());

        streetLayer = L.geoJson(streets);
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
      if (map.hasLayer(streetLayer)){
        map.removeLayer(streetLayer);
      } else{
        map.addLayer(streetLayer);
      }
    }


    function panMapToParcel(feature, layer) {
      map.panTo(layer._latlngs[0]);

      layer.on('click', function (e) {
        map.panTo(e.target._latlngs[0]);
      });
    }


});



