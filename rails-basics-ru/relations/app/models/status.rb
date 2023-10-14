# frozen_string_literal: true

class Status < ApplicationRecord
  # BEGIN
  has_many :tasks, inverse_of: :status
  # END
end
