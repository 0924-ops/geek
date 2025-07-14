class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
  if params[:tag_ids].present?
    selected_tag_ids = params[:tag_ids].select { |_id, v| v == "1" }.keys
    @tweets = Tweet.joins(:tags).where(tags: { id: selected_tag_ids }).distinct
  else
    @tweets = Tweet.all
  end

  # 投稿ランキング（いいね数順）
  tweets_ranked = @tweets.includes(:liked_users).sort_by { |t| -t.liked_users.size }

  @tweets = Kaminari.paginate_array(tweets_ranked).page(params[:page]).per(5)

  # タグの新規作成（タグ投稿機能がある場合）
  if params[:tag]
    Tag.find_or_create_by(name: params[:tag])
  end
end
  def new
    @tweet = Tweet.new
  end
  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id 
    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
  def show
    @tweet = Tweet.find(params[:id])
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end
  def tweet_params
    params.require(:tweet).permit(:place, :comment, :image, tag_ids: [])
  end
end