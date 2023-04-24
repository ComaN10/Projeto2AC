; Perrifericos IN
ON_OFF  EQU 1A0H ;BOTAO ON/OFF
Nr_Menu EQU 1B0H ;Numero de escolha menu
OK      EQU 1C0H ;Escolha OK

InicioPasseIn EQU 01D0H ;Endereco inic-o passe
FinalPasseIn EQU 01D7H ;Endereco Fim passe

PInicio     EQU 0202H   ;Posicao vertical do inicio do produto
PFIM        EQU 020EH   ;Posicao vertical do fim do produto
PEscolhido  EQU 2530H   ;Posicao para colocar o produto no talao

MInicio     EQU 0204H   ;Posicao vertical do inicio das moedas
MFIM        EQU 0206H   ;Posicao vertical do fim das moedas
MEscolhido  EQU 254AH   ;Posicao para colocar as moedas no talao

Prod1       EQU 253AH   ;Posicao do digito das unidades dos euros do produto escolhido
Prod2       EQU 253CH   ;Posicao do digito das dezenas dos centimos do produto escolhido
Ins1        EQU 254AH   ;Posicao do digito das unidades dos euros do dinheiro inserido
Ins2        EQU 254CH   ;Posicao do digito das dezenas dos centimos do dinheiro inserido
Troco1      EQU 255AH   ;Posicao do digito das unidades dos euros do troco
Troco2      EQU 255CH   ;Posicao do digito das centenas dos centimos do troco
Troco3      EQU 255DH   ;Posicao do digito das unidades dos centimos do troco

ReduzStock  EQU 2710H   ;Posicao do produto escolhido para reduzir no stock

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
;Endereços de memória para guardar a compra
Compra EQU 1000H
PasseInserida EQU 0230H
;Palavra Passe
Place 0030H
Passe:
    String "Tr0l@da" 
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
CincoEur EQU 1 ;Opcao 5 euros
DoisEur EQU 2 ;Opçao 2 euros
UmEur EQU 3 ;Opçao 1 euros
cinqCents EQU 4 ;Opçao 50 cents
vinteCents EQU 5 ;Opçao 20 cents
dezCents EQU 6 ;Opçao 10 cents
ECinco     EQU 500; Valor nota 5 euros
EDois      EQU 200; Valor moeda 2 euros
EUm        EQU 100; Valor moeda 1 euro
CCinquenta EQU 50;  Valor moeda 50 centimos
CVinte     EQU 20;  Valor moeda 20 centimos
CDez       EQU 10;  Valor moeda 10 centimos


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
    String "1-Coca-cola 1.00"
    String "2-Brisa mar 1.00"
    String "3-Fanta lar 1.00"
    String "4-Agua      1.00"
    String "7- Cancelar     "
    String "----------------"
Place 2300H
MenuSnacks:
    String "  -- Snacks --  "
    String "1-Doritos   2.00"
    String "2-Amendoim  1.00"
    String "3-Pistacio  2.00"
    String "4-Cajus     3.00" 
    String "7- Cancelar     "
    String "----------------"

Place 2100H          ;Display do menu Stock
MenuStock:
    String "---- STOCK ---- "
    String "   Introduza    "
    String "   Password     "
    String "                "
    String "1- Confirmar    "
    String "4- Voltar       "
    String "----------------"
Place 2380H
MStock1:
    String "---- Stock ---- "
    String "Doritos       50"
    String "Amendoim      50"
    String "Pistacio      50"
    String "Cajus         50"
    String "Coca cola     50"
    String "1- Seguinte 1/3 " 
Place 2600H
Mstock2:
    String "---- Stock ---- "
    String "Brisa Mar     50"
    String "Fanta lar     50"
    String "Agua          50"
    String "Cinco Eur     50"
    String "Dois  Eur     50"
    String "1 -Seguinte 2/3 "
Place 2680H
    Mstock3:
    String "---- Stock ---- "
    String "Um   Eur      50"
    String "0.50 Eur      50"
    String "0.20 Eur      50"
    String "0.10 Eur      50"
    String "1- Seguinte 3/3 "
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

