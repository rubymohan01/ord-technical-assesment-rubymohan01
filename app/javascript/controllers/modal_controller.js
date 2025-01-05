import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    if (this.hasContentTarget && this.contentTarget.innerHTML.trim() !== "") {
      this.element.classList.remove("hidden");
    }
  }

  hide(event) {
    if (event) event.preventDefault();
    this.element.classList.add("hidden");
    if (this.hasContentTarget) {
      this.contentTarget.innerHTML = "";
    }
  }
}
