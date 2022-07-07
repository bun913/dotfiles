#!/bin/zsh
<< COOMENTOUT
# 以下のようにAutomationでAppscriptを呼べばショートカットから呼べる
on run {input, parameters}
	do shell script "~/dotfiles/sh/time.sh"
end run
COOMENTOUT

TIME=`date '+%H:%M'`
echo $TIME | pbcopy
