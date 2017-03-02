class NoteSerializer < ActiveModel::Serializer
	# embed :ids, include: true
  	attributes :id, :title, :content

  	has_many :tags, :embed => :ids
end
