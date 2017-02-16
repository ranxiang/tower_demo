class EventsController < ApplicationController
  PER_PAGE = 50

  def index
    # TODO we might need consider the access permission between user and project here
    @events = Event.order(created_at: :desc).limit(PER_PAGE)
  end
end
