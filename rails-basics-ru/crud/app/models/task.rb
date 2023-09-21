class Task < ApplicationRecord
  validates :name,
						:status,
						:creator,
						presence: true

	
	attribute :status, :string, default: -> { 'new' }
	attribute :completed, :boolean, default: -> { false }
end
