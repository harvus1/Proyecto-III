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
