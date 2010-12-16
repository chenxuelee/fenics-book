import os
import numpy
from distutils.core import setup, Extension
swig_cmd ='swig -o Array_wrap.cxx -shadow -python -c++ -O -I. Array_2.i'
os.system(swig_cmd)
sources = ['Array.cpp','Array_wrap.cxx'] 
setup(name = 'Array',
      py_modules = ["Array"],
      ext_modules = [Extension('_' + 'Array', sources, \
                    include_dirs=['.', numpy.get_include() + "/numpy"])]) 
