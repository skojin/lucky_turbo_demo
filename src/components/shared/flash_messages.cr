class Shared::FlashMessages < BaseComponent
  needs flash : Lucky::FlashStore

  def render
    tag("turbo-frame", id: "flash") do
      flash.each do |flash_type, flash_message|
        div class: "flash-#{flash_type}", flow_id: "flash" do
          text flash_message
        end
      end
    end
  end
end
