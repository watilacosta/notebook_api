class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  # ASSOCIATIONS
  belongs_to :kind do
    link(:related) { kind_url(object.kind) }
  end
  has_many :phones
  has_one :address

  # LINKS (HATEOAS)
  # link(:self) { contact_url(object) }
  # link(:kind) { kind_url(object.kind) }

  def attributes(*args)
    hash = super(*args)
    # hash[:birthdate] = (I18n.l(object.birthdate) if object.birthdate.present?) # -> Formato pt-br
    hash[:birthdate] = object.birthdate.to_time.iso8601 if object.birthdate.present? # -> Formato da norma ISO 8601
    hash
  end

  # Adiciona dados meta no json retornado
  meta do
    {
      author: 'Wátila'
    }
  end
end
