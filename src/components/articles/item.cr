class Articles::Item < BaseComponent
  needs article : Article

  def render
    li do
      link article.title, Articles::Show.with(article)
    end
  end
end
