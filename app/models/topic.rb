# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  name        :string
#  public      :boolean          default(TRUE)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  scope :visible_to, -> (user) { user ? all : where(public: true) }
  validates :name, length: { minimum: 5 }, presence: true
end
