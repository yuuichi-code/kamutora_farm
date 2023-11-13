import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['remarks']

  remarks_btn(event) {
    const fieldName = event.currentTarget.dataset.fieldName;
    const nowStep = event.currentTarget.dataset.nowStep;
    const input = document.createElement('input');
    input.type = 'text';
    input.name = `post_form_${nowStep}[${fieldName}]`;
    input.id = `post_form_${nowStep}_${fieldName}`;
    input.placeholder = '備考欄';

    // 備考欄追加ボタンと入力フォームを置き換えている
    this.remarksTarget.replaceWith(input);
  }
}