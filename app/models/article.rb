class Article < ActiveRecord::Base
  
  belongs_to :section
  belongs_to :admin
#  validates :title, presence: true, length: { minimum: 8 }
#  validates :text, presence: true, length: { minimum: 100 }
  
  scope :fresh, -> { where(created_at > Date.today - 3.days)}
  scope :old, -> { where(created_at < Date.today - 3.days)}
  
end
