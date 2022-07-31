require 'net/http'
require 'uri'
require 'rexml/document'
require 'cgi'
require 'date'

class Forecast

  def load_data(data)
  end

  def print_forecast
  end

  def self.from_xml(uri_adress)

    uri = URI.parse(uri_adress)

    response = Net::HTTP.get_response(uri)

    doc = REXML::Document.new(response.body)

    times_of_day = []

    city_name = CGI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])

    city = {city_name => times_of_day}

    doc.root.elements.each('REPORT/TOWN/FORECAST') do |item|

      day = Daytime.new

      day.load_data(
        date: item.attributes['day'].to_i,
        tod: item.attributes['tod'].to_i,
        min_temp: item.elements['TEMPERATURE'].attributes['min'],
        max_temp: item.elements['TEMPERATURE'].attributes['max'],
        max_wind: item.elements['WIND'].attributes['max'],
        clouds_index: item.elements['PHENOMENA'].attributes['cloudiness'].to_i
      )

      times_of_day.push(day)
    end

    return city
  end

  def self.show(city)
    city.each do |key, value|
      puts key
      puts
      value.each do |item|
        item.print_forecast
        puts
      end
    end
  end

end