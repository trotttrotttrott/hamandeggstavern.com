top.Ham = (->
  modules = {}
  register: (id, module)->
    console.log "register #{id}"
    modules[id] = module
  start: (id, options={})->
    console.log "start #{id}"
    modules[id](options)
)()
