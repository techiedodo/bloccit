# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  posts = Post.all

  scope :ordered_by_title, -> { posts.order(:title)}
  #scope :ordered_by_title, -> { order('title ASC')} why will this only work w/o default scope
  scope :ordered_by_reverse_created_at, -> { posts.order('created_at DESC').reverse}
  #scope :ordered_by_reverse_created_at, -> { order('created_at ASC' )}
  default_scope { order('created_at DESC') }

end
