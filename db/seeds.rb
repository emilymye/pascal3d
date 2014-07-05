# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
## CURRENTLY: Defaults for Category, Mesh

Category.create([
{ 
name: 'aeroplane', 
keypoints: ["left_elevator", "left_wing", "noselanding", "right_elevator", 
            "right_wing", "rudder_lower", "rudder_upper", "tail"],
meshes:[ "aeroplane01.json","aeroplane02.json","aeroplane03.json","aeroplane04.json",
         "aeroplane05.json","aeroplane06.json","aeroplane07.json","aeroplane08.json" ]
},
{
name: 'bicycle', 
keypoints: [ "head_center", "left_back_wheel", "left_front_wheel", "left_handle", 
             "left_pedal_center", "right_back_wheel", "right_front_wheel", 
             "right_handle", "right_pedal_center", "seat_back", "seat_front"],
meshes: [ "bicycle01.json","bicycle02.json","bicycle03.json","bicycle04.json",
          "bicycle05.json","bicycle06.json" ]
},
{
  name: 'boat', 
  keypoints: ["head", "head_down", "head_left", "head_right", "tail_left", "tail_right", "tail"],
  meshes: [ "boat01.json","boat02.json","boat03.json","boat04.json","boat05.json","boat06.json" ]
},
{
  name: 'bottle', 
  keypoints: ["mouth", "body", "body_left", "body_right", "bottom", "bottom_left", "bottom_right"],
  meshes: ["bottle01.json","bottle02.json","bottle03.json","bottle04.json",
           "bottle05.json", "bottle06.json","bottle07.json","bottle08.json" ]
},
{
  name: 'bus', 
  keypoints: ["body_back_left_lower", "body_back_left_upper", "body_back_right_lower", "body_back_right_upper",
              "body_front_left_upper", "body_front_right_upper", "body_front_left_lower", "body_front_right_lower",
              "left_back_wheel", "left_front_wheel", "right_back_wheel", "right_front_wheel"],
  meshes: [ "bus01.json","bus02.json","bus03.json","bus04.json","bus05.json","bus06.json" ]
},
{
  name: 'car', 
  keypoints: ["left_front_wheel", "left_back_wheel", "right_front_wheel", "right_back_wheel",
              "upper_left_windshield", "upper_right_windshield", "upper_left_rearwindow", 
              "upper_right_rearwindow", "left_front_light", "right_front_light", "left_back_trunk", 
              "right_back_trunk"],
  meshes: [ "car01.json","car02.json","car03.json","car04.json","car05.json","car06.json",
            "car07.json","car08.json","car09.json","car10.json" ]
},
{
  name: 'chair', 
  keypoints: ["back_upper_left", "back_upper_right", "seat_upper_left", "seat_upper_right", "seat_lower_left", 
              "seat_lower_right", "leg_upper_left", "leg_upper_right", "leg_lower_left", "leg_lower_right"],
  meshes: [ "chair01.json","chair02.json","chair03.json","chair04.json","chair05.json","chair06.json",
            "chair07.json","chair08.json","chair09.json","chair10.json" ]
},
{ 
  name: 'dining_table', 
  keypoints: ["leg_upper_left", "leg_upper_right", "leg_lower_left", "leg_lower_right",
              "top_upper_left", "top_upper_right", "top_lower_left", "top_lower_right",
              "top_up", "top_down", "top_left", "top_right"],
  meshes: [ "diningtable01.json","diningtable02.json","diningtable03.json","diningtable04.json",
            "diningtable05.json","diningtable06.json" ]
},
{ 
  name: 'motorbike', 
  keypoints: ["back_seat", "front_seat", "head_center", "headlight_center",
              "left_back_wheel", "left_front_wheel","left_handle_center",
              "right_back_wheel", "right_front_wheel", "right_handle_center"],
  meshes: [ "motorbike01.json","motorbike02.json","motorbike03.json","motorbike04.json","motorbike05.json" ]
},
{ 
  name: 'sofa', 
  keypoints: ["front_bottom_left", "front_bottom_right", "seat_bottom_left", "seat_bottom_right", 
              "left_bottom_back", "right_bottom_back", "top_left_corner",  "top_right_corner", 
              "seat_top_left", "seat_top_right" ],
  meshes: [ "sofa01.json","sofa02.json","sofa03.json","sofa04.json","sofa05.json","sofa06.json" ]
},
{
  name: 'train', 
  keypoints: ["head_left_bottom", "head_left_top", "head_right_bottom", "head_right_top", "head_top",
              "mid1_left_bottom", "mid1_left_top", "mid1_right_bottom", "mid1_right_top",
              "mid2_left_bottom", "mid2_left_top", "mid2_right_bottom", "mid2_right_top",
              "tail_left_bottom", "tail_left_top", "tail_right_bottom", "tail_right_top"],
  meshes: [ "train01.json","train02.json","train03.json","train04.json" ]

},
{ 
  name: 'tv_monitor', 
  keypoints: ["front_bottom_left", "front_bottom_right", "front_top_left", "front_top_right",
              "back_bottom_left", "back_bottom_right", "back_top_left", "back_top_right"],
  meshes: [ "tvmonitor01.json","tvmonitor02.json","tvmonitor03.json","tvmonitor04.json" ]
},
{
  name: 'bed',
  keypoints: ["back_left", "back_right", "frame_upper_left", "frame_upper_right", "frame_lower_left", "frame_lower_right",
              "mattress_upper_left", "mattress_upper_right", "mattress_lower_left", "mattress_lower_right"],
  meshes: [ "bed01.json","bed02.json","bed03.json","bed04.json","bed05.json","bed06.json" ]
}
])


