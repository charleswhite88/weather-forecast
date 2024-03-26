class ForecastsController < ApplicationController
  before_action: :permit_weather_params, only: :show

  def index
    @recently_searched = recently_searched
  end

  def show
    @forecasts = ForecastService.new(params).call
  end

  private

  def permit_weather_params
    params.permit(:query, :days)
  end

  def recently_searched
    forecast_keys = Rails.cache.redis.keys('forecast_*')
    forecast_keys.select { |key| Rails.cache.read(key).present? }
  end
end
