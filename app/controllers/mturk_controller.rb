class MturkController < ApplicationController
  before_filter :set_mturk_attributes
  before_filter :set_annotation, :only => [ :edit_annotation ]
  
  skip_before_filter :verify_authenticity_token
  
  def bounding_box
    @img = params[:image] || render_401
    @img = URI.decode(@img)
    @category = Category.find_by_name(params[:category]) || render_401
    render_401 unless Rails.application.assets.find_asset(@img)
  end

  def edit_annotation
    if @annotation.stage == Annotation::STAGES[:mesh]
      @meshes = @annotation.category.meshes
      render "mesh"
    elsif @annotation.stage == Annotation::STAGES[:orientation]
      render "orientation"
    elsif @annotation.stage == Annotation::STAGES[:keypoints]
      @valid_keypoints = @annotation.category.keypoints
      render "keypoints"
    else 
      render "/"
    end
  end

  def test_form
    type = params[:task]

    if type == "bounding_box"
      @annotation = Annotation.new
      @annotation.image_file = params[:image_file]
      @annotation.category_name = params[:category_name]
      @annotation.x0 = params[:x0]
      @annotation.x1 = params[:x1]
      @annotation.y0 = params[:y0]
      @annotation.y1 = params[:y1]
      if @annotation.save
        render :text => "Annotation was successfully created" and return
      else 
        p @annotation.errors
        render :text => "Error, no annotation created" and return
      end
    else
      @annotation = Annotation.find_by_id(params[:annotation_id])
      render :text => "Error, no such annotation" and return unless !@annotation.nil?
      if type == "mesh"
        @annotation.mesh = params[:mesh_file]
        render :text => "Error, no such mesh" and return unless @annotation.category.meshes.include?(params[:mesh_file])
      elsif type == "orientation"
        @annotation.elevation = params[:elevation]
        @annotation.azimuth = params[:azimuth]
      elsif type == "keypoints"

      end

      if !@annotation.nil?
        @annotation.stage = @annotation.stage + 1;
        if @annotation.save

          render :text => "Annotation was successfully updated" and return
        else 
          p @annotation.errors
          render :text => "Error, no annotation updated" and return
        end
      end
    end
  end

protected
  def set_mturk_attributes
    @via_turk = !!params['assignmentId']
    @preview = false #(params['assignmentId'] == 'ASSIGNMENT_ID_NOT_AVAILABLE')
    @sandbox  = RTurk.sandbox?

    if @via_turk
      @form_url = "http://workersandbox.mturk.com/mturk/externalSubmit"
      if not @preview then

      end
    else
      @formurl = "/mturk/test_form"
    end

  end

  def set_annotation
    @annotation = Annotation.find_by_id(params[:annotation_id]) || render_404
  end
end
