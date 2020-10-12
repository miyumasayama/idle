class RoomsController < ApplicationController
    before_action :require_login
    def index
      @rooms = Room.where(user_id:current_user.id).or(Room.where(receiver_id: current_user.id))
      @rooms.each do |r|
        if r.user_id == current_user.id
          @user = User.find_by(:id => r.receiver_id)
        else
          @user = User.find_by(:id => r.user_id)
        end
      end
    end

    def create
      @user = User.find_by(params[:room][:receiver_id])
      @room = Room.new(user_id:current_user.id, receiver_id: @user.id)
      if @room.save
        redirect_to room_path(@room.id)
      end
    end

    def show 
      @room = Room.find(params[:id])
      @messages = @room.messages
      @message = Message.new
    end

end

