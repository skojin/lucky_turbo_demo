class Articles::RandomRedirect < BrowserAction
  patch "/articles/:article_id/random_redirect" do
    article = ArticleQuery.find(article_id)
    SaveArticle.update(article, title: Random.new.hex) do |operation, updated_article|
      flash.success = "The title has been changed at #{Time.utc.to_s("%H:%M:%S")}"
      redirect Show.with(updated_article.id), status: HTTP::Status::SEE_OTHER
    end
  end
end
