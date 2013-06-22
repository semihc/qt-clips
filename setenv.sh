#
# Necessary environment variables to work QmkBld based projects
#

# If Projects Home directory is not defined
if [ -z "$PRJS_HOME" ]; then
  PRJS_HOME=$HOME
fi

# QmkBld related variables
QMKBLD=$HOME/qmkbld
QMK_DEBUG=0
QMAKEFEATURES=$QMKBLD/prf
export QMKBLD QMK_DEBUG QMAKEFEATURES

# The project that uses QmkBld 
export PRJ_ROOT=$PRJS_HOME/qt-clips

# Give feedback about project root
echo "PRJ_ROOT=$PRJ_ROOT"