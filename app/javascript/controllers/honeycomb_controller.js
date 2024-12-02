import { Controller } from "@hotwired/stimulus"
import { useTransition } from "stimulus-use"

// Connects to data-controller="honeycomb"
export default class extends Controller {
  static targets = ["dialog"]

  connect() {
    useTransition(this, {
      element: this.dialogTarget,
      enterActive: "ease-out duration-300 translate-x-0",
      enterFrom: "translate-x-100",
      leaveActive: "ease-in duration-200 translate-x-100",
      leaveFrom: "translate-x-0"
    })
  }

  open() {
    this.enter()
    this.dialogTarget.showModal()
  }

  async close() {
    await this.leave()
    this.dialogTarget.close()
  }

  clickOutside(event) {
    if (event.target === this.dialogTarget) {
      this.close()
    }
  }
}
