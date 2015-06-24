class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tasks
  has_many :goals
  validates :name, presence: true, length: { minimum: 4, maximum: 16 }

  def self.today_tasks
  	where(date: Date.yesterday.in_time_zone)
  end

  def self.tomorrow_tasks
  	where(date: Date.tomorrow.in_time_zone)  
  end

  
end
