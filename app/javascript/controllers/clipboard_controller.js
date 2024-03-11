import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "button"];
  static values = {
    feedbackText: String
  }
  connect() {

  }

  copy(event) {
    let text = this.inputTarget.innerHTML;

    const copyContent = async () => {
      try {
        await navigator.clipboard.writeText(text);
        console.log('Content copied to clipboard');

        this.buttonTarget.disabled = true;
        this.buttonTarget.innerText = this.feedbackTextValue;
      } catch (err) {
        console.error('Failed to copy: ', err);
      }
    }

    copyContent();
  }
}



