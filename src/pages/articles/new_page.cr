class Articles::NewPage < MainLayout
  needs operation : SaveArticle
  quick_def page_title, "New Article"

  def content
    h1 "New Article"
    render_article_form(operation)
  end

  def render_article_form(op)
    form_for Articles::Create do
      # Edit fields in src/components/articles/form_fields.cr
      mount Articles::FormFields, op

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
