class Participant < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  belongs_to :score
  
  validates :user_id, :score_id, :presence => true
  validates :user_id, :uniqueness => { :scope => :post_id, 
            :message => "Duplicate player in game. Enter other name, then edit & remove." }
end
