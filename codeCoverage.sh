#!/usr/bin/sh

reset

# Select Xcode version.
export DEVELOPER_DIR="/Applications/XCode 7.3.1/Xcode.app"

# Build project.
export BUILD_OUTPUT=build-output.txt
xcodebuild \
  -scheme PCICSampleApp \
  -sdk iphonesimulator \
  -configuration Debug \
  -enableCodeCoverage YES \
  test \
  > ${BUILD_OUTPUT}

# Get build settings.
export BUILD_SETTINGS=build-settings.txt
xcodebuild \
  -scheme PCICSampleApp \
  -sdk iphonesimulator \
  -configuration Debug \
  -showBuildSettings \
  > ${BUILD_SETTINGS}


# Get paths.
PROJECT_TEMP_ROOT=$(grep -m1 PROJECT_TEMP_ROOT ${BUILD_SETTINGS} | cut -d= -f2 | xargs)
PROFDATA=$(find ${PROJECT_TEMP_ROOT} -name "Coverage.profdata")
BINARY=$(find ${PROJECT_TEMP_ROOT} -path "*PCICSampleApp.app/PCICSampleApp")

echo ${PROJECT_TEMP_ROOT}
echo ${PROFDATA}
echo ${BINARY}

# Detailed code coverage report.
xcrun \
  llvm-cov show \
  -instr-profile ${PROFDATA} \
  ${BINARY}

# Summary code coverage report.
xcrun \
  llvm-cov report \
  -instr-profile ${PROFDATA} \
  ${BINARY}

#  TEST_AFTER_BUILD=YES \

slather coverage \
    --input-format profdata \
    --cobertura-xml \
    --ignore "../**/*/Xcode*" \
    --output-directory slather-report \
    --scheme PCICSampleApp \
    PCICSampleApp.xcodeproj
