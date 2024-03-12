import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-edit"
export default class extends Controller {
  static targets = ["field", "check", "content"]

  toggleFunction(field){
    const prevValue = field.dataset.value;
    field.dataset.value = field.innerHTML;
    field.innerHTML = prevValue;
    field.classList.toggle("field-tag")
  }

  connect() {
    this.checkTargets.forEach((check) => {
      const fieldId = check.dataset.fieldId;

      if (!check.checked) {
        const field = this.fieldTargets.find((field) => field.dataset.id === check.dataset.fieldId)
        this.toggleFunction(field);
      }
    });
    this.contentTarget.classList.remove("opacity-0");
  }

  toggleField(event) {
    const fieldId = event.target.dataset.fieldId;

    this.fieldTargets.forEach((field) => {
      if (field.dataset.id === fieldId) {
        this.toggleFunction(field)
      }
    });
  }
}
