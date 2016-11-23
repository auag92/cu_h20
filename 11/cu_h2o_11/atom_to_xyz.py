from __future__ import print_function
import warnings
import time

import numpy as np
import os

from ase import __version__
from ase.atoms import Atoms
from ase.io.trajectory import Trajectory
from ase.visualize import view

from converter import Converter

name = ('Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'Cu', 'O', 'H', 'H')

for hops in range(10):
    fname  = 'hop%d_qn.traj'%(hops)
    # fname1 = 'hop%d_qn.log'%(hops)
    traj  = Trajectory(fname)
    length_trajectory = len(traj) # No. of atom objects

    n = 1
    for atoms in traj:
        output_file = "%d_%d_qn.xyz" % (hops,n)
        a = np.array(atoms.get_positions())
        with open(output_file, 'w') as f:
            f.write(str(len(a)))
            f.write('\n\n')
            for i in range(len(a)):
                f.write(name[i] + '\t')
                for x in range(3):
                    # print(str(a[i,x]))
                    f.write('\t%f'% (a[i,x]))
                f.write('\n')
        n = n + 1
    print(hops)
