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
            "chair07.json","chair08.json","chair09.json","chair10.json","incorrect_bbox" ]
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
  meshes: [ "ashtray01.json","ashtray02.json","ashtray03.json","ashtray04.json","ashtray05.json","ashtray06.json","ashtray07.json",
	    "ashtray08.json","ashtray09.json","ashtray10.json","incorrect_bbox"]
},
{
  name: 'backpack',
  keypoints: ["tmp"],
  meshes: ["backpack01.json","backpack02.json","backpack03.json","backpack04.json","backpack05.json","backpack06.json",
	   "backpack07.json","backpack08.json","backpack09.json","backpack10.json","backpack11.json","incorrect_bbox"]
},
{
  name: 'basket',
  keypoints: ["tmp"],
  meshes: ["basket01.json","basket02.json","basket03.json","basket04.json","basket05.json","basket06.json","basket07.json",
	   "basket08.json","basket09.json","basket10.json","basket11.json","basket12.json","basket13.json","incorrect_bbox"]
},
{
  name: 'bed',
  keypoints: ["back_left", "back_right", "frame_upper_left", "frame_upper_right", "frame_lower_left", "frame_lower_right",
              "mattress_upper_left", "mattress_upper_right", "mattress_lower_left", "mattress_lower_right"],
  meshes: [ "bed01.json","bed02.json","bed03.json","bed04.json","bed05.json","bed06.json","bed07.json",
	    "bed08.json","bed09.json","incorrect_bbox" ]
},
{
  name: 'bench',
  keypoints: ["seat_front_left","seat_front_right","seat_back_left","seat_back_right",
              "leg_front_left","leg_front_right","leg_back_left","leg_back_right",
              "back_upper_left","back_upper_right","left_handle","right_handle"],
  meshes: [ "bench01.json","bench02.json","bench03.json","bench04.json","bench05.json","bench06.json","bench07.json","incorrect_bbox"]
},
{
  name: 'blackboard',
  keypoints: ["upper_left","upper_right","lower_left","lower_right"],
  meshes: ["blackboard01.json","blackboard02.json","blackboard03.json","blackboard04.json","blackboard05.json","blackboard06.json",
	   "blackboard07.json","blackboard08.json","blackboard09.json","blackboard10.json","blackboard11.json","incorrect_bbox"]
},
{
  name: 'bookshelf',
  keypoints: ["front_top_left","front_top_right","front_bottom_left","front_bottom_right",
              "back_top_left","back_top_right","back_bottom_left","back_bottom_right"],
  meshes: ["bookshelf01.json","bookshelf02.json","bookshelf03.json","bookshelf04.json","bookshelf05.json","bookshelf06.json",
	   "bookshelf07.json","bookshelf08.json","incorrect_bbox"]
},
{
  name: 'bucket',
  keypoints: ["handle_center","handle_left","handle_right","bottom","bottom_left","bottom_right",
              "top","top_left","top_right"],
  meshes: ["bucket01.json","bucket02.json","bucket03.json","bucket04.json","incorrect_bbox"]
},
{
  name: 'cabinet',
  keypoints: ["tmp"],
  meshes: ["cabinet01.json","cabinet02.json","cabinet03.json","cabinet04.json","cabinet05.json","cabinet06.json","cabinet07.json",
	   "cabinet08.json","cabinet09.json","cabinet10.json","cabinet11.json","cabinet12.json","cabinet13.json","cabinet14.json",
	   "cabinet15.json","incorrect_bbox"]
},
{
  name: 'calculator',
  keypoints: ["display_upper_left","display_upper_right","display_lower_left","display_lower_right",
              "body_upper_left","body_upper_right","body_lower_left","body_lower_right",
              "key_upper_left","key_upper_right","key_lower_left","key_lower_right"],
  meshes: ["calculator01.json","calculator02.json","calculator03.json","calculator04.json","calculator05.json","incorrect_bbox"]
},
{
  name: 'camera',
  keypoints: ["tmp"],
  meshes: ["camera01.json","camera02.json","camera03.json","camera04.json","camera05.json","camera06.json","camera07.json",
	   "camera08.json","camera09.json","camera10.json","camera11.json","incorrect_bbox"]
},
{
  name: 'can',
  keypoints: ["tmp"],
  meshes: ["can01.json","can02.json","can03.json","can04.json","can05.json","can06.json","incorrect_bbox"]
},
{
  name: 'cap',
  keypoints: ["tmp"],
  meshes: ["cap01.json","cap02.json","cap03.json","cap04.json","cap05.json","cap06.json","cap07.json","cap08.json","cap09.json",
	   "cap10.json","cap11.json","cap12.json","cap13.json","cap14.json","cap15.json","incorrect_bbox"]
},
{
  name: 'cellphone',
  keypoints: ["inscreen_upper_left","inscreen_upper_right","inscreen_lower_left","inscreen_lower_right",
              "outscreen_upper_left","outscreen_upper_right","outscreen_lower_left","outscreen_lower_right",
              "key_upper_left","key_upper_right","key_lower_left","key_lower_right",
              "back_upper_left","back_upper_right","back_lower_left","back_lower_right"],
  meshes: ["cellphone01.json","cellphone02.json","cellphone03.json","cellphone04.json",
           "cellphone05.json","cellphone06.json","cellphone07.json","cellphone08.json",
           "cellphone09.json","cellphone10.json","cellphone11.json","incorrect_bbox"]
},
{
  name: 'clock',
  keypoints: ["tmp"],
  meshes: ["clock01.json","clock02.json","clock03.json","clock04.json","clock05.json","clock06.json",
	   "clock07.json","clock08.json","clock09.json","incorrect_bbox"]
},
{
  name: 'coffee_maker',
  keypoints: ["left","right","top","bottom"],
  meshes: ["coffee_maker01.json","coffee_maker02.json","coffee_maker03.json","coffee_maker04.json","coffee_maker05.json",
	   "coffee_maker06.json","coffee_maker07.json","incorrect_bbox"]
},
{
  name: 'comb',
  keypoints: ["tmp"],
  meshes: ["comb01.json","comb02.json","comb03.json","comb04.json","comb05.json","comb06.json",
	   "comb07.json","comb08.json","comb09.json","incorrect_bbox"]
},
{
  name: 'computer',
  keypoints: ["tmp"],
  meshes: ["computer01.json"]
},
{
  name: 'cup',
  keypoints: ["upper_left","upper_right","upper_center","lower_left","lower_right","lower_center","handle_top","handle_bottom","handle_center"],
  meshes: [ "cup01.json","cup02.json","cup03.json","cup04.json","cup05.json","cup06.json","cup07.json",
	    "cup08.json","cup09.json","cup10.json","incorrect_bbox" ]
},
{
  name: 'desk_lamp',
  keypoints: ["tmp"],
  meshes: ["desk_lamp01.json","desk_lamp02.json","desk_lamp03.json","desk_lamp04.json","desk_lamp05.json","desk_lamp06.json",
	   "desk_lamp07.json","desk_lamp08.json","incorrect_bbox"]
},
{
  name: 'dishwasher',
  keypoints: ["tmp"],
  meshes: ["dishwasher01.json","dishwasher02.json","dishwasher03.json","dishwasher04.json","incorrect_bbox"]
},
{
  name: 'door',
  keypoints: ["tmp"],
  meshes: ["door01.json","door02.json","door03.json","door04.json","door05.json","door06.json","door07.json","door08.json",
	   "door09.json","door10.json","door11.json","incorrect_bbox"]
},
{
  name: 'eraser',
  keypoints: ["tmp"],
  meshes: ["eraser01.json","eraser02.json","eraser03.json","eraser04.json","eraser05.json","eraser06.json","eraser07.json","eraser08.json",
	   "eraser09.json","eraser10.json","eraser11.json","eraser12.json","eraser13.json","eraser14.json","eraser15.json","incorrect_bbox"]
},
{
  name: 'eyeglasses',
  keypoints: ["tmp"],
  meshes: ["eyeglasses01.json","eyeglasses02.json","eyeglasses03.json","eyeglasses04.json","eyeglasses05.json","eyeglasses06.json",
	   "eyeglasses07.json","eyeglasses08.json","eyeglasses09.json","eyeglasses10.json","eyeglasses11.json","incorrect_bbox"]
},
{
  name: 'fan',
  keypoints: ["tmp"],
  meshes: ["fan01.json","fan02.json","fan03.json","fan04.json","fan05.json","fan06.json","fan07.json","fan08.json",
	   "fan09.json","fan10.json","fan11.json","fan12.json","fan13.json","incorrect_bbox"]
},
{
  name: 'faucet',
  keypoints: ["tmp"],
  meshes: ["faucet01.json","faucet02.json","faucet03.json","faucet04.json","faucet05.json","faucet06.json","faucet07.json",
	   "faucet08.json","faucet09.json","faucet10.json","faucet11.json","incorrect_bbox"]
},
{
  name: 'filing_cabinet',
  keypoints: ["tmp"],
  meshes: ["filing_cabinet01.json","filing_cabinet02.json","filing_cabinet03.json","filing_cabinet04.json","filing_cabinet05.json",
	   "filing_cabinet06.json","filing_cabinet07.json","filing_cabinet08.json","incorrect_bbox"]
},
{
  name: 'fire_extinguisher',
  keypoints: ["tmp"],
  meshes: ["fire_extinguisher01.json"]
},
{
  name: 'fish_tank',
  keypoints: ["tmp"],
  meshes: ["fish_tank01.json","fish_tank02.json","fish_tank03.json","fish_tank04.json",
	   "fish_tank05.json","fish_tank06.json","incorrect_bbox"]
},
{
  name: 'flashlight',
  keypoints: ["tmp"],
  meshes: ["flashlight01.json","flashlight02.json","flashlight03.json","flashlight04.json",
	   "flashlight05.json","flashlight06.json","incorrect_bbox"]
},
{
  name: 'fork',
  keypoints: ["tmp"],
  meshes: ["fork01.json","fork02.json","fork03.json","fork04.json","fork05.json","fork06.json","fork07.json",
	   "fork08.json","fork09.json","incorrect_bbox"]
},
{
  name: 'guitar',
  keypoints: ["tmp"],
  meshes: ["guitar01.json","guitar02.json","guitar03.json","guitar04.json","guitar05.json",
	   "incorrect_bbox"]
},
{
  name: 'hair_dryer',
  keypoints: ["tmp"],
  meshes: ["hair_dryer01.json","hair_dryer02.json","hair_dryer03.json","hair_dryer04.json",
	   "incorrect_bbox"]
},
{
  name: 'hammer',
  keypoints: ["tmp"],
  meshes: ["hammer01.json","hammer02.json","hammer03.json","hammer04.json","hammer05.json",
	   "hammer06.json","incorrect_bbox"]
},
{
  name: 'headphone',
  keypoints: ["tmp"],
  meshes: ["headphone01.json","headphone02.json","headphone03.json","headphone04.json",
	   "headphone05.json","incorrect_bbox"]
},
{
  name: 'helmet',
  keypoints: ["tmp"],
  meshes: ["helmet01.json","helmet02.json","helmet03.json","helmet04.json",
	   "helmet05.json","helmet06.json","helmet07.json","helmet08.json","incorrect_bbox"]
},
{
  name: 'iron',
  keypoints: ["tmp"],
  meshes: ["iron01.json","iron02.json","iron03.json","iron04.json",
	   "iron05.json","incorrect_bbox"]
},
{
  name: 'jar',
  keypoints: ["tmp"],
  meshes: ["jar01.json","jar02.json","jar03.json","jar04.json","jar05.json",
	   "jar06.json","jar07.json","incorrect_bbox"]
},
{
  name: 'kettle',
  keypoints: ["tmp"],
  meshes: ["kettle01.json","kettle02.json","kettle03.json","kettle04.json",
	   "kettle05.json","kettle06.json","kettle07.json","incorrect_bbox"]
},
{
  name: 'key',
  keypoints: ["tmp"],
  meshes: ["key01.json","key02.json","key03.json","key04.json","key05.json",
	   "key06.json","key07.json","key08.json","key09.json","incorrect_bbox"]
},
{
  name: 'keyboard',
  keypoints: ["tmp"],
  meshes: ["keyboard01.json","keyboard02.json","keyboard03.json","keyboard04.json","keyboard05.json","keyboard06.json","keyboard07.json",
	   "keyboard08.json","keyboard09.json","keyboard10.json","keyboard11.json","keyboard12.json","incorrect_bbox"]
},
{
  name: 'knife',
  keypoints: ["tmp"],
  meshes: ["knife01.json","knife02.json","knife03.json","knife04.json","knife05.json","knife06.json","knife07.json","knife08.json","incorrect_bbox"]
},
{
  name: 'laptop',
  keypoints: ["tmp"],
  meshes: ["laptop01.json","laptop02.json","laptop03.json","laptop04.json","laptop05.json","incorrect_bbox"]
},
{
  name: 'lighter',
  keypoints: ["tmp"],
  meshes: ["lighter01.json","lighter02.json","lighter03.json","lighter04.json","lighter05.json","incorrect_bbox"]
},
{
  name: 'mailbox',
  keypoints: ["tmp"],
  meshes: ["mailbox01.json","mailbox02.json","mailbox03.json","mailbox04.json","mailbox05.json",
	   "mailbox06.json","mailbox07.json","mailbox08.json","incorrect_bbox"]
},
{
  name: 'microphone',
  keypoints: ["tmp"],
  meshes: ["microphone01.json","microphone02.json","microphone03.json","microphone04.json",
	   "microphone05.json","microphone06.json","microphone07.json","incorrect_bbox"]
},
{
  name: 'microwave',
  keypoints: ["tmp"],
  meshes: ["microwave01.json","microwave02.json","microwave03.json","microwave04.json",
	   "microwave05.json","microwave06.json","incorrect_bbox"]
},
{
  name: 'mouse',
  keypoints: ["tmp"],
  meshes: ["mouse01.json","mouse02.json","mouse03.json","mouse04.json","mouse05.json","incorrect_bbox"]
},
{
  name: 'paintbrush',
  keypoints: ["tmp"],
  meshes: ["paintbrush01.json"]
},
{
  name: 'pan',
  keypoints: ["tmp"],
  meshes: ["pan01.json","pan02.json","pan03.json","pan04.json","pan05.json","incorrect_bbox"]
},
{
  name: 'pen',
  keypoints: ["tmp"],
  meshes: ["pen01.json","pen02.json","pen03.json","pen04.json","pen05.json","pen06.json","pen07.json","incorrect_bbox"]
},
{
  name: 'pencil',
  keypoints: ["tmp"],
  meshes: ["pencil01.json","pencil02.json","pencil03.json","pencil04.json","incorrect_bbox"]
},
{
  name: 'piano',
  keypoints: ["tmp"],
  meshes: ["piano01.json","piano02.json","piano03.json","piano04.json","piano05.json","incorrect_bbox"]
},
{
  name: 'pillow',
  keypoints: ["tmp"],
  meshes: ["pillow01.json","pillow02.json","pillow03.json","pillow04.json","pillow05.json","pillow06.json","incorrect_bbox"]
},
{
  name: 'plate',
  keypoints: ["tmp"],
  meshes: ["plate01.json","plate02.json","plate03.json","plate04.json","plate05.json","plate06.json","incorrect_bbox"]
},
{
  name: 'pot',
  keypoints: ["tmp"],
  meshes: ["pot01.json","pot02.json","pot03.json","pot04.json","pot05.json","pot06.json","pot07.json","incorrect_bbox"]
},
{
  name: 'printer',
  keypoints: ["tmp"],
  meshes: ["printer01.json","printer02.json","printer03.json","printer04.json","printer05.json","printer06.json","incorrect_bbox"]
},
{
  name: 'racket',
  keypoints: ["tmp"],
  meshes: ["racket01.json","racket02.json","racket03.json","incorrect_bbox"]
},
{
  name: 'refrigerator',
  keypoints: ["tmp"],
  meshes: ["refrigerator01.json","refrigerator02.json","refrigerator03.json","refrigerator04.json","refrigerator05.json",
	   "refrigerator06.json","refrigerator07.json","refrigerator08.json","refrigerator09.json","refrigerator10.json",
	   "refrigerator11.json","refrigerator12.json","incorrect_bbox"]
},
{
  name: 'remote_control',
  keypoints: ["tmp"],
  meshes: ["remote_control01.json","remote_control02.json","remote_control03.json","remote_control04.json",
	   "remote_control05.json","remote_control06.json","remote_control07.json","incorrect_bbox"]
},
{
  name: 'rifle',
  keypoints: ["tmp"],
  meshes: ["rifle01.json","rifle02.json","rifle03.json","rifle04.json","rifle05.json","rifle06.json",
	   "rifle07.json","rifle08.json","incorrect_bbox"]
},
{
  name: 'road_pole',
  keypoints: ["tmp"],
  meshes: ["road_pole01.json"]
},
{
  name: 'satellite_dish',
  keypoints: ["tmp"],
  meshes: ["satellite_dish01.json","satellite_dish02.json","satellite_dish03.json","satellite_dish04.json",
	   "satellite_dish05.json","incorrect_bbox"]
},
{
  name: 'scissors',
  keypoints: ["tmp"],
  meshes: ["scissors01.json","scissors02.json","scissors03.json","scissors04.json","scissors05.json",
	   "scissors06.json","incorrect_bbox"]
},
{
  name: 'screwdriver',
  keypoints: ["tmp"],
  meshes: ["screwdriver01.json","screwdriver02.json","screwdriver03.json","screwdriver04.json","screwdriver05.json",
	   "screwdriver06.json","screwdriver07.json","incorrect_bbox"]
},
{
  name: 'shoe',
  keypoints: ["tmp"],
  meshes: ["shoe01.json","shoe02.json","shoe03.json","shoe04.json","shoe05.json","shoe06.json","shoe07.json",
	   "shoe08.json","shoe09.json","shoe10.json","incorrect_bbox"]
},
{
  name: 'shovel',
  keypoints: ["tmp"],
  meshes: ["shovel01.json","shovel02.json","shovel03.json","shovel04.json","shovel05.json","incorrect_bbox"]
},
{
  name: 'sign',
  keypoints: ["tmp"],
  meshes: ["sign01.json","sign02.json","sign03.json","sign04.json","sign05.json","sign06.json","sign07.json",
	   "sign08.json","sign09.json","sign10.json","sign11.json","incorrect_bbox"]
},
{
  name: 'skate',
  keypoints: ["tmp"],
  meshes: ["skate01.json","skate02.json","incorrect_bbox"]
},
{
  name: 'skateboard',
  keypoints: ["tmp"],
  meshes: ["skateboard01.json","skateboard02.json","incorrect_bbox"]
},
{
  name: 'slipper',
  keypoints: ["tmp"],
  meshes: ["slipper01.json","slipper02.json","slipper03.json","slipper04.json","slipper05.json",
	   "slipper06.json","incorrect_bbox"]
},
{
  name: 'speaker',
  keypoints: ["tmp"],
  meshes: ["speaker01.json","speaker02.json","speaker03.json","speaker04.json","speaker05.json","speaker06.json",
	   "speaker07.json","speaker08.json","speaker09.json","incorrect_bbox"]
},
{
  name: 'spoon',
  keypoints: ["tmp"],
  meshes: ["spoon01.json","spoon02.json","spoon03.json","spoon04.json","spoon05.json","spoon06.json",
	   "spoon07.json","incorrect_bbox"]
},
{
  name: 'stapler',
  keypoints: ["tmp"],
  meshes: ["stapler01.json","stapler02.json","stapler03.json","stapler04.json","stapler05.json","incorrect_bbox"]
},
{
  name: 'stove',
  keypoints: ["tmp"],
  meshes: ["stove01.json","stove02.json","stove03.json","stove04.json","stove05.json","stove06.json","incorrect_bbox"]
},
{
  name: 'suitcase',
  keypoints: ["tmp"],
  meshes: ["suitcase01.json","suitcase02.json","suitcase03.json","suitcase04.json","suitcase05.json","suitcase06.json",
	   "suitcase07.json","suitcase08.json","suitcase09.json","incorrect_bbox"]
},
{
  name: 'teapot',
  keypoints: ["tmp"],
  meshes: ["teapot01.json","teapot02.json","teapot03.json","teapot04.json","teapot05.json","teapot06.json","teapot07.json","incorrect_bbox"]
},
{
  name: 'telephone',
  keypoints: ["tmp"],
  meshes: ["telephone01.json","telephone02.json","telephone03.json","telephone04.json","telephone05.json","telephone06.json",
	   "telephone07.json","telephone08.json","telephone09.json","incorrect_bbox"]
},
{
  name: 'toaster',
  keypoints: ["tmp"],
  meshes: ["toaster01.json","toaster02.json","toaster03.json","toaster04.json","toaster05.json","toaster06.json",
	   "toaster07.json","toaster08.json","toaster09.json","toaster10.json","incorrect_bbox"]
},
{
  name: 'toilet',
  keypoints: ["tmp"],
  meshes: ["toilet01.json","toilet02.json","toilet03.json","toilet04.json","toilet05.json","toilet06.json","toilet07.json","incorrect_bbox"]
},
{
  name: 'toothbrush',
  keypoints: ["tmp"],
  meshes: ["toothbrush01.json","toothbrush02.json","toothbrush03.json","toothbrush04.json","toothbrush05.json","incorrect_bbox"]
},
{
  name: 'trash_bin',
  keypoints: ["tmp"],
  meshes: ["trash_bin01.json","trash_bin02.json","trash_bin03.json","trash_bin04.json","trash_bin05.json","trash_bin06.json",
	   "trash_bin07.json","trash_bin08.json","trash_bin09.json","trash_bin10.json","incorrect_bbox"]
},
{
  name: 'trophy',
  keypoints: ["tmp"],
  meshes: ["trophy01.json","trophy02.json","trophy03.json","trophy04.json","trophy05.json","trophy06.json","trophy07.json",
	   "trophy08.json","trophy09.json","trophy10.json","trophy11.json","incorrect_bbox"]
},
{
  name: 'tub',
  keypoints: ["tmp"],
  meshes: ["tub01.json","tub02.json","tub03.json","tub04.json","tub05.json","tub06.json","tub07.json","tub08.json",
	   "tub09.json","incorrect_bbox"]		  
},
{
  name: 'vending_machine',
  keypoints: ["tmp"],
  meshes: ["vending_machine01.json","vending_machine02.json","vending_machine03.json","vending_machine04.json","vending_machine05.json",
	   "vending_machine06.json","vending_machine07.json","vending_machine08.json","vending_machine09.json","vending_machine10.json",
	   "vending_machine11.json","incorrect_bbox"]
},
{
  name: 'washing_machine',
  keypoints: ["tmp"],
  meshes: ["washing_machine01.json","washing_machine02.json","washing_machine03.json","washing_machine04.json",
	   "washing_machine05.json","incorrect_bbox"]
},
{
  name: 'watch',
  keypoints: ["tmp"],
  meshes: [ "watch01.json", "watch02.json", "watch03.json", "watch04.json", "watch05.json", "watch06.json", "watch07.json",
	    "watch08.json", "watch09.json","incorrect_bbox"]
},
{
  name: 'wheelchair',
  keypoints: ["tmp"],
  meshes: [ "wheelchair01.json","wheelchair02.json","wheelchair03.json","wheelchair04.json","incorrect_bbox" ]
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
