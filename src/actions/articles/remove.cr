class Articles::Remove < BrowserAction
  delete "/articles/:article_id/remove" do
    article = ArticleQuery.find(article_id)
    DeleteArticle.delete(article) do |_operation, _deleted|
      flash.success = "Removed the article '#{article.title}'"
      page = RemovePage.new(context: context, article: article)
      Lucky::TextResponse.new(
        context,
        "text/vnd.turbo-stream.html",
        page.perform_render,
        status: 200,
      )
    end
  end
end
