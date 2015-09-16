#!/bin/sh

DIR=`pwd`
GITPULL="git pull"
GITPUSH="git push origin master"
GITSTATUS="git status"
REPLIST="apps driver flash"
REPLIST2="cdk"

case "$1" in
	clone)
		for f in  $REPLIST ; do
			if [ -d "$f" ]; then
				echo "$f already cloned"
			else
				if [ "$2" = "dev" ]; then
					# dev
					git clone git@github.com:Duckbox-Developers/$f $f
				else
					# usr
					git clone git://github.com/Duckbox-Developers/$f $f
				fi
				echo "git clone" $f
			fi
		done
		for f in  $REPLIST2 ; do
			if [ -d "$f" ]; then
				echo "$f already cloned"
			else
				if [ "$2" = "dev" ]; then
					# dev
					git clone git@github.com:herpoi/$f $f
				else
					# usr
					git clone git://github.com/herpoi/$f $f
				fi
				echo "git clone" $f
			fi
		done
		#sudo $DIR/prepare4cdk.sh
		;;
	pull)
		for f in  $REPLIST ; do
			cd $DIR/$f
			echo "$GITPULL" $f
			$GITPULL
			cd ..
			done
		for f in  $REPLIST2 ; do
			cd $DIR/$f
			echo "$GITPULL" $f
			$GITPULL
			cd ..
			done
			;;
	push)
		for f in  $REPLIST ; do
			cd $DIR/$f
			echo "$GITPUSH" $f
			$GITPUSH
			cd ..
			done
		for f in  $REPLIST2 ; do
			cd $DIR/$f
			echo "$GITPUSH" $f
			$GITPUSH
			cd ..
			done
			;;
	status)
		for f in  $REPLIST ; do
			cd $DIR/$f
			echo "$GITSTATUS" $f
			$GITSTATUS
			cd ..
			done
		for f in  $REPLIST2 ; do
			cd $DIR/$f
			echo "$GITSTATUS" $f
			$GITSTATUS
			cd ..
			done
			;;
	*)
		if [ -d cdk ]; then
			echo "Usage: {clone | pull | push | status}"
			exit 1
		else
			$0 clone
		fi
		;;
esac
