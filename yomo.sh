#!/usr/bin/env bash
me=$(basename "$0")

help_message="\
Usage: $me [-c FILE] [<options>]
Deploy api docs to line5-docs.

Options:

  -h, --help           Show this help information.
  -m, --master-branch  Master bracnh to merge to, by default master
  -t, --testing        Run tests, by default is inactive
"

master='master'
testing='false'
branch=`git branch | grep \* | cut -d ' ' -f2`

parse_args() {
  # Set args from a local environment file.
  if [ -e ".env" ]; then
    source .env
  fi

  # Parse arg flags
  # If something is exposed as an environment variable, set/overwrite it
  # here. Otherwise, set/overwrite the internal variable instead.
  while : ; do
    if [[ $1 = "-m" || $1 = "--master-branch" && -n $2 ]]; then
      master=$2
      shift 2
    elif [[ ( $1 = "-t" || $1 = "--testing" ) ]]; then
      testing='true'
      shift
    else
      break
    fi
  done
}

main() {
  parse_args "$@"

  if [[ "$branch" = "$master" ]]; then
    echo "Cant merge and rebase into the same branch" >&2
    return 1
  fi

  if [[ "$testing" = 'true' ]]; then
    run_tests
  fi

  rebase_and_push_master
}

run_tests() {
  rake
}

rebase_and_push_master() {
  git rebase "$master" && git push -f origin "$branch" && git checkout "$master" && git merge - && git push && git branch -d "$branch"
}

if [[ $1 = "-h" || $1 = "--help" ]]; then
  echo "$help_message"
  return 0
fi

main "$@"
