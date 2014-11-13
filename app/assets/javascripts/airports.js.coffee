# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
currentPage = 0
$ ->
  observeScroll()
  return

loadData = (data) ->
  $("#airports").append Mustache.to_html(
    "{{#airports}} 
    <tr>
        <td><a href='/airports/{{id}}'>{{name}}</a></td>
        <td><a href='/airports/{{id}}'>{{airport_type}}</a></td>
        <td><a href='/airports/{{id}}'>{{continent}}</a></td>
        <td><a href='/airports/{{id}}'>{{iso_country}}</a></td>
        <td><a href='/airports/{{id}}'>{{iso_region}}</a></td>
        <td><a href='/airports/{{id}}'>{{municipality}}</a></td>
        <td><a href='/airports/{{id}}'>{{scheduled_service}}</a></td>
    </tr>
    {{/airports}}",
    airports: data)
  return

nextPageWithJSON = ->
  currentPage += 1
  newURL = "/airports.json?page=" + currentPage
  splitHref = document.URL.split("?")
  parameters = splitHref[1]
  if parameters
    parameters = parameters.replace(/[?&]page=[^&]*/, "")
    newURL += "&" + parameters
    newURL
    currentPage = 0

getNextPage = ->
  return  unless loadingPage is 0
  loadingPage++
  $.getJSON(nextPageWithJSON(), {}, updateContent).complete ->
    loadingPage--
    return
  return

updateContent = (response) ->
  loadData response
  return

readyForNextPage = ->
  return  unless $("#next_page_spinner").is(":visible")
  threshold = 200
  bottomPosition = $(window).scrollTop() + $(window).height()
  distanceFromBottom = $(document).height() - bottomPosition
  distanceFromBottom <= threshold

observeScroll = (event) ->
  getNextPage()  if readyForNextPage()
  return

loadingPage = 0
$(document).scroll observeScroll




