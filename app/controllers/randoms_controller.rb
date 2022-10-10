class RandomsController < ApplicationController
  def index
  end

  def prepend
    @random = rand(1000)

    respond_to do |format|
      format.turbo_stream { render partial: 'prepend' }
      format.html         { redirect_to randoms_url }
    end
  end
end
