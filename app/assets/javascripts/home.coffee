# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
  success = (pos) ->
    $('#map').html('<img src=' +
      '"http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=' +
      pos.coords.latitude + '%2C' + pos.coords.longitude + '"' + ' alt="map">')
    return

  error = (err) ->
    console.warn 'ERROR(' + err.code + '): ' + err.message
    return

  document.addEventListener 'DOMContentLoaded', (->
    options =
      enableHighAccuracy: true
      timeout: 60000
      maximumAge: 0
    window.navigator.geolocation.getCurrentPosition success, error, options
    return
  ), false
