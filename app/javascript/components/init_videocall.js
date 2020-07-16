// const videoCall = () => {
//     /* Get the text field */
//     const copyText = document.getElementById("videocall");
  
//     /* Select the text field */
//     copyText.select();
//     copyText.setSelectionRange(0, 99999); /*For mobile devices*/
  
//     /* Copy the text inside the text field */
//     document.execCommand("copy");
// };
import $ from 'jquery';

const copy = () => {
  if ($('#copy').length > 0) {
    document.querySelector("#copy").addEventListener("click", copy);
    const copyText = document.querySelector("#invitation");
    copyText.select();
    document.execCommand("copy");
  }
}

export { copy };
