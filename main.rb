require_relative 'ordenamiento'
require 'terminal-table'

def limpiar_pantalla
    gets
    system('clear')
end

def limpiar
    system ('clear')
end

@valoresq = []

def ordenar
    if @valoresq == []
        puts ' ----------------'
        puts '|VECTOR SIN DATOS|'
        puts '|INGRESE DATOS   |'
        puts ' ----------------'
        puts ' '
        puts 'PRESIONE ENTER PARA CONTINUAR'
        limpiar_pantalla()
        return
    end
    rows = []
    puts 'ORDENAMIENTO DE DATOS'
    puts '---------------------'
    puts ''
    puts "Valores a Ordenar: #{@valoresq}"
    lista = Metodos.ordenarlista(@valoresq, false)
    cola = Metodos.ordenarcola(@valoresq, false)
    pila = Metodos.ordenarpila(@valoresq, false)

    rows << ['Cola', cola[:pasos], 0, cola[:resultado]]
    rows << ['Pila', pila[:pasos], 0, pila[:resultado]]
    rows << ['Lista', lista[:pasos], 0, lista[:resultado]]
    limite = rows [0][1]
    for x in 0..2
        if rows[x][1] > limite
            limite = rows[x][1].to_f
        end
    end

    for x in 0..2
        rows[x][2] = (limite / rows[x][1]) * 100
    end
    table = Terminal::Table.new :rows => rows
    table.headings = ['Metodos de Ordenamiento', 'No. Pasos', 'Rendimiento', 'Resultado']
    puts table
    limpiar_pantalla()
end

def ingreso
    puts 'INGRESO DE DATOS'
    puts '----------------'
    puts ''
    puts 'Ingrese Valores (SEPARADOS POR UN ESPACIO): '
    puts ''
    aux = gets.chomp
    @valoresq = aux.split(' ').map(&:to_i)
    size = @valoresq.size - 1
    limpiar()
    
end

def pasosordenar
    if @valoresq == []
        puts ' ----------------'
        puts '|VECTOR SIN DATOS|'
        puts '|INGRESE DATOS   |'
        puts ' ----------------'
        puts ' '
        puts 'PRESIONE ENTER PARA CONTINUAR'
        limpiar_pantalla()
        return
    end
    puts 'ORDENAMIENTO A PASOS'
    puts '--------------------'
    puts ''
    puts "ORDENAMIENDO PASO A PASO: COLA"
        Metodos.ordenarcola(@valoresq, true)
        limpiar_pantalla()
    
        puts "ORDENAMIENDO PASO A PASO: PILA"
        Metodos.ordenarpila(@valoresq, true)
        limpiar_pantalla()
    
        puts "ORDENAMIENTO PASO A PASO: LISTA"
        Metodos.ordenarlista(@valoresq, true)
        limpiar_pantalla()
        
   
end



opcion = 0
while opcion != 4
    limpiar()
    puts 'PROYECTO III'
    puts '------------'
    puts ''
    puts '1. Ingreso de Datos'
    puts '2. Ordenamiento de Datos'
    puts '3. Ordenamiento a Pasos'
    puts '4. Salir'
    puts ''
    print 'Ingrese opcion: '
    opcion = gets.chomp.to_i
    puts ''

    if opcion == 1
        limpiar()
        ingreso
    elsif opcion == 2
        limpiar()
        ordenar
    elsif opcion == 3
        limpiar()
        pasosordenar
    elsif opcion == 4
        limpiar_pantalla()
    else
        puts ' ---------------'
        puts '|OPCION INVALIDA|'
        puts ' ---------------'
        limpiar_pantalla()
    end
end