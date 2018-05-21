class PagesController < ApplicationController
  def home
    @locations = Location.first(5)
  end
end
