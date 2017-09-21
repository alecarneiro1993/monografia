class Result < ApplicationRecord
  belongs_to :user
  belongs_to :list
  belongs_to :question
end
