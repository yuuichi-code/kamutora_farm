// 備考欄追加の関数
function addRemarksField(turn, fieldName) {
  const remarks = document.querySelector(`.js-remarks-field${turn}`);
  remarks.innerHTML = `<input type="text" name="post_form_step2[${fieldName}]" id="post_form_step3_${fieldName}" placeholder="備考欄">`;
}

// 備考欄追加ボタンのクリックイベントを設定
function setupAddRemarksButton(turn, fieldName) {
  const button = document.querySelector(`.js-add-form-btn${turn}-step3`);
  button.addEventListener('click', function() {
    addRemarksField(turn, fieldName);
  });
}

// 各ターンの備考欄追加ボタンを設定
setupAddRemarksButton(1, 'first_day_remark');
setupAddRemarksButton(2, 'second_day_remark');
setupAddRemarksButton(3, 'third_day_remark');
setupAddRemarksButton(4, 'fourth_day_remark');
setupAddRemarksButton(5, 'fifth_day_remark');
setupAddRemarksButton(6, 'sixth_day_remark');
setupAddRemarksButton(7, 'seventh_day_remark');
setupAddRemarksButton(8, 'eighth_day_remark');