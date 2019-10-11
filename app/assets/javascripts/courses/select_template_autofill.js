let titleBox = document.getElementById("course_title_box");
let descriptionBox = document.getElementById("course_description_box");
let resourceBox = document.getElementById("course_resource_box");
let templates = gon.templates;

function autofill(value){

  if (value == "NO Template") {
    titleBox.value = "";
    descriptionBox.innerHTML = "";
    resourceBox.innerHTML = "";
  }
  else {
    let template = null
    template = templates.find(function(element) { return element.id == value; });
    titleBox.value = template.title;
    descriptionBox.innerHTML = template.description;
    resourceBox.innerHTML = template.resource;
  }
}
