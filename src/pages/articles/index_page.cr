class Articles::IndexPage < MainLayout
  needs articles : ArticleQuery
  quick_def page_title, "All Articles"

  def content
    h1 "All Articles"
    link "New Article", to: Articles::New
    render_articles
    render_form
  end

  def render_articles
    ul id: "articles" do
      articles.each do |article|
        mount Articles::Item, article
      end
    end
  end

  def render_form
    mount Articles::AppendForm, SaveArticle.new
  end
end
