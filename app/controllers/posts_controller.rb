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
    @post_form_step2 = PostFormStep2.new
    @now_chapter = Chapter.first
    @turns = Turn.all
    @actions = Action.all
    @selected_support_characters = Character.find(session[:support_characters])
  end

  def create_step2
    @post_form_step2 = PostFormStep2.new(post_form_step2_params)
    @now_chapter = Chapter.first
    @turns = Turn.all
    @actions = Action.all
    @selected_support_characters = Character.find(session[:support_characters])
    if @post_form_step2.valid?
      session[:chapter1_actions] = [
        @post_form_step2.first_day_action,
        @post_form_step2.second_day_action,
        @post_form_step2.third_day_action,
        @post_form_step2.fourth_day_action,
        @post_form_step2.fifth_day_action,
        @post_form_step2.sixth_day_action,
        @post_form_step2.seventh_day_action,
        @post_form_step2.eighth_day_action
      ]
      session[:chapter1_remarks] = [
        @post_form_step2.first_day_remark,
        @post_form_step2.second_day_remark,
        @post_form_step2.third_day_remark,
        @post_form_step2.fourth_day_remark,
        @post_form_step2.fifth_day_remark,
        @post_form_step2.sixth_day_remark,
        @post_form_step2.seventh_day_remark,
        @post_form_step2.eighth_day_remark
      ]
      redirect_to step3_path, notice: t('.to_second_chapter')
    else
      flash.now[:alert] = t('.fail')
      render :step2, status: :unprocessable_entity
    end
  end

  def step3
    @selected_chapter1_remarks = session[:chapter1_remarks]
  end

  def create_step3; end

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

  def post_form_step2_params
    params.require(:post_form_step2).permit(
      # 行動選択用
      :first_day_action,
      :second_day_action,
      :third_day_action,
      :fourth_day_action,
      :fifth_day_action,
      :sixth_day_action,
      :seventh_day_action,
      :eighth_day_action,
      # 備考欄用
      :first_day_remark,
      :second_day_remark,
      :third_day_remark,
      :fourth_day_remark,
      :fifth_day_remark,
      :sixth_day_remark,
      :seventh_day_remark,
      :eighth_day_remark
    )
  end
end
