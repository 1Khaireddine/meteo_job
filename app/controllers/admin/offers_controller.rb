class Admin::OffersController < ApplicationController
  before_action :authorize_only_admin!
  before_action :set_offer, only: %i[show edit update destroy]

  # GET /offers
  def index
    if current_user.type = "Superadmin"
      @offers = current_user.company.offers
    else
      @offers = current_user.offers
    end
    respond_to do |format|
      format.html # This will look for app/views/admin/offers/index.html.erb
      format.json { render json: @offers }
    end
  end

  # GET /offers/1
  def show
  end

  def posts
    @offer= Offer.find(params[:id])

    @users = @offer.candidates
    respond_to do |format|
      format.html # This will look for app/views/admin/offers/index.html.erb
      format.json { render json: [@offer, @users] }
    end
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/:id/edit
  def edit
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)

    @offer.user_id = current_user.id
    @offer.company_id = current_user.company.id

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
        format.turbo_stream {
          redirect_to admin_offers_path
        }

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace('offer_form', partial: 'admin/offers/form',
                  locals: { offer: @offer, title: "New offer" })
        }
      end
    end
  end

  # PATCH/PUT /offers/:id
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace('offer_form', partial: 'admin/offers/form',
                  locals: { offer: @offer, title: "Edit offer" })
        }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace('offer_form', partial: 'admin/offers/form',
                  locals: { offer: @offer })
        }
      end
    end
  end

  # DELETE /offers/:id
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.turbo_stream { render turbo_stream: turbo_stream.remove("offer_#{@offer.id}") }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def offer_params
    params.require(:offer).permit(:title, :description, :expired_date, :limit_date, tags: []).tap do |offer_params|
      offer_params[:tags] = offer_params[:tags].split(',').map(&:strip) if offer_params[:tags].is_a?(String)
    end
  end

  # other actions (show, new, create, edit, update, destroy) can be defined here
end
