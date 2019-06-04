console.log("hello from progressbar_teacher !");


function getSteps(steps)
{
  document.getElementById("step-div").innerHTML = "";
  steps.forEach(function(step)
  {
    var stepPercentage;
    if (isNaN(step.step_people.length/numberAttendance*100))
    {
      stepPercentage = 0
    }
    else
    {
      stepPercentage = step.step_people.length/numberAttendance*100
    }

    var newDiv = document.createElement("div");
    newDiv.classList.add("step-card");
    newDiv.setAttribute('id','step-card#'+step.id);
    newDiv.innerHTML = step.title+ "<br>\ "
                      + step.description + "<br>\<br>\ "
                      + "Nombre d'étudiants ayant terminé cette étape : " + step.step_people.length   +" ("+stepPercentage +" %) <br>\ " ;

    var progressDiv = document.createElement("div");
    progressDiv.classList.add("progress");
    progressDiv.setAttribute('style',"min-width : 20px");

    var loadingDiv = document.createElement("div");
    loadingDiv.classList.add("progress-bar");
    loadingDiv.setAttribute('role',"progressbar");
    loadingDiv.setAttribute('aria-valuenow', stepPercentage);
    loadingDiv.setAttribute('aria-valuemax',"100");
    loadingDiv.setAttribute('aria-valuemin',"0");
    loadingDiv.setAttribute('style',"width : "+stepPercentage+"%");

    loadingDiv.innerHTML = step.step_people.length + " / " + numberAttendance ;
    progressDiv.appendChild(loadingDiv);
    newDiv.appendChild(progressDiv);




  document.getElementById("step-div").appendChild(newDiv);

  })

}

var numberAttendance;
function courseAttendances(course){
  numberAttendance = course.attendances.length
}



gon.watch( "steps" , {interval: 1000}, getSteps );
gon.watch( "course" , {interval: 1000}, courseAttendances );