Place 2500H
    Talao:
    String "----------------"
    String "-----TALAO------"
    String "----------------"
    String "           .00--"
    String "Inserido   .00--"
    String "Troco      . 0--"
    String "----------------"

Place 0000H
Inicio:
    MOV R0, Principio
    JMP R0
Place 3000H
Principio:
    MOV SP,StackPointer  ; Apontador para a Pilha
    CALL LimpaDisplay    ; chamada para o display ser limpo 
    CALL LimpaPerif      ; chamada para os periféricos serem limpos
    MOV R0,ON_OFF        
Liga:                    ; ligação da Maquina   
    MOVB R1,[R0]         ; passa o bit no endereço 
    CMP R1,1
    JNE Liga
ligado:                 ; mostra o menu inicial 
    MOV R2,MenuInicio 
    CALL MostraDisplay
    CALL LimpaPerif
ler_opcao:              ; Lê a opção dada pelo utilizador 
    MOV R0,Nr_Menu
    MOVB R1,[R0]
    CMP R1,0
    JEQ ler_opcao       ; Caso o valor nao tenha sido inserido pelo utilizador, o programa vai ficar sempre a executar as mesmas instruçoes
    CMP R1,Produtos     ; Compara o valor inserido com o valor guardado na Variável Produtos
    JEQ Oprodutos       ; Caso seja igual salta para o Menu Produtos (etiqueta = OProdutos)
    CMP R1,Stock        ; Compara o valor inserido com o valor guardado na Variável Stock 
    JEQ Ostock          ; Caso seja igual salta para o Menu Produtos (etiqueta = OStock)
    CALL RotinaErro     ; Caso nao seja nenhuma das opçoes vai para a rotina de erro
    JMP ligado          ;Salta para a rotina ligado 


    
;--------------------
;Menu Produtos
;--------------------
Oprodutos:                  
    MOV R2,MenuCategoria;Coloca em r2 o endereco de memoria do display
    CALL MostraDisplay  ;Chamada para Mostrar o display em R2
    CALL LimpaPerif     ;Chammada para a limpeza dos Periféricos
    MOV R0,Nr_Menu      ;coloca em R0 o valor selecionado
OProdutosCiclo:             
    MOVB R1,[R0]        ;chamada para a do menuno display
    CMP R1,0            ;compara r1 com 0
    JEQ OProdutosCiclo  ;volta a repetir o processo se for igual 
    CMP R1,Bebidas      ;compara o valor de R1 com o valor da variavel bebidas
    JEQ OBebidas        ;Caso seja igual sal para a OBebidas
    CMP R1,Snacks       ;compara o valor de R1 com o valor da variavel Snacks
    JEQ OSnacks         ;Caso seja igual salta para a OSnacks
    CMP R1,7            ;compara o valor de R1 com o valor 7 que e o valor para sair do menu
    JEQ ligado          
    CALL RotinaErro     ;chamada para a rotina de ERRO
    JMP ligado

;--------------------
;Menu Stock
;--------------------
Ostock:
    MOV R2,MenuStock
    CALL MostraDisplay  ;Chamada para Mostrar o display em R2
    CALL LimpaPerif     ;Chammada para a limpeza dos Periféricos
    MOV R0,Nr_Menu      ;coloca em R0 o valor selecionado
OStockCiclo:
    CALL EscreveDisp    ;chamada para a do menuno display
    MOVB R1,[R0]        ;Passa o byte da selecao em R1
    CMP R1,0            ;compara r1 com 0
    JEQ OStockCiclo     ;volta a repetir o processo se for igual 
    CMP R1,Confirmar    ;compara o valor de R1 com o valor da variavel confirmar
    JEQ OMostraStock1   ;Caso seja igual sal para a OMostraStock1
    CMP R1,Voltar       ;compara o valor de R1 com o valor da variavel voltar
    JEQ ligado          
    CALL RotinaErro     ;chamada para a rotina de ERRO
    JMP ligado
