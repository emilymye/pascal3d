import json
import os
import glob
import re


def export(category,main_file):
    prevdir = os.getcwd()
    meshname = os.path.splitext(main_file)[0]
    print "READING ", category, meshname

    js = { "vertices" : [], "faces" : [], "keypoints" : {} } 
    os.chdir(category)
    
    #MAIN OFF FILE ([##].off)
    with open(main_file, 'r') as f:

      lines = f.readlines();
      counts = lines[1].split()
      nVertices = int(counts[0]);
      nFaces = int(counts[1]);

      #READ VERTICES
      for vertex in lines[2:(nVertices + 2)]:
        for v in vertex.split():
          js["vertices"].append(float(v))

      #READ FACES
      for face in lines[(nVertices+2):(nVertices+nFaces+2)]:
        for i in face.split():
          js["faces"].append(int(i))

    pts = {}
    #MAIN OFF FILE ([##].off)
    keypointFiles = [f for f in glob.glob(meshname+"+.off")] # regular expression: changed from * to +
    
    for kp in keypointFiles:
      kpname = os.path.splitext(kp)[0]
      kpname = kpname[len(meshname) + 1:]

      with open(kp, 'r') as f:
        lines = f.readlines();
        counts = lines[1].split()
        nVertices = int(counts[0]);
        x = 0.0
        y = 0.0
        z = 0.0
        #AVERAGE VERTICES
        for v in lines[2:(nVertices + 2)]:
          v = v.split()
          x = x + float(v[0])
          y = y + float(v[1])
          z = z + float(v[2])

        x = x/nVertices
        y = y/nVertices
        z = z/nVertices


      pts[kpname] = { "x":x, "y": y,"z": z}
    
    js["keypoints"] = pts

    os.chdir(prevdir)
    with open(category+meshname + ".json", 'w') as output:
      json.dump(js,output)
    print "OUTPUT ", category+meshname + ".json"


def convertAllToJSON():
    dir = os.getcwd()
    categories = [name for name in os.listdir(dir) if os.path.isdir(os.path.join(dir,name))]
    for c in categories:
      meshes = [f for f in os.listdir(c) if re.match("[0-9]+.off",f)]
      for m in meshes:
        export(c,m);




if __name__ == "__main__":
    convertAllToJSON()
