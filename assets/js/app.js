// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import topbar from "../vendor/topbar"
import * as Tone from '../vendor/tone';

const synth = new Tone.Synth().toDestination();

const volume_values = {
    1: -28,
    2: -24,
    3: -20,
    4: -16,
    5: -12,
    6: -8,
    7: -4,
}

const note_values = {
    1: "C4",
    2: "D4",
    3: "E4",
    4: "F4",
    5: "G4",
    6: "A4",
    7: "B4",
}

let Hooks = {
    ToggleSound: {
        updated() {
            synth.volume.value = volume_values[this.el.dataset.volume]
            synth.triggerAttack(note_values[this.el.dataset.step])
        },

        mounted() {
            this.soundOn = false;
            this.el.addEventListener("click", () => {
                if (this.soundOn) {
                    synth.triggerRelease();
                    this.soundOn = false;
                } else {
                    synth.triggerAttack(note_values[this.el.dataset.step])
                    this.soundOn = true;
                }
            });
        }
    }

}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks, params: { _csrf_token: csrfToken } })



// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

