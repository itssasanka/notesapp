class Tag < ApplicationRecord
  has_and_belongs_to_many :notes, join_table: :tags_notes
  validates :name, presence: true, uniqueness: true
end
