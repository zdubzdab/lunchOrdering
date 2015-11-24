class User < ActiveRecord::Base
  before_save :check_to_make_admin

  has_many :orders
  has_many :first_items, through: :orders
  has_many :second_items, through: :orders
  has_many :drink_items, through: :orders
  has_many :days do
    def today
      where(created_at: (Time.zone.now.beginning_of_day..Time.zone.now))
    end
  end

  validates :name, presence: true,
                    length: { minimum: 2 },
                    uniqueness: true
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                    message: :bad_email_format } ,
                    uniqueness: true

  Roles = [ :admin , :default ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def total_price_of_user_orders
    total = [] << first_items.to_a.sum { |item| item.total_price }
    total << second_items.to_a.sum { |item| item.total_price }
    total << drink_items.to_a.sum { |item| item.total_price }
    total.sum
  end

  private

  def check_to_make_admin
    # Only the first user should be made admin
    if User.count == 0
      self.role = 'admin'
    end
  end
end
