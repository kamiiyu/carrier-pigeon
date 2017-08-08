class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_event, only: [:show, :edit, :update, :send_email]
  before_action :set_events, only: [:index]
  before_action :load_departments, only: [:edit, :new, :create, :update]

  # GET /events
  # GET /events.json
  def index
    skip_authorization
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event
  end

  # GET /events/new
  def new
    authorize @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    authorize @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def send_email
      UserMailer.event_announcement(@event, current_user).deliver_later
      respond_to do |format|
        format.html { redirect_to event_path(@event), notice: "Your test email was sent to #{current_user.email} successfully. " }
      end
  end

  def enroll_by_email
    @enrollment = Enrollment.new(JWT.decode(params[:token], Rails.application.secrets.secret_key_base).first)
    respond_to do |format|
      if @enrollment.save
        format.html {redirect_to event_url(@enrollment.event), notice: 'You have enrolled successfully!' }
      else
        format.html {redirect_to event_url(@enrollment.event), alert: @enrollment.errors.values.sum([]).join(' & ') }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      authorize @event = Event.find(params[:id])
    end

    def load_departments
      @departments = Department.order(:id)
    end

    def set_events
      @filter_event_types = (params[:event_type] || Settings.event.types)
      @events = policy_scope(Event.where(event_type: @filter_event_types).order(filter_params.to_h).page(params[:page]))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :event_type, :organizer, :started_at, :ended_at, :enrollment_started_at, :enrollment_ended_at, :user_id, :owner_id, :capacity, :description, :status, :location, department_ids: [])
    end

    def filter_params
      params.require(:filter).permit(:updated_at, :started_at) rescue {id: :desc}
    end
end
