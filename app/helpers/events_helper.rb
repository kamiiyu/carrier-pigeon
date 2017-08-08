module EventsHelper
  def publish_caption
    @event.status == 'Published' ? 'Unpublish' : 'Publish'
  end

  def event_status
    @event.status == 'Published' ? 'Draft' : 'Published'
  end
end
