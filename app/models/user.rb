class User < ActiveRecord::Base
  attr_accessible :email, :gamertag, :name, :xbox_id
  has_many :lends
  validates_uniqueness_of :gamertag
end
