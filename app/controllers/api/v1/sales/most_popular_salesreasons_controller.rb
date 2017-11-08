module Api
  module V1
    module Sales
      class MostPopularSalesreasonsController < ApplicationController

        def index
          render json: Salesreason.most_popular_salesreasons
        end

      end
    end
  end
end
