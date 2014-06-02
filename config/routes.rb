Pascal3d::Application.routes.draw do
  get 'mturk/bounding_box' => "mturk#bounding_box"
  get 'mturk/edit_annotation/:annotation_id' => "mturk#edit_annotation"
  post 'mturk/test_form' => "mturk#test_form"
  get 'mturk/test' => 'mturk#test'
end
