import Foundation

// Dot produc of two vectors
extension Array<Double> {
    static public func *(lhs: Array<Double>, rhs: Array<Double>) -> Double {
        var n = 0.0
        for i in lhs.indices {
            n += lhs[i] * rhs[i]
        }
        return n
    }
}


extension Array<[Double]> {
    
    // Zero matrix
    static public func zeroMatrix(_ nrows: Int, _ ncols: Int) -> Array<[Double]> {
        var newArray = [[Double]]()
        for _ in 0..<nrows {
            newArray.append([Double](repeating: 0.0, count: ncols))
        }
        return newArray
    }
    
    // Shape of matrix
    public func shape() -> (nrows: Int, ncols: Int) {
        let nrows = self.count
        let ncols = self[0].count
        return (nrows, ncols)
    }
    
    // Transpose of matrix
    public func T() -> Array<[Double]> {
        let (nrows, ncols) = self.shape()
        var newArray = [[Double]].zeroMatrix(ncols, nrows)
        
        for i in 0..<nrows {
            for j in 0..<ncols {
                newArray[j][i] = self[i][j]
            }
        }
        
        return newArray
    }
    
    // Matrix multiplication
    static public func *(lhs: Array<[Double]>, rhs: Array<[Double]>) -> Array<[Double]>? {
        let (nrows1, ncols1) = lhs.shape()
        let (nrows2, ncols2) = rhs.shape()
        var newArray = [[Double]].zeroMatrix(nrows1, ncols2)
        
        if ncols1 == nrows2 {
            for n in 0..<nrows1 {
                for p in 0..<ncols2 {
                    newArray[n][p] = lhs[n] * rhs.T()[p]
                }
            }
            return newArray
        } else {
            return nil
        }
    }
    
    // Scalar multiply by matrix
    static public func *(lhs: Double, rhs: Array<[Double]>) -> Array<[Double]> {
        let (nrows, ncols) = rhs.shape()
        var newArray = [[Double]].zeroMatrix(nrows, ncols)
        for i in 0..<nrows {
            for j in 0..<ncols {
                newArray[i][j] = lhs * rhs[i][j]
            }
        }
        return newArray
    }
    
    // Matrix multiply by scalar
    static public func *(lhs: Array<[Double]>, rhs: Double) -> Array<[Double]> {
        let (nrows, ncols) = lhs.shape()
        var newArray = [[Double]].zeroMatrix(nrows, ncols)
        for i in 0..<nrows {
            for j in 0..<ncols {
                newArray[i][j] = rhs * lhs[i][j]
            }
        }
        return newArray
    }
    
    // Pretty print matrix
    public func pprint() {
        for i in 0..<self.count {
            if i == 0 {
                print("[\(self[i]),")
            } else if i == self.count - 1 {
                print(" \(self[i])]")
            } else {
                print(" \(self[i]),")
            }
        }
    }
    
    // more funcs to come
}
