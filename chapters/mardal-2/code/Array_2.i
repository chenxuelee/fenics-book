%module Array
%{
#include "Array.h"
#include <sstream>
#include <numpy/arrayobject.h>
%}

%init%{
import_array();
%}

%ignore Array::operator[];
%ignore Array::operator+=;
%ignore operator<<;
%rename (assign) Array::operator=;
%include <std_string.i>

%extend Array {
  double __getitem__(int i) {
    return (*self)[i];
  }

  void __setitem__(int i, double v) {
    (*self)[i] = v;
  }
 
  void _add(const Array& a){
    (*self) += a;
  }

  %pythoncode %{
    def __iadd__(self,a):
      self._add(a)
      return self
  %}
  
  std::string __str__() {
    std::ostringstream s; 
    s << (*self);
    return s.str();
  }

};

%typecheck(SWIG_TYPECHECK_DOUBLE_ARRAY) (int n_, double* a_) {
    $1 = PyArray_Check($input) ? 1 : 0;
 }

%typemap(in) (int n_, double* a_){
  if (!PyArray_Check($input)) { 
    PyErr_SetString(PyExc_TypeError, "Not a NumPy array");
    return NULL; ;
  }
  PyArrayObject* pyarray = reinterpret_cast<PyArrayObject*>($input); 
  if (!(PyArray_TYPE(pyarray) == NPY_DOUBLE)) {
    PyErr_SetString(PyExc_TypeError, "Not a NumPy array of doubles");
    return NULL; ;
  }
  $1 = PyArray_DIM(pyarray,0);
  $2 = static_cast<double*>(PyArray_DATA(pyarray));
}

%include "Array.h" 
