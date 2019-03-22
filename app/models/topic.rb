class Topic < ApplicationRecord
  belongs_to :user, counter_cache: true
  validates :title, :body, presence: true

  include SwaggableModel

  def author
    user.name
  end

  def as_json(opts = { only: %i(id title body user_id created_at updated_at), methods: :author })
    super(opts)
  end
end
