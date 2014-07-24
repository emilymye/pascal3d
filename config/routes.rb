Pascal3d::Application.routes.draw do
  get 'mturk/new_annotation' => "mturk#bounding_box"
  get 'mturk/edit_annotation/:annotation_id' => "mturk#edit_annotation"
  get 'mturk/mesh_annotation/:annotation_id' => "mturk#mesh_annotation"
  get 'mturk/orientation_annotation/:annotation_id' => "mturk#orientation_annotation"
  get 'mturk/keypoints_annotation/:annotation_id' => "mturk#keypoints_annotation"
  post 'mturk/test_form' => "mturk#test_form"
  post 'mturk/default_form' => "mturk#default_form"

end
