class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index; end

  def create; end

  def step1
    @post = Post.new
  end

  def create_step1
    @post = current_user.posts.build(post_params)
    # エラーメッセージの上書きを回避するためにvalidate_support_character_uniquenessより先に記述している
    @post.valid?
    # サポートキャラクターが重複しているかをチェックして、重複していたらエラーメッセージを入れる
    character_ids = support_character_params[:post_character_ids]
    @post.validate_support_character_uniqueness(character_ids)
    if @post.errors.empty?
      session[:post_title] = post_params[:title]
      session[:character_ids] = support_character_params[:post_character_ids]
      redirect_to step2_path
    else
      flash.now[:alert] = t('.fail')
      render :step1, status: :unprocessable_entity
    end
  end

  def step2
    @post = Post.new
    session[:character_ids]
    @selected_support_characters = Character.find(session[:character_ids])
  end

  def create_step2; end

  private

  def post_params
    params.require(:post).permit(:title)
  end

  def support_character_params
    params.require(:post).permit(post_character_ids: [])
  end
end
