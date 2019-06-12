require 'action_view/helpers/rendering_helper'

ActionView::Helpers::RenderingHelper.module_eval do
  alias render_without_update render
  def render(options = {}, locals = {}, &block)
    if options == :update
      update_page(&block)
    else
      render_without_update(options, locals, &block)
    end
  end
end
