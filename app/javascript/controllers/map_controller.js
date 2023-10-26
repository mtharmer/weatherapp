import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["map", "latitude", "longitude", "overlay"]

  connect() {
    if (typeof (google) != "undefined"){
      this.initializeMap()
    }
  }

  async initializeMap() {
    let map;
    if (this.hasMapTarget) {
      const { Map } = await google.maps.importLibrary("maps");
      const lat = parseFloat(this.mapTarget.dataset.lat);
      const lng = parseFloat(this.mapTarget.dataset.lng);
      map = new Map(this.mapTarget, {
        center: { lat: lat, lng: lng },
        zoom: 8,
      });
      this.mapTarget.gmap = map;
    }
    return map;
  }

  async overlayMap(event) {
    console.log(event.target);
    let map;
    if (this.hasMapTarget) {
      map = this.mapTarget.gmap;
      const { ImageMapType } = await google.maps.importLibrary("maps");
      const appid = this.mapTarget.dataset.appid;
      const mapType = event.target.dataset.overlay;
      const overlayMapType = new ImageMapType({
        getTileUrl: function (coord, zoom) {
          const normalizedCoord = getNormalizedCoord(coord, zoom);
          if (!normalizedCoord) {
            return '';
          }
          return ("https://tile.openweathermap.org/map/"
            + `${mapType}`
            + `/${zoom}`
            + `/${normalizedCoord.x}`
            + `/${(normalizedCoord.y)}`
            + `.png?appid=${appid}`
          );
        },
        tileSize: new google.maps.Size(256, 256),
        maxZoom: 9,
        minZoom: 0,
        name: `${mapType}`
      });
      console.log(map.overlayMapTypes);
      map.overlayMapTypes.setAt(0, overlayMapType);
      this.mapTarget.gmap = map;
    }
    return map;
  }
}
function getNormalizedCoord(coord, zoom) {
  const y = coord.y;
  let x = coord.x;
  const tileRange = 1 << zoom;
  if (y < 0 || y >= tileRange) {
    return null;
  }
  if (x < 0 || x >= tileRange) {
    x = ((x % tileRange) + tileRange) % tileRange;
  }
  return { x: x, y: y };
}
