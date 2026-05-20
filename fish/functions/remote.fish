function remote --description 'Open git repo on remote'
	if not type -sq node
		echo "node not installed. install by using \"brew install node\""
		echo "exiting..."
		exit 1
	end
	if not type -sq npm
		echo "npm not installed."
		echo "exiting..."
		exit 1
	end

	set -lx tool "git-remote-website-url-cli"
	set -lx toolGithub "git+https://github.com/bertvanpoecke/git-remote-website-url-cli.git"

	if not type -sq git-remote-website-url
		echo "$tool not found. installing now..."
		npm install -g --save $toolGithub
	end

	set -lx remoteuri (git remote get-url --all origin)
	set -lx website (git-remote-website-url $remoteuri)

	if test -n "$website"
		set -lx commitpage $website/commits
		echo $commitpage
		open $commitpage
	end
end