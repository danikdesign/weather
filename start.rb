require_relative 'lib/forecast'
require_relative 'lib/daytime'

# чтобы начать, создайте переменную и примените к ней метод класса
# Forecast.from_xml("ссылка на прогноз погоды в xml-формате с сайта xml.meteoservice.ru")
# после этого используйте метод класса Forecast.show(city), где аргументом является созданная раннее переменная.

kyiv = Forecast.from_xml("https://xml.meteoservice.ru/export/gismeteo/point/25.xml")\

Forecast.show(kyiv)





