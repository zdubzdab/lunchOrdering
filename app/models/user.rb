class User < ActiveRecord::Base
  before_save :check_to_make_admin

  has_many :orders
  has_many :first_items, through: :orders
  has_many :second_items, through: :orders
  has_many :drink_items, through: :orders
  has_many :days do
    def today
      where(:created_at => (Time.zone.now.beginning_of_day..Time.zone.now))
    end
  end

  Roles = [ :admin , :default ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def check_to_make_admin
    # Only the first user should be made admin
    if User.count == 0
      self.role = 'admin'
    end
  end
end
