class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  after_create :set_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  # Removes one or more objects from the collection by setting their foreign keys to NULL.
  # Objects will be in addition destroyed if they're associated with dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_posts
    posts.last(3)
  end

  private

  def set_role
    update(role: 'user')
  end
end
