'''
Declare list which will contain lists.
Get list of files in directory.
Iterate over them.
Get values and insert them in a list.
Append that list to a list of lists you declared at the top.
Outside of loop Convert the list of lists to a dataframe with pd.DataFrame(list_of_lists)
'''

import os
import glob
import pandas as pd

d = []
filenames = []
passed = []
basepath = '/data-sdd/forrest/keep/by_id/su92l-4zz18-ywqn26gpxtolv1x'
for filename in glob.glob(os.path.join(basepath, '*.vfy')):
    filenames.append(filename)
    with open(filename, 'r') as f:
        lineList = f.readlines()
        passed.append(lineList[-1])

d.append(filenames)
d.append(passed)
df = pd.DataFrame(d).transpose()

df.to_csv(r'gzverify.csv')
