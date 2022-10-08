class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, foreign_key: :post_id
  has_many :likes

  after_save :update_user_posts_count

  validates :title, presence: true, length: { in: 0..250 }
  validates :comments_conter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_user_posts_count
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  before_validation :set_defaults

  def set_defaults
    self.comments_conter ||= 0
    self.likes_counter ||= 0
  end
end
