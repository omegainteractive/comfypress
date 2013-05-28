class CmsAdmin::MenuItemsController < CmsAdmin::BaseController
  before_filter :load_menu
  before_filter :build_menu_item, :only => [:new, :create]
  before_filter :load_menu_item,  :only => [:edit, :update, :destroy]

  def index
    return redirect_to :action => :new if @menu.menu_items.count == 0
    @menu_items = @menu.menu_items
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @menu_item.save!
    flash[:success] = I18n.t('cms.menu_items.created')
    redirect_to :action => :index
  rescue ActiveRecord::RecordInvalid
    logger.detailed_error($!)
    flash.now[:error] = I18n.t('cms.menu_items.creation_failure')
    render :action => :new
  end

  def update
    @menu_item.update_attributes!(params[:menu_item])
    flash[:success] = I18n.t('cms.menu_items.updated')
    redirect_to :action => :index, :id => @menu_item
  rescue ActiveRecord::RecordInvalid
    logger.detailed_error($!)
    flash.now[:error] = I18n.t('cms.menu_items.update_failure')
    render :action => :edit
  end

  def destroy
    @menu_item.destroy
    flash[:success] = I18n.t('cms.menu_items.deleted')
    redirect_to :action => :index
  end

    
protected

  def load_menu
    @menu = @site.menus.find(params[:menu_id]) || session[:menu_id]
  end
    
  def build_menu_item
    @menu_item= @menu.menu_items.new(params[:menu_item])
  end
  
  def load_menu_item
    @menu_item = @menu.menu_items.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = I18n.t('cms.menu_items.not_found')
      redirect_to :action => :index
  end
      


end
