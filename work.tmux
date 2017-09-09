# work config
# starting from left: repo
# bottom: REPL
splitw -v -p 30 -c "#{pane_current_path}"
# bottom right: misc
splitw -h -p 30 -c "#{pane_current_path}"
# go back and
selectp -t 0
# central: dev
splitw -h -p 70 -c "#{pane_current_path}"
# right: logs
splitw -h -p 40 -c "#{pane_current_path}"
# back
selectp -t 1
