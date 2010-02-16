import numpy as np
from scipy.linalg import det, svd
from math import sqrt
from itertools import combinations

eps = 1e-9

A0 = np.array([[3,0,0,0],
      [0,-1,0,0],
      [1,1,0,0],
      [-4,-4,0,0],
      [0,4,0,0],
      [0,0,0,0],
      [0,0,-1,0],
      [0,0,0,3],
      [0,0,1,1],
      [0,0,0,0],
      [0,0,4,0],
      [0,0,-4,-4],
      [1,0,1,0],
      [0,1,0,1],
      [3,3,3,3],
      [-4,0,-4,0],
      [0,0,0,0],
      [0,-4,0,-4],
      [-4,0,-4,0],
      [0,0,0,0],
      [-4,-4,0,0],
      [8,4,4,8],
      [0,-4,-4,-8],
      [0,4,4,0],
      [0,0,4,0],
      [0,4,0,0],
      [0,0,0,0],
      [0,-4,-4,-8],
      [8,4,4,8],
      [-8,-4,-4,0],
      [0,0,0,0],
      [0,-4,0,-4],
      [0,0,-4,-4],
      [0,4,0,4],
      [-8,-4,-4,0],
      [8,4,4,8]])

A0 = np.array([[1, 1, 0, 0],
               [-4, -4, 0, 0],
               [0, 0, 1, 1],
               [3, 3, 3, 3],
               [0, 4, 4, 0],
               [8, 4, 4, 8],
               [0,-4,-4,-8],
               [-8,-4,-4,0],
               [0,0,0,0],
               [8,4,4,8]])

def randproj( m , n ):
    """creates a random matrix in R^{m,n}"""
    # maps from R^n to R^m
    if m >= n:
        A = np.random.rand( m , n )
        [u,s,vt] = svd(A, full_matrices=False)
        return u
    else:
        A = np.random.rand( n , m )
        [u,s,vt] = svd(A, full_matrices=False)
        return np.transpose(u)

def normalize_sign( u ):
    """Returns u or -u such that the first nonzero entry (up to eps)
    is positive"""
    for ui in u:
        if abs(ui) > eps:
            if ui < 0.0:
                return -u
            else:
                return u
    return u

def normalize(u):
    mau = max(abs(u))
    if mau < eps:
        raise RuntimeError, "barf: divide by zero"
    return normalize_sign( u / mau )

def check_lin(x, y):
    return np.allclose(normalize(x),normalize(y))

def strike_col( A , j ):
    m,n = A.shape
    return np.take( A , [ k for k in range(0,n) if k != j ] , 1 )

def proj_cross( vecs ):
    n,d = len( vecs ) , len( vecs[ 0 ] )
    udude = randproj(n,3)
    pi_
    mat = np.array( vecs )
    if n != d - 1:
        for v in vecs:
            print v
        raise RuntimeError, "barf"
    # normalize the cross product to have unit value to avoid
    # rounding to zero in the cross product routine.
    foo = np.array( \
        [ (-1)**i * det(strike_col(mat,i)) for i in range( d ) ] )
    foo /= max( abs( foo ) )
    return normalize( foo )

def compare( u , v ):
    """Lexicographic ordering that respects floating-point
    fuzziness"""
    if len(u) != len(v):
        raise RuntimeError, "can't compare"
    diff = u-v
    for d in diff:
        if abs(d) > eps:
            if d < 0:
                return -1
            else:
                return 1
    return 0

def process(vecs):
    n = len(vecs)
    d = len(vecs[0])
    idx = set(range(n))

    z = np.zeros(d)
    zidx = [i for i in xrange(n) \
                 if np.allclose(vecs[i], z)]
    idx -= set(zidx)
    print "zeros:", zidx

    l = [(i,normalize(vecs[i])) for i in idx]
    l.sort(lambda x,y: compare(x[1], y[1]))
    lidx = set()
    for i in xrange(len(l) - 1):
#        print l[i]
        if np.allclose(l[i][1], l[i+1][1]):
            lidx.add(l[i+1][0])
    idx -= set(lidx)
    print "lines:", lidx

    p = []
    udude = randproj(3,d)
    pi_vecs = [(i, np.dot(udude,A0[i])) for i in idx]
    for c1, c2 in combinations(xrange(len(pi_vecs)), 2):
        idx1, vec1 = pi_vecs[c1]
        idx2, vec2 = pi_vecs[c2]
        p.append((idx1, idx2, normalize(np.cross(vec1, vec2))))
    p.sort(lambda x, y: compare(x[2], x[2]))
#    print p
    curr_pidx = 0
    curr_plane = p[0][2]
    pidx = {curr_pidx:set([p[0][0], p[0][1]])}
#    print 0, curr_pidx, p[0]
    for i in xrange(1, len(p) - 1):
#        print i, curr_pidx, p[i]
        if np.allclose(p[i][2], curr_plane):
            pidx[curr_pidx].add(p[i][0])
            pidx[curr_pidx].add(p[i][1])
        else:
            curr_pidx += 1
            pidx[curr_pidx] = set([p[i][0], p[i][1]])
            curr_plane = p[i][2]

    real_pidx = []
    for a in pidx.keys():
        if len(pidx[a]) > 2:
            real_pidx.append(pidx[a])

    print "planes:", real_pidx

if __name__ == "__main__":
    process(A0)
