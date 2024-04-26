START_LINE=`head -n1 $INPUT_FILE`
PATTERN="^TASK: .*"
if ! [[ "$START_LINE" =~ $PATTERN ]]; then
  echo "Bad commit message, see example: TASK: some text"
  exit 1
fi
