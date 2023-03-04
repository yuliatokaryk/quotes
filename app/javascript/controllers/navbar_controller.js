import { Controller } from 'stimulus'; 
export default class extends Controller {
  open() {
    document.getElementById("navbar-default").classList.toggle("hidden");
  }
}
