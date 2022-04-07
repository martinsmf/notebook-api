class Contact < ApplicationRecord
  # Associations
  belongs_to :kind#, optional: true
  has_many :phones
  accepts_nested_attributes_for :phones

  def birthdate_br
      I18n.l(self.birthdate) unless self.birthdate.blank?
  end

  def to_br
    { name: self.name,
      email: self.email,
      brithdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
    }
  end
  # def author
  #   "Matheus"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:author, :kind_description]
  #   )
  # end

  # def hello
  #   I18n.t('hello')
  # end

  # def i18n
  #   I18n.default_locale    
  # end
end
