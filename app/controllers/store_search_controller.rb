class StoreSearchController < ApplicationController
  def show
    @stores = Store.all
  end
end
