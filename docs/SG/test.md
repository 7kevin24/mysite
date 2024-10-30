<div id="map" style="width: 100%; height: 500px;"></div>
<button id="toggleClick">Enable Click to Add Marker</button>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Initialize the map
    var map = L.map('map').setView([51.505, -0.09], 2);

    // Add OpenStreetMap tiles
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    var clickEnabled = false; // Tracks if clicking is enabled

    // Function to handle map click events
    function onMapClick(e) {
      console.log('Map clicked!'); // Debugging log
      console.log('Coordinates: ', e.latlng); // Log coordinates when clicked

      // Create a new marker at the clicked location
      L.marker([e.latlng.lat, e.latlng.lng]).addTo(map)
        .bindPopup(`Coordinates: ${e.latlng.lat.toFixed(5)}, ${e.latlng.lng.toFixed(5)}`)
        .openPopup();
    }

    // Function to toggle the click event on/off
    function toggleClickEvent() {
      clickEnabled = !clickEnabled;

      if (clickEnabled) {
        console.log('Click-to-add-marker enabled');
        map.on('click', onMapClick); // Enable click event
        document.getElementById('toggleClick').textContent = "Disable Click to Add Marker";
      } else {
        console.log('Click-to-add-marker disabled');
        map.off('click', onMapClick); // Disable click event
        document.getElementById('toggleClick').textContent = "Enable Click to Add Marker";
      }
    }

    // Add event listener to the toggle button
    document.getElementById('toggleClick').addEventListener('click', toggleClickEvent);
  });
</script>

<iframe src="http://priler.github.io/dino3d/low.html" width="100%" height="600" frameborder="0" allowfullscreen></iframe>

<iframe src="https://trinket.io/embed/python/40aaf904d260" width="100%" height="600" frameborder="0" marginwidth="0" marginheight="0" allowfullscreen></iframe>

<iframe src="https://www.geogebra.org/classic?embed" width="800" height="600"></iframe>


<script>
fetch('https://official-joke-api.appspot.com/jokes/random')
  .then(response => response.json())
  .then(data => {
    document.getElementById('joke').innerHTML = data.setup + " - " + data.punchline;
  });
</script>
<div id="joke"></div>

<script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.9.3/dist/confetti.browser.min.js"></script>

<script>
  function randomInRange(min, max) {
  return Math.random() * (max - min) + min;
}

function fire(particleRatio, opts) {
  confetti(Object.assign({}, {
    spread: 26,
    startVelocity: 55,
  }, opts, {
    particleCount: Math.floor(particleRatio * 250)
  }));
}
</script>

<script>
var duration = 15 * 1000;
var animationEnd = Date.now() + duration;
var skew = 1;

function randomInRange(min, max) {
  return Math.random() * (max - min) + min;
}

(function frame() {
  var timeLeft = animationEnd - Date.now();
  var ticks = Math.max(200, 500 * (timeLeft / duration));
  skew = Math.max(0.8, skew - 0.001);

  confetti({
    particleCount: 1,
    startVelocity: 0,
    ticks: ticks,
    origin: {
      x: Math.random(),
      // since particles fall down, skew start toward the top
      y: (Math.random() * skew) - 0.2
    },
    colors: ['#ffffff'],
    shapes: ['circle'],
    gravity: randomInRange(0.4, 0.6),
    scalar: randomInRange(0.4, 1),
    drift: randomInRange(-0.4, 0.4)
  });

  if (timeLeft > 0) {
    requestAnimationFrame(frame);
  }
}());
</script>


