import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="scroll"
export default class extends Controller {
    store() {
        this.scrollTop = this.element.scrollTop;
        this.scrollLeft = this.element.scrollLeft;
    }

    restore() {
        this.element.scrollTop = this.scrollTop;
        this.element.scrollLeft = this.scrollLef;
    }
}
