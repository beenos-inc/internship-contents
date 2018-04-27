function clearInput() {
  document.querySelector('#reset').addEventListener("click", function() {
    elements = document.querySelectorAll('input[type="checkbox"]');
    [...elements].map(element => {
      element.checked = false;
    });
  });
}