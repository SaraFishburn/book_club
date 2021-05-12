class AuthorsController < ApplicationController
  def index
    @authors = Author.order(:last_name)
  end

  def show
    @author = Author.find(params[:id])
  end
end
