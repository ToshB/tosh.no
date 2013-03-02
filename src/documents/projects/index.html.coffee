---
title: 'Projects'
layout: 'page'
---

# Projects
projects = (@feedr.feeds['toshb-projects'] or []).sort?((a,b) -> b.watchers - a.watchers) or []
if projects.length
	text @partial 'content/project-list.html.coffee', {
		projects: projects
	}
