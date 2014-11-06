module AirportsHelper
  def kelvin_to_fahrenheit(k)
    ((k - 273.15)* 1.8000 + 32.00).round(0)
  end
  
  def compass_point(bearing)
    points = %w[N NE E SE S SW W NW]
    seg_size = 360 / points.size
    points[((bearing + (seg_size / 2)) % 360) / seg_size]
  end
end
