class Question < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :list
  mount_uploaders :images, QuestionImagesUploader

  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :description, :on => :create, :message => "can't be blank"
  validates_presence_of :images, :on => :create, :message => "needs at least 2 images"

end
