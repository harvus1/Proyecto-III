def limpiar_pantalla
    system ('clear')
end
def ordenar_lista(lista, valor)
    for x in 0..valor.size-1 
        a=valor[x]
        elemento={
            valor: a,
            siguiente: nil,
        }
    if lista[:vacia]==true
    lista[:tope]=elemento
    lista[:fondo]=elemento
    lista[:vacia]=false
    lista[:tamaño]+=1
    
    else

    if a<lista[:tope][:valor]
    auxt=lista[:tope]
    elemento[:siguiente]=auxt
    lista[:tope]=elemento
    lista[:tamaño]+=1
    
    elsif a>lista[:fondo][:valor]
    auxf=lista[:fondo]
    auxf[:siguiente]=elemento
    lista[:fondo]=elemento
    lista[:tamaño]+=1
  
    else

    medios=lista[:tope]
    lista[:tamaño]=lista[:tamaño]+1
    antes=nil
    
    bole = false
    while bole == false
    if a<medios[:valor]
    elemento[:siguiente]=medios
    antes[:siguiente]=elemento
    bole = true
    end
    antes=medios
    medios=medios[:siguiente]
    end


end    
end
end
end

def ordenarc(cola, valor)


    for x in 0..valor.size-1 
        a=valor[x]
        elemento={
            valor: a,
            siguiente: nil,
        }
    

    if cola[:vacia]==true
    cola[:tope]=elemento
    cola[:fondo]=elemento
    cola[:vacia]=false
    cola[:tamaño]+=1
    
    else

    if a<cola[:tope][:valor]
    auxt=cola[:tope]
    elemento[:siguiente]=auxt
    cola[:tope]=elemento
    cola[:tamaño]+=1
    
    elsif a>cola[:fondo][:valor]
    auxf=cola[:fondo]
    auxf[:siguiente]=elemento
    cola[:fondo]=elemento
    cola[:tamaño]+=1
  
    else

    medios=cola[:tope]
    cola[:tamaño]=cola[:tamaño]+1
    antes=nil
    
    bole = false
    while bole == false
    if a<medios[:valor]
    elemento[:siguiente]=medios
    antes[:siguiente]=elemento
    bole = true
    end
    antes=medios
    medios=medios[:siguiente]
    end


end    
end
end
end



limpiar_pantalla()
opcion = 0
while (opcion!=4)
puts 'PROYECTO III'
puts '------------'
puts ''

    puts 'METODOS DE ORDENAMIENTO:'
    puts '1. Colas'
    puts '2. Pilas'
    puts '3. Listas'
    puts '4. Salir'
    puts ''
    print 'Ingrese Opcion: '
    opcion = gets.chomp.to_i

    if opcion == 4
        limpiar_pantalla()
        puts '                              ------'
        puts 'METODO MAS EFICIENTE:        |LISTAS|'
        puts '                              ------'

    if opcion == 3
        limpiar_pantalla()
        lista  = {
            tope: nil,
            fondo: nil,
            vacia: true,
            tamaño: 0
        }
        
        puts "Ingrese Valores (SEPARADOS POR UN ESPACIO):"
        aux = gets.chomp
        valor = aux.split(' ').map(&:to_i)
        
        ordenar_lista(lista, valor)
        
        as = lista[:tope]
        while as[:siguiente] != nil
        puts as[:valor]
        as = as[:siguiente]
        end
        puts as[:valor]
        gets
        limpiar_pantalla()
    end

    if opcion == 1
        limpiar_pantalla()
        cola  = {
            tope: nil,
            fondo: nil,
            vacia: true,
            tamaño: 0
        }
        
        puts "Ingrese Valores (SEPARADOS POR UN ESPACIO):"
        aux = gets.chomp
        valor = aux.split(' ').map(&:to_i)
        
        ordenarc(cola, valor)
        
        as = cola[:tope]
        while as[:siguiente] != nil
        puts as[:valor]
        as = as[:siguiente]
        end
        puts as[:valor]
        gets
        limpiar_pantalla()
    end

    if opcion == 2
        #################
 print 'Inserte Un Numero: '
    n = gets.chomp.to_i
    elemento = {
        valor: n,
        siguiente: nil
    }
    if pila[:esta_vacia]
        pila[:tope] = elemento
        pila [:esta_vacia] = false
    else 
        tope = pila[:tope]
        elemento[:siguiente] = tope
        pila[:tope] = elemento
    end
end

def mostrarp (pila)
        limpiar()
        elemento = pila[:tope]
        while elemento[:siguiente] != nil
            nuevo_elemento = elemento[:siguiente]
            elemento = nuevo_elemento
            puts elemento[:valor]
        end while elemento[:siguiente] != nil
        gets
end

def eliminarp (pila)

    limpiar()    
    aux = pila[:tope]
    aux = aux[:siguiente]
    pila[:tope] = nil
    pila[:tope] = aux 

end
    
    ################33
    end
end
end


    
