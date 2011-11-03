class Season < ActiveRecord::Base
	has_many :posts, :dependent => :destroy
	default_scope :order => 'name DESC'
  scope :current, where(:active => true)
  
end