;--------------------
;Opcao Mostra Stock
;--------------------
OMostraStock1:
    MOV R2,MStock1     ;Coloca em r2 o endereco de memoria do display
    CALL MostraDisplay ;Chamada para Mostrar o display em R2
    CALL LimpaPerif    ;Chammada para a limpeza dos Periféricos
    MOV R0,Nr_Menu     ;coloca em R0 o valor selecionado
OMostraCiclo1:
    MOVB R1,[R0]       ;Passa o byte da selecao em R1
    CMP R1,0           ;compara R1 com 0
    JEQ OMostraCiclo1
    CMP R1,1           ;compara R1 com 1
    JEQ OMostraStock2  ;Caso seja igual sal para a OMostraStock2
    CALL RotinaErro    ;chamada para a rotina de ERRO
    JMP ligado
OMostraStock2:
    MOV R2,Mstock2     ;Coloca em r2 o endereco de memoria do display  
    CALL MostraDisplay ;Chamada para Mostrar o display em R2
    CALL LimpaPerif    ;Chammada para a limpeza dos Periféricos
    MOV R0,Nr_Menu     ;coloca em R0 o valor selecionado
OMostraCiclo2:
    MOVB R1,[R0]       ;Passa o byte da selecao em R1
    CMP R1,0           ;compara R1 com 0
    JEQ OMostraCiclo2
    CMP R1,1           ;compara R1 com 1
    JEQ OMostraStock3  ;Caso seja igual sal para a OMostraStock2
    CALL RotinaErro    ;chamada para a rotina de ERRO
    JMP ligado
OMostraStock3:
    MOV R2,Mstock3     ;Coloca em r2 o endereco de memoria do display
    CALL MostraDisplay ;Chamada para Mostrar o display em R2
    CALL LimpaPerif    ;Chammada para a limpeza dos Periféricos
    MOV R0,Nr_Menu     ;coloca em R0 o valor selecionado
OMostraCiclo3:
    MOVB R1,[R0]       ;Passa o byte da selecao em R1
    CMP R1,0           ;compara R1 com 0
    JEQ OMostraCiclo3
    CMP R1,1           ;compara R1 com 1
    JEQ OMostraStock1  ;Caso seja igual sal para a OMostraStock3
    CALL RotinaErro    ;chamada para a rotina de ERRO
    JMP ligado
;--------------------
;Jump absoluto
;--------------------
 jumpLigado:  ;visto que a instruçao JEQ tem um limite de 255 instruçoes foi criada uma etiqueta com um JMP
    JMP ligado
;--------------------
;Menu Bebidas
;--------------------
OBebidas:
    MOV R2,MenuBebidadas
    CALL MostraDisplay
    CALL LimpaPerif
    MOV R0,Nr_Menu
    MOV R3,48
    MOV R4,1
    MOV R5, ReduzStock
OBebidasCiclo:
    MOVB R1,[R0]
    CMP R1,0
    JEQ OBebidasCiclo
    ADD R3,R4
    MOVB [R5],R3
    CMP R1,COCA
    JEQ Omoedas
    ADD R3,R4
    MOVB [R5],R3
    CMP R1,Brisa
    JEQ Omoedas
    ADD R3,R4
    MOVB [R5],R3
    CMP R1,Fanta
    JEQ Omoedas
    ADD R3,R4
    MOVB [R5],R3
    CMP R1,Agua
    JEQ Omoedas
    CMP R1,7
    JEQ ligado
    CALL RotinaErro
    JMP OBebidas
;--------------------
;Menu Snacks
;--------------------  
OSnacks:
    MOV R2,MenuSnacks
    CALL MostraDisplay
    CALL LimpaPerif
    MOV R0,Nr_Menu
    MOV R3,53
    MOV R4,1
    MOV R5, ReduzStock
OSnacksCiclo:
    MOVB R1,[R0]
    CMP R1,0
    JEQ OSnacksCiclo
    MOVB [R5],R3
    CMP R1,Doritos
    JEQ Omoedas
    ADD R3,R4
    MOVB [R5],R3
    CMP R1,Amendoim
    JEQ Omoedas
    ADD R3,R4
    MOVB [R5],R3
    CMP R1,Pistacio
    JEQ Omoedas
    ADD R3,R4
    MOVB [R5],R3
    CMP R1,Cajus
    JEQ Omoedas
    CMP R1,7
    JEQ jumpLigado
    CALL RotinaErro
    JMP OSnacks
