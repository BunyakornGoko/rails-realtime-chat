import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.scrollToBottom()

    // Watch for changes and scroll to bottom when content changes
    const observer = new MutationObserver(() => this.scrollToBottom())
    observer.observe(this.element, { childList: true, subtree: true })
  }

  scrollToBottom() {
    this.element.scrollTop = this.element.scrollHeight
  }
}
