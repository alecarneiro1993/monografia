class Question < ApplicationRecord
  belongs_to :users, -> { where(role: "professor") }, class_name: 'User'
  mount_uploaders :question_images, QuestionImagesUploader
end
