class SocializationsController < ApplicationController
  before_filter :load_socializable

  def like
    current_user.like!(@socializable)
    render json: { follow: true }
  end

  def unlike
    current_user.unlike!(@socializable)
    render json: { follow: false }
  end

  def toggle_like
    current_user.toggle_like!(@socializable)
    render json: { follow: true }
  end

private
  def load_socializable
    @socializable =
      case
      when id = params[:comment_id] # Must be before :item_id, since it's nested under it.
        @community.comments.find(id)
      when id = params[:item_id]
        @community.items.find(id)
      when id = params[:user_id]
        User.find(id)
      when id = params[:category_id]
        @community.categories.find_by_id(id)
      else
        raise ArgumentError, "Unsupported socializable model, params: " +
                             params.keys.inspect
      end
    raise ActiveRecord::RecordNotFound unless @socializable
  end
end
