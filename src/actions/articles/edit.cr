class Articles::Edit < BrowserAction
  get "/articles/:article_id/edit" do
    article = ArticleQuery.find(article_id)
    html EditPage,
      operation: SaveArticle.new(article),
      article: article
  end
end
