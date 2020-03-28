class Post < ApplicationRecord
  belongs_to :user
  has_many :like_posts
  has_many :liked_by, through: :like_posts, source: :user

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
