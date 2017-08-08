module EventsHelper

  def publish_caption
    @event.published? ? 'Unpublish' : 'Publish & Send email'
  end

  def event_status
    @event.published? ? 'draft' : 'published'
  end

  def panel_type
    @event.published? ? 'panel panel-green' : 'panel panel-red'
  end

  def filters_path(filters = {})
    if request.path == '/'
      events_path(filters)
    else
      "#{request.path}?#{filters.to_query}"
    end
  end

end
