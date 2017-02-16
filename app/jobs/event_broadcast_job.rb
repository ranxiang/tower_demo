class EventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(event)
    ActionCable.server.broadcast 'event_channel', event: render_event(event)
  end

  private
  def render_event(event)
    ApplicationController.renderer.render(partial: "events/#{event.event_type}", locals: { event: event })
  end
end
