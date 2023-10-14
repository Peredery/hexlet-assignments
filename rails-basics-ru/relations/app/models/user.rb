# frozen_string_literal: true

class User < ApplicationRecord
  # BEGIN
  has_many :tasks, inverse_of: :user
  # END
end
