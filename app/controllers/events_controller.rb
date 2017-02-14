class EventsController < ApplicationController
  PER_PAGE = 50

  def index
    @events = Event.order(created_at: :desc).limit(PER_PAGE)
  end
end
