module Api
  module V1
    module Stores
      class TerritoryAreaController < ApplicationController

        def show
          render json: Store.territory_area(store_params[:name])
        end

        private

        def store_params
          params.permit(:name)
        end

      end
    end
  end
end
