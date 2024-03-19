# frozen_string_literal: true

class Resume < ApplicationRecord
  validates :name, presence: true
  validates :contact, presence: true

  # BEGIN
  has_many :works, inverse_of: :resume, class_name: 'ResumeWork', dependent: :destroy
  has_many :educations, inverse_of: :resume, class_name: 'ResumeEducation', dependent: :destroy
  accepts_nested_attributes_for :works, :educations
  # END
end
