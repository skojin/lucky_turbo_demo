class Shared::LayoutHead < BaseComponent
  needs page_title : String

  def render
    head do
      utf8_charset
      title "My App - #{@page_title}"
      css_link asset("css/app.css"), data_turbo_track: "reload"
      js_link asset("js/app.js"), defer: "true", data_turbo_track: "reload"
      meta name: "turbolinks-cache-control", content: "no-cache"
      csrf_meta_tags
      responsive_meta_tag
    end
  end
end
