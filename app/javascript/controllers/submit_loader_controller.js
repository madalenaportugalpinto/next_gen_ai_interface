import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['backdrop']

  submit() {
    this.backdropTarget.classList.add("modal-backdrop");
    this.backdropTarget.classList.add("show");
  }
}