#UNUSED CATEGORIES
# {
#   name: 'bed', 
#   keypoints: ["back_left", "back_right", "frame_upper_left", "frame_upper_right", "frame_lower_left", 
#     "frame_lower_right", "mattres_upper_left", "mattres_upper_right", "mattres_lower_left", "mattres_lower_right"] 
# },
# {
# name: 'cellphone', 
# keypoints: ["insidescreen_lower_left", "insidescreen_lower_right", "insidescreen_upper_left", "insidescreen_upper_right",
#         "lowerkeyboard_lower_left", "lowerkeyboard_lower_right", "lowerkeyboard_upper_left", "lowerkeyboard_upper_right",
#         "outsidescreen_lower_left", "outsidescreen_lower_right", "outsidescreen_upper_left", "outsidescreen_upper_right",
#         "upperkeyboard_lower_left", "upperkeyboard_lower_right", "upperkeyboard_upper_left", "upperkeyboard_upper_right"] 
# },
# {
#   name: 'iron', 
#   keypoints: ["handle_back", "handle_top", "back_left", "back_right", "tip"] 
# },
# { 
#   name: 'mouse', 
#   keypoints: ["peak", "head", "scroll_lower", "scroll_upper", "tail"] 
# },
# { 
#   name: 'mug', 
#   keypoints: ["bottom_near_handle", "bottom_opposite_handle",
#           "handle_bottom", "handle_top", "top_near_handle", "top_opposite_handle"] 
# },
# { 
#   name: 'shoe', 
#   keypoints: ["back_bottom", "back_top", "front_bottom", "front_line", "front_top"] 
# },
# { 
#   name: 'stapler', 
#   keypoints: ["back_lower_left", "back_lower_right", "back_upper_left",
#               "back_upper_right", "front_upper_left",
#               "front_upper_right", "front_bottom_left", "front_bottom_right"] 
# },
# { 
#   name: 'toaster', 
#   keypoints: ["leftside_bottom_left", "leftside_bottom_right",
#               "leftside_top_left", "leftside_top_right",
#               "rightside_bottom_left", "rightside_bottom_right",
#               "rightside_top_left", "rightside_top_right"] 
# }
