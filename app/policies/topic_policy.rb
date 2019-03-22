# frozen_string_literal: true

class TopicPolicy
  attr_reader :user, :topic

  def initialize(user, topic)
    @user = user
    @post = topic
  end


  def update?
    @post.user_id == @user.id
  end

  def destroy?
    update?
  end
end
