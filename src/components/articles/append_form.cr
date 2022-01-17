class Articles::AppendForm < BaseComponent
  needs operation : SaveArticle

  def render
    tag "turbo-frame", id: "append-article-form" do
      form_for Articles::Append do
        mount Articles::FormFields, operation
        submit "Save"
      end
    end
  end
end
