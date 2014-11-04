@Ethereal = {
  attributeName: 'as'
}

@Ethereal.isDOM = (el) ->
  el instanceof HTMLDocument ||
  el instanceof HTMLElement

listen = (e) ->
  if e.type && e.type == 'DOMContentLoaded'
    document.removeEventListener('DOMContentLoaded', listen)

  Ethereal.Watcher(document, {
      attributes: true,
      subtree: true,
      childList: true,
      attributeFilter: [Ethereal.attributeName],
      characterData: true
  })

  Ethereal.Watcher().inspect(document.body)

  document.addEventListener 'submit', (e) ->
    if e.target.getAttribute('disabled')? || e.target.dataset['remote'] != 'true'
      return

    Ethereal.XHR.Form(e.target)

    e.preventDefault()
    return false

  document.addEventListener 'click', (e) ->

    if e.target.getAttribute('disabled')? || e.target.dataset['remote'] != 'true'
      return

    xhr = new Ethereal.XHR(e.target)
    xhr.send(e.target.getAttribute('href'))

    e.preventDefault()
    return false


if document.readyState == 'complete'
  listen()
else
  document.addEventListener('DOMContentLoaded', listen)


