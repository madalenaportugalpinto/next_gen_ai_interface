import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-edit"
export default class extends Controller {
  static targets = ["field", "check"]

  connect() {
     console.log(this.checkTargets)
    // let boxes = document.querySelectorAll('input[type=checkbox]')
    // boxes.forEach((box) => {

    //   box.checked = true;
    // });
  }

  toggleField(event) {
    const fieldId = event.target.dataset.fieldId;
    this.fieldTargets.forEach((field) => {
      if (field.dataset.id === fieldId) {
        const prevValue = field.dataset.value;
        field.dataset.value = field.innerHTML;
        field.innerHTML = prevValue;
        field.classList.toggle("field-tag")
      }
    });
  }
}
