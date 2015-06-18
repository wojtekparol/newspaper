class Article < ActiveRecord::Base
  
  belongs_to :section
  belongs_to :admin
  has_many :comments
  validates :title, presence: true
  validates :text, presence: true
  
  scope :fresh, -> { where(created_at > Date.today - 3.days)}
  scope :old, -> { where(created_at < Date.today - 3.days)}
  
end
