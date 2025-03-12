import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content"]

  connect() {
    this.element.addEventListener("turbo:submit-end", () => {
      this.contentTarget.value = ""
    })
  }
}
