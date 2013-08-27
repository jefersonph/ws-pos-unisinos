class Lend < ActiveRecord::Base
  belongs_to :user
  attr_accessible :game_id, :to, :user_id
  
end
