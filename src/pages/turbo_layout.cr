# turbo stream update flash in this layout, via https://gorails.com/forum/flash-messages-and-toasts-with-hotwire-turbo-js-discussion#forum_post_18899
abstract class TurboLayout
  include Lucky::HTMLPage

  abstract def content

  def render
    content

    tag("turbo-stream", action: "replace", target: "flash") do
      tag("template") do
        mount Shared::FlashMessages, context.flash
      end
    end
  end
end
