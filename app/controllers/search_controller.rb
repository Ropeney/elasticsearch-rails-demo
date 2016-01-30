##
# Used to demonstrate searching on models
class SearchController < ApplicationController
  def index
    if params[:q]
      @books = Book.search(params[:q]).results
    end
  end
end
