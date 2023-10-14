class Task < ApplicationRecord
  belongs_to :user, inverse_of: :tasks
  belongs_to :status, inverse_of: :tasks
end
