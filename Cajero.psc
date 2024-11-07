Algoritmo Cajero
	
	Definir eleccion, cuenta, deposito, retiro, temp, impuesto, contador Como Real
	
	accesoCorrecto= Falso
    Dimension datosUser[2] //Arreglo con espacio 0 y 1
    datosUser[1] <- "bancoseguro" 
    datosUser[2] <- "ClaveSegura2024"
	
	Definir miDinero, historialDepositos, historialRetiro Como real
	Dimension historialDepositos[10]
	Dimension historialRetiro[10]
	
	Dimension miDinero[3] //Arreglo con espacio 0 y 1
    miDinero[1] <- 0 //Espacio para deposito
    miDinero[2] <- 0 //Espacio para retiro
	miDinero[3] <- 0 //Espacio para saldo
	
	
	
    Definir usuarioIngresado Como Caracter
    Definir claveIngresada Como Caracter
    Definir intentos Como Entero
    intentos = 0
	miDinero[3]=100
	eleccion=0
	transaccionActual=1
	
	
    Mientras intentos < 3 y accesoCorrecto= Falso Hacer
        Escribir "Por favor ingrese su usuario:"
        Leer usuarioIngresado
        Escribir "Por favor ingrese su contraseña:"
        Leer claveIngresada
		
        // Pasa el usuario a minusculas para evitar conlficto
        Si Minusculas(usuarioIngresado) = datosUser[1] Entonces
            Si claveIngresada = datosUser[2] Entonces
				accesoCorrecto= Verdadero
                Escribir "Acceso permitido"
				
			Sino
				Escribir "Contraseña incorrecta. Intente nuevamente."
			FinSi
		Sino
			Escribir "Usuario incorrecto. Intente nuevamente."
		FinSi
		
		
		intentos <- intentos + 1 //Incrementa los intentos
	FinMientras
	
	Si intentos = 3 Entonces
		Escribir "Ha superado 3 intentos. El sistema se ha bloqueado"
	FinSi
	
	
	Mientras eleccion <> 4 Hacer //Menu
		Escribir "1. Depositar dinero a la cuenta"
		Escribir "2. Sacar dinero de la cuenta"
		Escribir "3. Ver saldo"
		Escribir "4. Salir"
		leer eleccion
		Segun eleccion Hacer
			1:
				Escribir "Ingrese cuanto dinero desea depositar:"
				leer deposito
				miDinero[1]=deposito
				Si miDinero[1] >=  3000 Entonces
					miDinero[3]= miDinero[3]+miDinero[1]
					impuesto= miDinero[3]*0.01
					miDinero[3]=miDinero[3]-impuesto
					
					Escribir "Ha depositado: ",miDinero[1]
					Escribir "Cuenta actual: ", miDinero[3]

					
				SiNo
					miDinero[3]= miDinero[3]+miDinero[1]
					Escribir "Ha depositado: ",miDinero[1]
					Escribir "Cuenta actual: ", miDinero[3]

					
				Fin Si
			2:
				escribir "Cuanto dinero desea retirar?"
				leer retiro
				miDinero[2]= retiro
				Si miDinero[2] MOD 1000 <>0 Entonces
					Si miDinero[2] <=  miDinero[3] Entonces
						temp=miDinero[2]
						miDinero[2]= miDinero[2]+miDinero[3]
						miDinero[3]= miDinero[3]-temp
						Escribir "Ha retirado: ",miDinero[2]
						Escribir "Cuenta actual: ", miDinero[3]

						
					SiNo
						Escribir "No tiene suficiente dinero para realizar la accion"
					Fin Si
				SiNo
					Escribir "No es posible de realizar la operacion"
				Fin Si
				
			3:
				Escribir "Su saldo es de: ",miDinero[3]
				
			4:
				Escribir"Hasta Pronto"
			De Otro Modo:
				Escribir "Opcion no valida"
		Fin Segun
	Fin Mientras
	
	
	
	
FinAlgoritmo

