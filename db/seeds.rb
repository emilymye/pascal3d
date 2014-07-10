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
  name: 'ashtray',
  keypoints: ["top_outer_left","top_outer_right","top_outer_back","top_outer_front",
              "bottom_left","bottom_right","bottom"],
  meshes: [ "ashtray01.json","ashtray02.json","ashtray03.json","ashtray04.json","ashtray05.json","ashtray06.json"]
},
{
  name: 'barrel',
  keypoints: ["tmp"],
  meshes: ["barrel01.json"]
},
{
  name: 'basket',
  keypoints: ["tmp"],
  meshes: ["basket01.json"]
},
{
  name: 'bed',
  keypoints: ["back_left", "back_right", "frame_upper_left", "frame_upper_right", "frame_lower_left", "frame_lower_right",
              "mattress_upper_left", "mattress_upper_right", "mattress_lower_left", "mattress_lower_right"],
  meshes: [ "bed01.json","bed02.json","bed03.json","bed04.json","bed05.json","bed06.json" ]
},
{
  name: 'bench',
  keypoints: ["seat_front_left","seat_front_right","seat_back_left","seat_back_right",
              "leg_front_left","leg_front_right","leg_back_left","leg_back_right",
              "back_upper_left","back_upper_right","left_handle","right_handle"],
  meshes: [ "bench01.json","bench02.json","bench03.json","bench04.json","bench05.json"]
},
{
  name: 'blackboard',
  keypoints: ["upper_left","upper_right","lower_left","lower_right"],
  meshes: ["blackboard01.json","blackboard02.json","blackboard03.json","blackboard04.json"]
},
{
  name: 'book',
  keypoints: ["tmp"],
  meshes: ["book01.json"]
},
{
  name: 'bookshelf',
  keypoints: ["front_top_left","front_top_right","front_bottom_left","front_bottom_right",
              "back_top_left","back_top_right","back_bottom_left","back_bottom_right"],
  meshes: ["bookshelf01.json","bookshelf02.json","bookshelf03.json","bookshelf04.json"]
},
{
  name: 'box',
  keypoints: ["tmp"],
  meshes: ["box01.json"]
},
{
  name: 'bucket',
  keypoints: ["handle_center","handle_left","handle_right","bottom","bottom_left","bottom_right",
              "top","top_left","top_right"],
  meshes: ["bucket01.json","bucket02.json","bucket03.json","bucket04.json","bucket05.json"]
},
{
  name: 'cabinet',
  keypoints: ["tmp"],
  meshes: ["cabinet01.json"]
},
{
  name: 'calculator',
  keypoints: ["display_upper_left","display_upper_right","display_lower_left","display_lower_right",
              "body_upper_left","body_upper_right","body_lower_left","body_lower_right",
              "key_upper_left","key_upper_right","key_lower_left","key_lower_right"],
  meshes: ["calculator01.json","calculator02.json","calculator03.json","calculator04.json","calculator05.json"]
},
{
  name: 'camera',
  keypoints: ["tmp"],
  meshes: ["camera01.json"]
},
{
  name: 'can',
  keypoints: ["tmp"],
  meshes: ["can01.json"]
},
{
  name: 'cap',
  keypoints: ["tmp"],
  meshes: ["cap01.json"]
},
{
  name: 'cellphone',
  keypoints: ["inscreen_upper_left","inscreen_upper_right","inscreen_lower_left","inscreen_lower_right",
              "outscreen_upper_left","outscreen_upper_right","outscreen_lower_left","outscreen_lower_right",
              "key_upper_left","key_upper_right","key_lower_left","key_lower_right",
              "back_upper_left","back_upper_right","back_lower_left","back_lower_right"],
  meshes: ["cellphone01.json","cellphone02.json","cellphone03.json","cellphone04.json"]
},
{
  name: 'clock',
  keypoints: ["tmp"],
  meshes: ["clock01.json"]
},
{
  name: 'coffee_maker',
  keypoints: ["left","right","top","bottom"],
  meshes: ["coffee_maker01.json","coffee_maker02.json","coffee_maker03.json","coffee_maker04.json"]
},
{
  name: 'comb',
  keypoints: ["tmp"],
  meshes: ["comb01.json"]
},
{
  name: 'computer',
  keypoints: ["tmp"],
  meshes: ["computer01.json"]
},
{
  name: 'cup',
  keypoints: ["upper_left","upper_right","upper_center","lower_left","lower_right","lower_center","handle_top","handle_bottom","handle_center"],
  meshes: [ "cup01.json","cup02.json","cup03.json","cup04.json","cup05.json","cup06.json" ]
},
{
  name: 'desk_lamp',
  keypoints: ["tmp"],
  meshes: ["desk_lamp01.json"]
},
{
  name: 'dishwasher',
  keypoints: ["tmp"],
  meshes: ["dishwasher01.json"]
},
{
  name: 'door',
  keypoints: ["tmp"],
  meshes: ["door01.json"]
},
{
  name: 'eraser',
  keypoints: ["tmp"],
  meshes: ["eraser01.json"]
},
{
  name: 'eyeglasses',
  keypoints: ["tmp"],
  meshes: ["eyeglasses01.json"]
},
{
  name: 'fan',
  keypoints: ["tmp"],
  meshes: ["fan01.json"]
},
{
  name: 'faucet',
  keypoints: ["tmp"],
  meshes: ["faucet01.json"]
},
{
  name: 'filing_cabinet',
  keypoints: ["tmp"],
  meshes: ["filing_cabinet01.json"]
},
{
  name: 'fire_extinguisher',
  keypoints: ["tmp"],
  meshes: ["fire_extinguisher01.json"]
},
{
  name: 'fish_tank',
  keypoints: ["tmp"],
  meshes: ["fish_tank01.json"]
},
{
  name: 'flashlight',
  keypoints: ["tmp"],
  meshes: ["flashlight01.json"]
},
{
  name: 'fork',
  keypoints: ["tmp"],
  meshes: ["fork01.json"]
},
{
  name: 'guitar',
  keypoints: ["tmp"],
  meshes: ["guitar01.json"]
},
{
  name: 'hair_dryer',
  keypoints: ["tmp"],
  meshes: ["hair_dryer01.json"]
},
{
  name: 'headphone',
  keypoints: ["tmp"],
  meshes: ["headphone01.json"]
},
{
  name: 'helmet',
  keypoints: ["tmp"],
  meshes: ["helmet01.json"]
},
{
  name: 'iron',
  keypoints: ["tmp"],
  meshes: ["iron01.json"]
},
{
  name: 'jar',
  keypoints: ["tmp"],
  meshes: ["jar01.json"]
},
{
  name: 'kettle',
  keypoints: ["tmp"],
  meshes: ["kettle01.json"]
},
{
  name: 'key',
  keypoints: ["tmp"],
  meshes: ["key01.json"]
},
{
  name: 'keyboard',
  keypoints: ["tmp"],
  meshes: ["keyboard01.json"]
},
{
  name: 'knife',
  keypoints: ["tmp"],
  meshes: ["knife01.json"]
},
{
  name: 'laptop',
  keypoints: ["tmp"],
  meshes: ["laptop01.json"]
},
{
  name: 'lighter',
  keypoints: ["tmp"],
  meshes: ["lighter01.json"]
},
{
  name: 'mailbox',
  keypoints: ["tmp"],
  meshes: ["mailbox01.json"]
},
{
  name: 'microphone',
  keypoints: ["tmp"],
  meshes: ["microphone01.json"]
},
{
  name: 'microwave',
  keypoints: ["tmp"],
  meshes: ["microwave01.json"]
},
{
  name: 'mouse',
  keypoints: ["tmp"],
  meshes: ["mouse01.json"]
},
{
  name: 'opener',
  keypoints: ["tmp"],
  meshes: ["opener01.json"]
},
{
  name: 'paintbrush',
  keypoints: ["tmp"],
  meshes: ["paintbrush01.json"]
},
{
  name: 'pan',
  keypoints: ["tmp"],
  meshes: ["pan01.json"]
},
{
  name: 'pen',
  keypoints: ["tmp"],
  meshes: ["pen01.json"]
},
{
  name: 'pencil',
  keypoints: ["tmp"],
  meshes: ["pencil01.json"]
},
{
  name: 'piano',
  keypoints: ["tmp"],
  meshes: ["piano01.json"]
},
{
  name: 'pillow',
  keypoints: ["tmp"],
  meshes: ["pillow01.json"]
},
{
  name: 'plate',
  keypoints: ["tmp"],
  meshes: ["plate01.json"]
},
{
  name: 'pot',
  keypoints: ["tmp"],
  meshes: ["pot01.json"]
},
{
  name: 'printer',
  keypoints: ["tmp"],
  meshes: ["printer01.json"]
},
{
  name: 'racket',
  keypoints: ["tmp"],
  meshes: ["racket01.json"]
},
{
  name: 'refrigerator',
  keypoints: ["tmp"],
  meshes: ["refrigerator01.json"]
},
{
  name: 'remote_control',
  keypoints: ["tmp"],
  meshes: ["remote_control01.json"]
},
{
  name: 'rifle',
  keypoints: ["tmp"],
  meshes: ["rifle01.json"]
},
{
  name: 'road_pole',
  keypoints: ["tmp"],
  meshes: ["road_pole01.json"]
},
{
  name: 'satellite_dish',
  keypoints: ["tmp"],
  meshes: ["satellite_dish01.json"]
},
{
  name: 'scissors',
  keypoints: ["tmp"],
  meshes: ["scissors01.json"]
},
{
  name: 'screwdriver',
  keypoints: ["tmp"],
  meshes: ["screwdriver01.json"]
},
{
  name: 'shoe',
  keypoints: ["tmp"],
  meshes: ["shoe01.json"]
},
{
  name: 'shovel',
  keypoints: ["tmp"],
  meshes: ["shovel01.json"]
},
{
  name: 'sign',
  keypoints: ["tmp"],
  meshes: ["sign01.json"]
},
{
  name: 'skate',
  keypoints: ["tmp"],
  meshes: ["skate01.json"]
},
{
  name: 'slipper',
  keypoints: ["tmp"],
  meshes: ["slipper01.json"]
},
{
  name: 'speaker',
  keypoints: ["tmp"],
  meshes: ["speaker01.json"]
},
{
  name: 'spoon',
  keypoints: ["tmp"],
  meshes: ["spoon01.json"]
},
{
  name: 'stapler',
  keypoints: ["tmp"],
  meshes: ["stapler01.json"]
},
{
  name: 'stove',
  keypoints: ["tmp"],
  meshes: ["stove01.json"]
},
{
  name: 'suitcase',
  keypoints: ["tmp"],
  meshes: ["suitcase01.json"]
},
{
  name: 'teapot',
  keypoints: ["tmp"],
  meshes: ["teapot01.json"]
},
{
  name: 'telephone',
  keypoints: ["tmp"],
  meshes: ["telephone01.json"]
},
{
  name: 'toilet',
  keypoints: ["tmp"],
  meshes: ["toilet01.json"]
},
{
  name: 'toothbrush',
  keypoints: ["tmp"],
  meshes: ["toothbrush01.json"]
},
{
  name: 'trash_bin',
  keypoints: ["tmp"],
  meshes: ["trash_bin01.json"]
},
{
  name: 'trophy',
  keypoints: ["tmp"],
  meshes: ["trophy01.json"]
},
{
  name: 'tub',
  keypoints: ["tmp"],
  meshes: ["tub01.json"]		  
},
{
  name: 'vending_machine',
  keypoints: ["tmp"],
  meshes: ["vending_machine01.json"]
},
{
  name: 'washing_machine',
  keypoints: ["tmp"],
  meshes: ["washing_machine01.json"]
},
{
  name: 'watch',
  keypoints: ["tmp"],
  meshes: [ "watch01.json"]
},
{
  name: 'wheelchair',
  keypoints: ["tmp"],
  meshes: [ "wheelchair01.json" ]
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
