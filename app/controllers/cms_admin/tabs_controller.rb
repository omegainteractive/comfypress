class CmsAdmin::TabsController < CmsAdmin::BaseController

  before_filter :build_tab, :only => [:new, :create]
  before_filter :load_tab,  :only => [:edit, :update, :destroy]

  def index
    return redirect_to :action => :new if @site.tabs.count == 0
    @tabs = @site.tabs
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @tab.save!
    flash[:success] = I18n.t('cms.tabs.created')
    redirect_to :action => :edit, :id => @tab
  rescue ActiveRecord::RecordInvalid
    logger.detailed_error($!)
    flash.now[:error] = I18n.t('cms.tabs.creation_failure')
    render :action => :new
  end

  def update
    @tab.update_attributes!(params[:tab])
    flash[:success] = I18n.t('cms.tabs.updated')
    redirect_to :action => :edit, :id => @tab
  rescue ActiveRecord::RecordInvalid
    logger.detailed_error($!)
    flash.now[:error] = I18n.t('cms.tabs.update_failure')
    render :action => :edit
  end

  def destroy
    @tab.destroy
    flash[:success] = I18n.t('cms.tabs.deleted')
    redirect_to :action => :index
  end
  
  def reorder
    (params[:cms_snippet] || []).each_with_index do |id, index|
      Cms::Snippet.where(:id => id).update_all(:position => index)
    end
    render :nothing => true
  end

protected

  def build_tab
    @tab = @site.tabs.new(params[:tab])
  end

  def load_tab
    @tab = @site.tabs.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = I18n.t('cms.tabs.not_found')
    redirect_to :action => :index
  end
end
