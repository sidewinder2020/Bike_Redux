module Api
  module V1
    module Sales
      class HighestGrossingRegionsController < ApplicationController

        def index
          render json: Salesterritory.highest_grossing_regions
        end

      end
    end
  end
end
