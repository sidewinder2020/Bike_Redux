module Api
  module V1
    module Stores
      class SalesytdPerStoreController < ApplicationController

        def show
          render json: Store.salesytd_per_store(store_params[:id])
        end

        private

        def store_params
          params.permit(:id)
        end

      end
    end
  end
end
