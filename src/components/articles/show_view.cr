class Articles::ShowView < BaseComponent
  needs article : Article

  def render
    tag("turbo-frame", id: "article_#{article.id}") do
      render_actions
      render_article
    end
  end

  def render_actions
    section do
      link "Edit", Articles::Edit.with(article.id), data_turbo_frame: "_top"
      text " | "
      link "Delete",
        Articles::Delete.with(article.id),
        data_turbo_frame: "_top",
        data_turbo_confirm: "Are you sure?",
        data_turbo_method: Articles::Delete.with(article.id).method.to_s
      text " | "
      link "Random Title (via redirect)",
        Articles::RandomRedirect.with(article.id),
        data_turbo_method: "patch",
        data_turbo_frame: "_top"
      text " | "
      link ".. (via turbo-frame)",
        Articles::RandomFrame.with(article.id),
        data_turbo_method: "patch"
      text " | "
      link ".. (via turbo-stream)",
        Articles::RandomStream.with(article.id),
        data_turbo_method: "patch"
    end
  end

  def render_article
    ul do
      li do
        text "title: "
        strong article.title.to_s
      end
    end
  end
end
