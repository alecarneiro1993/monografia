class List < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :list_questions, :on => :create, :message => "can't be blank and must have at least 2 questions"
  has_many :results, :dependent => :delete_all
  has_and_belongs_to_many :questions
end
