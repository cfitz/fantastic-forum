# frozen_string_literal: true

require_relative "swagger/topics_controller"
class Api::V1::TopicsController < ApplicationController
  before_action :set_topic, only: %i(show update destroy)
  skip_before_action :authenticate_user, only: %i( index show )

  include Swaggable

  def index
    topics = Topic.includes(:user).all
    paginate json: topics.as_json
  end

  def show
    render json: @topic.as_json
  end

  def create
    @topic = Topic.new(topic_params.merge(user: current_user))
    if @topic.save
      render json: @topic.as_json
    else
      render json: @topic.errors.messages.as_json, status: 400
    end
  end

  def update
    authorize @topic
    if @topic.update(topic_params)
      render json: @topic.as_json
    else
      render json: @topic.errors.messages.as_json, status: 400
    end
  end


  def destroy
    authorize @topic
    if @topic.destroy
      head :ok
    else
      render json: @topic.errors.messages.as_json, status: 400
    end
  end

  private

    def topic_params
      params.permit(:title, :body)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
