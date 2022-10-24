import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["validation", "submit"]

  updateValidity() {
    const submit = this.submitTarget;
    if (this.validationTargets.every((t) => t.dataset.validationValidityValue == 'true')) {
      submit.removeAttribute("disabled");
    } else {
      submit.setAttribute("disabled", true);
    }
  }
}
