class CmsAdmin::MenusController < CmsAdmin::BaseController
  before_filter :build_menu, :only => [:new, :create]

  def index
    return redirect_to :action => :new if @site.menus.count == 0
    @menus = @site.menus
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
    
      def build_menu
        @menu= @site.menus.new(params[:menu])
      end
  



end
