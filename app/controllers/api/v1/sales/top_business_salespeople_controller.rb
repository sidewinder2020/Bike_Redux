module Api
  module V1
    module Sales
      class TopBusinessSalespeopleController < ApplicationController

        def index
          render json: Salesperson.top_business_salespeople
        end

      end
    end
  end
end
