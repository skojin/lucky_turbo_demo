class Articles::Item < BaseComponent
  needs article : Article

  def render
    li id: "article_#{article.id}" do
      link article.title, Articles::Show.with(article)
      text " - "
      link "[remove]",
        Articles::Remove.with(article.id),
        # data_turbo_frame: "_top",
        data_turbo_confirm: "Are you sure?",
        data_turbo_method: Articles::Remove.with(article.id).method.to_s
    end
  end
end
