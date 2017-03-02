class Note < ApplicationRecord
  has_and_belongs_to_many :tags, join_table: :tags_notes
  accepts_nested_attributes_for :tags

  validates :title, presence: true
  validates :content, presence: true
  validates :tags, presence: true
end
