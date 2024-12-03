import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {

  static targets = ["togglableElement", "tourne"]

  connect() {
    console.log("Stimulus est dans le potager");
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
    this.tourneTarget.classList.toggle("tourne");
  }

  refresh() {
    location.reload();
  }
}
