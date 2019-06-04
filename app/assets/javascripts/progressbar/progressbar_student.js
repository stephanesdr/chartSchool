console.log("hello from progressbar_student !");

function getSteps(steps)
{
  document.getElementById("step_container").innerHTML = "";
  steps.forEach(function(step)
  {
    var newDiv = document.createElement("div");
    newDiv.classList.add("step-card");
    newDiv.setAttribute('id','step-card#'+step.id);
    newDiv.innerHTML = step.title+ "<br>\ "
                      + step.description + "<br>\<br>\ "
                      + "Nombre d'étudiants ayant terminé cette étape : " + step.step_people.length   +" ("+step.step_people.length/numberAttendance*100 +" %) <br>\ " ;

    var progressDiv = document.createElement("div");
    progressDiv.classList.add("progress");
    progressDiv.setAttribute('style',"min-width : 20px");

    var loadingDiv = document.createElement("div");
    loadingDiv.classList.add("progress-bar");
    loadingDiv.setAttribute('role',"progressbar");
    loadingDiv.setAttribute('aria-valuenow', step.step_people.length/numberAttendance*100);
    loadingDiv.setAttribute('aria-valuemax',"100");
    loadingDiv.setAttribute('aria-valuemin',"0");
    loadingDiv.setAttribute('style',"width : "+step.step_people.length/numberAttendance*100+"%");

    var vote_link = document.createElement("a");
    console.log("has voted step-> "+hasVotedStep( gon.user ,step ) );
    //console.log("STEP_PEOPLE -> "+  step.step_people );

    if (hasVotedStep( gon.user ,step ) )
    {
      vote_link.innerHTML = "✗ EN COURS ";
      vote_link.href= "/steps_people/"+ step.id;
      vote_link.setAttribute("data-method", "delete");
      //vote_link.setAttribute("onclick", "disableLink(this)");
      newDiv.appendChild(vote_link);
    }
    else
    {
      vote_link.innerHTML = "✓ TERMINÉ !";
      vote_link.href= "/courses/"+ gon.course.id+ "/steps/"+ step.id + "/steps_people";
      vote_link.setAttribute("data-method", "post");
      //vote_link.setAttribute("onclick", "disableLink(this)");
      newDiv.appendChild(vote_link);
    }



    loadingDiv.innerHTML = step.step_people.length + " / " + numberAttendance ;
    progressDiv.appendChild(loadingDiv);
    newDiv.appendChild(progressDiv);
    document.getElementById("step_container").appendChild(newDiv);

  })

}

function hasVotedStep(user,step)
{
  var arr = [];
  step.step_people.forEach(function(e){if (e.attendee_id == user.id){arr.push(e)};});
  return arr.length >= 1  ;
}

var numberAttendance;

function courseAttendances(course)
{
  numberAttendance = course.attendances.length;
}

// function disableLink(link)
// {
//    link.onclick = function(event){ event.preventDefault() ;}
// }


gon.watch( "steps" , {interval: 1500}, getSteps );
gon.watch( "course" , {interval: 1000}, courseAttendances );
//gon.watch( "has_voted" , {interval: 1000}, hasVoted );
