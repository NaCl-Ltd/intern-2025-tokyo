class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  # routesで設定した通り，pin要求が来た場合に実行
  before_action :set_micropost, only: [:pin]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.isPinned = false
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  def pin
    # isPinnedの値を変更
    @prevPinnedPost.update(isPinned: false) if @prevPinnedPost != nil
    @micropost.update(isPinned: !@micropost.isPinned)
    
    # ページをリダイレクト
    flash[:success] = "投稿の固定設定を更新しました。"
    redirect_to @micropost
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @micropost.nil?
    end

    def set_micropost
      # すでに固定済みの投稿を取得
      @prevPinnedPost = Micropost.find_by(isPinned: true)
      # 新たに固定する投稿を取得。url部に記載されるidから。
      @micropost = Micropost.find(params[:id])
    end
end
