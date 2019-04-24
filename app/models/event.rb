class Event < ApplicationRecord
     belongs_to :creator, class_name: "User"

     default_scope -> { order(created_at: :desc) }

     validates :creator_id, presence: true
     validates :name, presence: true, length: {minimum: 3 }
     validates :dateofevent, presence: true
     validates :location, presence: true 


end
