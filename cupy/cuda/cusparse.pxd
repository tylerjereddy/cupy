from libc.stdint cimport int64_t, intptr_t


cdef extern from *:
    ctypedef int IndexBase 'cusparseIndexBase_t'
    ctypedef int Status 'cusparseStatus_t'

    ctypedef void* Handle 'cusparseHandle_t'

    ctypedef void* MatDescr 'cusparseMatDescr_t'

    ctypedef int Direction 'cusparseDirection_t'

    ctypedef int MatrixType 'cusparseMatrixType_t'

    ctypedef int Operation 'cusparseOperation_t'

    ctypedef int PointerMode 'cusparsePointerMode_t'

    ctypedef int Action 'cusparseAction_t'
    ctypedef int AlgMode 'cusparseAlgMode_t'

    ctypedef void* cusparseHandle_t
    ctypedef void* cusparseMatDescr_t
    ctypedef void* csric02Info_t
    ctypedef void* bsric02Info_t
    ctypedef void* csrilu02Info_t
    ctypedef void* bsrilu02Info_t

    ctypedef int cusparseStatus_t
    ctypedef int cusparseDirection_t
    ctypedef int cusparseSolvePolicy_t

    ctypedef int IndexType 'cusparseIndexType_t'
    ctypedef int Format 'cusparseFormat_t'
    ctypedef int Order 'cusparseOrder_t'
    ctypedef int SpMVAlg 'cusparseSpMVAlg_t'
    ctypedef int SpMMAlg 'cusparseSpMMAlg_t'
    ctypedef int DataType 'cudaDataType_t'

    ctypedef void* SpVecDescr 'cusparseSpVecDescr_t'
    ctypedef void* DnVecDescr 'cusparseDnVecDescr_t'
    ctypedef void* SpMatDescr 'cusparseSpMatDescr_t'
    ctypedef void* DnMatDescr 'cusparseDnMatDescr_t'

    ctypedef void* cusparseSpVecDescr_t
    ctypedef void* cusparseDnVecDescr_t
    ctypedef void* cusparseSpMatDescr_t
    ctypedef void* cusparseDnMatDescr_t

cpdef enum:
    CUSPARSE_POINTER_MODE_HOST = 0
    CUSPARSE_POINTER_MODE_DEVICE = 1

    CUSPARSE_ACTION_SYMBOLIC = 0
    CUSPARSE_ACTION_NUMERIC = 1

    CUSPARSE_INDEX_BASE_ZERO = 0
    CUSPARSE_INDEX_BASE_ONE = 1

    CUSPARSE_MATRIX_TYPE_GENERAL = 0
    CUSPARSE_MATRIX_TYPE_SYMMETRIC = 1
    CUSPARSE_MATRIX_TYPE_HERMITIAN = 2
    CUSPARSE_MATRIX_TYPE_TRIANGULAR = 3

    CUSPARSE_OPERATION_NON_TRANSPOSE = 0
    CUSPARSE_OPERATION_TRANSPOSE = 1
    CUSPARSE_OPERATION_CONJUGATE_TRANSPOSE = 2

    CUSPARSE_DIRECTION_ROW = 0
    CUSPARSE_DIRECTION_COLUMN = 1

    CUSPARSE_SOLVE_POLICY_NO_LEVEL = 0
    CUSPARSE_SOLVE_POLICY_USE_LEVEL = 1

    CUSPARSE_ALG_NAIVE = 0
    CUSPARSE_ALG_MERGE_PATH = 1

    CUSPARSE_FORMAT_CSR = 1  # Compressed Sparse Row (CSR)
    CUSPARSE_FORMAT_CSC = 2  # Compressed Sparse Column (CSC)
    CUSPARSE_FORMAT_COO = 3  # Coordinate (COO) - Structure of Arrays
    CUSPARSE_FORMAT_COO_AOS = 4  # Coordinate (COO) - Array of Structures

    CUSPARSE_ORDER_COL = 1  # Column-Major Order - Matrix memory layout
    CUSPARSE_ORDER_ROW = 2  # Row-Major Order - Matrix memory layout

    CUSPARSE_MV_ALG_DEFAULT = 0
    CUSPARSE_COOMV_ALG = 1
    CUSPARSE_CSRMV_ALG1 = 2
    CUSPARSE_CSRMV_ALG2 = 3

    CUSPARSE_MM_ALG_DEFAULT = 0
    CUSPARSE_COOMM_ALG1 = 1  # non-deterministc results
    CUSPARSE_COOMM_ALG2 = 2  # deterministic results
    CUSPARSE_COOMM_ALG3 = 3  # non-deterministc results, for large matrices
    CUSPARSE_CSRMM_ALG1 = 4

    CUSPARSE_INDEX_16U = 1  # 16-bit unsigned integer
    CUSPARSE_INDEX_32I = 2  # 32-bit signed integer
    CUSPARSE_INDEX_64I = 3  # 64-bit signed integer

cpdef size_t create() except? 0
cpdef destroy(size_t handle)


cdef class SpVecAttributes:
    cdef:
        public int64_t size
        public int64_t nnz
        public intptr_t idx
        public intptr_t values
        public IndexType idxType
        public IndexBase idxBase
        public DataType valueType

cdef class CooAttributes:
    cdef:
        public int64_t rows
        public int64_t cols
        public int64_t nnz
        public intptr_t rowIdx
        public intptr_t colIdx
        public intptr_t values
        public IndexType idxType
        public IndexBase idxBase
        public DataType valueType

cdef class CooAoSAttributes:
    cdef:
        public int64_t rows
        public int64_t cols
        public int64_t nnz
        public intptr_t ind
        public intptr_t values
        public IndexType idxType
        public IndexBase idxBase
        public DataType valueType

cdef class CsrAttributes:
    cdef:
        public int64_t rows
        public int64_t cols
        public int64_t nnz
        public intptr_t rowOffsets
        public intptr_t colIdx
        public intptr_t values
        public IndexType rowOffsetType
        public IndexType colIdxType
        public IndexBase idxBase
        public DataType valueType

cdef class DnVecAttributes:
    cdef:
        public int64_t size
        public intptr_t values
        public DataType valueType

cdef class DnMatAttributes:
    cdef:
        public int64_t rows
        public int64_t cols
        public int64_t ld
        public intptr_t values
        public DataType valueType
        public Order order

cdef class DnMatBatchAttributes:
    cdef:
        public int count
        public int64_t stride
