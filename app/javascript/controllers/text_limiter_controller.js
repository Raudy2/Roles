import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="text-limiter"
export default class extends Controller {
  static values = {
    limit: Number,
    selector: "textarea"
  }
  connect() {
    this.inputTarget = this.element.querySelector(this.selectorValue)
    this.inputTarget.setAttribute("data-action", "keyup->text-limiter#keyup keypress->text-limiter#keypress")
    this.updateLabel()
  }

  keyup(event){
    this.keypress(event)
    this.updateLabel()
  }

  keypress(event){
    let input_length = this.inputTarget.value.toString().length
    if(input_length != undefined && input_length >= this.limitValue){
      event.preventDefault()
      this.inputTarget.value = this.inputTarget.value.slice(0, this.limitValue)
    }
    if(input_length != undefined && input_length / this.limitValue > 0.85){
      this.label().classList.add("text-red-600")
    }else{
      this.label().classList.remove("text-red-600")
    }
  }

  label(){
    if(this._label == undefined){
      this._label = document.createElement("Label")
      this._label.innerHTML = "Here goes the text"
      this.element.appendChild(this._label)
    }
    return this._label
  }

  updateLabel(){
    let input_length = this.inputTarget.value.toString().length
    this.label().innerHTML = `${1000 - input_length} characters remaining`

  }
}
