App.courses = App.cable.subscriptions.create "CoursesChannel",
  connected: (data)->
    # Called when the subscription is ready for use on the server

    console.log("hello mon poto !");
    for e in gon.attendees
      newDiv = document.createElement('div')
      newDiv.setAttribute 'id', 'presence-card-person#' + e.id
      newDiv.innerHTML = e.name;
      document.getElementById('attendees_container').appendChild newDiv;
    #return


    # for d, i in gon.attendees
    #   console.log d, i

  disconnected: (data) ->
    # Called when the subscription has been terminated by the server
      # console.log(data.content);
      # document.getElementById("person#" + data.user_id).innerHTML= "";
      document.getElementById('attendees_container').innerHTML = ""

  received: (data) ->
    console.log(data.user_id + ' vient de se connecter');
    newDiv = document.createElement('div');
    newDiv.setAttribute('id','person#'+data.user_id);
    newDiv.innerHTML= "PRÉSENT"
    document.getElementById("presence-card-person#" + data.user_id).appendChild newDiv ;
    # Called when there's incoming data on the websocket for this channel
