from __future__ import print_function
import warnings
import time

import numpy as np
from mpl_toolkits.mplot3d import Axes3D
from sklearn import manifold, datasets
from sklearn.decomposition import PCA
from pylab import *

from ase import __version__
from ase.atoms import Atoms
from ase.io.trajectory import Trajectory
from ase.visualize import view


n_traj = np.zeros(10, dtype = int)
n_atoms = 30
n_hops = 10
prop = []


for hops in range(n_hops):
    logfile  = 'hop%d_md.log' % (hops)
    with open(logfile, 'r') as f:
        f.readline()
        for line in f.readlines():
            prop.append(line.split()[2])
            n_traj[hops] = n_traj[hops] + 1

total_configurations = sum(n_traj)
X = np.zeros((total_configurations, n_atoms*6))
row = 0
for hops in range(n_hops):
    for i in range(n_traj[hops]):
        infile = "%d_%d.zmat" % (hops, i+1)
        j = 0
        with open(infile, 'r') as f:
            f.readline()
            f.readline()
            f.readline()
            for line in f.readlines():
                buf = line.split()[1:]
                for z in buf:
                    # print(z)
                    X[row,j] = z
                    j= j + 1
        row = row + 1

print(row)
print(len(prop))
