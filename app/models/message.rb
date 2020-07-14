class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :sender, class_name: "User"



end