;--------------------
;Menu Moedas
;--------------------  
Omoedas:
    CALL CicloEscolhaProduto
    MOV R2,MoedasCompra
    CALL MostraDisplay
    CALL LimpaPerif
    MOV R0,Nr_Menu
OmoedasCiclo:
    MOVB R1,[R0]
    CMP R1,0
    JEQ OmoedasCiclo
    CMP R1,CincoEur
    MOV R3,ECinco
    JEQ jumpAbsTalao
    CMP R1,DoisEur
    MOV R3,EDois
    JEQ jumpAbsTalao
    CMP R1,UmEur
    MOV R3,EUm  
    JEQ jumpAbsTalao
    CMP R1,cinqCents
    MOV R3,CCinquenta  
    JEQ jumpAbsTalao
    CMP R1,vinteCents
    MOV R3,CVinte  
    JEQ jumpAbsTalao
    CMP R1,dezCents
    MOV R3,CDez  
    JEQ jumpAbsTalao
    CALL RotinaErro
    JMP Omoedas

;--------------------
;Menu EscolhaProduto
;--------------------
CicloEscolhaProduto:
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6
    MOV R5, 16              ;Guarda em R5 o valor 16
    MUL R1,R5               ;multiplicar escolha produto por 10
    MOV R2,PInicio          ;guardar a posicao Produto inicio
    MOV R4,PFIM             ;guardar a posicao Produto Fim
    ADD R2,R1               ;Posicao inicial do produto selecionado
    ADD R4,R1               ;Posicao final do produto selecionado
    MOV R6,PEscolhido       ;Guarda a posicao onde o produto ira ser guardado
    MOV R7,R6
GuardarProd:
    MOV R6,[R2]
    MOV [R7],R6
    CMP R2,R4
    JEQ ProdutoGuardado
AdicionaProd:
    ADD R2,2
    ADD R7,2
    JMP GuardarProd
ProdutoGuardado:
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    RET
;--------------------
;Menu EscolhaMoedas
;--------------------
CicloEscolhaMoedas:
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R5
    PUSH R6
    MOV R5,16
    MUL R1,R5
    MOV R2,MInicio
    MOV R4,MFIM
    ADD R2,R1
    ADD R4,R1
    MOV R6,MEscolhido
    MOV R7,R6
GuardaMoeda:
    MOV R6,[R2]
    MOV [R7],R6
    CMP R2,R4
    JEQ MoedaGuardada
AdicionaMoeda:
    ADD R2,2
    ADD R7,2
    JMP GuardaMoeda
MoedaGuardada:
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    RET
;--------------------
;Jump absolutoTalao
;--------------------
jumpAbsTalao:  ;visto que a instruçao JEQ tem um limite de 255 instruçoes foi criada uma etiqueta com um JMP
    JMP OTalao
