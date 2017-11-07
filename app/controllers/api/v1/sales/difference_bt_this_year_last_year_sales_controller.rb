class Api::V1::Sales::DifferenceBtThisYearLastYearSalesController < ApplicationController

  def index
    render json: Salesperson.difference_bt_this_year_last_year_sales
  end
  
end
