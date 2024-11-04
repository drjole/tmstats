import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="modal"
export default class extends Controller {
    static targets = ["dialog"];

    connect() {}

    show() {
        this.dialogTarget.showModal();
    }

    close() {
        console.log("close");
        this.dialogTarget.close();
    }

    stopClickPropagation(event) {
        console.log(event);
        event.stopPropagation();
    }
}
