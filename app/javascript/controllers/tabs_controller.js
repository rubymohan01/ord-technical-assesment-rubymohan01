import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "content"];

  connect() {
    this.activate({ target: this.tabTargets[0] });
  }

  activate(event) {
    const targetId = event.target.getAttribute("data-id");
    this.tabTargets.forEach((tab) => {
      if (tab.getAttribute("data-id") === targetId) {
        tab.classList.add("active");
      } else {
        tab.classList.remove("active");
      }
    });

    this.contentTargets.forEach((content) => {
      if (content.getAttribute("data-id") === targetId) {
        content.removeAttribute("hidden");
      } else {
        content.setAttribute("hidden", "true");
      }
    });
  }
}
