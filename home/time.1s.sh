#!/Users/thebitstick/.local/state/home-manager/gcroots/current-home/home-path/bin/nu

# <xbar.title>Time Planner</xbar.title>
# <xbar.version>v2.0</xbar.version>
# <xbar.author>TheBitStick</xbar.author>
# <xbar.author.github>thebitstick</xbar.author.github>
# <xbar.desc>A simple command line tool</xbar.desc>
# <xbar.image></xbar.image>
# <xbar.dependencies>Nushell</xbar.dependencies>
# <swiftbar.hideAbout>true</swiftbar.hideAbout>
# <swiftbar.hideRunInTerminal>true</swiftbar.hideRunInTerminal>
# <swiftbar.hideLastUpdated>true</swiftbar.hideLastUpdated>
# <swiftbar.hideDisablePlugin>true</swiftbar.hideDisablePlugin>
# <swiftbar.hideSwiftBar>true</swiftbar.hideSwiftBar>

def main [] {
	def isTomorrow [time: datetime] {
		let now: record = (date now | into record)
		let later: record = ($time | into record)
		if $now.day != $later.day {
			return true
		}
		return false
	}

	let menu: string = (date now | format date "%H:%M:%S")
	print $menu
	print `---`

	let time: datetime = (date now) - ((date now | format date "%M" | into int) | into duration --unit min)
	print -n ($time | format date "%H:%M (now)")
	let hours: range = 1..24
	$hours | each { |it|
		let temp: datetime = ($time + ($it | into duration --unit hr))

		print -n "\n"
		print -n ($temp | format date "%H:%M")
		print -n (if (isTomorrow $temp) { " (tomorrow)" })
		print -n " | href=https://"
	}
	print -n "\n"
}
