class Articles::FormFields < BaseComponent
  needs operation : SaveArticle

  def render
    mount Shared::Field, operation.title, &.text_input(autofocus: "true")
  end
end
