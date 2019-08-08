import os
import glob
import pandas as pd

d = []
filenames = []
passed = []
basepath = 'path to verified collection'
for filename in glob.glob(os.path.join(basepath, '*.vfy')):
    filenames.append(filename)
    with open(filename, 'r') as f:
        lineList = f.readlines()
        passed.append(lineList[-1])

d.append(filenames)
d.append(passed)
df = pd.DataFrame(d).transpose()

df.to_csv(r'gzverify.csv')
