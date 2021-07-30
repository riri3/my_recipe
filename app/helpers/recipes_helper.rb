# frozen_string_literal: true

module RecipesHelper

  # 空白を保持する
  def recipe_text(text)
    return if text.blank?
    raw(url2a(nl2br(sanitize(text).to_s)))
  end

# 改行などの形態を保持する
  def nl2br(text)
    text.gsub(/\R/) { %Q{<br>} }
  end

# URLを入れたときにリンク表示にする
  def url2a(text)
    text.gsub(URI.regexp(%w[http https])) { %Q{<a href="#{$&}" target="_blank">#{$&}</a>} }
  end
end
