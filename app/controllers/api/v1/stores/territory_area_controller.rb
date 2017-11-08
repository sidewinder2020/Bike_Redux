module Api
  module V1
    module Stores
      class TerritoryAreaController < ApplicationController

        def show
          render json: Store.territory_area(store_params[:id])
        end

        private

        def store_params
          params.permit(:id)
        end

      end
    end
  end
end
