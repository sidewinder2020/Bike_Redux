module Api
  module V1
    module Products
      class WorstPerformingCategoriesController < ApplicationController

        def show
          render json: Productcategory.worst_performing_categories
        end

      end
    end
  end
end
