# frozen_string_literal: true

module RecipesHelper
  def recipe_text(text)
    return if text.blank?

    raw(email2a(url2a(nl2br(sanitize(text).to_s))))
  end

  def nl2br(text)
    text.gsub(/\R/) { %Q{<br>} }
  end

  def url2a(text)
    text.gsub(URI.regexp(%w[http https])) { %Q{<a href="#{$&}" target="_blank">#{$&}</a>} }
  end

  def email2a(text)
    text.gsub(/[\w+\-.]+@[a-z\d\-.]+\.[a-z]+/i) { %Q{<a href="mailto:#{$&}">#{$&}</a>} }
  end
end
