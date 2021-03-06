# This batch script is used during the execution of the makefile target
# regression/results.xml

# this bash script is used to test one parameter and print the XML
# result for that parameter it subsumes the existence of a few files
# which were generated by the main makefile which calls this script.


if (test `grep "^$1\$" regression/current_ok_tests`); then
    # the test completed successfully
    echo "  <testsuite name=\"template_test_$ARCH\" tests=\"\" failures=\"\" errors=\"\" time=\"\">"
    echo "    <testcase name=\"$1\" status=\"run\" time=\"\" classname=\"$ARCH.$1\">"
    echo "    </testcase>"
    echo "  </testsuite>"
elif (test `grep "^$1\$" regression/current_witherrors_tests`); then
    # the test has an error
    echo "  <testsuite name=\"template_test_$ARCH\" tests=\"\" failures=\"\" errors=\"\" time=\"\">"
    echo "    <testcase name=\"$1\" status=\"run\" time=\"\" classname=\"$ARCH.$1\">"
    echo "      <failure type=\"java.lang.RuntimeException\"><![CDATA["
    cat $PWD/regression/$1/output.log
    echo "]]></failure>\n"
    echo "    </testcase>"
    echo "  </testsuite>"
elif (test `grep "^$1\$" regression/current_ignored_tests`); then
    # the test has been ignored
    #echo "  <test name=\"$1\" executed=\"no\">"
    #echo "    <result>"
    #echo "      <success passed=\"no\" state=\"0\"/>"
    #echo "    </result>"
    #echo "    <description>"
    #echo "      IGNORED $1"
    #echo "    </description>"
    #echo "  </test>"
    echo ""
else
    # the test is not listed (either in the template list or in 
    # the regression directories)
    # put an error!
    #echo "  <test name=\"$1\" executed=\"yes\">"
    #echo "    <result>"
    #echo "      <success passed=\"no\" state=\"0\"/>"
    #echo "    </result>"
    #echo "    <description>"
    #echo "      ERRORNOTLISTED $1"
    #echo "    </description>"
    #echo "  </test>"
    echo ""
fi
 
