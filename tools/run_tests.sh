#
# Copyright (c) 2024 Ajil Oommen. All Rights Reserved
#

flutter test --coverage
lcov --remove coverage/lcov.info 'lib/*/*.freezed.dart' 'lib/*/*.g.dart' 'lib/*/*.gr.dart' -o coverage/lcov.info
genhtml -o coverage coverage/lcov.info
open coverage/index.html
