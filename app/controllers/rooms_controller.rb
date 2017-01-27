class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.create
      flash[:message] = "Room saved."
      redirect_to rooms_path
    else
      flash[:message] = "Room failed to save."
      render new_room_path(@room)
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
