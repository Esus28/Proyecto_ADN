 
        var AND = L.icon({
            iconUrl: 'static/images/dron.png', 
            iconSize: [32, 32],             
            iconAnchor: [16, 32],            
            popupAnchor: [0, -32]         
          });
        
          // Crear el marcador del punto de salida
          var marcador1 = L.marker([19.7887059, -99.8736229], { icon: AND }).addTo(map)
            .bindPopup("<b>Agroquímicos del Norte-Sede-Atlacomulco.</b>");
        
          // Recoger los datos de los clientes (punto de llegada)
          const clientes = JSON.parse('{{ datos_clientes_json | tojson }}');
          
          // Inicializar el marcador del cliente (punto de llegada)
          var lat = parseFloat(clientes[0].latitud);  // Usamos el primer cliente como ejemplo
          var lon = parseFloat(clientes[0].longitud);
          
          var iconUrl = 'static/images/cliente.png';  
        
          // Crear el marcador del punto de llegada
          var marker = L.marker([lat, lon], {
            icon: L.icon({
              iconUrl: iconUrl,  
              iconSize: [30, 30],  
              iconAnchor: [15, 30], 
              popupAnchor: [0, -30] 
            })
          }).addTo(map);
        
          // Bind popup con el nombre del cliente
          marker.bindPopup("<b>Cliente: " + clientes[0].nombre + "</b><br>Latitud: " + lat + "<br>Longitud: " + lon);

var url = `https://router.project-osrm.org/route/v1/driving/${marcador1.getLatLng().lng},${marcador1.getLatLng().lat};${lon},${lat}?overview=full&steps=true`;

  // Realizar la solicitud a la API de OSRM
  fetch(url)
    .then(response => response.json())
    .then(data => {
      // Comprobar si la API devuelve una ruta
      if (data.routes && data.routes.length > 0) {
        var route = data.routes[0].geometry.coordinates;

        // Convertir las coordenadas de la ruta en formato adecuado para Leaflet
        var routeLatLngs = route.map(function(coord) {
          return [coord[1], coord[0]]; // Invertir las coordenadas (lat, lon) -> (lat, lon)
        });

        // Crear la polilínea de la ruta
        var polyline = L.polyline(routeLatLngs, { color: 'blue', weight: 4, opacity: 0.7 }).addTo(map);
        
        // Ajustar la vista del mapa para mostrar la ruta completa
        map.fitBounds(polyline.getBounds());
      } else {
        console.error("No se pudo calcular la ruta.");
      }
    })
    .catch(error => console.error("Error al calcular la ruta:", error));