class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index; end

  def create; end

  def step_1; end
end
