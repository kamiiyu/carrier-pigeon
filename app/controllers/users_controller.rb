class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_event, only: [:enroll]
  before_action :set_user, only: [:enroll]

  def enroll
    @enrollment = Enrollment.new(event: @event, user: @user)
    @enrollment.save
    respond_to do |format|
        format.js {}
    end
  end

  private

    def set_event
      authorize @event = Event.find(params[:event_id])
    end

    def set_user
      @user = User.find(params[:id])
    end
end
