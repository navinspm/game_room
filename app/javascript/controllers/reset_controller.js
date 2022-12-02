import { Controller } from "@hotwired/stimulus"
document.addEventListener('turbo:load', () => queryDocumentForTomSelect());
document.addEventListener('turbo:render', () => queryDocumentForTomSelect());
document.addEventListener('turbo:before-render', () => queryDocumentForTomSelect());
document.addEventListener('turbo:frame-load', () => queryDocumentForTomSelect());

export default class extends Controller {
  static targets = [ "showButton" ] 
  reset() {
    console.log(this);
    this.element.children[2].disabled = true;
    this.element.innerText = 'Player is selecting image , Please wait';
  }

}