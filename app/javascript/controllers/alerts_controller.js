import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["closeable"]

  dismiss() {
    this.closeableTargets.forEach(el => el.style.display = 'none');
  }
}
