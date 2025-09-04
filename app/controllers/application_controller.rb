class ApplicationController < ActionController::Base
  include SessionsHelper

  # 毎回のURLのパラメータにロケールを設定する
  def default_url_options
    { locale: I18n.locale }
  end

  # localeの設定
  around_action :switch_locale
  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
    puts("＊＊＊", I18n.default_locale)
  end

  private

    # ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url, status: :see_other
      end
    end
end
