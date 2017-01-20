// This example creates circles on the map, representing populations in North
// America.
function initMap() {

    var myCenter = new google.maps.LatLng($("#endereco_latitude").val(), $("#endereco_longitude").val());

    var mapProp = {
        center: myCenter,
        zoom: 20,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("map"), mapProp);

    var marker = new google.maps.Marker({
        position: myCenter,
    });

    marker.setMap(map);

}