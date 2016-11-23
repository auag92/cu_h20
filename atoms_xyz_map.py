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
output_file = "xyz_map.dat"
with open(output_file, 'w') as f:
    for hops in range(10):
        fname = 'hop%d_md.traj'%(hops)
        traj  = Trajectory(fname)
        length_trajectory = len(traj) # No. of atom objects
        for atoms in traj:
            a = np.reshape(np.array(atoms.get_positions()), (1,90))
            f.write('\t%90f'% (a[0,:]))
            f.write('\n')
        print(hops)

        fname = 'hop%d_qn.traj'%(hops)
        traj  = Trajectory(fname)
        length_trajectory = len(traj) # No. of atom objects
        for atoms in traj:
            a = np.reshape(np.array(atoms.get_positions()), (1,90))
            for i in range(len(a)):
                for x in range(3):
                    f.write('\t%f'% (a[i,:]))
                f.write('\n')

        print(hops)
