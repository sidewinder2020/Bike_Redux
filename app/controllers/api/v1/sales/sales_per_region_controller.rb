module Api
  module V1
    module Sales
      class SalesPerRegionController < ApplicationController

        def index
          render json: Salesterritory.sales_per_region
        end

      end
    end
  end
end
