import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="details"
export default class extends Controller {
    connect() {}

    keepOpen(event) {
        if (event.detail.attributeName == "open") {
            event.preventDefault();
        }
    }
}
