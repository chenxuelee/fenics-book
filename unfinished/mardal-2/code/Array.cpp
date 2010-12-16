#include <Array.h>
#include <cmath>

Array::Array(const Array& a_) { 
  n = a_.dim(); 
  a = new double[n]; 
  for (int i=0; i<n; i++) { 
    a[i] = a_[i]; 
  } 
}

Array& Array::operator=(const Array& a_) { 
  if (a) delete [] a; 
  n = a_.dim(); 
  a = new double[n]; 
  for (int i=0; i<n; i++) { 
    a[i] = a_[i]; 
  } 
  return *this; 
}

Array::Array(int n_) : n(n_) { 
  a = new double[n];
  for (int i=0; i<n; i++) { 
    a[i] = 0.0;
  } 
}

Array::Array(int n_, double* a_) : n(n_) { 
  a = new double[n]; 
  for (int i=0; i<n; i++) { 
    a[i] = a_[i];
  } 
}

Array::~Array() {
  delete [] a; 
}

const double& Array::operator [] (int i) const { return a[i]; } 
double& Array::operator [] (int i) { return a[i]; }  

const Array& Array::operator+= (const Array& b) {
  for (int i=0; i<n; i++) {
    a[i] += b[i]; 
  }
  return *this; 
}

int Array::dim() const { return n; }

double Array::norm() const { 
  double val = 0.0;
  for (int i = 0; i < n; i++)
    val += a[i]*a[i];
  val = sqrt(val);
  val /= n;
  return val; 
}

std::ostream & operator<< ( std::ostream& os, const Array& a)
{
  if (a.dim() >= 1)
  {
    os << "[";
    for (int i=0; i<a.dim()-1; ++i)
    {
      os << a[i] << ",";
    }
    os << a[a.dim()-1] << "]";
  }
  else
  {
    os << "Array empty";
  }
  return os;
}






