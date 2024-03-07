import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-edit"
export default class extends Controller {
  connect() {
    let boxes = document.querySelectorAll('input[type=checkbox]')
    boxes.forEach((box) => {
      box.checked = true;
    });
  }
}
