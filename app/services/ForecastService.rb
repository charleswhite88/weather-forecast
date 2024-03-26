class ForecastService
  attr_reader :query, :days, :cache_key, :cached_response

  URL = 'http://api.weatherapi.com/v1/forecast.json'
  KEY = '25aafaf019984987a08205239242403'

  def initialize(data)
    @query = data.dig(:query)
    @days = data.dig(:day)
    @cache_key = "forecast_#{query}_#{days}" # Generate the key against query and date
    @cached_response = Rails.cache.read(cache_key)
  end

  def call
    if cached_response.nil?
      # If not cached, fetch the response from the API
      response = fetch_response_from_api

      if response.success?
        forecast = extract_forecast_from_response(response)
        cache_forecast(forecast)
        forecast
      else
        raise StandardError, "Error occurred: #{response.code}"
      end
    else
      cached_response
    end
  end

  private

  def fetch_response_from_api
    HTTParty.get(URL, query: { key: KEY, q: query, days: days })
  end

  def extract_forecast_from_response(response)
    response.dig('forecast', 'forecastday')&.map { |item| item.dig('day') }
  end

  def cache_forecast(forecast)
    Rails.cache.write(cache_key, forecast, expires_in: 30.minutes)
  end
end
