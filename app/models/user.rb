class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :like_posts
  has_many :likes, through: :like_posts, source: :post
  has_many :comments

  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/default-profile.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_attached_file :banner, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/beach.jpg"
  validates_attachment_content_type :banner, content_type: /\Aimage\/.*\z/
end
