class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
