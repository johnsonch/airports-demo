@convertKToF = (k) ->
  Math.round((k - 273.15)* 1.8000 + 32.00)
  
@renderWeather = (data) ->
  weatherPanel = $("#weather-data")
  weatherPanel.html ""
  weatherPanel.append Mustache.to_html(
    "{{#weather}} 
      <h3>Weather</h3>
 Temperature:
      <ul>
        <li>Current {{main.temp}}&degF</li>
       </ul>
    {{/weather}}",
    weather: data)
  return

@populateWeather = (data) ->
  sanitizedData = {
    main: {
      temp: convertKToF(data.main.temp)
    }
  }
  renderWeather(sanitizedData)
  
@getWeather = (url) ->
  $.ajax
    method: "get"
    url: url
    success: (data) ->
      populateWeather(data)
      return
    error: (data) ->
      console.log data
      return
