def limpiar
    system ('clear')
end

 def ver (cola)
    aux = cola[:frente]
    auxb = cola[:frente]
    for x in (1..(cola.size-1))
        for y in (1..(cola.size-1))
            if auxb[:valor] > aux[:valor]
            asd = aux[:valor]
            aux[:valor] = auxb[:valor]
            auxb[:valor] = asd
            end
         auxb=auxb[:siguiente]
        end
        aux= aux[:siguiente]
        auxb = cola[:frente]
    end
    aux = cola[:frente]
    while aux != nil
        puts aux[:valor]
        aux = aux[:siguiente] 
    end  
end
 def verl (lista)
    aux = lista[:frente]
    auxb = lista[:frente]
    for x in (1..(lista.size-1))
        for y in (1..(lista.size-1))
            if auxb[:valor] > aux[:valor]
            asd = aux[:valor]
            aux[:valor] = auxb[:valor]
            auxb[:valor] = asd
            end
         auxb=auxb[:siguiente]
        end
        aux= aux[:siguiente]
        auxb = lista[:frente]
    end
    aux = lista[:frente]
    while aux != nil
        puts aux[:valor]
        aux = aux[:siguiente] 
    end  
end
 def eliminar(cola)
aux = cola[:frente]
cola[:frente] = nil
cola[:frente] = aux[:siguiente]
end
 def eliminarl(lista)
    aux = lista[:tope]
    lista[:tope] = nil
    lista[:tope] = aux[:siguiente]
end
 def insertar (cola)
    limpiar()
     print 'Inserte Un Numero: '
    n = gets.chomp.to_i
         elemento = {
        valor: n,
        siguiente: nil
        }
    if cola[:esta_vacia] == true
        cola[:tope] = elemento
        cola[:frente] = elemento
        cola[:esta_vacia] = false
    else 
        aux = cola[:tope] 
        aux[:siguiente] = elemento 
        elemento[:siguiente] = nil
        cola[:tope] = elemento
    end
end
 def insertarl (lista)
    limpiar()
     print 'Inserte Un Numero: '
    n = gets.chomp.to_i
         elemento = {
        valor: n,
        siguiente: nil
        }
     if lista[:esta_vacia] == true
        lista[:tope] = elemento
        lista[:frente] = elemento
        lista[:esta_vacia] = false
    else 
        aux = lista[:tope] 
        aux[:siguiente] = elemento 
        elemento[:siguiente] = nil
        lista[:tope] = elemento
    end
end
 cola = {
    tope: nil,
    frente: nil,
    max: -1,
    esta_vacia: true 
}
 lista ={
    tope: nil,
    frente: nil,
    max: -1,
    esta_vacia: true
}
 pila = {
    tope: nil,
    max: -1,
    esta_vacia: true
}
 ap =0
op = 0
 puts "-----------------------------"
puts "Proyecto 3"
puts "En que de sea trabajar?"
puts "1. Colas"
puts "2. Pilas"
puts "3. Listas"
ap = gets.chomp.to_i
 while op != 4
puts "Ingrese la opcion que desea"
puts "1. Insertar"
puts "2. Establecer el orden"
puts "3. Eliminar un elemento"
puts "4. Salir"
op = gets.chomp.to_i
limpiar()
if ap ==1
if op == 1
insertar(cola)
end
if op == 2
ver(cola)
end
if op == 3 
eliminar(cola)
end
end
 if ap ==2
    if op == 1
    insertarp(pila)
    end
    if op == 2
    verp(pila)
    end
    if op == 3 
    eliminarp(pila)
    end
end
 if ap ==3
    if op == 1
    insertarl(lista)
    end
    if op == 2
    verl(lista)
    end
    if op == 3 
    eliminarl(lista)
    end
end
 end