class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :tag_ids
end
