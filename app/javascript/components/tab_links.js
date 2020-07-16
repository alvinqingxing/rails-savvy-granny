const tablinks = () => {
  const url = document.location.toString();
  if (url.match('active_tab')) {
    const cat = url.match(/=(.*$)/).slice(-1)[0];
    const tab = document.querySelector(`#pills-${cat}-tab`);
    const pill = document.querySelector(`#pills-${cat}`);
    tab.classList.add('active');
    pill.classList.remove('fade');
    pill.classList.add('active');
    console.log(pill)
  } 
}

export { tablinks };