class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  # ASSOCIATIONS
  belongs_to :kind
  has_many :phones
  has_one :address

  def attributes(*args)
    hash = super(*args)
    # hash[:birthdate] = (I18n.l(object.birthdate) if object.birthdate.present?) # -> Formato pt-br
    hash[:birthdate] = object.birthdate.to_time.iso8601 if object.birthdate.present? # -> Formato da norma ISO 8601
    hash
  end
end
