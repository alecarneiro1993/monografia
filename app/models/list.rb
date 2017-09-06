class List < ApplicationRecord
  has_one :user, -> { where(role: "professor") }, class_name: 'User'
  has_and_belongs_to_many :questions
end
