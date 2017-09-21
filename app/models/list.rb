class List < ApplicationRecord
  has_one :user, -> { where(role: "professor") }, class_name: 'User'
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :question_ids, :on => :create, :message => "can't be blank and must have at least 2 questions"
end
