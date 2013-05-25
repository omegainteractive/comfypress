class CmsAdmin::MenusController < CmsAdmin::BaseController

  before_filter :check_for_layouts, :only => [:new, :edit]

  def index
    render
  end

  def new
    render
  end

  def edit
    render
  end

  def create
  end

  def update

  end

  def destroy
    @menu.destroy
    flash[:success] = I18n.t('cms.menus.deleted')
    redirect_to :action => :index
  end

protected


end
