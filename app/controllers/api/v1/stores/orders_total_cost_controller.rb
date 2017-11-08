module Api
  module V1
    module Stores
      class OrdersTotalCostController < ApplicationController

        def show
          render json: Store.orders_total_cost(store_params[:id])
        end

        private

        def store_params
          params.permit(:id)
        end

      end
    end
  end
end
