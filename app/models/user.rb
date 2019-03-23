# frozen_string_literal: true

class User < ApplicationRecord
  include SwaggableModel
  has_many :topics, dependent: :destroy

  has_secure_password
  validates :email, :name,  :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }

  def as_json(opts = { only: %i(id email name topics_count) })
    super(opts)
  end
end
