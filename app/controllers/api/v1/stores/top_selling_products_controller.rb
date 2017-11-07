module Api
  module V1
    module Stores
      class TopSellingProductsController < ApplicationController

        def index
          render json: Store.top_selling_products(store_params[:name])
        end

        private

        def store_params
          params.permit(:name)
        end

      end
    end
  end
end
