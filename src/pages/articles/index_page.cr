class Articles::IndexPage < MainLayout
  needs articles : ArticleQuery
  quick_def page_title, "All Articles"

  def content
    h1 "All Articles"
    link "New Article", to: Articles::New
    render_articles
  end

  def render_articles
    ul do
      articles.each do |article|
        li do
          link article.title, Articles::Show.with(article)
        end
      end
    end
  end
end
