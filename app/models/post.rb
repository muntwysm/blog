class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  
  has_many :participants, :dependent => :destroy
  has_many :users, :through => :participants
  belongs_to :season

  accepts_nested_attributes_for :participants, :allow_destroy => :true,
      :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  scope :published, where(:publish => true)
  validates_associated :participants
  default_scope :order => 'game_date ASC'
  
end
