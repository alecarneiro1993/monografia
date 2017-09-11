class List < ApplicationRecord
  has_one :user, -> { where(role: "professor") }, class_name: 'User'
end
