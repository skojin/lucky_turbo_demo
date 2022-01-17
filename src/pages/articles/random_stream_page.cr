class Articles::RandomStreamPage
  include Lucky::HTMLPage

  needs article : Article

  def render
    tag("turbo-stream", action: "replace", target: "article_#{article.id}") do
      tag("template") do
        mount Articles::ShowView, article
      end
    end
    tag("turbo-stream", action: "replace", target: "flash") do
      tag("template") do
        mount Shared::FlashMessages, context.flash
      end
    end
  end
end
