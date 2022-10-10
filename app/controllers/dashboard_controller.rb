class DashboardController < ApplicationController
  def index
    @fortune = %w(大吉 中吉 小吉 凶).sample
  end

  def fortune
    @fortune = %w(大吉 中吉 小吉 凶).sample
    render partial: 'fortune'
  end
end
