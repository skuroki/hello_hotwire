import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["field", "errorMessage"]
  static values = { length: Number, validity: Boolean, formId: String }

  validate() {
    const fieldValue = this.fieldTarget.value;
    const length = fieldValue.length;
    if (length == 0) {
      this.errorMessageTarget.textContent = '入力してください';
      this.notifyValidityToForm(false);
    } else if (length > this.lengthValue) {
      this.errorMessageTarget.textContent = '長過ぎます';
      this.notifyValidityToForm(false);
    } else {
      this.errorMessageTarget.textContent = '';
      this.notifyValidityToForm(true);
    }
  }

  notifyValidityToForm(validity) {
    this.validityValue = validity;
    const form = document.getElementById(this.formIdValue);
    const formController = this.application.getControllerForElementAndIdentifier(form, 'form');
    if (formController) {
      formController.updateValidity();
    }
  }
}
