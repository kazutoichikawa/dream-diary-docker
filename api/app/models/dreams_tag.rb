class DreamsTag

  include ActiveModel::Model
  attr_accessor :title, :discription, :name

  with_options presence: true do
    validates :title
    validates :description
    validates :name
  end

  def save
    dram = Dream.create(message: message, discription: discription)
    tag = Tag.create(name: name)

    DreamTagRelation.create(dream_id: dream.id, tag_id: tag.id)
  end

end
