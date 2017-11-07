class Api::V1::StoresController < ApplicationController

  def show
    render json: Store.find(params[:id])
  end

end
