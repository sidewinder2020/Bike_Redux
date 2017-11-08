module Api
  module V1
    module Stores
      class NumberOfOrdersController < ApplicationController

        def show
          render json: Store.number_of_orders(store_params[:id])
        end

        private

        def store_params
          params.permit(:id)
        end

      end
    end
  end
end
