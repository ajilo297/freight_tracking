#
# Copyright (c) 2024 Ajil Oommen. All Rights Reserved
#

flutter test --coverage
lcov --remove coverage/lcov.info \
  'lib/**/*.g.dart' \
  -o coverage/lcov.info
genhtml -o coverage_report coverage/lcov.info
open coverage_report/index.html
