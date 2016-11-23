import os
import shutil

a = (11, 33, 44, 55)
home  = '/gpfs/pace1/project/pme/pme1/ashanker9/cu_h2o_11'

print(home)
if not os.path.exists(home):
    os.makedirs(home)

fpath = '/gpfs/pace1/project/pme/pme1/amedford6/chaos/projects/interface_structures/chaos/H2O_coverage/Cu_211_constrain/H2O-0.11ML_parallel'

i = 0
for root dirs files in os.walk(fpath):
    # print root
    fpath1 = root + '/md00001.traj'
    fpath2 = '/gpfs/pace1/project/pme/pme1/ashanker9/cu_h2o_11' + '/hop%d_md.traj' % (i)
    print(fpath1)
    print(fpath2)
    if os.path.exists(fpath1):
        shutil.copy2(fpath1, fpath2)
        print(yay)
    fpath1 = root + '/md00001.log'
    fpath2 = '/gpfs/pace1/project/pme/pme1/ashanker9/cu_h2o_11' + '/hop%d_md.log' % (i)
    if os.path.exists(fpath1):
        shutil.copy2(fpath1, fpath2)
    fpath1 = root + '/qn00001.traj'
    fpath2 = '/gpfs/pace1/project/pme/pme1/ashanker9/cu_h2o_11' + '/hop%d_qn.traj' % (i)
    if os.path.exists(fpath1):
        shutil.copy2(fpath1, fpath2)
    fpath1 = root + '/qn00001.traj'
    fpath2 = '/gpfs/pace1/project/pme/pme1/ashanker9/cu_h2o_11' + '/hop%d_qn.log' % (i)
    if os.path.exists(fpath1):
        shutil.copy2(fpath1, fpath2)
    i = i+1
    # print(i)
