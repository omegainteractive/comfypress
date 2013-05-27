class CmsAdmin::MenusController < CmsAdmin::BaseController
  before_filter :build_menu, :only => [:new, :create]
  before_filter :load_menu,  :only => [:edit, :update, :destroy]

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
    @menu.save!
    flash[:success] = I18n.t('cms.menus.created')
    redirect_to :action => :edit, :id => @menu
  rescue ActiveRecord::RecordInvalid
    logger.detailed_error($!)
    flash.now[:error] = I18n.t('cms.menus.creation_failure')
    render :action => :new
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
  
      def load_menu
          @menu = @site.menus.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          flash[:error] = I18n.t('cms.menus.not_found')
          redirect_to :action => :index
        end
      


end
