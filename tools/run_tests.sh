#
# Copyright (c) 2024 Ajil Oommen. All Rights Reserved
#

flutter test --coverage
genhtml -o coverage coverage/lcov.info
open coverage/index.html