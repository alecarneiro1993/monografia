class Question < ApplicationRecord
  belongs_to :user, class_name: "User"
  mount_uploaders :images, QuestionImagesUploader
  has_many :results, :dependent => :delete_all
  has_and_belongs_to_many :lists, :dependent => :delete_all

  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :description, :on => :create, :message => "can't be blank"
  validates_presence_of :images, :on => :create, :message => "needs at least 2 images"

end
