. ./package.od

redo-ifchange "$2.patch"   # FIXME: do we really need to patch first?
redo-ifchange "$2.deps"
exec xargs redo-ifchange <$2.deps
