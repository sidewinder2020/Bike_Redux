module Api
  module V1
    module Stores
      class SalesytdPerStoreController < ApplicationController

        def show
          render json: Store.salesytd_per_store(store_params[:name])
        end

        private

        def store_params
          params.permit(:name)
        end

      end
    end
  end
end
