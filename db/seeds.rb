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
  keypoints: ["top1","top2","top3","top4","bottom1","bottom2","bottom3","bottom4"],
  meshes: [ "ashtray01.json","ashtray02.json","ashtray03.json","ashtray04.json","ashtray05.json","ashtray06.json","ashtray07.json",
	    "ashtray08.json","ashtray09.json","ashtray10.json","incorrect_bbox"]
},
{
  name: 'backpack',
  keypoints: ["front1","front2","front3","front4","front5","back1","back2","back3","back4",
    	      "shoulder_strap_left1","shoulder_strap_left2","shoulder_strap_right1","shoulder_strap_right2"],
  meshes: ["backpack01.json","backpack02.json","backpack03.json","backpack04.json","backpack05.json","backpack06.json",
	   "backpack07.json","backpack08.json","backpack09.json","backpack10.json","backpack11.json","backpack12.json",
	   "backpack13.json","backpack14.json","backpack15.json","backpack16.json","incorrect_bbox"]
},
{
  name: 'basket',
  keypoints: ["top1","top2","top3","top4","bottom1","bottom2","bottom3","bottom4"],
  meshes: ["basket01.json","basket02.json","basket03.json","basket04.json","basket05.json","basket06.json","basket07.json",
	   "basket08.json","basket09.json","basket10.json","basket11.json","basket12.json","basket13.json","basket14.json",
	   "basket15.json","incorrect_bbox"]
},
{
  name: 'bed',
  keypoints: ["mattress1","mattress2","mattress3","mattress4",
	      "frame_front1","frame_front2","frame_front3","frame_front4",
	      "frame_back1","frame_back2","frame_back3","frame_back4",
	      "bedpost_bottom1","bedpost_bottom2","bedpost_bottom3","bedpost_bottom4",
	      "bedpost_top1","bedpost_top2","bedpost_top3","bedpost_top4"],
  meshes: [ "bed01.json","bed02.json","bed03.json","bed04.json","bed05.json","bed06.json","bed07.json",
	    "bed08.json","bed09.json","bed10.json","incorrect_bbox" ]
},
{
  name: 'bench',
  keypoints: ["seat1","seat2","seat3","seat4","leg1","leg2","leg3","leg4",
              "back1","back2","handle_left1","handle_left2","handle_right1","handle_right2"],
  meshes: [ "bench01.json","bench02.json","bench03.json","bench04.json","bench05.json","bench06.json","bench07.json","incorrect_bbox"]
},
{
  name: 'blackboard',
  keypoints: ["main_front1","main_front2","main_front3","main_front4","sub_front1","sub_front2","sub_front3","sub_front4",
    	      "leg1","leg2","leg3","leg4"],
  meshes: ["blackboard01.json","blackboard02.json","blackboard03.json","blackboard04.json","blackboard05.json","blackboard06.json",
	   "blackboard07.json","blackboard08.json","blackboard09.json","blackboard10.json","blackboard11.json","incorrect_bbox"]
},
{
  name: 'bookshelf',
  keypoints: ["bottom1","bottom2","bottom3","bottom4","top1","top2","top3","top4",
    	      "compartment_bottom1","compartment_bottom2","compartment_top1","compartment_top2"],
  meshes: ["bookshelf01.json","bookshelf02.json","bookshelf03.json","bookshelf04.json","bookshelf05.json","bookshelf06.json",
	   "bookshelf07.json","bookshelf08.json","incorrect_bbox"]
},
{
  name: 'bucket',
  keypoints: ["top1","top2","top3","top4","bottom1","bottom2","bottom3","bottom4"],
  meshes: ["bucket01.json","bucket02.json","bucket03.json","bucket04.json","incorrect_bbox"]
},
{
  name: 'cabinet',
  keypoints: ["bottom1","bottom2","bottom3","bottom4","bottom5","bottom6","bottom7","bottom8",
    	      "top1","top2","top3","top4","top5","top6","top7","top8"],
  meshes: ["cabinet01.json","cabinet02.json","cabinet03.json","cabinet04.json","cabinet05.json","cabinet06.json","cabinet07.json",
	   "cabinet08.json","cabinet09.json","cabinet10.json","cabinet11.json","cabinet12.json","cabinet13.json","cabinet14.json",
	   "cabinet15.json","incorrect_bbox"]
},
{
  name: 'calculator',
  keypoints: ["frame_front1","frame_front2","frame_front3","frame_front4",
    	      "frame_back1","frame_back2","frame_back3","frame_back4",
    	      "display1","display2","display3","display4"],
  meshes: ["calculator01.json","calculator02.json","calculator03.json","calculator04.json","calculator05.json","incorrect_bbox"]
},
{
  name: 'camera',
  keypoints: ["frame_front1","frame_front2","frame_front3","frame_front4",
    	      "frame_back1","frame_back2","frame_back3","frame_back4",
    	      "lens1","lens2","lens3","lens4","display1","display2","display3","display4"],
  meshes: ["camera01.json","camera02.json","camera03.json","camera04.json","camera05.json","camera06.json","camera07.json",
	   "camera08.json","camera09.json","camera10.json","camera11.json","incorrect_bbox"]
},
{
  name: 'can',
  keypoints: ["body_bottom_left","body_bottom_center","body_bottom_right",
    	      "body_top_left","body_top_center","body_top_right",
	      "brim_bottom_left","brim_bottom_center","brim_bottom_right",
    	      "brim_top_left","brim_top_center","brim_top_right"],
  meshes: ["can01.json","can02.json","can03.json","can04.json","can05.json","can06.json","incorrect_bbox"]
},
{
  name: 'cap',
  keypoints: ["brim1","brim2","brim3","brim4","lower1","lower2","lower3","lower4",
    	      "upper1","upper2","upper3","upper4","top_center"],
  meshes: ["cap01.json","cap02.json","cap03.json","cap04.json","cap05.json","cap06.json","cap07.json","cap08.json","cap09.json",
	   "cap10.json","cap11.json","cap12.json","cap13.json","cap14.json","cap15.json","incorrect_bbox"]
},
{
  name: 'cellphone',
  keypoints: ["frame_front1","frame_front2","frame_front3","frame_front4",
    	      "frame_back1","frame_back2","frame_back3","frame_back4",
    	      "display1","display2","display3","display4",
    	      "keypad1","keypad2","keypad3","keypad4"],
  meshes: ["cellphone01.json","cellphone02.json","cellphone03.json","cellphone04.json",
           "cellphone05.json","cellphone06.json","cellphone07.json","cellphone08.json",
           "cellphone09.json","cellphone10.json","cellphone11.json","incorrect_bbox"]
},
{
  name: 'clock',
  keypoints: ["display1","display2","display3","display4","body_front1","body_front2","body_front3","body_front4",
    	      "body_back1","body_back2","body_back3","body_back4"],
  meshes: ["clock01.json","clock02.json","clock03.json","clock04.json","clock05.json","clock06.json",
	   "clock07.json","clock08.json","clock09.json","incorrect_bbox"]
},
{
  name: 'coffee_maker',
  keypoints: ["bottom1","bottom2","bottom3","bottom4","top1","top2","top3","top4",
	      "base_left","base_center","base_right"],
  meshes: ["coffee_maker01.json","coffee_maker02.json","coffee_maker03.json","coffee_maker04.json","coffee_maker05.json",
	   "coffee_maker06.json","coffee_maker07.json","incorrect_bbox"]
},
{
  name: 'comb',
  keypoints: ["frame_front1","frame_front2","frame_front3","frame_front4",
	      "frame_back1","frame_back2","frame_back3","frame_back4",
	      "teeth1","teeth2","teeth3","teeth4",
	      "handle_bottom","handle_top_front","handle_top_back"],
  meshes: ["comb01.json","comb02.json","comb03.json","comb04.json","comb05.json","comb06.json",
	   "comb07.json","comb08.json","comb09.json","incorrect_bbox"]
},
{
  name: 'computer',
  keypoints: ["front1","front2","front3","front4","back1","back2","back3","back4"],
  meshes: ["computer01.json","computer02.json","computer03.json","computer04.json","computer05.json","computer06.json",
	   "computer07.json","computer08.json","computer09.json","computer10.json","computer11.json","incorrect_bbox"]
},
{
  name: 'cup',
  keypoints: ["handle_upper","handle_middle","handle_lower",
    	      "bowl_top1","bowl_top2","bowl_top3","bowl_top4",
    	      "bowl_bottom1","bowl_bottom2","bowl_bottom3","bowl_bottom4",
    	      "stem_upper","stem_lower","foot1","foot2","foot3","foot4"],
  meshes: [ "cup01.json","cup02.json","cup03.json","cup04.json","cup05.json","cup06.json","cup07.json",
	    "cup08.json","cup09.json","cup10.json","incorrect_bbox" ]
},
{
  name: 'desk_lamp',
  keypoints: ["shade1","shade2","shade3","shade4","joint_top","joint_bottom",
    	      "base1","base2","base3","base4"],
  meshes: ["desk_lamp01.json","desk_lamp02.json","desk_lamp03.json","desk_lamp04.json","desk_lamp05.json","desk_lamp06.json",
	   "desk_lamp07.json","desk_lamp08.json","incorrect_bbox"]
},
{
  name: 'dishwasher',
  keypoints: ["body_front1","body_front2","body_front3","body_front4",
    	      "body_back1","body_back2","body_back3","body_back4",
    	      "front_door1","front_door2","front_door3","front_door4"],
  meshes: ["dishwasher01.json","dishwasher02.json","dishwasher03.json","dishwasher04.json","incorrect_bbox"]
},
{
  name: 'door',
  keypoints: ["top_left_corner","top_right_corner","top_center","bottom_left_corner","bottom_right_corner","doorknob_left","doorknob_right"],
  meshes: ["door01.json","door02.json","door03.json","door04.json","door05.json","door06.json","door07.json","door08.json",
	   "door09.json","door10.json","door11.json","incorrect_bbox"]
},
{
  name: 'eraser',
  keypoints: ["front1","front2","front3","front4","back1","back2","back3","back4"],
  meshes: ["eraser01.json","eraser02.json","eraser03.json","eraser04.json","eraser05.json","eraser06.json","eraser07.json","eraser08.json",
	   "eraser09.json","eraser10.json","eraser11.json","eraser12.json","eraser13.json","eraser14.json","eraser15.json","incorrect_bbox"]
},
{
  name: 'eyeglasses',
  keypoints: ["lens_left1","lens_left2","lens_left3","lens_left4",
    "lens_right1","lens_right2","lens_right3","lens_right4","bridge",
    "earpiece_left","endpiece_left1","endpiece_left2","earpiece_right","endpiece_right1","endpiece_righ2"],
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
  keypoints: ["bottom1","bottom2","bottom3","bottom4","top1","top2","top3","top4",
    	      "compartment_bottom1","compartment_bottom2","compartment_top1","compartment_top2" ],
  meshes: ["filing_cabinet01.json","filing_cabinet02.json","filing_cabinet03.json","filing_cabinet04.json","filing_cabinet05.json",
	   "filing_cabinet06.json","filing_cabinet07.json","filing_cabinet08.json","incorrect_bbox"]
},
{
  name: 'fire_extinguisher',
  keypoints: ["lever1","lever2","nozzle","body_bottom_left","body_bottom_center","body_bottom_right",
    	      "body_top_left","body_top_center","body_top_right"],
  meshes: ["fire_extinguisher01.json","fire_extinguisher02.json","fire_extinguisher03.json","fire_extinguisher04.json",
	   "fire_extinguisher05.json","fire_extinguisher06.json","fire_extinguisher07.json","fire_extinguisher08.json",
	   "fire_extinguisher09.json","incorrect_bbox"]
},
{
  name: 'fish_tank',
  keypoints: ["bottom1","bottom2","bottom3","bottom4","bottom5","bottom6",
    	      "body_front_left","body_front_right","top1","top2","top3","top4","top5","top6"],
  meshes: ["fish_tank01.json","fish_tank02.json","fish_tank03.json","fish_tank04.json",
	   "fish_tank05.json","fish_tank06.json","incorrect_bbox"]
},
{
  name: 'flashlight',
  keypoints: ["lamp1","lamp2","lamp3","lamp4","handle_bottom1","handle_bottom2","handle_bottom3","handle_bottom4",
    	      "handle_top1","handle_top2","handle_top3","handle_top4"],
  meshes: ["flashlight01.json","flashlight02.json","flashlight03.json","flashlight04.json",
	   "flashlight05.json","flashlight06.json","incorrect_bbox"]
},
{
  name: 'fork',
  keypoints: ["stem_bottom1","stem_bottom2","stem_bottom3","stem_upper_left","stem_upper_right",
    	      "head_bottom_left","head_bottom_center","head_bottom_right","fork_tip_left","fork_tip_right"],
  meshes: ["fork01.json","fork02.json","fork03.json","fork04.json","fork05.json","fork06.json","fork07.json",
	   "fork08.json","fork09.json","incorrect_bbox"]
},
{
  name: 'guitar',
  keypoints: ["head_top","neck_upper","neck_lower","front_body1","front_body2","front_body3","front_body4",
    	      "front_body5","front_body6","front_body7","back_body1","back_body2","back_body3","back_body4",
    	      "back_body5","back_body6","back_body7","back_body8"],
  meshes: ["guitar01.json","guitar02.json","guitar03.json","guitar04.json","guitar05.json",
	   "incorrect_bbox"]
},
{
  name: 'hair_dryer',
  keypoints: ["nozzle1","nozzle2","nozzle3","nozzle4","side_left1","side_left2","side_left3","side_left4",
    	      "side_right1","side_right2","side_right3","side_right4",
	      "handle_bottom1","handle_bottom2","handle_bottom3","handle_bottom4"],
  meshes: ["hair_dryer01.json","hair_dryer02.json","hair_dryer03.json","hair_dryer04.json",
	   "incorrect_bbox"]
},
{
  name: 'hammer',
  keypoints: ["head_left1","head_left2","head_left3","head_left4","head_right1","head_right2","head_right3","head_right4",
    	      "handle_bottom1","handle_bottom2","handle_bottom3","handle_top1","handle_top2"],
  meshes: ["hammer01.json","hammer02.json","hammer03.json","hammer04.json","hammer05.json",
	   "hammer06.json","incorrect_bbox"]
},
{
  name: 'headphone',
  keypoints: ["ear_left1","ear_left2","ear_left3","ear_left4","ear_left_inner1","ear_left_inner2",
    	      "ear_right1","ear_right2","ear_right3","ear_right4","ear_right_inner1","ear_right_inner2",
    	      "strap_left","strap_center","strap_right"],
  meshes: ["headphone01.json","headphone02.json","headphone03.json","headphone04.json",
	   "headphone05.json","incorrect_bbox"]
},
{
  name: 'helmet',
  keypoints: ["top_center","front_left","front_center","front_right",
    	      "back_left","back_center","back_right","eyes1","eyes2","eyes3","eyes4"],
  meshes: ["helmet01.json","helmet02.json","helmet03.json","helmet04.json",
	   "helmet05.json","helmet06.json","helmet07.json","helmet08.json","incorrect_bbox"]
},
{
  name: 'iron',
  keypoints: ["hotplate_tip","hotplate_bottom_left","hotplate_bottom_right","body_bottom_tip","body_bottom_left","body_bottom_right",
              "body_top_tip","body_top_left","body_top_right","handle_upper","handle_lower"],
  meshes: ["iron01.json","iron02.json","iron03.json","iron04.json",
	   "iron05.json","incorrect_bbox"]
},
{
  name: 'jar',
  keypoints: ["bottom1","bottom2","bottom3","bottom4","mid1","mid2","mid3","mid4",
		"top1","top2","top3","top4"],
  meshes: ["jar01.json","jar02.json","jar03.json","jar04.json","jar05.json",
	   "jar06.json","jar07.json","incorrect_bbox"]
},
{
  name: 'kettle',
  keypoints: ["body_bottom1","body_bottom2","body_bottom3","body_bottom4",
	      "body_top1","body_top2","body_top3","body_top4",
              "handle1","handle2","handle3",
	      "spout1","spout2","spout3","spout4","lid_knob"],
  meshes: ["kettle01.json","kettle02.json","kettle03.json","kettle04.json",
	   "kettle05.json","kettle06.json","kettle07.json","incorrect_bbox"]
},
{
  name: 'key',
  keypoints: ["head1","head2","head3","head4","neck_bottom","neck_top_front","neck_top_back","side_tooth"],
  meshes: ["key01.json","key02.json","key03.json","key04.json","key05.json",
	   "key06.json","key07.json","key08.json","key09.json","key10.json",
	   "key11.json","key12.json","key13.json","incorrect_bbox"]
},
{
  name: 'keyboard',
  keypoints: ["lower_left","lower_center","lower_right","upper_left","upper_middle1","upper_middle2","upper_right"],
  meshes: ["keyboard01.json","keyboard02.json","keyboard03.json","keyboard04.json","keyboard05.json","keyboard06.json","keyboard07.json",
	   "keyboard08.json","keyboard09.json","keyboard10.json","keyboard11.json","keyboard12.json","incorrect_bbox"]
},
{
  name: 'knife',
  keypoints: ["blade1","blade2","blade3","spine1","spine2","spine3","handle1","handle2","handle3","handle4"],
  meshes: ["knife01.json","knife02.json","knife03.json","knife04.json","knife05.json","knife06.json","knife07.json","knife08.json","incorrect_bbox"]
},
{
  name: 'laptop',
  keypoints: ["upper_panel1","upper_panel2","upper_panel3","upper_panel4","lower_panel1","lower_panel2","lower_panel3","lower_panel4"],
  meshes: ["laptop01.json","laptop02.json","laptop03.json","laptop04.json","laptop05.json","incorrect_bbox"]
},
{
  name: 'lighter',
  keypoints: ["bottom1","bottom2","bottom3","bottom4","top1","top2","top3","top4","upper_cover1","upper_cover2","upper_cover3","upper_cover4"],
  meshes: ["lighter01.json","lighter02.json","lighter03.json","lighter04.json","lighter05.json","lighter06.json","incorrect_bbox"]
},
{
  name: 'mailbox',
  keypoints: ["body_bottom1","body_bottom2","body_bottom3","body_bottom4","body_top1","body_top2","body_top3","body_top4",
              "roof_salient1","roof_salient2","leg1","leg2","leg3","leg4","slot1","slot2","slot3","slot4"],
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
  keypoints: ["front1","front2","front3","front4","back1","back2","back3","back4","door_corner1","door_corner2","handl1","handle2"],
  meshes: ["microwave01.json","microwave02.json","microwave03.json","microwave04.json",
	   "microwave05.json","microwave06.json","incorrect_bbox"]
},
{
  name: 'mouse',
  keypoints: ["wheel","body_front_center",
    "top_left","top_center","top_right",
    "bottom_left","bottom_center","bottom_right",
    "body_left","body_right",
    "back_top","back_bottom","back_left","back_right"],
  meshes: ["mouse01.json","mouse02.json","mouse03.json","mouse04.json","mouse05.json","incorrect_bbox"]
},
{
  name: 'paintbrush',
  keypoints: ["bristles_left","bristles_center","bristles_right","head_lower_left","head_lower_right",
    "handle_top","handle_bottom"],
  meshes: ["paintbrush01.json","paintbrush02.json","paintbrush03.json","paintbrush04.json",
	   "paintbrush05.json","paintbrush06.json","incorrect_bbox"]
},
{
  name: 'pan',
  keypoints: ["bowl_bottom1","bowl_bottom2","bowl_bottom3","bowl_bottom4",
    "bowl_top1","bowl_top2","bowl_top3","bowl_top4",
    "handle1_bowl_side","handle1_opposite_bowl","handle2_bowl_side","handle2_opposite_bowl"],
  meshes: ["pan01.json","pan02.json","pan03.json","pan04.json","pan05.json","incorrect_bbox"]
},
{
  name: 'pen',
  keypoints: ["ink_tip","shoulder_left","shoulder_right","tail_left","tail_tip","tail_right",
    "cap1","cap2","cap3","cap4","clip_top","clip_bottom"],
  meshes: ["pen01.json","pen02.json","pen03.json","pen04.json","pen05.json","pen06.json","pen07.json","incorrect_bbox"]
},
{
  name: 'pencil',
  keypoints: ["lead_tip","shoulder_left","shoulder_right","tail_left","tail_right"],
  meshes: ["pencil01.json","pencil02.json","pencil03.json","pencil04.json","incorrect_bbox"]
},
{
  name: 'piano',
  keypoints: ["key1","key2","key3","key4",
    "front1","front2","front3","front4",
    "body_top1","body_top2","body_top3","body_top4",
    "top_lid1","top_lid2","top_lid3","top_lid4",
    "bottom1","bottom2","bottom3","bottom4",
    "pedal_center"],
  meshes: ["piano01.json","piano02.json","piano03.json","piano04.json","piano05.json","incorrect_bbox"]
},
{
  name: 'pillow',
  keypoints: ["front_center",
    "corner1","corner2","corner3","corner4",
    "corner5","corner6","corner7","corner8"],
  meshes: ["pillow01.json","pillow02.json","pillow03.json","pillow04.json","pillow05.json","pillow06.json","incorrect_bbox"]
},
{
  name: 'plate',
  keypoints: ["top1","top2","top3","top4","bottom1","bottom2","bottom3","bottom4"],
  meshes: ["plate01.json","plate02.json","plate03.json","plate04.json","plate05.json","plate06.json","incorrect_bbox"]
},
{
  name: 'pot',
  keypoints: ["bowl_bottom_left","bowl_bottom_center","bowl_bottom_right",
		"bowl_top_left","bowl_top_center","bowl_top_right",
		"handle1_front","handle1_center","handle1_back",
		"handle2_front","handle2_center","handle2_back","handle_lid"],
  meshes: ["pot01.json","pot02.json","pot03.json","pot04.json","pot05.json","pot06.json","pot07.json","incorrect_bbox"]
},
{
  name: 'printer',
  keypoints: ["bottom1","bottom2","bottom3","bottom4","top1","top2","top3","top4"],
  meshes: ["printer01.json","printer02.json","printer03.json","printer04.json","printer05.json","printer06.json","incorrect_bbox"]
},
{
  name: 'racket',
  keypoints: ["head_top","head_bottom","head_left","head_right",
    "grip_top_front","grip_top_back","grip_bottom_front","grip_bottom_back"],
  meshes: ["racket01.json","racket02.json","racket03.json","incorrect_bbox"]
},
{
  name: 'refrigerator',
  keypoints: ["bottom1","bottom2","bottom3","bottom4","top1","top2","top3","top4",
            "compartment1_door1","compartment1_door2","compartment1_handle1","compartment1_handle2",
            "compartment2_door1","compartment2_door2","compartment2_handle1","compartment2_handle2",
            "compartment3_door1","compartment3_door2","compartment3_handle1","compartment3_handle2"],
  meshes: ["refrigerator01.json","refrigerator02.json","refrigerator03.json","refrigerator04.json","refrigerator05.json",
	   "refrigerator06.json","refrigerator07.json","refrigerator08.json","refrigerator09.json","refrigerator10.json",
	   "refrigerator11.json","refrigerator12.json","incorrect_bbox"]
},
{
  name: 'remote_control',
  keypoints: ["front1","front2","front3","front4","back1","back2","back3","back4"],
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
  keypoints: ["pole_bottom_left","pole_bottom_right","pole_top",
		"branch_left_tip","lamp_left","branch_right_tip","lamp_right"],
  meshes: ["road_pole01.json","road_pole02.json","road_pole03.json","road_pole04.json","road_pole05.json","road_pole06.json",
	   "road_pole07.json","road_pole08.json","road_pole09.json","road_pole10.json","road_pole11.json","road_pole12.json",
	   "road_pole13.json","road_pole14.json","road_pole15.json","road_pole16.json","incorrect_bbox"]
},
{
  name: 'satellite_dish',
  keypoints: ["dish1","dish2","dish3","dish4","dish_bottom_center",
    	      "base1","base2","base3","base4"],
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
  keypoints: ["handle1","handle2","handle3","handle4","blade_neck","blade_tip"],
  meshes: ["screwdriver01.json","screwdriver02.json","screwdriver03.json","screwdriver04.json","screwdriver05.json",
	   "screwdriver06.json","screwdriver07.json","incorrect_bbox"]
},
{
  name: 'shoe',
  keypoints: ["foot_top_front","heel_tip",
	      "bottom_front","bottom_back","bottom_left","bottom_right",
	      "front_cover1","front_cover2","front_cover3","front_cover4",
	      "top1","top2","top3","top4","highheel_tip"],
  meshes: ["shoe01.json","shoe02.json","shoe03.json","shoe04.json","shoe05.json","shoe06.json","shoe07.json",
	   "shoe08.json","shoe09.json","shoe10.json","incorrect_bbox"]
},
{
  name: 'shovel',
  keypoints: ["blade_bottom_left","blade_bottom_center","blade_bottom_right",
    "blade_top_left","blade_top_right","handle_top","handle_bottom"],
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
  keypoints: ["foot_toe","heel","ankle_bottom1","ankle_bottom2","ankle_bottom3","ankle_bottom4",
	      "ankle_top1","ankle_top2","ankle_top3","ankle_top4","wheel1","wheel2","wheel3","wheel4"],
  meshes: ["skate01.json","skate02.json","incorrect_bbox"]
},
{
  name: 'skateboard',
  keypoints: ["body1","body2","body3","body4","body5","body6",
    "wheel1","wheel2","wheel3","wheel4"],
  meshes: ["skateboard01.json","skateboard02.json","incorrect_bbox"]
},
{
  name: 'slipper',
  keypoints: ["toe_tip","heel_tip","left","right","upper_cover1","upper_cover2","upper_cover3","upper_cover4"],
  meshes: ["slipper01.json","slipper02.json","slipper03.json","slipper04.json","slipper05.json",
	   "slipper06.json","incorrect_bbox"]
},
{
  name: 'speaker',
  keypoints: ["body_front1","body_front2","body_front3","body_front4",
    "body_back1","body_back2","body_back3","body_back4",
    "first_meshcap1","first_meshcap2","first_meshcap3","first_meshcap4",
    "second_meshcap1","second_meshcap2","second_meshcap3","second_meshcap4"],
  meshes: ["speaker01.json","speaker02.json","speaker03.json","speaker04.json","speaker05.json","speaker06.json",
	   "speaker07.json","speaker08.json","speaker09.json","incorrect_bbox"]
},
{
  name: 'spoon',
  keypoints: ["bowl1","bowl2","bowl3","bowl4","bowl_bottom_center","stem_tip"],
  meshes: ["spoon01.json","spoon02.json","spoon03.json","spoon04.json","spoon05.json","spoon06.json",
	   "spoon07.json","incorrect_bbox"]
},
{
  name: 'stapler',
  keypoints: ["base1","base2","base3","base4",
    "cover_left1","cover_left2","cover_left3","cover_left4",
    "cover_right1","cover_right2","cover_right3","cover_right4",
    "pusherblade_left","pusherblade_right"],
  meshes: ["stapler01.json","stapler02.json","stapler03.json","stapler04.json","stapler05.json","incorrect_bbox"]
},
{
  name: 'stove',
  keypoints: ["bottom1","bottom2","bottom3","bottom4","top1","top2","top3","top4"],
  meshes: ["stove01.json","stove02.json","stove03.json","stove04.json","stove05.json","stove06.json","incorrect_bbox"]
},
{
  name: 'suitcase',
  keypoints: ["front1","front2","front3","front4","back1","back2","back3","back4",
    "handle1_left","handle1_center","handle1_right",
    "handle2_left","handle2_center","handle2_right"],
  meshes: ["suitcase01.json","suitcase02.json","suitcase03.json","suitcase04.json","suitcase05.json","suitcase06.json",
	   "suitcase07.json","suitcase08.json","suitcase09.json","incorrect_bbox"]
},
{
  name: 'teapot',
  keypoints: ["body_bottom1","body_bottom2","body_bottom3","body_bottom4",
	      "body_top1","body_top2","body_top3","body_top4",
              "handle1","handle2","handle3",
	      "spout1","spout2","spout3","spout4","lid_knob"],
  meshes: ["teapot01.json","teapot02.json","teapot03.json","teapot04.json","teapot05.json","teapot06.json","teapot07.json","incorrect_bbox"]
},
{
  name: 'telephone',
  keypoints: ["body_bottom1","body_bottom2","body_bottom3","body_bottom4",
    "body_top1","body_top2","body_top3","body_top4",
    "handset_mic_center","handset_speaker_center",
    "handset_bottom","handset_top","handset_handle_bottom","handset_handle_top",
    "dial_pad1","dial_pad2","dial_pad3","dial_pad4"],
  meshes: ["telephone01.json","telephone02.json","telephone03.json","telephone04.json","telephone05.json","telephone06.json",
	   "telephone07.json","telephone08.json","telephone09.json","incorrect_bbox"]
},
{
  name: 'toaster',
  keypoints: ["case_bottom1","case_bottom2","case_bottom3","case_bottom4",
    	      "case_top1","case_top2","case_top3","case_top4",
 	      "slot1_front","slot1_back","slot2_front","slot2_back",
              "slot3_front","slot3_back","slot4_front","slot4_back"],
  meshes: ["toaster01.json","toaster02.json","toaster03.json","toaster04.json","toaster05.json","toaster06.json",
	   "toaster07.json","toaster08.json","toaster09.json","toaster10.json","incorrect_bbox"]
},
{
  name: 'toilet',
  keypoints: ["seat1","seat2","seat3","seat4","tank_front1","tank_front2","tank_front3","tank_front4",
    	      "tank_back1","tank_back2","tank_back3","tank_back4","bottom1","bottom2","bottom3","bottom4"],
  meshes: ["toilet01.json","toilet02.json","toilet03.json","toilet04.json","toilet05.json","toilet06.json","toilet07.json","incorrect_bbox"]
},
{
  name: 'toothbrush',
  keypoints: ["brush_head_top","brush_head_bottom","bristles_upper_tip","bristles_lower_tip",
		"handle_top_front","handle_top_back","handle_bottom"],
  meshes: ["toothbrush01.json","toothbrush02.json","toothbrush03.json","toothbrush04.json","toothbrush05.json","incorrect_bbox"]
},
{
  name: 'trash_bin',
  keypoints: ["bottom1","bottom2","bottom3","bottom4",
		"mid1","mid2","mid3","mid4","top1","top2","top3","top4"],
  meshes: ["trash_bin01.json","trash_bin02.json","trash_bin03.json","trash_bin04.json","trash_bin05.json","trash_bin06.json",
	   "trash_bin07.json","trash_bin08.json","trash_bin09.json","trash_bin10.json","incorrect_bbox"]
},
{
  name: 'trophy',
  keypoints: ["bottom1","bottom2","bottom3","bottom4",
    "body_middle1","body_middle2","body_middle3",
    "body_top1","body_top2","body_top3"],
  meshes: ["trophy01.json","trophy02.json","trophy03.json","trophy04.json","trophy05.json","trophy06.json","trophy07.json",
	   "trophy08.json","trophy09.json","trophy10.json","trophy11.json","incorrect_bbox"]
},
{
  name: 'tub',
  keypoints: ["bottom1","bottom2","bottom3","bottom4","top1","top2","top3","top4"],
  meshes: ["tub01.json","tub02.json","tub03.json","tub04.json","tub05.json","tub06.json","tub07.json","tub08.json",
	   "tub09.json","incorrect_bbox"]		  
},
{
  name: 'vending_machine',
  keypoints: ["body_front1","body_front2","body_front3","body_front4",
    	      "body_back1","body_back2","body_back3","body_back4"],
  meshes: ["vending_machine01.json","vending_machine02.json","vending_machine03.json","vending_machine04.json","vending_machine05.json",
	   "vending_machine06.json","vending_machine07.json","vending_machine08.json","vending_machine09.json","vending_machine10.json",
	   "vending_machine11.json","incorrect_bbox"]
},
{
  name: 'washing_machine',
  keypoints: ["body_front1","body_front2","body_front3","body_front4",
    	      "body_back1","body_back2","body_back3","body_back4","door1","door2","door3","door4"],
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
  meshes: [ "wheelchair01.json","wheelchair02.json","wheelchair03.json","wheelchair04.json","wheelchair05.json","incorrect_bbox" ]
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
