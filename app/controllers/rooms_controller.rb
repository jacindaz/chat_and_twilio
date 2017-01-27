class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    binding.pry
  end

  def create
  end
end
