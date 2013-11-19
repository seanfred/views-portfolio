class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  scope :published, where(published: true)
  translates :name, :content

  def publish!
    self.published = true
    save!
  end

  def authored_by?(user)
    author == user
  end
end
