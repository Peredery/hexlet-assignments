# frozen_string_literal: true

class Repository < ApplicationRecord
  include AASM

  validates :link, presence: true, uniqueness: true

  # BEGIN
  aasm do
    state :created, initial: true
    state :fetching
    state :fetched
    state :failed

    event :fetch do
      transitions from: %i[created fetched], to: :fetching
    end

    event :fetched do
      transitions from: :fetching, to: :fetched
    end

    event :failed do
      transitions from: :fetching, to: :failed
    end
  end
  # END
end
