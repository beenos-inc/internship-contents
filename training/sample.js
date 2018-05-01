function validation() {
  var elements = document.querySelectorAll('input[type="text"]');
  bool = true;
  var bool = ![...elements].some(element => {
      return element.value === '';
  });

  if (!bool) alert('未入力項目があります');
  return bool;
}

function clearInput() {
  var checkboxes = document.querySelectorAll('input[type="checkbox"]');
  [...checkboxes].map(checkbox => {
    checkbox.checked = false;
  });

  var texts = document.querySelectorAll('input[type="text"]');
  [...texts].map(text => {
    text.value = "";
  });
}