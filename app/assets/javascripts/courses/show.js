console.log("Welcome bro from course/show.js!");


var divCount = document.getElementsByClassName('question-card').length;
var initialQuestionsCount = gon.initial_questions_count;

  $( document ).on('load' , (function()
  {
    var objDiv = document.getElementById("question_container");
    objDiv.innerHTML = "" ;
    objDiv.scrollTop = objDiv.scrollHeight;

  }));


function getQuestions(questions)
  {
    document.getElementById("question_container").innerHTML = "";
    questions.forEach(function(element)
    {

      var newDiv = document.createElement("div");
      newDiv.classList.add("question-card");
      newDiv.setAttribute('id','question-card#'+element.id);
      newDiv.innerHTML = " ID : #"+ element.id + "<br>\ "
                        + element.title+ "<br>\ "
                        + element.description + "<br>\<br>\ "
                        + element.general_question_votes.length + " votes<br>\ ";
      //console.log( element.general_question_votes);
      if (gon.student)
      {
        var vote_link = document.createElement("a");
        if(hasVoted(gon.student,element))
            {
            vote_link.href='/general_question_votes/'+ element.id ;
            vote_link.setAttribute("data-method" , "delete");
            vote_link.innerHTML = "Dévoter <hr/>";
            newDiv.appendChild( vote_link );
          }
        else
          {
            vote_link.href='/general_questions/'+ element.id + '/general_question_votes';
            vote_link.setAttribute("data-method", "post");
            vote_link.innerHTML = "Voter <hr/>";
            newDiv.appendChild( vote_link );
          }
        }
      else if (gon.teacher)
      {
        // var form = document.createElement("form");
        // form.setAttribute('method',"patch");
        // form.setAttribute('action',"/general_questions/"+element.id);
        //
        // var checkbox_case = document.createElement("INPUT");
        // checkbox_case.innerHTML ="Validation";
        // checkbox_case.setAttribute("type", "checkbox");
        // checkbox_case.checked = element.teacher_check;
        // checkbox_case.setAttribute('name',"Validation");
        // checkbox_case.setAttribute('onchange' , "this.form.submit();")
        // form.appendChild( checkbox_case );
        //
        // newDiv.appendChild( form );

        var delete_link = document.createElement("a");
        delete_link.href='/general_questions/'+ element.id ;
        // console.log("element.id ->" + element.id);
        delete_link.setAttribute("data-method", "delete");
        delete_link.innerHTML = "Supprimer la question <hr/>";
        newDiv.appendChild( delete_link );

      }
      document.getElementById("question_container").appendChild(newDiv);

      //var id =element.id
      //console.log("Creation de la div question_card#"+id)
    })
    scrollDownNewQuestion();
    initialQuestionsCount = document.getElementsByClassName('question-card').length ;
    //initialQuestionsCount = questions.length ;

}

function hasVoted(user,question)
{
  var arr = [];
  question.general_question_votes.forEach(function(e){if (e.student_id == user.id){arr.push(e)};});
  return arr.length >= 1 ;
}

function scrollDownNewQuestion()
{
  newCount =  document.getElementsByClassName('question-card').length;
  if (newCount != divCount)
  {
    var objDiv = document.getElementById("question_container");
    objDiv.scrollTop = objDiv.scrollHeight;
  }
  divCount = document.getElementsByClassName('question-card').length;
}

function questionCount(questions)
{
  var newQuestionCount = questions.length ;
  if (newQuestionCount != initialQuestionsCount){ getQuestions(questions) }
   //  console.log(questions);
   // console.log("newQuestionCount ->" + newQuestionCount);
   // console.log("initialQuestionsCount ->" + initialQuestionsCount);
}

 gon.watch( "questions" , {interval: 1000}, getQuestions );
