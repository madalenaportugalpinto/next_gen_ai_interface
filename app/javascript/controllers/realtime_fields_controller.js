import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="realtime-fields"
export default class extends Controller {
  static targets = ["field", "input"]

  connect() {
    this.inputTargets.forEach((input) => {
      if (input.value.length > 0) {
        this.updateFieldText(input.dataset.id, input.value)
      }
    })
  }

  updateFieldText(fieldId, value) {
    const field = this.fieldTargets.find((field) => field.dataset.id === fieldId)

    if (field.classList.contains("field-tag")) {
      // Store the key in the data-value
      field.dataset.value = field.innerHTML;
      field.classList.toggle("field-tag")
      field.classList.toggle("field-value")
    }

    field.innerHTML = value;

    if (field.innerHTML === "") {
      field.classList.toggle("field-tag")
      field.classList.toggle("field-value")
      field.innerHTML = field.dataset.value
    }
  }

  changeText(event) {
    const fieldId = event.target.dataset.id;
    const value = event.target.value;

    this.updateFieldText(fieldId, value)
  }
}
