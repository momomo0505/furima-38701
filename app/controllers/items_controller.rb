class ItemsController < ApplicationController
  def new 
    authenticate_user!
  end

  def index
  end
end
