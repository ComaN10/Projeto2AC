; Perrifericos IN
ON_OFF  EQU 1A0H ;BOTAO ON/OFF
Nr_Menu EQU 1B0H ;Numero de escolha menu
OK      EQU 1C0H ;Escolha OK
InicioPasseIn EQU 01D0H ;Endereco inic-o passe
FinalPasseIn EQU 01D7H ;Endereco Fim passe

;PLACE 02A0H
;Passe:
;String "   -passe-   " ;Mostra Password
;Place 01A2H
;Sel_Menu:
;String "Sel_Num_Menu"  ;Mostra Botao de selecao do Menu



;DISPLAY
Display EQU 200H
DISPLAY_END  EQU 26FH
CaracterVazio EQU 20H

;Escolhas de Menu (Opcoes)
Produtos EQU 1 ;Ocao Produtos
Stock    EQU 2 ;Opcao Stock
Bebidas  EQU 1 ;Opcao Bebidas
Snacks   EQU 2 ;Opcao Cancelar
Confirmar EQU 1 ;Opcao Confirmar
COCA EQU 1;Opcao coca cola
Brisa EQU 2;Opcao Brisa
Fanta EQU 3;Opcao Fanta
Agua EQU 4;Opcao Agua
Doritos EQU 1;Opcao doritos
Amendoim EQU 2;Opcao Amendoim
Pistacio EQU 3;Opcao pistacio
Cajus EQU 4;Opcao cajus
Voltar   EQU 4 ;Opcao Voltar





StackPointer EQU 6000H ;pilha

Place 2000H          ;Display do menu inicial
MenuInicio:
    String "----------------"
    String "MAQUINA MADEIRA "
    String "   BEM-VINDO    "
    String "----------------"
    String "1- Produtos     "
    String "2- Stock        "
    String "----------------"

Place 2200H          ;Display do menu categoria
MenuCategoria:
    String "----------------"
    String "-- Categoria -- "
    String "----------------"
    String "1- Bebidas      "
    String "2- Snacks       "
    String "7- Cancelar     "
    String "----------------"
Place 2280H
MenuBebidadas:
    String "-- Bebidas --   "
    String "----------------"
    String "1- Coca-cola    "
    String "2- Brisa marac  "
    String "3- Fanta laranja"
    String "4- Agua         "
    String "----------------"
Place 2300H
MenuSnacks:
    String "-- Snacks --    "
    String "----------------"
    String "1- Doritos      "
    String "2- Amendoim     "
    String "3- Pistacio     "
    String "4- Cajus        " 
    String "----------------"

Place 2100H          ;Display do menu Stock
MenuStock:
    String "---- STOCK ---- "
    String "----------------"
    String "Introduza       "
    String "Password        "
    String "1- Confirmar    "
    String "4- Voltar       "
    String "----------------"
Place 2500H
MenuErro:
    String "     Atencao    "
    String "      Opcao     "   
    String "     Errada     "
    String "----------------"

Place 2180H         ;Display infroma passe Errada
PasseErrada:
    String "     ATENCAO    "
    String "----------------"
    String "A passe inserida"
    String "   Esta errada  "
    String "Tentar Novamente"
    String "----------------"
    String "   OK - VOLTAR  "
Place 2400H
    MoedasCompra:
    String "-Inserir Moedas-"
    String " 1- 5.00  euros "
    String " 2- 2.00  euros "
    String " 3- 1.00  euros "
    String " 4- 0.50  euros "
    String " 5- 0.20  euros "
    String " 6- 0.10  euros "


Place 0000H
Inicio:
    MOV R0, Principio
    JMP R0
Place 3000H
Principio:
    MOV SP,StackPointer
    CALL LimpaDisplay
    CALL LimpaPerif
    MOV R0,ON_OFF
Liga:
    MOV R1,[R0]
    CMP R1,1
    JNE ligado
ligado:
    MOV R2,MenuInicio
    CALL MostraDisplay
    CALL LimpaPerif
