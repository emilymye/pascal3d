require 'json'

class MturkController < ApplicationController
  before_filter :set_mturk_attributes
  before_filter :set_annotation, :only => [ :edit_annotation, :mesh_annotation, :orientation_annotation, :keypoints_annotation]
  
  skip_before_filter :verify_authenticity_token
  
  def bounding_box
    @img = params[:image] || render_401
    @img = URI.decode(@img)
    @category = Category.find_by_name(params[:category]) || render_401
  end

  def edit_annotation
    if @annotation.stage == Annotation::STAGES[:mesh]
      @meshes = @annotation.category.meshes
      render "mesh"
    elsif @annotation.stage == Annotation::STAGES[:orientation]
      render "orientation"
    elsif @annotation.stage == Annotation::STAGES[:keypoints]
      render "keypoints"
    else 
      render "complete_annotation"
    end
  end
  
  def mesh_annotation
    if @annotation.stage == Annotation::STAGES[:mesh]
      @meshes = @annotation.category.meshes
      render "mesh"
    else
      render "complete_annotation"
    end
  end

  def orientation_annotation
    if @annotation.stage == Annotation::STAGES[:orientation]
      # @meshes = @annotation.category.meshes
      render "orientation"
    else
      render "complete_annotation"
    end
  end

  def keypoints_annotation
    if @annotation.stage == Annotation::STAGES[:keypoints]
      render "keypoints"
    else
      render "complete_annotation"
    end
  end 

  def test_form
    if !INIT_CONFIG["HOST_BASE_URL"].starts_with?("localhost")
      render :text => "You are not using Mechanical Turk - input rejected." and return
    end

    type = params[:task]
    if type == "bounding_box"
      render :text => "Error, no bounding boxes to process" and return if params["bounding_boxes"].nil? 
      text = ""
      boundingboxes = JSON.parse(params["bounding_boxes"])
      boundingboxes.each do |bb|

        @annotation = Annotation.new_from_hit({
          "image_file"=>params["image_file"],
          "category_name"=> params["category_name"],
          "x0" => bb["x0"],
          "y0" => bb["y0"],
          "x1" => bb["x1"],
          "y1" => bb["y1"]
        })
        if @annotation.save
          text = text + "Annotation #{@annotation.id} created\n"
        else 
          text = text + "Error, no annotation created with bounding box #{bb.to_s}]"
        end
        
      end
      render :text => text and return
    else
      @annotation = Annotation.find_by_id(params[:annotation_id])
      render :text => "Error, no such annotation" and return unless !@annotation.nil?
      if type == "mesh"
        @annotation.mesh = params[:mesh_file]
        render :text => "Error, no such mesh" and return unless @annotation.category.meshes.include?(params[:mesh_file])
      elsif type == "orientation"
        @annotation.elevation = params[:elevation]
        @annotation.azimuth = params[:azimuth]
	@annotation.bbox_validity = params[:bbox_validity]
	@annotation.mesh_validity = params[:mesh_validity]
        @annotation.keypoint_matches = JSON.parse(params[:keypoint_matches])
        @annotation.keypoint_matches.each do |k,v|
          v["px"] = nil
          v["py"] = nil
        end
      elsif type == "keypoints"
        @annotation.keypoint_matches = JSON.parse(params[:keypoint_matches])
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
    @assignmentId = params['assignmentId']
    @preview = (@assignmentId == 'ASSIGNMENT_ID_NOT_AVAILABLE')

    # assignment ID not provided for the sandbox mode
    if !@assignmentId.nil?
      @formurl = "https://#{RTurk.sandbox? ? "workersandbox" : "www"}.mturk.com/mturk/externalSubmit"
    else
      @formurl = "/mturk/test_form"
    end
  end

  def set_annotation
    @annotation = Annotation.find_by_id(params[:annotation_id]) || render_404
  end
end
