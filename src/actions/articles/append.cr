class Articles::Append < BrowserAction
  post "/articles/append" do
    SaveArticle.create(params) do |operation, article|
      if article
        flash.success = "The record has been saved"
        operation = SaveArticle.new # reset form
      else
        flash.failure = "It looks like the form is not valid"
      end
      page = AppendPage.new(context: context, article: article, operation: operation)
      Lucky::TextResponse.new(
        context,
        "text/vnd.turbo-stream.html",
        page.perform_render,
        status: 200,
      )
    end
  end
end
