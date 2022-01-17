class Articles::RandomFrame < BrowserAction
  patch "/articles/:article_id/random_frame" do
    article = ArticleQuery.find(article_id)
    SaveArticle.update(article, title: Random.new.hex) do |operation, updated_article|
      html RandomFramePage,
        article: updated_article
    end
  end
end
