module Api
  module V1
    module Stores
      class OrdersTotalCostController < ApplicationController

        def show
          render json: Store.orders_total_cost(store_params[:name])
        end

        private

        def store_params
          params.permit(:name)
        end

      end
    end
  end
end
