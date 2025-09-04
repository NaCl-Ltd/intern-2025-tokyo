module ApplicationHelper
  # thanks: https://qiita.com/d-haru/items/11f961535e3c7bd64d71
  def convert_url_to_a_element(text)
    uri_reg = URI.regexp(%w[http https])
    text.gsub(uri_reg) { %{<a href='#{$&}' target='_blank'>#{$&}</a>} }
  end

  # ページごとの完全なタイトルを返します。                   # コメント行
  def full_title(page_title = '')                     # メソッド定義とオプション引数
    base_title = "faciem libri"  # 変数への代入
    if page_title.empty?                              # 論理値テスト
      base_title                                      # 暗黙の戻り値
    else
      "#{page_title} | #{base_title}"                 # 文字列の結合
    end
  end
end
