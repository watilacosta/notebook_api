class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  accepts_nested_attributes_for :phones, allow_destroy: true

  # def country
  #   'Brasil'
  # end

  # def kind_description
  #   kind.description
  # end

  # # Todos as actions agora utilizam este metodo.
  # def as_json(options={})
  #   super(methods: [:kind_description, :country],
  #         root: true,
  #         #include: { kind: { only: :description }}) -> COM O 'include', O JSON VEM ANINHADO
  #   )
  # end

  # FORMATANDO ATRIBUTO "birthdate" PARA pt-BR
  # def birthdate_br
  #   I18n.l(self.birthdate) if self.birthdate.present?
  # end

  # FORMATANDO ATRIBUTO 'birthdate' PARA pt-BR sem criar novo atributo
  # def to_br
  #   {
  #     name: self.name,
  #     email: self.email,
  #     birthdate: (I18n.l(self.birthdate) if self.birthdate.present?)
  #   }
  # end

  # REESCREVENDO O METODO as_json PARA FORMATAR O ATRIBUTO birthdate PARA UMA MELHOR ABORDAGEM
  def as_json(options = {})
    hash = super(options)
    hash[:birthdate] = (I18n.l(self.birthdate) if self.birthdate.present?)
    hash
  end

end
