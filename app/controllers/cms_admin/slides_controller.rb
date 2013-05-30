class CmsAdmin::SlidesController < CmsAdmin::BaseController

  skip_before_filter :load_fixtures

  before_filter :build_slide,  :only => [:new, :create]
  before_filter :load_slide,   :only => [:edit, :update, :destroy]

  def index
    @slides = @site.slides.order('cms_slides.position')

      if params[:ajax]
      slides = @slides.images.collect do |slide|
        { :thumb  => slide.file.url(:cms_thumb),
          :image  => slide.file.url }
      end
      render :json => slides
    else
      return redirect_to :action => :new if @site.slides.count == 0
    end
  end

  def new
    render
  end

  def create
    @slides = []

    # Sometimes params[:file] comes in as a single file object
    unless params[:file].is_a?(Hash)
      uploaded_file = params[:file]
      params[:file] = { }
      params[:file][:file] = [uploaded_file]
    end

    file_array  = params[:file][:file] || [nil]
    label       = params[:file][:label]

    file_array.each_with_index do |file, i|
      file_params = params[:file].merge(:file => file)
      # if file_array.size > 1 && file_params[:label].present?
      #   label = file_params[:label] + " #{i + 1}"
      # end
      @slide = @site.slides.create!(file_params)
      @slides << @slide
    end

    if params[:ajax]
      view = render_to_string(:partial => 'cms_admin/slides/slide', :collection => @slides, :layout => false)
      render :json => {:filelink => @slide.file.url, :view => view.gsub("\n", '')}
    else
      flash[:success] = I18n.t('cms.slides.created')
      redirect_to :action => :index
    end
  rescue ActiveRecord::RecordInvalid
    logger.detailed_error($!)
    if params[:ajax]
      render :nothing => true, :status => :unprocessable_entity
    else
      flash.now[:error] = I18n.t('cms.slides.creation_failure')
      render :action => :new
    end
  end

  def update
    @slide.update_attributes!(params[:file])
    flash[:success] = I18n.t('cms.slides.updated')
    redirect_to :action => :edit, :id => @slide
  rescue ActiveRecord::RecordInvalid
    logger.detailed_error($!)
    flash.now[:error] = I18n.t('cms.slides.update_failure')
    render :action => :edit
  end

  def destroy
    @slide.destroy
    respond_to do |format|
      format.js
      format.html do
        flash[:success] = I18n.t('cms.slides.deleted')
        redirect_to :action => :index
      end
    end
  end

  def reorder
    (params[:cms_slide] || []).each_with_index do |id, index|
      if (cms_slide = Cms::Slide.find_by_id(id))
        cms_slide.update_attributes(:position => index)
      end
    end
    render :nothing => true
  end

protected

  def build_slide
    @slide = @site.slides.new
  end

  def load_slide
    @slide = @site.slides.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = I18n.t('cms.slides.not_found')
    redirect_to :action => :index
  end
end
