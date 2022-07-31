class Daytime < Forecast

  CLOUDINESS = {-1 => 'туман', 0 => 'ясно', 1 => 'малооблачно', 2 => 'облачно', 3 => 'пасмурно'}
  TOD = {0 => 'ночь', 1 => 'утро', 2 => 'день', 3 => 'вечер'}

  def load_data(data)

    @date = data[:date]
    @tod = TOD[data[:tod]]
    @min_temp = data[:min_temp]
    @max_temp = data[:max_temp]
    @max_wind = data[:max_wind]
    @clouds_index = CLOUDINESS[data[:clouds_index]]

    time = Time.new
    today = time.day
    tomorrow = Date.today + 1

    if @date == today
      @real_date = 'Сегодня'
    else
      @real_date = tomorrow
    end
  end

  def print_forecast
    puts "#{@real_date}, #{@tod}"
    puts "Температура от #{@min_temp} до #{@max_temp}, ветер #{@max_wind} м/с, #{@clouds_index}"
  end

end