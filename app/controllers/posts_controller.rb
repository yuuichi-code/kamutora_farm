class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index; end

  def create; end

  # 投稿タイトル、修行仲間選択用
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

  # 1巻の修行手順登録用
  def step2
    @post_form_step2 = PostFormStep2.new
    @now_chapter = Chapter.first
    @turns = Turn.all
    @actions = Action.all
    @flower_seeds = FlowerSeed.all
    @selected_support_characters = Character.find(session[:support_characters])
    @farm_places = FarmPlace.all
  end

  def create_step2
    @post_form_step2 = PostFormStep2.new(post_form_step2_params)
    @now_chapter = Chapter.first
    @turns = Turn.all
    @actions = Action.all
    @flower_seeds = FlowerSeed.all
    @selected_support_characters = Character.find(session[:support_characters])
    if @post_form_step2.valid?
      # チャプター1行動選択用
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
      # チャプター1備考欄用
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
      # チャプター1畑1の種用
      session[:chapter1_farm1_seeds] = [
        @post_form_step2.day2_farm1_seed,
        @post_form_step2.day3_farm1_seed,
        @post_form_step2.day4_farm1_seed,
        @post_form_step2.day5_farm1_seed,
        @post_form_step2.day6_farm1_seed,
        @post_form_step2.day7_farm1_seed,
        @post_form_step2.day8_farm1_seed
      ]
      # チャプター1畑1の設置キャラクター用
      session[:chapter1_farm1_characters] = [
        @post_form_step2.day2_farm1_character,
        @post_form_step2.day3_farm1_character,
        @post_form_step2.day4_farm1_character,
        @post_form_step2.day5_farm1_character,
        @post_form_step2.day6_farm1_character,
        @post_form_step2.day7_farm1_character,
        @post_form_step2.day8_farm1_character
      ]
      # チャプター1畑2の種用
      session[:chapter1_farm2_seeds] = [
        @post_form_step2.day2_farm2_seed,
        @post_form_step2.day3_farm2_seed,
        @post_form_step2.day4_farm2_seed,
        @post_form_step2.day5_farm2_seed,
        @post_form_step2.day6_farm2_seed,
        @post_form_step2.day7_farm2_seed,
        @post_form_step2.day8_farm2_seed
      ]
      # チャプター1畑2の設置キャラクター用
      session[:chapter1_farm2_characters] = [
        @post_form_step2.day2_farm2_character,
        @post_form_step2.day3_farm2_character,
        @post_form_step2.day4_farm2_character,
        @post_form_step2.day5_farm2_character,
        @post_form_step2.day6_farm2_character,
        @post_form_step2.day7_farm2_character,
        @post_form_step2.day8_farm2_character
      ]
      # チャプター1畑3の種用
      session[:chapter1_farm3_seeds] = [
        @post_form_step2.day6_farm3_seed,
        @post_form_step2.day7_farm3_seed,
        @post_form_step2.day8_farm3_seed
      ]
      # チャプター1畑3の設置キャラクター用
      session[:chapter1_farm3_characters] = [
        @post_form_step2.day6_farm3_character,
        @post_form_step2.day7_farm3_character,
        @post_form_step2.day8_farm3_character
      ]
      # チャプター1畑4の種用
      session[:chapter1_farm4_seeds] = [
        @post_form_step2.day7_farm4_seed,
        @post_form_step2.day8_farm4_seed
      ]
      # チャプター1畑4の設置キャラクター用
      session[:chapter1_farm4_characters] = [
        @post_form_step2.day7_farm4_character,
        @post_form_step2.day8_farm4_character
      ]
      # チャプター1畑5の種用
      session[:chapter1_farm5_seeds] = [
        @post_form_step2.day8_farm5_seed
      ]
      # チャプター1畑5の設置キャラクター用
      session[:chapter1_farm5_characters] = [
        @post_form_step2.day8_farm5_character
      ]
      redirect_to step3_path, notice: t('.to_second_chapter')
    else
      flash.now[:alert] = t('.fail')
      render :step2, status: :unprocessable_entity
    end
  end

  # 2巻の修行手順登録用
  def step3
    @selected_chapter1_remarks = session[:chapter1_remarks]
  end

  def create_step3; end

  def step4
    @post_form_step4 = PostFormStep4.new
  end

  def create_step4
    @post_form_step4 = PostFormStep4.new(post_form_step4_params)
    render :step4, status: :unprocessable_entity
  end

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
      :eighth_day_remark,
      # 1の畑の種用
      :day2_farm1_seed,
      :day3_farm1_seed,
      :day4_farm1_seed,
      :day5_farm1_seed,
      :day6_farm1_seed,
      :day7_farm1_seed,
      :day8_farm1_seed,
      # 1の畑の設置キャラクター用
      :day2_farm1_character,
      :day3_farm1_character,
      :day4_farm1_character,
      :day5_farm1_character,
      :day6_farm1_character,
      :day7_farm1_character,
      :day8_farm1_character,
      # 2の畑の種用
      :day2_farm2_seed,
      :day3_farm2_seed,
      :day4_farm2_seed,
      :day5_farm2_seed,
      :day6_farm2_seed,
      :day7_farm2_seed,
      :day8_farm2_seed,
      # 2の畑の設置キャラクター用
      :day2_farm2_character,
      :day3_farm2_character,
      :day4_farm2_character,
      :day5_farm2_character,
      :day6_farm2_character,
      :day7_farm2_character,
      :day8_farm2_character,
      # 3の畑の種用
      :day6_farm3_seed,
      :day7_farm3_seed,
      :day8_farm3_seed,
      # 3の畑の設置キャラクター用
      :day6_farm3_character,
      :day7_farm3_character,
      :day8_farm3_character,
      # 4の畑の種用
      :day7_farm4_seed,
      :day8_farm4_seed,
      # 4の畑の設置キャラクター用
      :day7_farm4_character,
      :day8_farm4_character,
      # 5の畑の種用
      :day8_farm5_seed,
      # 5の畑の設置キャラクター用
      :day8_farm5_character
    )
  end

  def post_form_step4_params
    params.require(:post_form_step4).permit(body: [])
  end
end
