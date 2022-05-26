class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :author

  belongs_to :kind #, optional: true
  has_many :phones
  has_one :address

  def author
    "Matheus Martins"
  end

  def attributes(*args)
    h = super(*args)
    # ptbr h[:birthdate] = I18n.l(object.birthdate) unless object.birthdate.blank?
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