;--------------------
;--------------------
;Calcula Troco
;--------------------
CicloTroco:
    MOV R8,Troco1           ;guarda a posicao dos euros do troco em R8
    MOV R9,Troco2           ;guarda a posicao das dezenas dos centimos do troco em R9
    MOV R0,Troco3           ;guarda a posicao das unidades dos centimos do troco em R0
    MOV R1,Prod1            ;guarda a posicao dos euros do Produto escolhido em R1
    MOVB R1,[R1]            ;guarda o valor dos euros do produto escolhido em R1
    MOV R2,Prod2            ;guarda a posicao dos centimos do Produto escolhido em R2
    MOVB R2,[R2]            ;guarda o valor dos centimos do produto escolhido em R2
    MOV R3,Ins1             ;guarda a posicao dos euros do Valor inserido em R3
    MOVB R3,[R3]            ;guarda o valor dos euros do Valor inserido em R3
    MOV R4,Ins2             ;guarda a posicao dos euros do Valor Inserido em R4
    MOVB R4,[R4]            ;guarda o valor dos centimos do Valor inserido em R4
    MOV R5,48               ;Guarda o valor de conversao no R5
    MOV R6,10               ;Guarda o valor 10 para fazer as contas de multiplicação e divisão em R6 
    SUB R1,R5               ;Coverte o valor de R1 para decimal
    SUB R2,R5               ;Coverte o valor de R2 para decimal
    SUB R3,R5               ;Coverte o valor de R3 para decimal
    SUB R4,R5               ;Coverte o valor de R4 para decimal
    MUL R1,R6               ;Multiplica o valor dos euros do Produto escolhido em 10
    MUL R3,R6               ;Multiplica o valor dos euros do Valor inserido em 10
    ADD R1,R2               ;Adiciona os Centimos aos euros do Produto escolhido para facilitar a operacao de subtracao 1,5 euros = 15
    ADD R3,R4               ;Adiciona os centimos aos euros do Valor inserido para facilitar a operacao de subtracao 1,5 euros = 15
    CMP R3,R1               ;compara o valor inserido com o valor do produto para saber se foi inserido o suficiente
    JN DinheiroInsuf        ;salta para o DinheiroInsuf caso o valor inserido nao seja o suficiente 
    SUB R3,R1               ;caso seja, remove o valor do produto para obter o troco
    MOV R7,R3               ;faz uma copia de R3
    MOD R7,R6               ;calcula o D - resto da divisão inteira por 10
    DIV R3,R6               ;atualiza X - quociente da divisão inteira por 10
    ADD R3,R5               ;Converte o valor de R3 para apresentar no Display
    ADD R7,R5               ;Converte o valor de R5 para apresentar no Display
    MOVB [R8],R3            ;Guarda o valor dos euros na posicao do troco pretendida
    MOVB [R9],R7            ;Guarda o valor dos centimos na posicao do troco pretendida
    RET
DinheiroInsuf:
    MOV R1,49H              ;Guarda o char "I" em R1
    MOV R2,4EH              ;Guarda o char "N" em R2
    MOV R3,53H              ;Guarda o char "S" em R3
    MOVB [R8],R1            ;Escreve o char "I" na posicao de R8
    MOVB [R9],R2            ;Escreve o char "N" na posicao de R9
    MOVB [R0],R3            ;Escreve o char "S" na posicao de R0
    RET
;--------------------
;Menu DiminuiStock
;--------------------
CicloDiminuiStock:
    MOV R0,ReduzStock       ;Guarda a posicao de ReduzStock em R0
    MOVB R0,[R0]            ;Guarda o valor de Reduzstock em R0
    MOV R3,48               ;Guarda o valor de conversao em R3
    SUB R0,R3               ;Converte o valor de R0 para decimal
    MOV R8,8                ;Guarda o valor 8 em R8, pois ao comprar o caso dos cajus o valor 8 nao é possivel comparar, por isso é necessario um Registo
    CMP R0,1                ;Compara o valor com 1
    JEQ DCoca               ;e salta para o caso de ser cocacola
    CMP R0,2                
    JEQ DBrisa              
    CMP R0,3                
    JEQ DFanta              
    CMP R0,4                
    JEQ DAgua               
    CMP R0,5                
    JEQ DDoritos            
    CMP R0,6                
    JEQ DAmendoim           
    CMP R0,7                
    JEQ DPistacio           
    CMP R0,R8               
    JEQ DCajus              
DCoca:                      ;caso de ser escolhida uma cocacola
    MOV R1,23DEH            ;Guarda o primeiro digito(dezenas) do stock da cocacola
    MOV R2,23DFH            ;Guarda o segundo digito(unidades) do stock da cocacola
    JMP Diminui             ;apos guardar salta para a operacao de diminuir o stock
DBrisa:
    MOV R1,261EH
    MOV R2,261FH
    JMP Diminui
DFanta:
    MOV R1,262EH
    MOV R2,262FH
    JMP Diminui
DAgua:
    MOV R1,263EH
    MOV R2,263FH
    JMP Diminui
