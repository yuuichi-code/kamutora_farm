class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @posts = Post.all
  end

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
      flash.now[:alert] = t('defaults.reenter')
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
    @farm_places = FarmPlace.all
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
        {
          remark: @post_form_step2.first_day_remark,
          chapter_turn: ChapterTurn.chapter1_turn1
        },
        {
          remark: @post_form_step2.second_day_remark,
          chapter_turn: ChapterTurn.chapter1_turn2
        },
        {
          remark: @post_form_step2.third_day_remark,
          chapter_turn: ChapterTurn.chapter1_turn3
        },
        {
          remark: @post_form_step2.fourth_day_remark,
          chapter_turn: ChapterTurn.chapter1_turn4
        },
        {
          remark: @post_form_step2.fifth_day_remark,
          chapter_turn: ChapterTurn.chapter1_turn5
        },
        {
          remark: @post_form_step2.sixth_day_remark,
          chapter_turn: ChapterTurn.chapter1_turn6
        },
        {
          remark: @post_form_step2.seventh_day_remark,
          chapter_turn: ChapterTurn.chapter1_turn7
        },
        {
          remark: @post_form_step2.eighth_day_remark,
          chapter_turn: ChapterTurn.chapter1_turn8
        }
      ].reject { |hash| hash[:remark].nil? }
      # チャプター1畑1の種用
      session[:chapter1_farm1_seeds] = [
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step2.day2_farm1_seed,
          chapter_turn: ChapterTurn.chapter1_turn2
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step2.day3_farm1_seed,
          chapter_turn: ChapterTurn.chapter1_turn3
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step2.day4_farm1_seed,
          chapter_turn: ChapterTurn.chapter1_turn4
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step2.day5_farm1_seed,
          chapter_turn: ChapterTurn.chapter1_turn5
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step2.day6_farm1_seed,
          chapter_turn: ChapterTurn.chapter1_turn6
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step2.day7_farm1_seed,
          chapter_turn: ChapterTurn.chapter1_turn7
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step2.day8_farm1_seed,
          chapter_turn: ChapterTurn.chapter1_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター1畑1の設置キャラクター用
      session[:chapter1_farm1_characters] = [
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step2.day2_farm1_character,
          chapter_turn: ChapterTurn.chapter1_turn2
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step2.day3_farm1_character,
          chapter_turn: ChapterTurn.chapter1_turn3
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step2.day4_farm1_character,
          chapter_turn: ChapterTurn.chapter1_turn4
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step2.day5_farm1_character,
          chapter_turn: ChapterTurn.chapter1_turn5
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step2.day6_farm1_character,
          chapter_turn: ChapterTurn.chapter1_turn6
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step2.day7_farm1_character,
          chapter_turn: ChapterTurn.chapter1_turn7
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step2.day8_farm1_character,
          chapter_turn: ChapterTurn.chapter1_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター1畑2の種用
      session[:chapter1_farm2_seeds] = [
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step2.day2_farm2_seed,
          chapter_turn: ChapterTurn.chapter1_turn2
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step2.day3_farm2_seed,
          chapter_turn: ChapterTurn.chapter1_turn3
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step2.day4_farm2_seed,
          chapter_turn: ChapterTurn.chapter1_turn4
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step2.day5_farm2_seed,
          chapter_turn: ChapterTurn.chapter1_turn5
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step2.day6_farm2_seed,
          chapter_turn: ChapterTurn.chapter1_turn6
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step2.day7_farm2_seed,
          chapter_turn: ChapterTurn.chapter1_turn7
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step2.day8_farm2_seed,
          chapter_turn: ChapterTurn.chapter1_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター1畑2の設置キャラクター用
      session[:chapter1_farm2_characters] = [
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step2.day2_farm2_character,
          chapter_turn: ChapterTurn.chapter1_turn2
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step2.day3_farm2_character,
          chapter_turn: ChapterTurn.chapter1_turn3
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step2.day4_farm2_character,
          chapter_turn: ChapterTurn.chapter1_turn4
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step2.day5_farm2_character,
          chapter_turn: ChapterTurn.chapter1_turn5
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step2.day6_farm2_character,
          chapter_turn: ChapterTurn.chapter1_turn6
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step2.day7_farm2_character,
          chapter_turn: ChapterTurn.chapter1_turn7
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step2.day8_farm2_character,
          chapter_turn: ChapterTurn.chapter1_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター1畑3の種用
      session[:chapter1_farm3_seeds] = [
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step2.day6_farm3_seed,
          chapter_turn: ChapterTurn.chapter1_turn2
        },
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step2.day7_farm3_seed,
          chapter_turn: ChapterTurn.chapter1_turn3
        },
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step2.day8_farm3_seed,
          chapter_turn: ChapterTurn.chapter1_turn4
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター1畑3の設置キャラクター用
      session[:chapter1_farm3_characters] = [
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step2.day6_farm3_character,
          chapter_turn: ChapterTurn.chapter1_turn2
        },
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step2.day7_farm3_character,
          chapter_turn: ChapterTurn.chapter1_turn3
        },
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step2.day8_farm3_character,
          chapter_turn: ChapterTurn.chapter1_turn4
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター1畑4の種用
      session[:chapter1_farm4_seeds] = [
        {
          farm_place: FarmPlace.place4,
          seed: @post_form_step2.day7_farm4_seed,
          chapter_turn: ChapterTurn.chapter1_turn2
        },
        {
          farm_place: FarmPlace.place4,
          seed: @post_form_step2.day8_farm4_seed,
          chapter_turn: ChapterTurn.chapter1_turn3
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター1畑4の設置キャラクター用
      session[:chapter1_farm4_characters] = [
        {
          farm_place: FarmPlace.place4,
          character: @post_form_step2.day7_farm4_character,
          chapter_turn: ChapterTurn.chapter1_turn3
        },
        {
          farm_place: FarmPlace.place4,
          character: @post_form_step2.day8_farm4_character,
          chapter_turn: ChapterTurn.chapter1_turn4
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター1畑5の種用
      session[:chapter1_farm5_seeds] = [
        {
          farm_place: FarmPlace.place5,
          seed: @post_form_step2.day8_farm5_seed,
          chapter_turn: ChapterTurn.chapter1_turn3
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター1畑5の設置キャラクター用
      session[:chapter1_farm5_characters] = [
        {
          farm_place: FarmPlace.place5,
          character: @post_form_step2.day8_farm5_character,
          chapter_turn: ChapterTurn.chapter1_turn4
        }
      ].reject { |hash| hash[:character].nil? }
      redirect_to step3_path, notice: t('.to_second_chapter')
    else
      flash.now[:alert] = t('defaults.reenter')
      render :step2, status: :unprocessable_entity
    end
  end

  # 2巻の修行手順登録用
  def step3
    @post_form_step3 = PostFormStep3.new
    @now_chapter = Chapter.second
    @turns = Turn.all
    @actions = Action.all
    @flower_seeds = FlowerSeed.all
    @selected_support_characters = Character.find(session[:support_characters])
    @farm_places = FarmPlace.all
  end

  def create_step3
    @post_form_step3 = PostFormStep3.new(post_form_step3_params)
    @now_chapter = Chapter.second
    @turns = Turn.all
    @actions = Action.all
    @flower_seeds = FlowerSeed.all
    @selected_support_characters = Character.find(session[:support_characters])
    @farm_places = FarmPlace.all
    if @post_form_step3.valid?
      # チャプター2行動選択用
      session[:chapter2_actions] = [
        @post_form_step3.first_day_action,
        @post_form_step3.second_day_action,
        @post_form_step3.third_day_action,
        @post_form_step3.fourth_day_action,
        @post_form_step3.fifth_day_action,
        @post_form_step3.sixth_day_action,
        @post_form_step3.seventh_day_action,
        @post_form_step3.eighth_day_action
      ]
      # チャプター2備考欄用
      session[:chapter2_remarks] = [
        {
          remark: @post_form_step3.first_day_remark,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          remark: @post_form_step3.second_day_remark,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          remark: @post_form_step3.third_day_remark,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          remark: @post_form_step3.fourth_day_remark,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          remark: @post_form_step3.fifth_day_remark,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          remark: @post_form_step3.sixth_day_remark,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          remark: @post_form_step3.seventh_day_remark,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          remark: @post_form_step3.eighth_day_remark,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:remark].nil? }
      # チャプター2畑1の種用
      session[:chapter2_farm1_seeds] = [
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step3.day1_farm1_seed,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step3.day2_farm1_seed,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step3.day3_farm1_seed,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step3.day4_farm1_seed,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step3.day5_farm1_seed,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step3.day6_farm1_seed,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step3.day7_farm1_seed,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place1,
          seed: @post_form_step3.day8_farm1_seed,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター2畑1の設置キャラクター用
      session[:chapter2_farm1_characters] = [
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step3.day2_farm1_character,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step3.day2_farm1_character,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step3.day3_farm1_character,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step3.day4_farm1_character,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step3.day5_farm1_character,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step3.day6_farm1_character,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step3.day7_farm1_character,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place1,
          character: @post_form_step3.day8_farm1_character,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター2畑2の種用
      session[:chapter2_farm2_seeds] = [
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step3.day1_farm2_seed,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step3.day2_farm2_seed,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step3.day3_farm2_seed,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step3.day4_farm2_seed,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step3.day5_farm2_seed,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step3.day6_farm2_seed,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step3.day7_farm2_seed,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place2,
          seed: @post_form_step3.day8_farm2_seed,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター2畑2の設置キャラクター用
      session[:chapter2_farm2_characters] = [
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step3.day1_farm2_character,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step3.day2_farm2_character,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step3.day3_farm2_character,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step3.day4_farm2_character,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step3.day5_farm2_character,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step3.day6_farm2_character,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step3.day7_farm2_character,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place2,
          character: @post_form_step3.day8_farm2_character,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター2畑3の種用
      session[:chapter2_farm3_seeds] = [
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step3.day1_farm3_seed,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step3.day2_farm3_seed,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step3.day3_farm3_seed,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step3.day4_farm3_seed,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step3.day5_farm3_seed,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step3.day6_farm3_seed,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step3.day7_farm3_seed,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place3,
          seed: @post_form_step3.day8_farm3_seed,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター2畑3の設置キャラクター用
      session[:chapter2_farm3_characters] = [
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step3.day1_farm3_character,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step3.day2_farm3_character,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step3.day3_farm3_character,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step3.day4_farm3_character,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step3.day5_farm3_character,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step3.day6_farm3_character,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step3.day7_farm3_character,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place3,
          character: @post_form_step3.day8_farm3_character,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター2畑4の種用
      session[:chapter2_farm4_seeds] = [
        {
          farm_place: FarmPlace.place4,
          seed: @post_form_step3.day1_farm4_seed,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place4,
          seed: @post_form_step3.day2_farm4_seed,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place4,
          seed: @post_form_step3.day3_farm4_seed,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place4,
          seed: @post_form_step3.day4_farm4_seed,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place4,
          seed: @post_form_step3.day5_farm4_seed,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place4,
          seed: @post_form_step3.day6_farm4_seed,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place4,
          seed: @post_form_step3.day7_farm4_seed,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place4,
          seed: @post_form_step3.day8_farm4_seed,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター2畑4の設置キャラクター用
      session[:chapter2_farm4_characters] = [
        {
          farm_place: FarmPlace.place4,
          character: @post_form_step3.day1_farm4_character,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place4,
          character: @post_form_step3.day2_farm4_character,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place4,
          character: @post_form_step3.day3_farm4_character,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place4,
          character: @post_form_step3.day4_farm4_character,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place4,
          character: @post_form_step3.day5_farm4_character,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place4,
          character: @post_form_step3.day6_farm4_character,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place4,
          character: @post_form_step3.day7_farm4_character,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place4,
          character: @post_form_step3.day8_farm4_character,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター2畑5の種用
      session[:chapter2_farm5_seeds] = [
        {
          farm_place: FarmPlace.place5,
          seed: @post_form_step3.day1_farm5_seed,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place5,
          seed: @post_form_step3.day2_farm5_seed,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place5,
          seed: @post_form_step3.day3_farm5_seed,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place5,
          seed: @post_form_step3.day4_farm5_seed,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place5,
          seed: @post_form_step3.day5_farm5_seed,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place5,
          seed: @post_form_step3.day6_farm5_seed,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place5,
          seed: @post_form_step3.day7_farm5_seed,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place5,
          seed: @post_form_step3.day8_farm5_seed,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター2畑5の設置キャラクター用
      session[:chapter2_farm5_characters] = [
        {
          farm_place: FarmPlace.place5,
          character: @post_form_step3.day1_farm5_character,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place5,
          character: @post_form_step3.day2_farm5_character,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place5,
          character: @post_form_step3.day3_farm5_character,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place5,
          character: @post_form_step3.day4_farm5_character,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place5,
          character: @post_form_step3.day5_farm5_character,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place5,
          character: @post_form_step3.day6_farm5_character,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place5,
          character: @post_form_step3.day7_farm5_character,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place5,
          character: @post_form_step3.day8_farm5_character,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター2畑6の種用
      session[:chapter2_farm6_seeds] = [
        {
          farm_place: FarmPlace.place6,
          seed: @post_form_step3.day1_farm6_seed,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place6,
          seed: @post_form_step3.day2_farm6_seed,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place6,
          seed: @post_form_step3.day3_farm6_seed,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place6,
          seed: @post_form_step3.day4_farm6_seed,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place6,
          seed: @post_form_step3.day5_farm6_seed,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place6,
          seed: @post_form_step3.day6_farm6_seed,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place6,
          seed: @post_form_step3.day7_farm6_seed,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place6,
          seed: @post_form_step3.day8_farm6_seed,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター2畑6の設置キャラクター用
      session[:chapter2_farm6_characters] = [
        {
          farm_place: FarmPlace.place6,
          character: @post_form_step3.day1_farm6_character,
          chapter_turn: ChapterTurn.chapter2_turn1
        },
        {
          farm_place: FarmPlace.place6,
          character: @post_form_step3.day2_farm6_character,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place6,
          character: @post_form_step3.day3_farm6_character,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place6,
          character: @post_form_step3.day4_farm6_character,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place6,
          character: @post_form_step3.day5_farm6_character,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place6,
          character: @post_form_step3.day6_farm6_character,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place6,
          character: @post_form_step3.day7_farm6_character,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place6,
          character: @post_form_step3.day8_farm6_character,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター2畑7の種用
      session[:chapter2_farm7_seeds] = [
        {
          farm_place: FarmPlace.place7,
          seed: @post_form_step3.day2_farm7_seed,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place7,
          seed: @post_form_step3.day3_farm7_seed,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place7,
          seed: @post_form_step3.day4_farm7_seed,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place7,
          seed: @post_form_step3.day5_farm7_seed,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place7,
          seed: @post_form_step3.day6_farm7_seed,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place7,
          seed: @post_form_step3.day7_farm7_seed,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place7,
          seed: @post_form_step3.day8_farm7_seed,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター2畑7の設置キャラクター用
      session[:chapter2_farm7_characters] = [
        {
          farm_place: FarmPlace.place7,
          character: @post_form_step3.day2_farm7_character,
          chapter_turn: ChapterTurn.chapter2_turn2
        },
        {
          farm_place: FarmPlace.place7,
          character: @post_form_step3.day3_farm7_character,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place7,
          character: @post_form_step3.day4_farm7_character,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place7,
          character: @post_form_step3.day5_farm7_character,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place7,
          character: @post_form_step3.day6_farm7_character,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place7,
          character: @post_form_step3.day7_farm7_character,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place7,
          character: @post_form_step3.day8_farm7_character,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター2畑8の種用
      session[:chapter2_farm8_seeds] = [
        {
          farm_place: FarmPlace.place8,
          seed: @post_form_step3.day3_farm8_seed,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place8,
          seed: @post_form_step3.day4_farm8_seed,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place8,
          seed: @post_form_step3.day5_farm8_seed,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place8,
          seed: @post_form_step3.day6_farm8_seed,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place8,
          seed: @post_form_step3.day7_farm8_seed,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place8,
          seed: @post_form_step3.day8_farm8_seed,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター2畑8の設置キャラクター用
      session[:chapter2_farm8_characters] = [
        {
          farm_place: FarmPlace.place8,
          character: @post_form_step3.day3_farm8_character,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place8,
          character: @post_form_step3.day4_farm8_character,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place8,
          character: @post_form_step3.day5_farm8_character,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place8,
          character: @post_form_step3.day6_farm8_character,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place8,
          character: @post_form_step3.day7_farm8_character,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place8,
          character: @post_form_step3.day8_farm8_character,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      # チャプター2畑9の種用
      session[:chapter2_farm9_seeds] = [
        {
          farm_place: FarmPlace.place9,
          seed: @post_form_step3.day3_farm9_seed,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place9,
          seed: @post_form_step3.day4_farm9_seed,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place9,
          seed: @post_form_step3.day5_farm9_seed,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place9,
          seed: @post_form_step3.day6_farm9_seed,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place9,
          seed: @post_form_step3.day7_farm9_seed,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place9,
          seed: @post_form_step3.day8_farm9_seed,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:seed].nil? }
      # チャプター2畑9の設置キャラクター用
      session[:chapter2_farm9_characters] = [
        {
          farm_place: FarmPlace.place9,
          character: @post_form_step3.day3_farm9_character,
          chapter_turn: ChapterTurn.chapter2_turn3
        },
        {
          farm_place: FarmPlace.place9,
          character: @post_form_step3.day4_farm9_character,
          chapter_turn: ChapterTurn.chapter2_turn4
        },
        {
          farm_place: FarmPlace.place9,
          character: @post_form_step3.day5_farm9_character,
          chapter_turn: ChapterTurn.chapter2_turn5
        },
        {
          farm_place: FarmPlace.place9,
          character: @post_form_step3.day6_farm9_character,
          chapter_turn: ChapterTurn.chapter2_turn6
        },
        {
          farm_place: FarmPlace.place9,
          character: @post_form_step3.day7_farm9_character,
          chapter_turn: ChapterTurn.chapter2_turn7
        },
        {
          farm_place: FarmPlace.place9,
          character: @post_form_step3.day8_farm9_character,
          chapter_turn: ChapterTurn.chapter2_turn8
        }
      ].reject { |hash| hash[:character].nil? }
      redirect_to step4_path, notice: t('.to_third_chapter')
    else
      flash.now[:alert] = t('defaults.reenter')
      render :step3, status: :unprocessable_entity
    end
  end

  def step4
    @post_form_step4 = PostFormStep4.new
    @now_chapter = Chapter.third
    @turns = Turn.all
    @actions = Action.all
    @flower_seeds = FlowerSeed.all
    @selected_support_characters = Character.find(session[:support_characters])
    @farm_places = FarmPlace.all
  end

  def create_step4
    @post_form_step4 = PostFormStep4.new(post_form_step4_params)
    @now_chapter = Chapter.third
    @turns = Turn.all
    @actions = Action.all
    @flower_seeds = FlowerSeed.all
    @selected_support_characters = Character.find(session[:support_characters])
    @farm_places = FarmPlace.all
    if @post_form_step4.valid?
      # チャプター3行動選択用
      session[:chapter3_actions] = [
        @post_form_step4.first_day_action,
        @post_form_step4.second_day_action,
        @post_form_step4.third_day_action,
        @post_form_step4.fourth_day_action,
        @post_form_step4.fifth_day_action,
        @post_form_step4.sixth_day_action,
        @post_form_step4.seventh_day_action,
        @post_form_step4.eighth_day_action
      ]
      # チャプター3備考欄用
      session[:chapter3_remarks] = [
        @post_form_step4.first_day_remark,
        @post_form_step4.second_day_remark,
        @post_form_step4.third_day_remark,
        @post_form_step4.fourth_day_remark,
        @post_form_step4.fifth_day_remark,
        @post_form_step4.sixth_day_remark,
        @post_form_step4.seventh_day_remark,
        @post_form_step4.eighth_day_remark
      ]
      # チャプター3畑1の種用
      session[:chapter3_farm1_seeds] = [
        @post_form_step4.day1_farm1_seed,
        @post_form_step4.day2_farm1_seed,
        @post_form_step4.day3_farm1_seed,
        @post_form_step4.day4_farm1_seed,
        @post_form_step4.day5_farm1_seed,
        @post_form_step4.day6_farm1_seed,
        @post_form_step4.day7_farm1_seed,
        @post_form_step4.day8_farm1_seed
      ]
      # チャプター3畑1の設置キャラクター用
      session[:chapter3_farm1_characters] = [
        @post_form_step4.day1_farm1_character,
        @post_form_step4.day2_farm1_character,
        @post_form_step4.day3_farm1_character,
        @post_form_step4.day4_farm1_character,
        @post_form_step4.day5_farm1_character,
        @post_form_step4.day6_farm1_character,
        @post_form_step4.day7_farm1_character,
        @post_form_step4.day8_farm1_character
      ]
      # チャプター3畑2の種用
      session[:chapter3_farm2_seeds] = [
        @post_form_step4.day1_farm2_seed,
        @post_form_step4.day2_farm2_seed,
        @post_form_step4.day3_farm2_seed,
        @post_form_step4.day4_farm2_seed,
        @post_form_step4.day5_farm2_seed,
        @post_form_step4.day6_farm2_seed,
        @post_form_step4.day7_farm2_seed,
        @post_form_step4.day8_farm2_seed
      ]
      # チャプター3畑2の設置キャラクター用
      session[:chapter3_farm2_characters] = [
        @post_form_step4.day1_farm2_character,
        @post_form_step4.day2_farm2_character,
        @post_form_step4.day3_farm2_character,
        @post_form_step4.day4_farm2_character,
        @post_form_step4.day5_farm2_character,
        @post_form_step4.day6_farm2_character,
        @post_form_step4.day7_farm2_character,
        @post_form_step4.day8_farm2_character
      ]
      # チャプター3畑3の種用
      session[:chapter3_farm3_seeds] = [
        @post_form_step4.day1_farm3_seed,
        @post_form_step4.day2_farm3_seed,
        @post_form_step4.day3_farm3_seed,
        @post_form_step4.day4_farm3_seed,
        @post_form_step4.day5_farm3_seed,
        @post_form_step4.day6_farm3_seed,
        @post_form_step4.day7_farm3_seed,
        @post_form_step4.day8_farm3_seed
      ]
      # チャプター3畑3の設置キャラクター用
      session[:chapter3_farm3_characters] = [
        @post_form_step4.day1_farm3_character,
        @post_form_step4.day2_farm3_character,
        @post_form_step4.day3_farm3_character,
        @post_form_step4.day4_farm3_character,
        @post_form_step4.day5_farm3_character,
        @post_form_step4.day6_farm3_character,
        @post_form_step4.day7_farm3_character,
        @post_form_step4.day8_farm3_character
      ]
      # チャプター3畑4の種用
      session[:chapter3_farm4_seeds] = [
        @post_form_step4.day1_farm4_seed,
        @post_form_step4.day2_farm4_seed,
        @post_form_step4.day3_farm4_seed,
        @post_form_step4.day4_farm4_seed,
        @post_form_step4.day5_farm4_seed,
        @post_form_step4.day6_farm4_seed,
        @post_form_step4.day7_farm4_seed,
        @post_form_step4.day8_farm4_seed
      ]
      # チャプター3畑4の設置キャラクター用
      session[:chapter3_farm4_characters] = [
        @post_form_step4.day1_farm4_character,
        @post_form_step4.day2_farm4_character,
        @post_form_step4.day3_farm4_character,
        @post_form_step4.day4_farm4_character,
        @post_form_step4.day5_farm4_character,
        @post_form_step4.day6_farm4_character,
        @post_form_step4.day7_farm4_character,
        @post_form_step4.day8_farm4_character
      ]
      # チャプター3畑5の種用
      session[:chapter3_farm5_seeds] = [
        @post_form_step4.day1_farm5_seed,
        @post_form_step4.day2_farm5_seed,
        @post_form_step4.day3_farm5_seed,
        @post_form_step4.day4_farm5_seed,
        @post_form_step4.day5_farm5_seed,
        @post_form_step4.day6_farm5_seed,
        @post_form_step4.day7_farm5_seed,
        @post_form_step4.day8_farm5_seed
      ]
      # チャプター3畑5の設置キャラクター用
      session[:chapter3_farm5_characters] = [
        @post_form_step4.day1_farm5_character,
        @post_form_step4.day2_farm5_character,
        @post_form_step4.day3_farm5_character,
        @post_form_step4.day4_farm5_character,
        @post_form_step4.day5_farm5_character,
        @post_form_step4.day6_farm5_character,
        @post_form_step4.day7_farm5_character,
        @post_form_step4.day8_farm5_character
      ]
      # チャプター3畑6の種用
      session[:chapter3_farm6_seeds] = [
        @post_form_step4.day1_farm6_seed,
        @post_form_step4.day2_farm6_seed,
        @post_form_step4.day3_farm6_seed,
        @post_form_step4.day4_farm6_seed,
        @post_form_step4.day5_farm6_seed,
        @post_form_step4.day6_farm6_seed,
        @post_form_step4.day7_farm6_seed,
        @post_form_step4.day8_farm6_seed
      ]
      # チャプター3畑6の設置キャラクター用
      session[:chapter3_farm6_characters] = [
        @post_form_step4.day1_farm6_character,
        @post_form_step4.day2_farm6_character,
        @post_form_step4.day3_farm6_character,
        @post_form_step4.day4_farm6_character,
        @post_form_step4.day5_farm6_character,
        @post_form_step4.day6_farm6_character,
        @post_form_step4.day7_farm6_character,
        @post_form_step4.day8_farm6_character
      ]
      # チャプター3畑7の種用
      session[:chapter3_farm7_seeds] = [
        @post_form_step4.day1_farm7_seed,
        @post_form_step4.day2_farm7_seed,
        @post_form_step4.day3_farm7_seed,
        @post_form_step4.day4_farm7_seed,
        @post_form_step4.day5_farm7_seed,
        @post_form_step4.day6_farm7_seed,
        @post_form_step4.day7_farm7_seed,
        @post_form_step4.day8_farm7_seed
      ]
      # チャプター3畑7の設置キャラクター用
      session[:chapter3_farm7_characters] = [
        @post_form_step4.day1_farm7_character,
        @post_form_step4.day2_farm7_character,
        @post_form_step4.day3_farm7_character,
        @post_form_step4.day4_farm7_character,
        @post_form_step4.day5_farm7_character,
        @post_form_step4.day6_farm7_character,
        @post_form_step4.day7_farm7_character,
        @post_form_step4.day8_farm7_character
      ]
      # チャプター3畑8の種用
      session[:chapter3_farm8_seeds] = [
        @post_form_step4.day1_farm8_seed,
        @post_form_step4.day2_farm8_seed,
        @post_form_step4.day3_farm8_seed,
        @post_form_step4.day4_farm8_seed,
        @post_form_step4.day5_farm8_seed,
        @post_form_step4.day6_farm8_seed,
        @post_form_step4.day7_farm8_seed,
        @post_form_step4.day8_farm8_seed
      ]
      # チャプター3畑8の設置キャラクター用
      session[:chapter3_farm8_characters] = [
        @post_form_step4.day1_farm8_character,
        @post_form_step4.day2_farm8_character,
        @post_form_step4.day3_farm8_character,
        @post_form_step4.day4_farm8_character,
        @post_form_step4.day5_farm8_character,
        @post_form_step4.day6_farm8_character,
        @post_form_step4.day7_farm8_character,
        @post_form_step4.day8_farm8_character
      ]
      # チャプター3畑9の種用
      session[:chapter3_farm9_seeds] = [
        @post_form_step4.day1_farm9_seed,
        @post_form_step4.day2_farm9_seed,
        @post_form_step4.day3_farm9_seed,
        @post_form_step4.day4_farm9_seed,
        @post_form_step4.day5_farm9_seed,
        @post_form_step4.day6_farm9_seed,
        @post_form_step4.day7_farm9_seed,
        @post_form_step4.day8_farm9_seed
      ]
      # チャプター3畑9の設置キャラクター用
      session[:chapter3_farm9_characters] = [
        @post_form_step4.day1_farm9_character,
        @post_form_step4.day2_farm9_character,
        @post_form_step4.day3_farm9_character,
        @post_form_step4.day4_farm9_character,
        @post_form_step4.day5_farm9_character,
        @post_form_step4.day6_farm9_character,
        @post_form_step4.day7_farm9_character,
        @post_form_step4.day8_farm9_character
      ]
      redirect_to step5_path, notice: t('.to_fourth_chapter')
    else
      flash.now[:alert] = t('defaults.reenter')
      render :step4, status: :unprocessable_entity
    end
  end

  def step5
    @post_form_step5 = PostFormStep5.new
    @now_chapter = Chapter.fourth
    @turns = Turn.all
    @actions = Action.all
    @flower_seeds = FlowerSeed.all
    @selected_support_characters = Character.find(session[:support_characters])
    @farm_places = FarmPlace.all
  end

  def create_step5
    @post_form_step5 = PostFormStep5.new(post_form_step5_params)
    @now_chapter = Chapter.fourth
    @turns = Turn.all
    @actions = Action.all
    @flower_seeds = FlowerSeed.all
    @selected_support_characters = Character.find(session[:support_characters])
    @farm_places = FarmPlace.all
    if @post_form_step5.valid?
      # チャプター4行動選択用
      session[:chapter4_actions] = [
        @post_form_step5.first_day_action,
        @post_form_step5.second_day_action,
        @post_form_step5.third_day_action,
        @post_form_step5.fourth_day_action,
        @post_form_step5.fifth_day_action,
        @post_form_step5.sixth_day_action,
        @post_form_step5.seventh_day_action,
        @post_form_step5.eighth_day_action
      ]
      # チャプター4備考欄用
      session[:chapter4_remarks] = [
        @post_form_step5.first_day_remark,
        @post_form_step5.second_day_remark,
        @post_form_step5.third_day_remark,
        @post_form_step5.fourth_day_remark,
        @post_form_step5.fifth_day_remark,
        @post_form_step5.sixth_day_remark,
        @post_form_step5.seventh_day_remark,
        @post_form_step5.eighth_day_remark
      ]
      # チャプター4畑1の種用
      session[:chapter4_farm1_seeds] = [
        @post_form_step5.day1_farm1_seed,
        @post_form_step5.day2_farm1_seed,
        @post_form_step5.day3_farm1_seed,
        @post_form_step5.day4_farm1_seed,
        @post_form_step5.day5_farm1_seed,
        @post_form_step5.day6_farm1_seed,
        @post_form_step5.day7_farm1_seed,
        @post_form_step5.day8_farm1_seed
      ]
      # チャプター4畑1の設置キャラクター用
      session[:chapter4_farm1_characters] = [
        @post_form_step5.day1_farm1_character,
        @post_form_step5.day2_farm1_character,
        @post_form_step5.day3_farm1_character,
        @post_form_step5.day4_farm1_character,
        @post_form_step5.day5_farm1_character,
        @post_form_step5.day6_farm1_character,
        @post_form_step5.day7_farm1_character,
        @post_form_step5.day8_farm1_character
      ]
      # チャプター4畑2の種用
      session[:chapter4_farm2_seeds] = [
        @post_form_step5.day1_farm2_seed,
        @post_form_step5.day2_farm2_seed,
        @post_form_step5.day3_farm2_seed,
        @post_form_step5.day4_farm2_seed,
        @post_form_step5.day5_farm2_seed,
        @post_form_step5.day6_farm2_seed,
        @post_form_step5.day7_farm2_seed,
        @post_form_step5.day8_farm2_seed
      ]
      # チャプター4畑2の設置キャラクター用
      session[:chapter4_farm2_characters] = [
        @post_form_step5.day1_farm2_character,
        @post_form_step5.day2_farm2_character,
        @post_form_step5.day3_farm2_character,
        @post_form_step5.day4_farm2_character,
        @post_form_step5.day5_farm2_character,
        @post_form_step5.day6_farm2_character,
        @post_form_step5.day7_farm2_character,
        @post_form_step5.day8_farm2_character
      ]
      # チャプター4畑3の種用
      session[:chapter4_farm3_seeds] = [
        @post_form_step5.day1_farm3_seed,
        @post_form_step5.day2_farm3_seed,
        @post_form_step5.day3_farm3_seed,
        @post_form_step5.day4_farm3_seed,
        @post_form_step5.day5_farm3_seed,
        @post_form_step5.day6_farm3_seed,
        @post_form_step5.day7_farm3_seed,
        @post_form_step5.day8_farm3_seed
      ]
      # チャプター4畑3の設置キャラクター用
      session[:chapter4_farm3_characters] = [
        @post_form_step5.day1_farm3_character,
        @post_form_step5.day2_farm3_character,
        @post_form_step5.day3_farm3_character,
        @post_form_step5.day4_farm3_character,
        @post_form_step5.day5_farm3_character,
        @post_form_step5.day6_farm3_character,
        @post_form_step5.day7_farm3_character,
        @post_form_step5.day8_farm3_character
      ]
      # チャプター4畑4の種用
      session[:chapter4_farm4_seeds] = [
        @post_form_step5.day1_farm4_seed,
        @post_form_step5.day2_farm4_seed,
        @post_form_step5.day3_farm4_seed,
        @post_form_step5.day4_farm4_seed,
        @post_form_step5.day5_farm4_seed,
        @post_form_step5.day6_farm4_seed,
        @post_form_step5.day7_farm4_seed,
        @post_form_step5.day8_farm4_seed
      ]
      # チャプター4畑4の設置キャラクター用
      session[:chapter4_farm4_characters] = [
        @post_form_step5.day1_farm4_character,
        @post_form_step5.day2_farm4_character,
        @post_form_step5.day3_farm4_character,
        @post_form_step5.day4_farm4_character,
        @post_form_step5.day5_farm4_character,
        @post_form_step5.day6_farm4_character,
        @post_form_step5.day7_farm4_character,
        @post_form_step5.day8_farm4_character
      ]
      # チャプター4畑5の種用
      session[:chapter4_farm5_seeds] = [
        @post_form_step5.day1_farm5_seed,
        @post_form_step5.day2_farm5_seed,
        @post_form_step5.day3_farm5_seed,
        @post_form_step5.day4_farm5_seed,
        @post_form_step5.day5_farm5_seed,
        @post_form_step5.day6_farm5_seed,
        @post_form_step5.day7_farm5_seed,
        @post_form_step5.day8_farm5_seed
      ]
      # チャプター4畑5の設置キャラクター用
      session[:chapter4_farm5_characters] = [
        @post_form_step5.day1_farm5_character,
        @post_form_step5.day2_farm5_character,
        @post_form_step5.day3_farm5_character,
        @post_form_step5.day4_farm5_character,
        @post_form_step5.day5_farm5_character,
        @post_form_step5.day6_farm5_character,
        @post_form_step5.day7_farm5_character,
        @post_form_step5.day8_farm5_character
      ]
      # チャプター4畑6の種用
      session[:chapter4_farm6_seeds] = [
        @post_form_step5.day1_farm6_seed,
        @post_form_step5.day2_farm6_seed,
        @post_form_step5.day3_farm6_seed,
        @post_form_step5.day4_farm6_seed,
        @post_form_step5.day5_farm6_seed,
        @post_form_step5.day6_farm6_seed,
        @post_form_step5.day7_farm6_seed,
        @post_form_step5.day8_farm6_seed
      ]
      # チャプター4畑6の設置キャラクター用
      session[:chapter4_farm6_characters] = [
        @post_form_step5.day1_farm6_character,
        @post_form_step5.day2_farm6_character,
        @post_form_step5.day3_farm6_character,
        @post_form_step5.day4_farm6_character,
        @post_form_step5.day5_farm6_character,
        @post_form_step5.day6_farm6_character,
        @post_form_step5.day7_farm6_character,
        @post_form_step5.day8_farm6_character
      ]
      # チャプター4畑7の種用
      session[:chapter4_farm7_seeds] = [
        @post_form_step5.day1_farm7_seed,
        @post_form_step5.day2_farm7_seed,
        @post_form_step5.day3_farm7_seed,
        @post_form_step5.day4_farm7_seed,
        @post_form_step5.day5_farm7_seed,
        @post_form_step5.day6_farm7_seed,
        @post_form_step5.day7_farm7_seed,
        @post_form_step5.day8_farm7_seed
      ]
      # チャプター4畑7の設置キャラクター用
      session[:chapter4_farm7_characters] = [
        @post_form_step5.day1_farm7_character,
        @post_form_step5.day2_farm7_character,
        @post_form_step5.day3_farm7_character,
        @post_form_step5.day4_farm7_character,
        @post_form_step5.day5_farm7_character,
        @post_form_step5.day6_farm7_character,
        @post_form_step5.day7_farm7_character,
        @post_form_step5.day8_farm7_character
      ]
      # チャプター4畑8の種用
      session[:chapter4_farm8_seeds] = [
        @post_form_step5.day1_farm8_seed,
        @post_form_step5.day2_farm8_seed,
        @post_form_step5.day3_farm8_seed,
        @post_form_step5.day4_farm8_seed,
        @post_form_step5.day5_farm8_seed,
        @post_form_step5.day6_farm8_seed,
        @post_form_step5.day7_farm8_seed,
        @post_form_step5.day8_farm8_seed
      ]
      # チャプター4畑8の設置キャラクター用
      session[:chapter4_farm8_characters] = [
        @post_form_step5.day1_farm8_character,
        @post_form_step5.day2_farm8_character,
        @post_form_step5.day3_farm8_character,
        @post_form_step5.day4_farm8_character,
        @post_form_step5.day5_farm8_character,
        @post_form_step5.day6_farm8_character,
        @post_form_step5.day7_farm8_character,
        @post_form_step5.day8_farm8_character
      ]
      # チャプター4畑9の種用
      session[:chapter4_farm9_seeds] = [
        @post_form_step5.day1_farm9_seed,
        @post_form_step5.day2_farm9_seed,
        @post_form_step5.day3_farm9_seed,
        @post_form_step5.day4_farm9_seed,
        @post_form_step5.day5_farm9_seed,
        @post_form_step5.day6_farm9_seed,
        @post_form_step5.day7_farm9_seed,
        @post_form_step5.day8_farm9_seed
      ]
      # チャプター4畑9の設置キャラクター用
      session[:chapter4_farm9_characters] = [
        @post_form_step5.day1_farm9_character,
        @post_form_step5.day2_farm9_character,
        @post_form_step5.day3_farm9_character,
        @post_form_step5.day4_farm9_character,
        @post_form_step5.day5_farm9_character,
        @post_form_step5.day6_farm9_character,
        @post_form_step5.day7_farm9_character,
        @post_form_step5.day8_farm9_character
      ]
      redirect_to step6_path, notice: t('.input_status')
    else
      flash.now[:alert] = t('defaults.reenter')
      render :step5, status: :unprocessable_entity
    end
  end

  def step6
    @training_character = TrainingCharacter.new
  end

  def create_step6
    post = current_user.posts.create(title: session[:post_title])
    # 育成キャラクターの保存
    training_character_params_with_character_id = training_character_params.merge(character_id: session[:training_character])
    @training_character = post.create_training_character(training_character_params_with_character_id)
    # 修行仲間の保存
    session[:support_characters].each do |support_character_id|
      post.support_characters.create(character_id: support_character_id)
    end

    # 1巻の行動の保存
    chapter1_days = ChapterTurn.where(chapter_id: 1)
    session[:chapter1_actions].zip(chapter1_days) do |action, chapter1_day|
      post.training_actions.create(action_id: action, chapter_turn_id: chapter1_day.id)
    end
    # 1巻の備考欄保存
    session[:chapter1_remarks].each do |chapter1|
      post.training_advices.create(content: chapter1[:remark], chapter_turn_id: chapter1[:chapter_turn])
    end
    # 1巻の畑1の種保存
    session[:chapter1_farm1_seeds].each do |chapter1|
      post.flower_fields.create(farm_place_id: chapter1[:farm_place], flower_seed_id: chapter1[:seed], chapter_turn_id: chapter1[:chapter_turn])
    end
    # 1巻の畑1の設置キャラクター保存
    session[:chapter1_farm1_characters].each do |chapter1|
      post.character_fields.create(farm_place_id: chapter1[:farm_place], character_id: chapter1[:character], chapter_turn_id: chapter1[:chapter_turn])
    end
    # 1巻の畑2の種保存
    session[:chapter1_farm2_seeds].each do |chapter1|
      post.flower_fields.create(farm_place_id: chapter1[:farm_place], flower_seed_id: chapter1[:seed], chapter_turn_id: chapter1[:chapter_turn])
    end
    # 1巻の畑2の設置キャラクター保存
    session[:chapter1_farm2_characters].each do |chapter1|
      post.character_fields.create(farm_place_id: chapter1[:farm_place], character_id: chapter1[:character], chapter_turn_id: chapter1[:chapter_turn])
    end
    # 1巻の畑3の種保存
    session[:chapter1_farm3_seeds].each do |chapter1|
      post.flower_fields.create(farm_place_id: chapter1[:farm_place], flower_seed_id: chapter1[:seed], chapter_turn_id: chapter1[:chapter_turn])
    end
    # 1巻の畑3の設置キャラクター保存
    session[:chapter1_farm3_characters].each do |chapter1|
      post.character_fields.create(farm_place_id: chapter1[:farm_place], character_id: chapter1[:character], chapter_turn_id: chapter1[:chapter_turn])
    end
    # 1巻の畑4の種保存
    session[:chapter1_farm4_seeds].each do |chapter1|
      post.flower_fields.create(farm_place_id: chapter1[:farm_place], flower_seed_id: chapter1[:seed], chapter_turn_id: chapter1[:chapter_turn])
    end
    # 1巻の畑4の設置キャラクター保存
    session[:chapter1_farm4_characters].each do |chapter1|
      post.character_fields.create(farm_place_id: chapter1[:farm_place], character_id: chapter1[:character], chapter_turn_id: chapter1[:chapter_turn])
    end
    # 1巻の畑5の種保存
    session[:chapter1_farm5_seeds].each do |chapter1|
      post.flower_fields.create(farm_place_id: chapter1[:farm_place], flower_seed_id: chapter1[:seed], chapter_turn_id: chapter1[:chapter_turn])
    end
    # 1巻の畑5の設置キャラクター保存
    session[:chapter1_farm5_characters].each do |chapter1|
      post.character_fields.create(farm_place_id: chapter1[:farm_place], character_id: chapter1[:character], chapter_turn_id: chapter1[:chapter_turn])
    end

    # 2巻の行動の保存
    chapter2_days = ChapterTurn.where(chapter_id: 2)
    session[:chapter2_actions].zip(chapter2_days) do |action, chapter2_day|
      post.training_actions.create(action_id: action, chapter_turn_id: chapter2_day.id)
    end
    # 2巻の備考欄保存
    session[:chapter2_remarks].each do |chapter2|
      post.training_advices.create(content: chapter2[:remark], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑1の種保存
    session[:chapter2_farm1_seeds].each do |chapter2|
      post.flower_fields.create(farm_place_id: chapter2[:farm_place], flower_seed_id: chapter2[:seed], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑1の設置キャラクター保存
    session[:chapter2_farm1_characters].each do |chapter2|
      post.character_fields.create(farm_place_id: chapter2[:farm_place], character_id: chapter2[:character], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑2の種保存
    session[:chapter2_farm2_seeds].each do |chapter2|
      post.flower_fields.create(farm_place_id: chapter2[:farm_place], flower_seed_id: chapter2[:seed], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑2の設置キャラクター保存
    session[:chapter2_farm2_characters].each do |chapter2|
      post.character_fields.create(farm_place_id: chapter2[:farm_place], character_id: chapter2[:character], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑3の種保存
    session[:chapter2_farm3_seeds].each do |chapter2|
      post.flower_fields.create(farm_place_id: chapter2[:farm_place], flower_seed_id: chapter2[:seed], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑3の設置キャラクター保存
    session[:chapter2_farm3_characters].each do |chapter2|
      post.character_fields.create(farm_place_id: chapter2[:farm_place], character_id: chapter2[:character], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑4の種保存
    session[:chapter2_farm4_seeds].each do |chapter2|
      post.flower_fields.create(farm_place_id: chapter2[:farm_place], flower_seed_id: chapter2[:seed], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑4の設置キャラクター保存
    session[:chapter2_farm4_characters].each do |chapter2|
      post.character_fields.create(farm_place_id: chapter2[:farm_place], character_id: chapter2[:character], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑5の種保存
    session[:chapter2_farm5_seeds].each do |chapter2|
      post.flower_fields.create(farm_place_id: chapter2[:farm_place], flower_seed_id: chapter2[:seed], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑5の設置キャラクター保存
    session[:chapter2_farm5_characters].each do |chapter2|
      post.character_fields.create(farm_place_id: chapter2[:farm_place], character_id: chapter2[:character], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑6の種保存
    session[:chapter2_farm6_seeds].each do |chapter2|
      post.flower_fields.create(farm_place_id: chapter2[:farm_place], flower_seed_id: chapter2[:seed], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑6の設置キャラクター保存
    session[:chapter2_farm6_characters].each do |chapter2|
      post.character_fields.create(farm_place_id: chapter2[:farm_place], character_id: chapter2[:character], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑7の種保存
    session[:chapter2_farm7_seeds].each do |chapter2|
      post.flower_fields.create(farm_place_id: chapter2[:farm_place], flower_seed_id: chapter2[:seed], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑7の設置キャラクター保存
    session[:chapter2_farm7_characters].each do |chapter2|
      post.character_fields.create(farm_place_id: chapter2[:farm_place], character_id: chapter2[:character], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑8の種保存
    session[:chapter2_farm8_seeds].each do |chapter2|
      post.flower_fields.create(farm_place_id: chapter2[:farm_place], flower_seed_id: chapter2[:seed], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑8の設置キャラクター保存
    session[:chapter2_farm8_characters].each do |chapter2|
      post.character_fields.create(farm_place_id: chapter2[:farm_place], character_id: chapter2[:character], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑9の種保存
    session[:chapter2_farm9_seeds].each do |chapter2|
      post.flower_fields.create(farm_place_id: chapter2[:farm_place], flower_seed_id: chapter2[:seed], chapter_turn_id: chapter2[:chapter_turn])
    end
    # 2巻の畑9の設置キャラクター保存
    session[:chapter2_farm9_characters].each do |chapter2|
      post.character_fields.create(farm_place_id: chapter2[:farm_place], character_id: chapter2[:character], chapter_turn_id: chapter2[:chapter_turn])
    end
    binding.b
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

  def post_form_step3_params
    params.require(:post_form_step3).permit(
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
      :day1_farm1_seed,
      :day2_farm1_seed,
      :day3_farm1_seed,
      :day4_farm1_seed,
      :day5_farm1_seed,
      :day6_farm1_seed,
      :day7_farm1_seed,
      :day8_farm1_seed,
      # 1の畑の設置キャラクター用
      :day1_farm1_character,
      :day2_farm1_character,
      :day3_farm1_character,
      :day4_farm1_character,
      :day5_farm1_character,
      :day6_farm1_character,
      :day7_farm1_character,
      :day8_farm1_character,
      # 2の畑の種用
      :day1_farm2_seed,
      :day2_farm2_seed,
      :day3_farm2_seed,
      :day4_farm2_seed,
      :day5_farm2_seed,
      :day6_farm2_seed,
      :day7_farm2_seed,
      :day8_farm2_seed,
      # 2の畑の設置キャラクター用
      :day1_farm2_character,
      :day2_farm2_character,
      :day3_farm2_character,
      :day4_farm2_character,
      :day5_farm2_character,
      :day6_farm2_character,
      :day7_farm2_character,
      :day8_farm2_character,
      # 3の畑の種用
      :day1_farm3_seed,
      :day2_farm3_seed,
      :day3_farm3_seed,
      :day4_farm3_seed,
      :day5_farm3_seed,
      :day6_farm3_seed,
      :day7_farm3_seed,
      :day8_farm3_seed,
      # 3の畑の設置キャラクター用
      :day1_farm3_character,
      :day2_farm3_character,
      :day3_farm3_character,
      :day4_farm3_character,
      :day5_farm3_character,
      :day6_farm3_character,
      :day7_farm3_character,
      :day8_farm3_character,
      # 4の畑の種用
      :day1_farm4_seed,
      :day2_farm4_seed,
      :day3_farm4_seed,
      :day4_farm4_seed,
      :day5_farm4_seed,
      :day6_farm4_seed,
      :day7_farm4_seed,
      :day8_farm4_seed,
      # 4の畑の設置キャラクター用
      :day1_farm4_character,
      :day2_farm4_character,
      :day3_farm4_character,
      :day4_farm4_character,
      :day5_farm4_character,
      :day6_farm4_character,
      :day7_farm4_character,
      :day8_farm4_character,
      # 5の畑の種用
      :day1_farm5_seed,
      :day2_farm5_seed,
      :day3_farm5_seed,
      :day4_farm5_seed,
      :day5_farm5_seed,
      :day6_farm5_seed,
      :day7_farm5_seed,
      :day8_farm5_seed,
      # 5の畑の設置キャラクター用
      :day1_farm5_character,
      :day2_farm5_character,
      :day3_farm5_character,
      :day4_farm5_character,
      :day5_farm5_character,
      :day6_farm5_character,
      :day7_farm5_character,
      :day8_farm5_character,
      # 6の畑の種用
      :day1_farm6_seed,
      :day2_farm6_seed,
      :day3_farm6_seed,
      :day4_farm6_seed,
      :day5_farm6_seed,
      :day6_farm6_seed,
      :day7_farm6_seed,
      :day8_farm6_seed,
      # 6の畑の設置キャラクター用
      :day1_farm6_character,
      :day2_farm6_character,
      :day3_farm6_character,
      :day4_farm6_character,
      :day5_farm6_character,
      :day6_farm6_character,
      :day7_farm6_character,
      :day8_farm6_character,
      # 7の畑の種用
      :day2_farm7_seed,
      :day3_farm7_seed,
      :day4_farm7_seed,
      :day5_farm7_seed,
      :day6_farm7_seed,
      :day7_farm7_seed,
      :day8_farm7_seed,
      # 7の畑の設置キャラクター用
      :day2_farm7_character,
      :day3_farm7_character,
      :day4_farm7_character,
      :day5_farm7_character,
      :day6_farm7_character,
      :day7_farm7_character,
      :day8_farm7_character,
      # 8の畑の種用
      :day3_farm8_seed,
      :day4_farm8_seed,
      :day5_farm8_seed,
      :day6_farm8_seed,
      :day7_farm8_seed,
      :day8_farm8_seed,
      # 8の畑の設置キャラクター用
      :day3_farm8_character,
      :day4_farm8_character,
      :day5_farm8_character,
      :day6_farm8_character,
      :day7_farm8_character,
      :day8_farm8_character,
      # 9の畑の種用
      :day3_farm9_seed,
      :day4_farm9_seed,
      :day5_farm9_seed,
      :day6_farm9_seed,
      :day7_farm9_seed,
      :day8_farm9_seed,
      # 9の畑の設置キャラクター用
      :day3_farm9_character,
      :day4_farm9_character,
      :day5_farm9_character,
      :day6_farm9_character,
      :day7_farm9_character,
      :day8_farm9_character
    )
  end

  def post_form_step4_params
    params.require(:post_form_step4).permit(
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
      :day1_farm1_seed,
      :day2_farm1_seed,
      :day3_farm1_seed,
      :day4_farm1_seed,
      :day5_farm1_seed,
      :day6_farm1_seed,
      :day7_farm1_seed,
      :day8_farm1_seed,
      # 1の畑の設置キャラクター用
      :day1_farm1_character,
      :day2_farm1_character,
      :day3_farm1_character,
      :day4_farm1_character,
      :day5_farm1_character,
      :day6_farm1_character,
      :day7_farm1_character,
      :day8_farm1_character,
      # 2の畑の種用
      :day1_farm2_seed,
      :day2_farm2_seed,
      :day3_farm2_seed,
      :day4_farm2_seed,
      :day5_farm2_seed,
      :day6_farm2_seed,
      :day7_farm2_seed,
      :day8_farm2_seed,
      # 2の畑の設置キャラクター用
      :day1_farm2_character,
      :day2_farm2_character,
      :day3_farm2_character,
      :day4_farm2_character,
      :day5_farm2_character,
      :day6_farm2_character,
      :day7_farm2_character,
      :day8_farm2_character,
      # 3の畑の種用
      :day1_farm3_seed,
      :day2_farm3_seed,
      :day3_farm3_seed,
      :day4_farm3_seed,
      :day5_farm3_seed,
      :day6_farm3_seed,
      :day7_farm3_seed,
      :day8_farm3_seed,
      # 3の畑の設置キャラクター用
      :day1_farm3_character,
      :day2_farm3_character,
      :day3_farm3_character,
      :day4_farm3_character,
      :day5_farm3_character,
      :day6_farm3_character,
      :day7_farm3_character,
      :day8_farm3_character,
      # 4の畑の種用
      :day1_farm4_seed,
      :day2_farm4_seed,
      :day3_farm4_seed,
      :day4_farm4_seed,
      :day5_farm4_seed,
      :day6_farm4_seed,
      :day7_farm4_seed,
      :day8_farm4_seed,
      # 4の畑の設置キャラクター用
      :day1_farm4_character,
      :day2_farm4_character,
      :day3_farm4_character,
      :day4_farm4_character,
      :day5_farm4_character,
      :day6_farm4_character,
      :day7_farm4_character,
      :day8_farm4_character,
      # 5の畑の種用
      :day1_farm5_seed,
      :day2_farm5_seed,
      :day3_farm5_seed,
      :day4_farm5_seed,
      :day5_farm5_seed,
      :day6_farm5_seed,
      :day7_farm5_seed,
      :day8_farm5_seed,
      # 5の畑の設置キャラクター用
      :day1_farm5_character,
      :day2_farm5_character,
      :day3_farm5_character,
      :day4_farm5_character,
      :day5_farm5_character,
      :day6_farm5_character,
      :day7_farm5_character,
      :day8_farm5_character,
      # 6の畑の種用
      :day1_farm6_seed,
      :day2_farm6_seed,
      :day3_farm6_seed,
      :day4_farm6_seed,
      :day5_farm6_seed,
      :day6_farm6_seed,
      :day7_farm6_seed,
      :day8_farm6_seed,
      # 6の畑の設置キャラクター用
      :day1_farm6_character,
      :day2_farm6_character,
      :day3_farm6_character,
      :day4_farm6_character,
      :day5_farm6_character,
      :day6_farm6_character,
      :day7_farm6_character,
      :day8_farm6_character,
      # 7の畑の種用
      :day1_farm7_seed,
      :day2_farm7_seed,
      :day3_farm7_seed,
      :day4_farm7_seed,
      :day5_farm7_seed,
      :day6_farm7_seed,
      :day7_farm7_seed,
      :day8_farm7_seed,
      # 7の畑の設置キャラクター用
      :day1_farm7_character,
      :day2_farm7_character,
      :day3_farm7_character,
      :day4_farm7_character,
      :day5_farm7_character,
      :day6_farm7_character,
      :day7_farm7_character,
      :day8_farm7_character,
      # 8の畑の種用
      :day1_farm8_seed,
      :day2_farm8_seed,
      :day3_farm8_seed,
      :day4_farm8_seed,
      :day5_farm8_seed,
      :day6_farm8_seed,
      :day7_farm8_seed,
      :day8_farm8_seed,
      # 8の畑の設置キャラクター用
      :day1_farm8_character,
      :day2_farm8_character,
      :day3_farm8_character,
      :day4_farm8_character,
      :day5_farm8_character,
      :day6_farm8_character,
      :day7_farm8_character,
      :day8_farm8_character,
      # 9の畑の種用
      :day1_farm9_seed,
      :day2_farm9_seed,
      :day3_farm9_seed,
      :day4_farm9_seed,
      :day5_farm9_seed,
      :day6_farm9_seed,
      :day7_farm9_seed,
      :day8_farm9_seed,
      # 9の畑の設置キャラクター用
      :day1_farm9_character,
      :day2_farm9_character,
      :day3_farm9_character,
      :day4_farm9_character,
      :day5_farm9_character,
      :day6_farm9_character,
      :day7_farm9_character,
      :day8_farm9_character
    )
  end

  def post_form_step5_params
    params.require(:post_form_step5).permit(
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
      :day1_farm1_seed,
      :day2_farm1_seed,
      :day3_farm1_seed,
      :day4_farm1_seed,
      :day5_farm1_seed,
      :day6_farm1_seed,
      :day7_farm1_seed,
      :day8_farm1_seed,
      # 1の畑の設置キャラクター用
      :day1_farm1_character,
      :day2_farm1_character,
      :day3_farm1_character,
      :day4_farm1_character,
      :day5_farm1_character,
      :day6_farm1_character,
      :day7_farm1_character,
      :day8_farm1_character,
      # 2の畑の種用
      :day1_farm2_seed,
      :day2_farm2_seed,
      :day3_farm2_seed,
      :day4_farm2_seed,
      :day5_farm2_seed,
      :day6_farm2_seed,
      :day7_farm2_seed,
      :day8_farm2_seed,
      # 2の畑の設置キャラクター用
      :day1_farm2_character,
      :day2_farm2_character,
      :day3_farm2_character,
      :day4_farm2_character,
      :day5_farm2_character,
      :day6_farm2_character,
      :day7_farm2_character,
      :day8_farm2_character,
      # 3の畑の種用
      :day1_farm3_seed,
      :day2_farm3_seed,
      :day3_farm3_seed,
      :day4_farm3_seed,
      :day5_farm3_seed,
      :day6_farm3_seed,
      :day7_farm3_seed,
      :day8_farm3_seed,
      # 3の畑の設置キャラクター用
      :day1_farm3_character,
      :day2_farm3_character,
      :day3_farm3_character,
      :day4_farm3_character,
      :day5_farm3_character,
      :day6_farm3_character,
      :day7_farm3_character,
      :day8_farm3_character,
      # 4の畑の種用
      :day1_farm4_seed,
      :day2_farm4_seed,
      :day3_farm4_seed,
      :day4_farm4_seed,
      :day5_farm4_seed,
      :day6_farm4_seed,
      :day7_farm4_seed,
      :day8_farm4_seed,
      # 4の畑の設置キャラクター用
      :day1_farm4_character,
      :day2_farm4_character,
      :day3_farm4_character,
      :day4_farm4_character,
      :day5_farm4_character,
      :day6_farm4_character,
      :day7_farm4_character,
      :day8_farm4_character,
      # 5の畑の種用
      :day1_farm5_seed,
      :day2_farm5_seed,
      :day3_farm5_seed,
      :day4_farm5_seed,
      :day5_farm5_seed,
      :day6_farm5_seed,
      :day7_farm5_seed,
      :day8_farm5_seed,
      # 5の畑の設置キャラクター用
      :day1_farm5_character,
      :day2_farm5_character,
      :day3_farm5_character,
      :day4_farm5_character,
      :day5_farm5_character,
      :day6_farm5_character,
      :day7_farm5_character,
      :day8_farm5_character,
      # 6の畑の種用
      :day1_farm6_seed,
      :day2_farm6_seed,
      :day3_farm6_seed,
      :day4_farm6_seed,
      :day5_farm6_seed,
      :day6_farm6_seed,
      :day7_farm6_seed,
      :day8_farm6_seed,
      # 6の畑の設置キャラクター用
      :day1_farm6_character,
      :day2_farm6_character,
      :day3_farm6_character,
      :day4_farm6_character,
      :day5_farm6_character,
      :day6_farm6_character,
      :day7_farm6_character,
      :day8_farm6_character,
      # 7の畑の種用
      :day1_farm7_seed,
      :day2_farm7_seed,
      :day3_farm7_seed,
      :day4_farm7_seed,
      :day5_farm7_seed,
      :day6_farm7_seed,
      :day7_farm7_seed,
      :day8_farm7_seed,
      # 7の畑の設置キャラクター用
      :day1_farm7_character,
      :day2_farm7_character,
      :day3_farm7_character,
      :day4_farm7_character,
      :day5_farm7_character,
      :day6_farm7_character,
      :day7_farm7_character,
      :day8_farm7_character,
      # 8の畑の種用
      :day1_farm8_seed,
      :day2_farm8_seed,
      :day3_farm8_seed,
      :day4_farm8_seed,
      :day5_farm8_seed,
      :day6_farm8_seed,
      :day7_farm8_seed,
      :day8_farm8_seed,
      # 8の畑の設置キャラクター用
      :day1_farm8_character,
      :day2_farm8_character,
      :day3_farm8_character,
      :day4_farm8_character,
      :day5_farm8_character,
      :day6_farm8_character,
      :day7_farm8_character,
      :day8_farm8_character,
      # 9の畑の種用
      :day1_farm9_seed,
      :day2_farm9_seed,
      :day3_farm9_seed,
      :day4_farm9_seed,
      :day5_farm9_seed,
      :day6_farm9_seed,
      :day7_farm9_seed,
      :day8_farm9_seed,
      # 9の畑の設置キャラクター用
      :day1_farm9_character,
      :day2_farm9_character,
      :day3_farm9_character,
      :day4_farm9_character,
      :day5_farm9_character,
      :day6_farm9_character,
      :day7_farm9_character,
      :day8_farm9_character
    )
  end

  def training_character_params
    params.require(:training_character).permit(:hp, :atk, :def, :spd, :crt, :crd, :hit, :avd, :character_id)
  end
end
