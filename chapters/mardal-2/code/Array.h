#include <iostream>

class Array {
public: 
  // Constructors and destructors
  Array(int n_=0);
  Array(int n_, double* a_);
  Array(const Array& a_);
  ~Array(); 

  // Operators
  Array& operator=(const Array& a_); 
  const double& operator [] (int i) const;  
  double& operator [] (int i);
  const Array& operator+= (const Array& b); 

  // Methods
  int dim() const; 
  double norm() const;

private:
  int n; 
  double *a; 

};

std::ostream & operator<< ( std::ostream& os, const Array& a);
