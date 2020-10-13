class RoomsController < ApplicationController
  before_action :require_login
    def index
      @rooms = Room.where('user_id = ? or receiver_id = ?', current_user.id, current_user.id)
      @rooms.each do |r|
        if current_user.id = r.user_id
          @user = User.where(id: r.receiver_id)
        else
          @user = User.where(id: r.user_id)
        end
      end
    end



    def create
      @room = Room.new(user_id:current_user.id, receiver_id: params[:room][:receiver_id])
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

