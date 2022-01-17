class Articles::EditPage < MainLayout
  needs operation : SaveArticle
  needs article : Article
  quick_def page_title, "Edit Article with id: #{article.id}"

  def content
    link "Back to all Articles", Articles::Index
    h1 "Edit Article with id: #{article.id}"
    render_article_form(operation)
  end

  def render_article_form(op)
    form_for Articles::Update.with(article.id) do
      # Edit fields in src/components/articles/form_fields.cr
      mount Articles::FormFields, op

      submit "Update"
    end
  end
end
