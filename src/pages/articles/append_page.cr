class Articles::AppendPage < TurboLayout
  needs article : Article?
  needs operation : SaveArticle

  def content
    tag("turbo-stream", action: "replace", target: "append-article-form") do
      tag("template") do
        mount Articles::AppendForm, operation
      end
    end

    if article
      tag("turbo-stream", action: "append", target: "articles") do
        tag("template") do
          mount Articles::Item, article.not_nil!
        end
      end
    end
  end
end
