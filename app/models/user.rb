class User < ActiveRecord::Base
  
  validates :name, presence: true, uniqueness: true, length: { minimum: 8 }
  validates :password, presence: true, length: { minimum: 6 }
  has_many :comments
  after_destroy :message
  def message
    puts "blabla"
  end
  
end
