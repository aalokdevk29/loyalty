class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spendings
  has_many :loyalties, through: :spendings

  def total_rewards_earned
    not_expired_loyalty_points.sum(:points)
  end
  
  private

  def last_rebate_date
    not_expired_loyalty_points.where(reward_title: 'rebate').order(created_at: :desc).first.created_at
  end

  def loyalty_tier
    points = not_expired_loyalty_points.sum(:points)

    if points < 1000
      'standard'
    elsif points < 5000
      'gold'
    elsif points > 5000
      'platinum'
    end
  end

  def not_expired_loyalty_points
    loyalties.where(created_at: 1.year.ago..DateTime.now)
  end  
end
