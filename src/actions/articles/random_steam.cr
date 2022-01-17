class Articles::RandomStream < BrowserAction
  patch "/articles/:article_id/random_stream" do
    article = ArticleQuery.find(article_id)
    SaveArticle.update(article, title: Random.new.hex) do |operation, updated_article|
      flash.success = "The title has been changed at #{Time.utc.to_s("%H:%M:%S")}"
      page = RandomStreamPage.new(context: context, article: updated_article)
      Lucky::TextResponse.new(
        context,
        "text/vnd.turbo-stream.html",
        page.perform_render,
        status: 200,
      )
    end
  end
end
