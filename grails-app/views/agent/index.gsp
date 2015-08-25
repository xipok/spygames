<!DOCTYPE html>
<html>
	<head>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.js"></script>
		<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/leaflet.css" />
        <meta name="layout" content="main"/>
		<title>Agents</title>
	</head>
	<body>
        <h1>Counter Agents at Large!</h1>
        <div id="map"></div>
        <script>
            var map = L.map('map').setView([38.548,-95.844], 6);
            L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
                attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
                maxZoom: 18,
                id: 'lundydr.n8og6jeh',
                accessToken: 'pk.eyJ1IjoibHVuZHlkciIsImEiOiI4NDkyYWQ3ZTIxODQxNDVmZWJhZWZkNzI1NmYyYzAwYiJ9.UYUHAMc-TKmemz2bDVjARw#3/50.18/-116.37'
            }).addTo(map);
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
                    L.marker([${agent.lat},${agent.lon}], {icon: spy}).addTo(map)
                }
                else {
                    L.marker([${agent.lat},${agent.lon}], {icon: femspy}).addTo(map)
                }
            </script>
            <h3>${i+1}. ${agent.name}</h3>
            <p>
                Age: ${agent.age}
            </p>
            <br/>
        </g:each>
	</body>
</html>