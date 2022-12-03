# frozen_string_literal: true

class LabShow
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :numb

  validates :numb, presence: { message: 'не может быть пустым' }
  # validates :numb, format: {with: /\d/, message: 'Пожалуйста, число'}
end
