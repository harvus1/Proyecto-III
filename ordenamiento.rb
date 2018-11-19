require 'terminal-table'

module Metodos
   

def self.pasos(paso, pp, cont1, table)
    if pp == true
      limpiar
      puts table
      limpiar
    end
    table.add_row [paso, "#{cont1}"]      
end

def self.ordenarcola(valoreso, show)
    valoresq = *valoreso
    rows = []
    table = Terminal::Table.new :rows => rows 
    table.title = "COLA"
    table.headings = ['No. Paso', 'Procedimiento']
    pp = show
    paso = 0
    size = valoresq.size - 1
    cola = Cola.new
    for i in 0..size
    if cola.tope == nil
            cola.insertar(valoresq[i])
            pp = pasos(paso, pp, cola, table)
            paso += 1
            elsif valoresq[i] < cola.fondo.valor
            cola2 = Cola.new
            tp = cola.tope
            begin
            if valoresq[i] != nil && valoresq[i] < tp.valor
            cola2.insertar(valoresq[i])
            valoresq[i] = nil
           end
            cola2.insertar(tp.valor)
             tp = tp.siguiente
            cola.borrar
        pp = pasos(paso, pp, cola, table)
        paso += 1
        if tp == nil && valoresq[i] != nil
         cola2.insertar(valoresq[i])
        end
            end while tp != nil
            tp = cola2.tope
            begin
         cola.insertar(tp.valor)
        pp = pasos(paso, pp, cola, table)
        paso += 1
        tp = tp.siguiente
        end while tp != nil
        else
        cola.insertar(valoresq[i])
         pp = pasos(paso, pp, cola, table)
        paso += 1
        end
    end
    puts table if show == true
    return {resultado: cola, pasos: paso}
    end

    def self.ordenarpila(valoresq, show)
        rows = []
        table = Terminal::Table.new :rows => rows 
        table.title = "PILA"
        table.headings = ['No. Paso', 'Procedimiento']
        pp = show
        paso = 0
        size = valoresq.size - 1
        pila = Pila.new
        for i in 0..size
        if pila.tope == nil
        pila.insertar(valoresq[i])
        pp = pasos(paso, pp, pila, table)
        paso += 1
        elsif valoresq[i] < pila.tope.valor
        pila2 = Pila.new
        tp = pila.tope
            begin
                if tp.valor < valoresq[i]
                pila.insertar(valoresq[i])
                pp = pasos(paso, pp, pila, table)
                paso += 1
                break
            end
        pila2.insertar(tp.valor)
        tp = tp.siguiente
        pila.borrar
        pp = pasos(paso, pp, pila, table)
        paso += 1
        if tp == nil
        pila.insertar(valoresq[i])
        pp = pasos(paso, pp, pila, table)
        paso += 1
        end
        end  while tp != nil
            tp = pila2.tope
        begin
            pila.insertar(tp.valor)
            pp = pasos(paso, pp, pila, table)
            paso += 1
            tp = tp.siguiente
            end while tp != nil
         else
          pila.insertar(valoresq[i])
          pp = pasos(paso, pp, pila, table)
          paso += 1
        end
    end
    puts table if show == true
    return {resultado: pila, pasos: paso}
    end

def self.ordenarlista(valoresq, show)
    rows = []
    table = Terminal::Table.new :rows => rows
    table.title = "LISTA"
    table.headings = ['No. Paso', 'Procedimiento']
    pp = show
    paso = 0
    size = valoresq.size - 1
    lista = Lista.new
    for i in 0..size
       if lista.tope == nil
        lista.insertar(valoresq[i])
        pp = pasos(paso, pp, lista, table)
        paso += 1
        else
           tp = lista.tope
        begin
        if tp.siguiente == nil 
            if tp.valor < valoresq[i]
           lista.after(valoresq[i], tp.valor)
           pp = pasos(paso, pp, lista, table)
           paso += 1
           break 
        else
           lista.before(valoresq[i], tp.valor)
            pp = pasos(paso, pp, lista, table)
            paso += 1
            break 
            end
            elsif tp.valor <= valoresq[i] && tp.siguiente.valor >= valoresq[i]
           lista.after(valoresq[i], tp.valor)
           pp = pasos(paso, pp, lista, table)
           paso += 1
           break
            elsif tp.valor >= valoresq[i]
            lista.before(valoresq[i], tp.valor)
            pp = pasos(paso, pp, lista, table)
            paso += 1
            break
            else
            tp = tp.siguiente
            end
            end while tp != nil
        end
    end
    puts table if show == true
    return {resultado: lista, pasos: paso}
    end
end
class Elemento
    attr_accessor :valor, :siguiente
    def initialize(valor)
    @valor = valor
    @siguiente = nil
    end
end

class Pila
    attr_accessor :tope
    def initialize
    @tope = nil
end

def insertar(valor)
    l = Elemento.new(valor)
    l.siguiente = @tope
    @tope = l
end

def borrar
    @tope = @tope.siguiente
end

def to_s
        vector = ' '
        tp = @tope
        while tp != nil
        if tp.siguiente != nil
        vector += "#{tp.valor} --> "
        else
        vector += "#{tp.valor}"
        end
       tp = tp.siguiente
end 
return vector
end
end

class Cola
    attr_accessor :tope, :fondo
    def initialize
        @tope = nil
        @fondo = nil
    end

def insertar(valor)
    l = Elemento.new(valor)
   tp = @tope
    begin
        if tp == nil
        @tope = l
        @fondo = l
        break
        elsif tp.siguiente == nil
        tp.siguiente = l
        @fondo = l
    break
       else
        tp = tp.siguiente
       end
    end while tp != nil
end

def borrar
    @tope = @tope.siguiente
end

    def to_s
    vector = ''
    tp = @tope
        while tp != nil
        if tp.siguiente != nil
            vector += "#{tp.valor} --> "
        else
            vector += "#{tp.valor}"
           end
        tp = tp.siguiente
   end
    return vector
end
end

class Lista
    attr_accessor :tope, :fondo
def initialize
    @tope = nil
    @fondo = nil
end

def insertar(valor)
    l = Elemento.new(valor)
    @fondo = l
    @tope = l
end

def after(valor, referencia)
    l = Elemento.new(valor)
    tp = @tope
    begin
        if tp.valor == referencia
        l.siguiente = tp.siguiente
            tp.siguiente = l
            @fondo = l if l.siguiente == nil
            break
         end
        tp = tp.siguiente
    end while tp != nil
end

def before(valor, referencia)
    l = Elemento.new(valor)
    tp = @tope
   begin
        if tp.valor == referencia
        after(tp.valor, tp.valor)
        tp.valor = valor
        break
        end while tp != nil
        tp = tp.siguiente
    end
end

def to_s
        vector = ''
        tp = @tope
        while tp != nil
        if tp.siguiente != nil
                vector += "#{tp.valor} --> "
         else
                vector += "#{tp.valor}"
        end
    tp = tp.siguiente
    end
    return vector
end
end
           
           
