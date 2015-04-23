# Helper function to get elapsed time
# Usage:
# composertimestart = Time.now
# <some long task>
# composertimefinished = Time.now
# timeTaken = time_diff_milli composertimestart, composertimefinished
def time_diff_milli( start, finish )

	( finish - start )

end