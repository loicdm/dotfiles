function premoveorphans --wraps='premove -snc $(p -Qdtq)' --description 'alias premoveorphans premove -snc $(p -Qdtq)'
  premove -snc $(p -Qdtq) $argv
        
end
