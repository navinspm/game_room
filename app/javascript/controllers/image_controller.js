import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "camelCase" ] 
  reset() {
    console.log(this);
  }

}