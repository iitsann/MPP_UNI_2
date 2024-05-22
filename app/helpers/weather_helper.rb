module WeatherHelper
  def fetch_weather(city, country)
    client = OpenWeather::Client.new(api_key: ENV["OPEN_WEATHER_API_KEY"] || "13282b2bca2e8496abec960f2acdc6d9")
    client.current_weather(city:, country:)
  end
end
