class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index; end

  def create; end

  def step1
    @post_form_step1 = PostFormStep1.new
    @characters = Character.all
  end

  def create_step1
    @post_form_step1 = PostFormStep1.new(post_form_step1_params)
    @characters = Character.all
    if @post_form_step1.valid?
      session[:post_title] = @post_form_step1.title
      session[:training_character] = @post_form_step1.training_character
      session[:support_characters] = [
        @post_form_step1.first_character,
        @post_form_step1.second_character,
        @post_form_step1.third_character,
        @post_form_step1.fourth_character,
        @post_form_step1.fifth_character,
        @post_form_step1.sixth_character
      ]
      redirect_to step2_path, notice: t('.to_first_chapter')
    else
      flash.now[:alert] = t('.fail')
      render :step1, status: :unprocessable_entity
    end
  end

  def step2
    @post = Post.new
    session[:support_characters]
    @selected_support_characters = Character.find(session[:support_characters])
  end

  def create_step2; end

  private

  def post_form_step1_params
    params.require(:post_form_step1).permit(
      :title,
      :training_character,
      :first_character,
      :second_character,
      :third_character,
      :fourth_character,
      :fifth_character,
      :sixth_character
    )
  end
end
