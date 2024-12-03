/* CODE MORT => animation de la show de la page */

import { Controller } from "@hotwired/stimulus"
import { useTransition } from "stimulus-use"

// Connects to data-controller="honeydetails"
export default class extends Controller {
  connect() {
    useTransition(this, {
      enterActive: "ease-out duration-300 translate-x-0",
      enterFrom: "translate-x-100",
      leaveActive: "ease-in duration-200 translate-x-100",
      leaveFrom: "translate-x-0"
    })
    this.enter()
    document.addEventListener('turbo:before-cache', () => this.leaveAnim());
  }

  leaveAnim() {
    this.leave()
  }

  async disconnect() {
    document.addEventListener('turbo:load', () => this.leaveAnim());
  }

  get isPreview() {
    return document.documentElement.hasAttribute('data-turbolinks-preview')
  }

}
