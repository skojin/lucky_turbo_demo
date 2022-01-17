class Articles::ShowPage < MainLayout
  needs article : Article
  quick_def page_title, "Article with id: #{article.id}"

  def content
    link "Back to all Articles", Articles::Index
    h1 "Article with id: #{article.id}"
    tag "p", "note: random via turbo-frame not update flash"
    render_article_fields
  end

  def render_article_fields
    mount Articles::ShowView, article
  end
end
