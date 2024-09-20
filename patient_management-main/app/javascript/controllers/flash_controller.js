import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        this.hideTimeout = setTimeout(this.hide, 3000)
        this.element.addEventListener('click', this.hideNow)
    }

    disconnect() {
        clearTimeout(this.hideTimeout)
        this.element.removeEventListener('click', this.hideNow)
    }

    hide = () => {
        this.element.style.display = 'none'
    }

    hideNow = () => {
        clearTimeout(this.hideTimeout)
        this.hide()
    }
}