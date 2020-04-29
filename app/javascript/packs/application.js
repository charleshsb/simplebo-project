import "bootstrap";

const filter = (event) => {
  const search = event.target.value.toLowerCase()
  document.querySelectorAll('.cards').forEach((product) => {
    const text = product.innerText.toLowerCase();
    if (text.match(search)) {
      product.style.display="block"
    } else {
      product.style.display="none"
    }
  })
}

document.querySelector('#search-bar').addEventListener("keyup", filter);
