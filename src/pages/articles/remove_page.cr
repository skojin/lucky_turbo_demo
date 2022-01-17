class Articles::RemovePage < TurboLayout
  needs article : Article

  def content
    tag("turbo-stream", action: "remove", target: "article_#{article.id}") do
    end
  end
end
