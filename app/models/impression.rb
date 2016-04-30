class Impression < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :title, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validate :user_product_uniqueness

  def user_product_uniqueness
    unless Impression.find_by(user: user, product: product)&.id == id
      errors.add(:user_product, 'already exist')
    end
  end
end
