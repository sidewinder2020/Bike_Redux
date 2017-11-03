class RequestsController < ApplicationController
  def create
    @request = Request.new(request_params)
  end

  def new
    @request = Request.new
  end

  private

  def request_params
    params.require(:request).permit()
  end
end
