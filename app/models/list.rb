class List < ApplicationRecord
  belongs_to :user, -> { where(role: "professor") }, class_name: 'User'
  has_many :questions
end
