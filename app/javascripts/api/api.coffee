module.exports = {
  getData: (token) ->
    ref = new Firebase('wss://developer-api.nest.com')
    ref.auth(token)
    ref.on 'value', (snapshot) ->
      console.log snapshot.val()

  getToken: (cb) ->
    code = document.getElementById('input').innerText
    xhr = new XMLHttpRequest
    xhr.addEventListener 'readystatechange', ->
      if @readyState == 4
        cb(JSON.parse(@responseText))

    xhr.open 'POST', "https://cors-anywhere.herokuapp.com/api.home.nest.com/oauth2/access_token?" +
                     "client_id=675828bd-1689-4422-94f4-4b3a5776746f&" +
                     "code=#{code}&" +
                     "client_secret=emDyfc0J8JyOgrIqZ6yMCCMno&grant_type=authorization_code"
    xhr.setRequestHeader 'cache-control', 'no-cache'
    xhr.setRequestHeader 'postman-token', '2126cd28-7fc4-e589-5b5c-375df070a3e0'
    xhr.send()
}
