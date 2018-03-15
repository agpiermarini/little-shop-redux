window.addEventListener("click", testEmpty);
function testEmpty {
  var nameValue = document.getElementById(Name).value;
  if (!nameValue) {
    alert ("You can't do that")
  }
}
