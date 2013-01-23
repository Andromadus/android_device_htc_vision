# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Touch screen configuration file for HTC Vision.
# Starting from ICS, the configuration file syntax was changed, 
# so the new one is needed to support touch pressure and size
# that are reported by Vision touch screen controller.
# (c) NeverGone, January 24, 2013.

# Changes:
# Jan 24, 2013
# -- initial commit

# Basic Parameters
touch.deviceType = touchScreen
touch.orientationAware = 1

# Size
touch.size.calibration = area
touch.size.isSummed=0
touch.size.scale=15
touch.size.bias=0

# Pressure
touch.pressure.calibration = amplitude
touch.pressure.scale = 0.01

# Orientation
touch.orientation.calibration = none
