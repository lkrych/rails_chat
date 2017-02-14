class ChatRoomsChannel < ApplicationCable::Channel
    def subscribed
        stop_all_streams
        stream_from "chat_rooms_#{params['chat_room_id']}_channel"
    end
    
    def unsubscribed
        # Any cleanup needed when channel is unsubscribed
        stop_all_streams
    end
    
    def send_message(data)
        # process data sent from the page
        current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
    end
end