class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  scope :long_description, ->{ where("length(description) > 6") }
  scope :recent, ->{ where("updated_at > ?",5.days.ago) }
end