ler_opcao:
    MOV R0,Nr_Menu
    MOVB R1,[R0]
    CMP R1,0
    JEQ ler_opcao
    CMP R1,Produtos
    JEQ Oprodutos
    CMP R1,Stock
    JEQ Ostock
    CALL RotinaErro
    JMP ligado


    
;--------------------
;Menu Produtos
;--------------------
Oprodutos:
    MOV R2,MenuCategoria
    CALL MostraDisplay
    CALL LimpaPerif
    MOV R0,Nr_Menu
OProdutosCiclo:
    MOVB R1,[R0]
    CMP R1,0
    JEQ OProdutosCiclo
    CMP R1,Bebidas
    JEQ OBebidas
    CMP R1,Snacks
    JEQ OSnacks
    CMP R1,7
    JEQ ligado
    CALL RotinaErro
    JMP ligado

;--------------------
;Menu Stock
;--------------------
Ostock:
    MOV R2,MenuStock
    CALL MostraDisplay
    CALL LimpaPerif
    MOV R0,Nr_Menu
OStockCiclo:
    MOVB R1,[R0]
    CMP R1,0
    JEQ OStockCiclo
    CMP R1,Confirmar
    JEQ ligado
    CMP R1,Voltar
    JEQ ligado
    CALL RotinaErro
    JMP ligado
;--------------------
;Menu Bebidas
;--------------------
OBebidas:
    MOV R2,MenuBebidadas
    CALL MostraDisplay
    CALL LimpaPerif
OBebidasCiclo:
    MOVB R1,[R0]
    CMP R1,0
    JEQ OBebidasCiclo
    CMP R1,COCA
    JEQ ligado
    CMP R1,Brisa
    JEQ ligado
    CMP R1,Fanta
    JEQ ligado
    CMP R1,Agua
    CALL RotinaErro
    JMP OBebidas

;--------------------
;Menu Snacks
;--------------------  


OSnacks:
    MOV R2,MenuSnacks
    CALL MostraDisplay
    CALL LimpaPerif
OSnacksCiclo:
    MOVB R1,[R0]
    CMP R1,0
    JEQ OSnacksCiclo
    CMP R1,Doritos
    JEQ ligado
    CMP R1,Amendoim
    JEQ ligado
    CMP R1,Pistacio
    JEQ ligado
    CMP R1,Cajus
    CALL RotinaErro
    JMP OBebidas

;--------------------
;Rotina Erro
;--------------------  
RotinaErro:
    PUSH R0
    PUSH R1
    PUSH R2
    MOV R2,MenuErro
    CALL MostraDisplay
    CALL LimpaPerif
    MOV R0,OK
ERRO:
    MOVB R1,[R0]
    CMP R1,1
    JNE ERRO
    POP R2
    POP R1
    POP R0
    RET

;--------------------
;Menu Display
;--------------------
MostraDisplay:
    PUSH R0
    PUSH R1
    PUSH R3
    MOV R0, Display
    MOV R1, DISPLAY_END
CicloMostrar:
    MOV R3,[R2]
    MOV [R0],R3
    ADD R2,2
    ADD R0,2
    CMP R0,R1
    JLE CicloMostrar
    POP R3
    POP R1
    POP R0
    RET

;--------------------
;Limpa Perifericos
;--------------------

LimpaPerif:
    push R0
    push R1
    push R2
    PUSH R3
    MOV R0,ON_OFF
    MOV R1,Nr_Menu
    MOV R2,OK
    MOV R3,0
    MOVB [R0],R3
    MOVB [R1],R3
    MOVB [R2],R3
    POP R3
    POP R2
    POP R1
    POP R0
    RET
;--------------------
;LIMPA DISPLAY
;--------------------
LimpaDisplay:
    PUSH R0
    PUSH R1
    PUSH R3
    MOV R0,Display
    MOV R1,DISPLAY_END
CicloLimpar:
    MOV R2,CaracterVazio
    MOVB [R0],R2
    ADD R0,1
    CMP R0,R1
    JLE CicloLimpar
    POP R3
    POP R1
    POP R0
    RET
