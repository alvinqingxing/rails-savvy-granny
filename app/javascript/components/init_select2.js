import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    theme: 'bootstrap4',
  });
};

function videoCall() {
  /* Get the text field */
  var copyText = document.getElementById("videocall");

  /* Select the text field */
  copyText.select();
  copyText.setSelectionRange(0, 99999); /*For mobile devices*/

  /* Copy the text inside the text field */
  document.execCommand("copy");

  /* Alert the copied text */
  alert("Copied to clipboard: " + copyText.value);
}

export { initSelect2 };
export { videoCall };