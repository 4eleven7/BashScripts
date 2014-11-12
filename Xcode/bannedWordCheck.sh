#!/bin/bash
#
# Checks for banned words within files in a folder. Useful for checking comments.
# Banned words are base64'd, rather than this script adding the swear words to your repo...
#
# Words copied from http://urbanoalvarez.es/blog/2008/04/04/bad-words-list/
# remove some uncommon bad words to make the script faster
# removed invalid characters '(', '+', '*'
#
# To add a different list of words, you'll want to base64 a string like so:
# `echo "badword|badderword" | base64`
#
# If used in Xcode as a buildscript, swear words will show up as warnings, complete with line number
#

BASE64="YWhvbGV8YW51c3xhc2hvbGVzfGFzc3xBc3MgTW9ua2V5fEFzc2ZhY2V8YXNzaG9sZXxhc3Nob2xlc3xhc3Nob2x6fGFzc3dpcGV8YmFzdGFyZHxiYXN0YXJkc3xiYXN0YXJkenxiYXN0ZXJkc3xiYXN0ZXJkenxCaWF0Y2h8Yml0Y2h8Yml0Y2hlc3xibG93IGpvYnxidXR0aG9sZXxidXR0d2lwZXxDYXJwZXQgTXVuY2hlcnxDbGl0fGNvY2t8Y29ja2hlYWR8Y29ja3N8Q29ja1N1Y2tlcnxjb2NrLXN1Y2tlcnxjcmFwfGN1bXxjdW50fGN1bnRzfGRpY2t8ZGlsZG98ZGlsZG9zfGR5a2V8ZmFnfGZhZ2dpdHxmYWdnb3R8ZmFnc3xmdWNrfGZ1Y2tlcnxmdWNraW5nfGZ1Y2tzfGdheXxnYXlib3l8Z2F5Z2lybHxnYXlzfGhlbGxzfGphY2tvZmZ8amVyay1vZmZ8aml6enxrbm9ifGtub2JzfE1vdGhlciBGdWNrZXJ8bW90aGVyZnVja2VyfHBlbmlzfHByaWNrfHB1c3N5fHF1ZWVyfHF1ZWVyc3xyZXRhcmR8c2NyZXdpbmd8c2VtZW58c2V4fHNleHl8c2hpdHxzaGl0c3xzaGl0dGVyfHNoaXR0eXxzaGl0eXxzbHV0fHNsdXRzfFNsdXR0eXx0aXR8dHVyZHx2YWdpbmF8d2hvcmV8Yml0Y2h8Ymxvd2pvYnxjbGl0fGZ1Y2t8c2hpdHxhc3N8YXNzaG9sZXxiYXN0YXJkfGNsaXRzfGNvY2t8Y3VtfGN1bnR8ZGlsZG98ZmF0YXNzfG1hc3R1cmJhdGV8bW90aGVyZnVja2VyfG1vZm98bmF6aXxudXRzYWNrfHB1c3N5fHNjcm90dW18dGl0c3xib29ic3x0ZXN0aWNhbHx0ZXN0aWNsZXxqYWNrb2ZmfHdhbmt8ZGFtbnxhcnNlfGJpdGNofGJvbGxvY2t8YnJlYXN0c3xidXR0LXBpcmF0ZXxjdW50fGRpY2t8cGlzc3xzY3Jld3x0ZXN0aWNsZXx0d2F0fHdhbmsK"

KEYWORDS=`echo $BASE64 | base64 -D`
	
find "${SRCROOT}/" -type f -print0 | \
xargs -0 egrep -w --ignore-case --with-filename --line-number --only-matching "\<($KEYWORDS)\>" | \
perl -p -e "s/($KEYWORDS)/ warning: BANNED WORD '\$&' located at: \$1/i"
