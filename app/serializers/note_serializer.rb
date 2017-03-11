class NoteSerializer < ActiveModel::Serializer
  	attributes :id, :title, :content

		has_many :tags
end
