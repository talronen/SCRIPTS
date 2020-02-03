#---====---  Exporting Models - You can run this Script with two Options ---====---#
#
#   python ExportModels.py <atlas-server-name> [folder-name-to-export]
#   
# !! Add folder-name-to-export if server convention not like xx-xxxx-xxx.domain.xx  
# !! If no 2 "-" in atlas name, add a folder-name-to-export
#
### Option 1 To RUN: python ExportModels.py om3-osdemo-atlas01.agt.lab
#  
### Option 2 To RUN: python ExportModels.py osdemo-atlas01.agt.lab osdemoexports
#   
#####################################################################################

__author__ = 'ALanda'

import urllib2
import json
import os
import sys
import re

#server = "om3-osdemo-atlas01d.agt.lab"
#folder = "export"
#folder = re.findall('-(.+)-', server)
#print(folder)

if len(sys.argv) > 1:
    server = sys.argv[1]

domain = re.findall('-(.+)-', server)
folder = (domain[0]+"-ModelExport")

if len(sys.argv) > 2:
    folder = sys.argv[2]

def get_models():
    res = urllib2.urlopen("http://%s:3160/api/atlas/registry/metamodel"%server)
    data = res.read()
    models = json.loads(data)
    return models

def dump_models_to_folders(models):
    if not os.path.exists(folder): os.makedirs(folder)
    for model in models:
        fname = os.path.join(folder, model["collectionName"] +".model")
        print "saving model",   fname
        with open(fname,"wb") as model_file:
            json.dump(model,model_file)

models = get_models()
dump_models_to_folders(models)