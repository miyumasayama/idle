class RoomsController < ApplicationController
  before_action :require_login
    def index
      @rooms = Room.where('user_id = ? or receiver_id = ?', current_user.id, current_user.id)
      @rooms.each do |r|
        @user = User.where(id: r.receiver_id)
        @user2 = User.where(id: r.user_id)
        @users = @user.where.not(id: current_user.id).(@user2.where.not(id: current_user.id))
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

