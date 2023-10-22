import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["expandable", "collapse", "tab", "btn"];

  expand() {
    this.expandableTarget.classList.toggle("collapsed");
    this.collapseTarget.classList.toggle("show");
  }

  selectTab(event) {
    const tabClasses = ['show', 'active'];
    const selectedTab = this.tabTargets.find(el => el.id === event.currentTarget.id);

    this.tabTargets.forEach(el => el.classList.remove(...tabClasses));
    this.btnTargets.forEach(el => el.classList.remove("active"));

    selectedTab.classList.add(...tabClasses);
    event.currentTarget.classList.add("active");
  }
}
