class MessagesController < ApplicationController
    before_action :require_login
    def create
        @room = Room.find(params[:room_id])
        @message = @room.messages.build(params.require(:message).permit(:body, :user_id, :room_id).merge(:user_id=> current_user.id))
        if @message.save
            redirect_back(fallback_location: root_path)
            
        else
            redirect_back(fallback_location: root_path)
        end
    end

    private
        def message_params
            params.require(:message).permit(:body, :user_id, :room_id)
        end
end
