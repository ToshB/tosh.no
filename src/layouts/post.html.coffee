---
layout: default
---

# Title
if @document.title
	header '.page-header', ->
		h1 ->
			a '.page-link', href:@document.url, ->
				strong '.page-title', property:'dcterms:title', ->
					@document.title
				small '.page-date', property:'dc:date', ->
					" #{@document.date.toShortDateString()}"

# Content
div '.page-content', property: 'sioc:content',
	-> @content

# Related Posts
relatedPosts = []
for document in @document.relatedDocuments or []
	if document.url.indexOf('/blog') is 0 and document.url.indexOf('/blog/index') isnt 0
		relatedPosts.push(document)
if relatedPosts.length
	section '.related-documents', ->
		h2 -> 'Related Posts'
		text @partial 'document-list.html.coffee', {
			documents: relatedPosts
		}