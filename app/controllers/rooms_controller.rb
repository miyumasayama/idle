class RoomsController < ApplicationController
  before_action :require_login
    def index
      @rooms = Room.where('user_id = ? or receiver_id = ?', current_user.id, current_user.id)
      user_ids = @rooms.pluck("user_id", "receiver_id").uniq.flatten
      user_ids.delete(current_user.id)
      @users = User.where(id: user_ids)
      
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
      if @room.user_id == current_user.id
        ur_id = @room.receiver_id
      else
        ur_id = @room.user_id
      end
      @messanger = User.find_by(id: ur_id)
    end





end

