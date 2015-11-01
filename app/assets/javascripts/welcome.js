// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require javascript:navbar_scroll
//= require javascript:smoothscroll
//= require chosen_v1.4.2/chosen.jquery.min
//= require scrollReveal
//= require_self

var storeList = [], storeMap = {}, _map, _country, _city;

function setInitialLocation(country, city){
    _country = country;
    _city = city;
}

function setStoresToMap(stores) {
    storeList = stores;
}

function removeOldMarkers(){
    try {
        var keys = Object.keys(storeMap);
        for (var i = 0; i < keys.length; i++) {
            storeMap[keys[i]].setMap(null);
        }
        storeMap = {};
    } catch(err) {
        console.error(err);
    }
}

function loadMarkers(){
    console.log('loadMarkers');
    var bounds = new google.maps.LatLngBounds();
    var infoWindow = new google.maps.InfoWindow();
    for(var i=0; i < storeList.length; i++){
        var store = storeList[i];
        var showBalloon = function(storeId) {
            infoWindow.setContent($(".balloon-area[data-id='"+storeId+"']").html());
            infoWindow.open(_map, this);
        };

        storeMap[store.id] = new google.maps.Marker({
            position: {lat: store.latitude, lng: store.longitude},
            map: _map,
            title: store.brand.name
        });
        storeMap[store.id].setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png');
        storeMap[store.id].addListener('click', showBalloon.bind(storeMap[store.id], store.id));
        bounds.extend(new google.maps.LatLng(store.latitude, store.longitude));
    }

    _map.fitBounds(bounds);
}

function associateListToMap() {
    $(".store-area").mouseover(function(){
        storeMap[$(this).attr("data-id")].setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png');
    });
    $(".store-area").mouseout(function(){
        storeMap[$(this).attr("data-id")].setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png');
    });
}
function loadLocateMap() {
    console.log('loadLocateMap');
    $.get( "http://maps.google.com/maps/api/geocode/json?address="+_city+"+"+_country+"&sensor=false", function(location){
        var myLatlng = new google.maps.LatLng(48.8536450,2.3325860);
        if (location["results"]){
            var geo = location["results"][0];
            myLatlng = new google.maps.LatLng(geo["geometry"]["location"]["lat"], geo["geometry"]["location"]["lng"])
        }

        var myOptions = {
            zoom: 14,
            maxZoom: 16,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            styles: [{
                "featureType": "administrative",
                "elementType": "labels.text.fill",
                "stylers": [{"color": "#444444"}]
            }, {"featureType": "landscape", "elementType": "all", "stylers": [{"color": "#f2f2f2"}]}, {
                "featureType": "poi",
                "elementType": "all",
                "stylers": [{"visibility": "off"}]
            }, {
                "featureType": "road",
                "elementType": "all",
                "stylers": [{"saturation": -100}, {"lightness": 45}]
            }, {
                "featureType": "road.highway",
                "elementType": "all",
                "stylers": [{"visibility": "simplified"}]
            }, {
                "featureType": "road.arterial",
                "elementType": "labels.icon",
                "stylers": [{"visibility": "off"}]
            }, {
                "featureType": "transit",
                "elementType": "all",
                "stylers": [{"visibility": "off"}]
            }, {"featureType": "water", "elementType": "all", "stylers": [{"color": "#46bcec"}, {"visibility": "on"}]}]
        };
        _map = new google.maps.Map(document.getElementById('map'), myOptions);

        loadMarkers();
        associateListToMap();
    });
}

$(document).on("page:change",function(){
    $("select").chosen({allow_single_deselect: true});
    $('.toggle-text').click(function() {
        $(this).find('span').each(function() { $(this).toggle(); });
    });
});

