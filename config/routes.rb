Pascal3d::Application.routes.draw do
  get 'mturk/new_annotation' => "mturk#bounding_box"
  get 'mturk/mesh' => "mturk#mesh"
  #get 'mturk/edit_annotation/' => "mturk#mesh"
  get 'mturk/edit_annotation/:annotation_id' => "mturk#edit_annotation"
  post 'mturk/test_form' => "mturk#test_form"
  post 'mturk/default_form' => "mturk#default_form"

end
