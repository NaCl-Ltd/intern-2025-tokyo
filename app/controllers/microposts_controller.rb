class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :get_hide_post, only: [:hide]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.hidden = false
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

  def hide
    # hiddenの値を変更
    @micropost.update(hidden: !@micropost.hidden)

    # ページをリダイレクト
    if @micropost.hidden
      flash[:success] = "投稿を削除しました。"
      puts ["▲▲▲", request.original_url, request.referer, request.referer.gsub(/&postId=.*/,"")]
      redirect_to "#{request.referer.gsub(/&postId=.*/, "")}&postId=#{@micropost.id}"
    else
      flash[:success] = "投稿を復元しました。"
      redirect_to request.referer
    end
  end

  private
    def get_hide_post
      @micropost = Micropost.find(params[:id])
    end

    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url, status: :see_other if @micropost.nil?
    end
end
