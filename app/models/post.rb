class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes

  after_save :update_user_posts_count

  validates :title, presence: true, length: { in: 0..250 }
  validates :commentscounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_user_posts_count
    author.increment!(:post_counter)
  end

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end
end
