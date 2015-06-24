class Goal < ActiveRecord::Base
  has_many :tasks
  belongs_to :user
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
end
