struct Op{T}
  operation::T
end
Op(s::Union{Symbol, String, Number, Expr}) = Op(`$(s)`)

function _splitter(delim)
  return (x,y) -> `$(x) $(delim) $(y)` 
end
_chainer = _splitter(` . `)
_spacer = _splitter(` `)

(o::Op)() = `$(o.operation)` 
(o::Op)(x) =  _spacer(o.operation, x)
(o::Op)(x...)= reduce(_spacer, [x...]; init = o())

macro op(x)
  return Op(x)
end

macro op(x::Vararg{Union{Symbol, String, Number, Expr}})
  Op(reduce( _spacer, [x...]))
end