DDoritos:
    MOV R1,239EH
    MOV R2,239FH
    JMP Diminui
DAmendoim:
    MOV R1,23AEH
    MOV R2,23AFH
    JMP Diminui
DPistacio:
    MOV R1,23BEH
    MOV R2,23BFH
    JMP Diminui
DCajus:
    MOV R1,23CEH
    MOV R2,23CFH
    JMP Diminui
Diminui:
    MOV R4,10               ;Guarda 10 em R4
    MOV R5,1                ;Guarda 1 em R5
    MOVB R6, [R1]           ;Recebe o valor das dezenas 
    MOVB R7, [R2]           ;Recebe o valor das unidades
    SUB R6,R3               ;Converte o digito das dezenas em decimal
    SUB R7,R3               ;Converte o digito das unidades em decimal
    MUL R6,R4               ;passa o valor para dezenas 
    ADD R6,R7               ;soma os dois para obter o valor do stock
    SUB R6,R5               ;diminui o valor do stock em 1
    MOV R7,R6               ;copia o valor do stock para R7
    MOD R7,R4               ;calcula o D - resto da divisão inteira por 10
    DIV R6,R4               ;atualiza X - quociente da divisão inteira por 10
    ADD R6,R3               ;Converte denovo para codigo ASCII
    ADD R7,R3               ;Converte denovo para codigo ASCII
    MOVB [R1],R6            ;Coloca o novo valor das dezenas
    MOVB [R2],R7            ;Coloca o novo valor das unidades
    RET

;--------------------
;Menu TALAO
;-------------------- 
OTalao:
    CALL CicloEscolhaMoedas
    CALL CicloTroco
    CALL CicloDiminuiStock
    MOV R2,Talao
    CALL MostraDisplay
    CALL LimpaPerif

;--------------------
;Escreve passe Display
;-------------------- 
EscreveDisp:
    MOV R2,PasseInserida
    MOV R4,InicioPasseIn
EscreveDispPasse:
    MOVB R3,[R4]
    CMP R3,0
    JEQ CicloOK
    MOV R3,2AH
    MOVB [R2],R3
    ADD R2,1
    ADD R4,1
    JMP EscreveDispPasse
CicloOK:
    MOV R0,OK
    MOVB R1,[R0]
    CMP R1,0
    JEQ CicloOK
    MOV R5,Nr_Menu
    MOVB R6,[R5]
    CMP R6,0
    JEQ EscreveDispPasse
    CALL VerificaPasse
    JMP EscreveDispPasse
    CALL RotinaErro
    RET
;--------------------
;Varifica Passe
;-------------------- 
VerificaPasse:
    MOV R0,InicioPasseIn
    MOV R1,FinalPasseIn
    MOV R2,Passe
    MOV R4,8    ;Registo auxiliar com o tamanho da Palavra Passe
CompararPasse:
    MOV R5,[R0]
    MOV R6,[R2]
    CMP R6,R5
    JEQ PasseIgual
CicloPasseErrada:
    Call LimpaPerif
    MOV R2,PasseErrada
    CALL MostraDisplay
    MOV R0,Nr_Menu
    MOVB R1,[R0]
    CMP R1,0
    JEQ CicloPasseErrada
    JMP CicloFinal
PasseIgual:
    ADD R0,2
    ADD R2,2
    CMP R0,R1
    JLE CompararPasse
    JMP OMostraStock1
CicloFinal:
    POP R7
    POP R6
    POP R5
    POP R4
    POP R3
    POP R2
    POP R1
    POP R0
    RET
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
    PUSH R0
    PUSH R1
    PUSH R2
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
LimpaDisplay:        ;Faz a Limpeza do diplay
    PUSH R0
    PUSH R1
    PUSH R3
    MOV R0,Display
    MOV R1,DISPLAY_END
CicloLimpar:         ;Ciclo para a limpeza caracter a caracter
    MOV R2,CaracterVazio
    MOVB [R0],R2
    ADD R0,1
    CMP R0,R1
    JLE CicloLimpar
    POP R3
    POP R1
    POP R0
    RET
