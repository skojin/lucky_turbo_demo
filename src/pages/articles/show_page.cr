class Articles::ShowPage < MainLayout
  needs article : Article
  quick_def page_title, "Article with id: #{article.id}"

  def content
    link "Back to all Articles", Articles::Index
    h1 "Article with id: #{article.id}"
    render_actions
    render_article_fields
  end

  def render_actions
    section do
      link "Edit", Articles::Edit.with(article.id)
      text " | "
      link "Delete",
        Articles::Delete.with(article.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_article_fields
    ul do
      li do
        text "title: "
        strong article.title.to_s
      end
    end
  end
end
