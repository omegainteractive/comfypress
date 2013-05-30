class CmsAdmin::SitesController < CmsAdmin::BaseController

  skip_before_filter  :load_admin_site,
                      :load_fixtures

  before_filter :build_site,  :only => [:new, :create]
  before_filter :load_site,   :only => [:edit, :update, :destroy]
  before_filter :build_logo,  :only => [:new, :edit]

  def index
    return redirect_to :action => :new if Cms::Site.count == 0
    @site = Cms::Site.find_by_id(session[:site_id])
    @sites ||= Cms::Site.all
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @site.save!
    upload_logo
    flash[:success] = I18n.t('cms.sites.created')
    redirect_to cms_admin_site_layouts_path(@site)
  rescue ActiveRecord::RecordInvalid
    logger.detailed_error($!)
    flash.now[:error] = I18n.t('cms.sites.creation_failure')
    render :action => :new
  end

  def update
    upload_logo
    @site.update_attributes!(params[:site])
    flash[:success] = I18n.t('cms.sites.updated')
    redirect_to :action => :edit, :id => @site
  rescue ActiveRecord::RecordInvalid
    logger.detailed_error($!)
    flash.now[:error] = I18n.t('cms.sites.update_failure')
    render :action => :edit
  end

  def destroy
    @site.destroy
    flash[:success] = I18n.t('cms.sites.deleted')
    redirect_to :action => :index
  end

protected

  def build_logo
    @site.build_logo unless @site.logo
  end

  def upload_logo
    if logo_file = params[:site][:logo_file]
      file = Cms::File.create!({file: logo_file, site_id: @site.id})
      @site.logo_id = file.id
      @site.save!
    end
  end

  def build_site
    @site = Cms::Site.new(params[:site])
    @site.hostname ||= request.host.downcase
  end

  def load_site
    @site = Cms::Site.find(params[:id])
    I18n.locale = ComfyPress.config.admin_locale || @site.locale
  rescue ActiveRecord::RecordNotFound
    flash[:error] = I18n.t('cms.sites.not_found')
    redirect_to :action => :index
  end

end
