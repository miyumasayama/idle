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
      ur_message =@messages.pluck("user_id").uniq
      ur_message.delete(current_user.id)
      @messanger = ur_message.user
    end


end

