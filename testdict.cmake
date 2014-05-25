include(dict.cmake)

function(assert_equal lhs rhs)
    if(lhs STREQUAL rhs)
    else()
        message(FATAL_ERROR "${message} (\"${lhs}\" != \"${rhs}\")")
    endif()
endfunction()

dict(SET mydict one uno)
assert_equal("${mydict}" "one=uno")
dict(SET mydict two dos)
assert_equal("${mydict}" "one=uno;two=dos")
dict(_IDX mydict one outvar)
assert_equal("${outvar}" 0)
dict(_IDX mydict two outvar)
assert_equal("${outvar}" 1)

dict(SET mydict three tres)
assert_equal("${mydict}" "one=uno;two=dos;three=tres")
dict(SET mydict two second)
assert_equal("${mydict}" "one=uno;three=tres;two=second")

dict(GET mydict one outvar)
assert_equal("${outvar}" uno)
dict(GET mydict two outvar)
assert_equal("${outvar}" second)

message(STATUS "test passed")
