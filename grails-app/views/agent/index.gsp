<!DOCTYPE html>
<html>
	<head>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.js"></script>
		<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.css" />
        <link rel="icon" type="image/png" href="https://s3-us-west-2.amazonaws.com/spygames/spy.png">
        <meta name="layout" content="main"/>
		<title>Spygames</title>
	</head>
	<body>
        <div id="toolbar">Counter Agents at Large:</div>
        <div id="map"></div>
        <script>
            var map = L.map('map').setView([38.548,-95.844], 5);
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
                attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
                maxZoom: 18,
                id: 'lundydr.n8og6jeh',
                accessToken: 'pk.eyJ1IjoibHVuZHlkciIsImEiOiI4NDkyYWQ3ZTIxODQxNDVmZWJhZWZkNzI1NmYyYzAwYiJ9.UYUHAMc-TKmemz2bDVjARw#3/50.18/-116.37'
            }).addTo(map);
            var markers = new L.FeatureGroup();
        </script>
        <g:each in="${agents}" var="agent" status="i">
            <script>
                var femspy = L.icon({
                    iconUrl: 'https://s3-us-west-2.amazonaws.com/spygames/femspy.png',
                    iconSize: [25,25]
                });
                var spy = L.icon({
                    iconUrl: 'https://s3-us-west-2.amazonaws.com/spygames/spy.png',
                    iconSize: [25,25]
                });
                if ('${agent.gender}' === 'Male') {
                    var m = L.marker([${agent.lat},${agent.lon}], {icon: spy});
                    m.bindPopup('<p>Name: ${agent.name}<br>Age: ${agent.age}</p>');
                    markers.addLayer(m);
                }
                else {
                    var m = L.marker([${agent.lat},${agent.lon}], {icon: femspy});
                    m.bindPopup('<p>Name: ${agent.name}<br>Age: ${agent.age}</p>');
                    markers.addLayer(m);
                }
                map.addLayer(markers);
            </script>
        </g:each>
        <div id="filter">
            <form><input type="text" name='agelimit' value='50'><input id='button' type="submit" value="Max Age"></form>
        </div>
        <script>
            $("#button").click(function(event) {
                event.preventDefault();
                map.removeLayer(markers);
                var limit = $('#filter form input').val();
                for (var agent in ${agents}) {
                    if (agent.gender === 'Male') && (agent.age <= limit) {
                        var m = L.marker([agent.lat,agent.lon], {icon: spy});
                        m.bindPopup('<p>Name: agent.name<br>Age: agent.age</p>');
                        markers.addLayer(m);
                    }
                    else if (agent.gender === 'Female') && (agent.age <= limit) {
                        var m = L.marker([agent.lat,agent.lon], {icon: femspy});
                        m.bindPopup('<p>Name: agent.name<br>Age: agent.age</p>');
                        markers.addLayer(m);
                    }
                }
                map.addLayer(markers)
            });
        </script>
	</body>
</html>