class Question < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_and_belongs_to_many :lists
  mount_uploaders :question_images, QuestionImagesUploader
end
