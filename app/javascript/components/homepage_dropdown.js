const dropdown = () => {
  window.addEventListener("resize", function(event) {
    const mq = window.matchMedia( "(max-width: 460px)");
    const mq2 = window.matchMedia( "(min-width: 460px)");
    if (mq.matches) {
      const ddown = document.querySelector("#homepage-dropdown");
      if (ddown) {
        ddown.classList.remove("dropright");
      }
    }
    if (mq2.matches) {
      const ddown = document.querySelector("#homepage-dropdown");
      if (ddown) {
        ddown.classList.add("dropright");
      }
    }
  })
  
  const mq = window.matchMedia( "(max-width: 460px)" );
  if (mq.matches) {
    const ddown = document.querySelector("#homepage-dropdown");
    if (ddown) {
      ddown.classList.remove("dropright");
    }
  }
}

export { dropdown };