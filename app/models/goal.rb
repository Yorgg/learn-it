class Goal < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy
  belongs_to :user
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
end
