; Perrifericos IN
ON_OFF  EQU 1A0H        ;BOTAO ON/OFF
Nr_Menu EQU 1B0H        ;Numero de escolha menu
OK      EQU 1C0H        ;Escolha OK

InicioPasseIn EQU 01D0H ;Endereco inic-o passe
FinalPasseIn EQU 01D7H  ;Endereco Fim passe

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
AumentaMoedas EQU 271EH ;Posicao da moeda escolhida para aumentar no stock

MCinco      EQU 2730H   ;Posicao para guardar o troco de cinco euros 
MDois       EQU 2740H   ;Posicao para guardar o troco de dois euros 
MUm         EQU 2750H   ;Posicao para guardar o troco de um euro 
MCinquenta  EQU 2760H   ;Posicao para guardar o troco de cinquenta centimos 
MVinte      EQU 2770H   ;Posicao para guardar o troco de venti centimos 
MDez        EQU 2780H   ;Posicao para guardar o troco de dez centimos 

SCinco1     EQU 264EH   ;Posicao para modificar os valores das dezenas do stock de cinco euros
SCinco2     EQU 264FH   ;Posicao para modificar os valores das unidades do stock de cinco euros
SDois1      EQU 265EH   ;Posicao para modificar os valores das dezenas do stock de dois euros
SDois2      EQU 265FH   ;Posicao para modificar os valores das unidades do stock de dois euros
SUm1        EQU 269EH   ;Posicao para modificar os valores das dezenas do stock de um euro
SUm2        EQU 269FH   ;Posicao para modificar os valores das unidades do stock de um euro
SCinquenta1 EQU 26AEH   ;Posicao para modificar os valores das dezenas do stock de cinquenta Centimos
SCinquenta2 EQU 26AFH   ;Posicao para modificar os valores das unidades do stock de cinquenta Centimos
SVinte1     EQU 26BEH   ;Posicao para modificar os valores das dezenas do stock de vinte Centimos
SVinte2     EQU 26BFH   ;Posicao para modificar os valores das unidades do stock de vinte Centimos
SDez1       EQU 26CEH   ;Posicao para modificar os valores das dezenas do stock de dez Centimos
SDez2       EQU 26CFH   ;Posicao para modificar os valores das unidades do stock de dez Centimos

;PLACE 02A0H
;Passe:
;String "   -passe-   "     ;Mostra Password
;Place 01A2H
;Sel_Menu:
;String "Sel_Num_Menu"      ;Mostra Botao de selecao do Menu


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
    String "@s3mblY" 
;Escolhas de Menu (Opcoes)
Produtos EQU 1              ;Ocao Produtos
Stock    EQU 2              ;Opcao Stock
Bebidas  EQU 1              ;Opcao Bebidas
Snacks   EQU 2              ;Opcao Cancelar
Confirmar EQU 1             ;Opcao Confirmar
COCA EQU 1                  ;Opcao coca cola
Brisa EQU 2                 ;Opcao Brisa
Fanta EQU 3                 ;Opcao Fanta
Agua EQU 4                  ;Opcao Agua
Doritos EQU 1               ;Opcao doritos
Amendoim EQU 2              ;Opcao Amendoim
Pistacio EQU 3              ;Opcao pistacio
Cajus EQU 4                 ;Opcao cajus
Voltar   EQU 4              ;Opcao Voltar
CincoEur EQU 1              ;Opcao 5 euros
DoisEur EQU 2               ;Opçao 2 euros
UmEur EQU 3                 ;Opçao 1 euros
cinqCents EQU 4             ;Opçao 50 cents
vinteCents EQU 5            ;Opçao 20 cents
dezCents EQU 6              ;Opçao 10 cents


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
    String "4-Agua      1.70"
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
    String "7- Voltar       "
Place 4000H
MenuErro:
    String "----------------"
    String "     Atencao    "
    String "      Opcao     "   
    String "     Errada     "
    String "----------------"
    String "   7 - VOLTAR   "
    String "----------------"

Place 2180H         ;Display infroma passe Errada
PasseErrada:
    String "     ATENCAO    "
    String "----------------"
    String "A passe inserida"
    String "   Esta errada  "
    String "Tentar Novamente"
    String "----------------"
    String "   7 - VOLTAR  "

Place 2400H
    MoedasCompra:
    String "-Inserir Moedas-"
    String " 1- 5.00  euros "
    String " 2- 2.00  euros "
    String " 3- 1.00  euros "
    String " 4- 0.50  euros "
    String " 5- 0.20  euros "
    String " 6- 0.10  euros "
Place 2900H
ErroStock:
    String "----------------"
    String "    Atencao     "
    String "      Sem       "   
    String "     Stock      "
    String "----------------"
    String "   7 - VOLTAR   "
    String "----------------"

Place 2800H
ErroTroco:
    String "----------------"
    String "    Atencao     "
    String "      Sem       "   
    String "     Troco      "
    String "----------------"
    String "   7 - VOLTAR   "
    String "----------------"

Place 2500H
    Talao:
    String "----------------"
    String "-----TALAO------"
    String "----------------"
    String "           .00--"
    String "Inserido   .00--"
    String "Troco      . 0--"
    String "---7 - VOLTAR---"

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
    MOVB R1,[R0]         ; passa o byte no endereço 
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
    CMP R1,7
    JEQ Ostock
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
    MOV R2,MenuBebidadas ; coloca em R2 o endereço de memoria do display
    CALL MostraDisplay   ; chamada a funcao para que o display seja mostrado
    CALL LimpaPerif      ; chamada a funcao limpa perifericos
    MOV R0,Nr_Menu       ; coloca em R0 o valor escolhido pelo utilizador 
    MOV R3,48            ; coloca em R3 o valor 48
    MOV R4,1             ; coloca em R4 o valor 1
    MOV R5, ReduzStock   ; guarda a posicao de ReduzStock em R5
OBebidasCiclo:
    MOVB R1,[R0]         ; Move um byte de R0 para R1 
    CMP R1,0             ; faz a comparacao de r1 com 0
    JEQ OBebidasCiclo    ; caso seja igual volta ao inicio do ciclo
    ADD R3,R4            ; Adiciona incrementa R3 em 1
    MOVB [R5],R3         ; Guarda o valor caso seja selecionado cocacola para depois diminuir o stock
    CMP R1,COCA          ; compara o valor de R1 com o valor guardado na variavel COCA
    JEQ Omoedas          ; caso seja igual salta para o display das moedas
    ADD R3,R4            ; Adiciona incrementa R3 em 1
    MOVB [R5],R3         ; Guarda o valor caso seja selecionado Brisa para depois diminuir o stock
    CMP R1,Brisa         ; compara o valor de R1 com o valor guardado na variavel Brisa
    JEQ Omoedas          ; caso seja igual salta para o display das moedas
    ADD R3,R4            ; Adiciona incrementa R3 em 1
    MOVB [R5],R3         ; Guarda o valor caso seja selecionado Fanta para depois diminuir o stock
    CMP R1,Fanta         ; compara o valor de R1 com o valor guardado na variavel Fanta
    JEQ Omoedas          ; caso seja igual salta para o display das moedas
    ADD R3,R4            ; Adiciona incrementa R3 em 1
    MOVB [R5],R3         ; Guarda o valor caso seja selecionado Agua para depois diminuir o stock
    CMP R1,Agua          ; compara o valor de R1 com o valor guardado na variavel Agua
    JEQ Omoedas          ; caso seja igual salta para o display das moedas
    CMP R1,7             ; compara o valor do R1  com o valor 7 que nos diz para retornar para o display inicial
    JEQ ligado           
    CALL RotinaErro      ; caso nao seja nenhuma das opçoes salta para a rotina de ERRO 
    JMP OBebidas         ; Salta para o inicio da rotina
;--------------------
;Menu Snacks
;--------------------  
;ciclo de opcao snacks equivalente ao das bebidas
OSnacks:
    MOV R2,MenuSnacks
    CALL MostraDisplay
    CALL LimpaPerif
    MOV R0,Nr_Menu
    MOV R3,53            ; guarda no R3 o valor 53 que equivale a 5 em ASCII
    MOV R4,1
    MOV R5, ReduzStock
OSnacksCiclo:            ; Elaborado da mesma maneira que a rotina OBebidasCiclo
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
    CALL CicloEscolhaProduto    ; chamada para a rotina CicloProdutoEscolhido
    MOV R2,MoedasCompra         ; guarda em R2 o endereço de MoedasCompra
    CALL MostraDisplay          ; chamada para mostrar display 
    CALL LimpaPerif             ; chamada para a funçao limpa periféricos
    MOV R0,Nr_Menu              ; guarda o valor inserido pelo utilizador em R0
    MOV R3,48                   ; guarda 48 em r3
    MOV R4,1                    ; guarda 1 em r4
    MOV R5,AumentaMoedas        ; guarda a posicao para guardar a moeda para incrementar no stock
OmoedasCiclo:
    MOVB R1,[R0]                ; move para R1 o byte de R0 
    CMP R1,0                    ; compara o que esta guardado em R1 com 0
    JEQ OmoedasCiclo            ; caso seja igual volta ao OmoedasCiclo
    ADD R3,R4                   ; Adiciona incrementa R3 em 1
    MOVB [R5],R3                ; Guarda o valor caso seja selecionado cocacola para depois aumentar o stock da moeda escolhida
    CMP R1,CincoEur             ; compara R1 com o valor guardado na Variável CincoEur 
    JEQ jumpAbsTalao            ; caso seja igual salta para um jump absolutotalao que depois salta para a rotina do talao
    ADD R3,R4                   ; Adiciona incrementa R3 em 1
    MOVB [R5],R3                ; Guarda o valor caso seja selecionado cocacola para depois aumentar o stock da moeda escolhida 
    CMP R1,DoisEur              ; compara R1 com o valor guardado na Variável DoisEur 
    JEQ jumpAbsTalao            ; caso seja igual salta para um jump absolutotalao que depois salta para a rotina do talao
    ADD R3,R4                   ; Adiciona incrementa R3 em 1
    MOVB [R5],R3                ; Guarda o valor caso seja selecionado cocacola para depois aumentar o stock da moeda escolhida 
    CMP R1,UmEur                ; compara R1 com o valor guardado na Variável UmEur
    JEQ jumpAbsTalao            ; caso seja igual salta para um jump absolutotalao que depois salta para a rotina do talao
    ADD R3,R4                   ; Adiciona incrementa R3 em 1
    MOVB [R5],R3                ; Guarda o valor caso seja selecionado cocacola para depois aumentar o stock da moeda escolhida 
    CMP R1,cinqCents            ; compara R1 com o valor guardado na Variável cinqCents
    JEQ jumpAbsTalao            ; caso seja igual salta para um jump absolutotalao que depois salta para a rotina do talao
    ADD R3,R4                   ; Adiciona incrementa R3 em 1
    MOVB [R5],R3                ; Guarda o valor caso seja selecionado cocacola para depois aumentar o stock da moeda escolhida 
    CMP R1,vinteCents           ; compara R1 com o valor guardado na Variável vinteCents
    JEQ jumpAbsTalao            ; caso seja igual salta para um jump absolutotalao que depois salta para a rotina do talao
    ADD R3,R4                   ; Adiciona incrementa R3 em 1
    MOVB [R5],R3                ; Guarda o valor caso seja selecionado cocacola para depois aumentar o stock da moeda escolhida
    CMP R1,dezCents             ; compara R1 com o valor guardado na Variável dezCents
    JEQ jumpAbsTalao            ; caso seja igual salta para um jump absolutotalao que depois salta para a rotina do talao
    CALL RotinaErro             ; chamada para a rotina de Erro
    JMP Omoedas                 ; salta para o inicio
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
    MOV R7,R6               ;Copia r6 para r7
GuardarProd:
    MOV R6,[R2]             ;guarda o valor na posicao de r2 em r6
    MOV [R7],R6             ;guarda esse mesmo valor na posicao r7
    CMP R2,R4               ;comprara r2 com r4
    JEQ ProdutoGuardado     ;caso sejam iguais saltam para o fim da rotina
AdicionaProd:
    ADD R2,2                ;incrementa a posicao de r2
    ADD R7,2                ;incrementa a posicao de r7
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
    MOV R5,16               ;guarda em r5 o valor de 16, para poder saltar uma posicao na vertical dependendo do valor do r1
    MUL R1,R5               ;multiplica o r1 com r5 para saber qual posicao ira estar a moeda na horizontal
    MOV R2,MInicio          ;guarda a posicao inicial da moeda generica
    MOV R4,MFIM             ;guarda a posicao final da moeda generica
    ADD R2,R1               ;guarda a nova posicao inicial da moeda
    ADD R4,R1               ;guarda a nova posicao final
    MOV R6,MEscolhido       ;guarda a posicao da moeda escolhida
    MOV R7,R6               ;copia r6 em r7
GuardaMoeda:
    MOV R6,[R2]             ;guarda o valor da posicao R2
    MOV [R7],R6             ;guarda o valor na nova posicao
    CMP R2,R4               ;compara se ja chegou a posicao final
    JEQ MoedaGuardada       ;caso seja a ultima posicao salta para o fim da rotina
AdicionaMoeda:  
    ADD R2,2                ;incrementa a posicao de r2
    ADD R7,2                ;incrementa a posicao de r7
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
;----------------------
;Menu DiminuiStockProd
;----------------------
CicloDiminuiStockProd:
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
    CMP R6,0                ;Compara se o valor fica a 0
    JEQ jumpSemStock        ;Como ficou sem stock mostra mensagem de erro
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
;Jump absoluto
;--------------------
 jumpLigado1:  ;visto que a instruçao JEQ tem um limite de 255 instruçoes foi criada uma etiqueta com um JMP
    JMP jumpLigado
;--------------------
;Menu MoedasTroco
;--------------------
CicloMoedasTrocos:
    MOV R0, Troco1          ;guarda a posicao das dezenas dos euros do troco
    MOV R1, Troco2          ;guarda a posicao das unidades dos euros do troco
    MOVB R0,[R0]            ;guarda o valor da posicao das dezenas
    MOVB R1,[R1]            ;guarda o valor da posicao das unidades
    MOV R2,48               ;guarda o valor 48 em r2
    MOV R3,10               ;guarda o valor 10 em r3
    SUB R0,R2               ;converte o valor em decimal
    SUB R1,R2               ;converte o valor em decimal
    MUL R0,R3               ;transforma o para dezenas
    ADD R0,R1               ;junta os dois valores do troco
;Guarda a Qauntidade de vezes que a maquina devolve 5 euros de Troco
    MOV R1,R0               ;copia r0 para r1
    MOV R4,50               ;guarda o valor 50 em r4
    MOD R0,R4               ;calcula o resto da divisao por 50
    DIV R1,R4               ;calcula o resultado da divisao por 50
    ADD R1,R2               ;converte o valor para ASCII
    MOV R5,MCinco           ;recebe a posicao para guardar o valor das notas de cinco de troco
    MOVB [R5],R1            ;guarda esse mesmo valor 
;Guarda a Qauntidade de vezes que a maquina devolve 2 euros de Troco
    MOV R1,R0               ;
    MOV R4,20               ;
    MOD R0,R4               ;--------------------
    DIV R1,R4               ;repete para 2 euros
    ADD R1,R2               ;--------------------
    MOV R5,MDois            ;
    MOVB [R5],R1            ;
;Guarda a Qauntidade de vezes que a maquina devolve 1 euros de Troco
    MOV R1,R0               ;
    MOV R4,10               ;
    MOD R0,R4               ;--------------------
    DIV R1,R4               ;repete para 1 euro
    ADD R1,R2               ;--------------------
    MOV R5,MUm              ;
    MOVB [R5],R1            ;
;Guarda a Qauntidade de vezes que a maquina devolve 50 centimos de Troco
    MOV R1,R0               ;
    MOV R4,5                ;
    MOD R0,R4               ;------------------------
    DIV R1,R4               ;repete para 50 centimos
    ADD R1,R2               ;------------------------
    MOV R5,MCinquenta       ;
    MOVB [R5],R1            ;
;Guarda a Qauntidade de vezes que a maquina devolve 20 centimos de Troco
    MOV R1,R0               ;
    MOV R4,2                ;
    MOD R0,R4               ;------------------------
    DIV R1,R4               ;repete para 20 centimos
    ADD R1,R2               ;------------------------
    MOV R5,MVinte           ;
    MOVB [R5],R1            ;
;Guarda a Qauntidade de vezes que a maquina devolve 10 Centimos de Troco
    MOV R1,R0               ;
    MOV R4,1                ;
    MOD R0,R4               ;------------------------
    DIV R1,R4               ;repete para 10 centimos
    ADD R1,R2               ;------------------------
    MOV R5,MDez             ;
    MOVB [R5],R1            ;
    RET                     
;--------------------
;Jump absolutoSemStock
;--------------------
 jumpSemStock:  ;visto que a instruçao JEQ tem um limite de 255 instruçoes foi criada uma etiqueta com um JMP
    JMP SemStock
;------------------------
;Menu DiminuiStockMoedas
;------------------------
CicloDiminuiStockMoedas:
    MOV R0,48               ;guarda 48 em r0
    MOV R1,10               ;guarda 10 em r1
;Diminui Stock 5 Euros
    MOV R2,MCinco           ;recebe a posicao onde foi guardado a quantidade de 5 euros como troco
    MOVB R2,[R2]            ;recebe a quantidade em r2
    SUB R2,R0               ;converte para decimal
    MOV R3,SCinco1          ;recebe a posicao das dezenas do stock das notas de 5 euros
    MOVB R5,[R3]            ;recebe o valor das dezenas
    MOV R4,SCinco2          ;recebe a posicao das unidades do stock das notas de 5 euros
    MOVB R6,[R4]            ;recebe o valor das unidades
    SUB R5,R0               ;converte para decimal
    SUB R6,R0               ;converte para decimal
    MUL R5,R1               ;tranforma o valor em dezenas
    ADD R5,R6               ;soma os dois digitos
    CMP R5,0                ;verifica se existe stock de moedas de 5 euros
    JEQ jumpSemTroco        ;caso nao exista salta para a rotina que apresenta dno display um aviso de nao ter stock
    SUB R5,R2               ;remove a quantidade de notas de 5 euros que foram dadas como troco
    MOV R6,R5               ;copia r5 para r6
    MOD R6,R1               ;calcula o quociente da divisao por 10
    DIV R5,R1               ;calcula o resultado da divisao por 10
    ADD R5,R0               ;converte para ASCII
    ADD R6,R0               ;convete para ASCII
    MOVB [R3],R5            ;guarda o novo valor das dezenas
    MOVB [R4],R6            ;guarda o novo valor das unidades
;Diminui Stock 2 Euros
    MOV R2,MDois
    MOVB R2,[R2]
    SUB R2,R0
    MOV R3,SDois1
    MOVB R5,[R3]
    MOV R4,SDois2
    MOVB R6,[R4]
    SUB R5,R0               ;-----------------------------------
    SUB R6,R0               ;repete para as moedas de dois euros
    MUL R5,R1               ;-----------------------------------
    ADD R5,R6
    CMP R5,0
    JEQ jumpSemTroco
    SUB R5,R2
    MOV R6,R5
    MOD R6,R1
    DIV R5,R1
    ADD R5,R0
    ADD R6,R0
    MOVB [R3],R5
    MOVB [R4],R6
;Diminui Stock 1 Euro
    MOV R2,MUm
    MOVB R2,[R2]
    SUB R2,R0
    MOV R3,SUm1             
    MOVB R5,[R3]
    MOV R4,SUm2
    MOVB R6,[R4]
    SUB R5,R0               ;-----------------------------------
    SUB R6,R0               ;repete para as moedas de um euro
    MUL R5,R1               ;-----------------------------------
    ADD R5,R6
    CMP R5,0
    JEQ jumpSemTroco
    SUB R5,R2
    MOV R6,R5
    MOD R6,R1
    DIV R5,R1
    ADD R5,R0
    ADD R6,R0
    MOVB [R3],R5
    MOVB [R4],R6
    JMP cont
;Diminui Stock 50 Centimos
    MOV R2,MCinquenta
    MOVB R2,[R2]
    SUB R2,R0
    MOV R3,SCinquenta1
    MOVB R5,[R3]
    MOV R4,SCinquenta2
    MOVB R6,[R4]
    SUB R5,R0                           
    SUB R6,R0
    MUL R5,R1                   ;--------------------------------------------
    ADD R5,R6                   ;repete para as moedas de cinquenta centimos
    CMP R5,0                    ;--------------------------------------------
    JEQ jumpSemTroco
    SUB R5,R2
    MOV R6,R5
    MOD R6,R1
    DIV R5,R1
    ADD R5,R0
    ADD R6,R0
    MOVB [R3],R5
    MOVB [R4],R6
;Diminui Stock 20 Centimos
    MOV R2,MVinte
    MOVB R2,[R2]
    SUB R2,R0
    MOV R3,SVinte1
    MOVB R5,[R3]
    MOV R4,SVinte2
    MOVB R6,[R4]                ;--------------------------------------------
    SUB R5,R0                   ;repete para as moedas de vinte centimos
    SUB R6,R0                   ;--------------------------------------------
    MUL R5,R1
    ADD R5,R6
    CMP R5,0
    JEQ jumpSemTroco
    SUB R5,R2
    MOV R6,R5
    MOD R6,R1
    DIV R5,R1
    ADD R5,R0
    ADD R6,R0
    MOVB [R3],R5
    MOVB [R4],R6
;-----------------------------------------------------------------------------------------------------------
;Jump absoluto Sem Troco
;--------------------
jumpSemTroco:  ;visto que a instruçao JEQ tem um limite de 255 instruçoes foi criada uma etiqueta com um JMP
    JMP SemTroco
;-----------------------------------------------------------------------------------------------------------
cont:                         ;foi feito uma rotina para salta a ultimas 3 linhas devido ao limite de instrucoes
;Diminui Stock 10 Centimos
    MOV R2,MDez
    MOVB R2,[R2]
    SUB R2,R0
    MOV R3,SDez1
    MOVB R5,[R3]
    MOV R4,SDez2
    MOVB R6,[R4]
    SUB R5,R0               ;--------------------------------------------
    SUB R6,R0               ;repete para as moedas de cinquanta centimos
    MUL R5,R1               ;--------------------------------------------
    ADD R5,R6
    CMP R5,0
    JEQ SemTroco
    SUB R5,R2
    MOV R6,R5
    MOD R6,R1
    DIV R5,R1
    ADD R5,R0
    ADD R6,R0
    MOVB [R3],R5
    MOVB [R4],R6
    RET
;---------------------------- 
;Menu Aumenta Moeda Inserida
;----------------------------
CicloAumentaMoedas:
    MOV R0,AumentaMoedas        ;guarda a posicao em que guarda qual foi a moeda inserida pelo utilizador
    MOVB R0,[R0]                ;guarda o valor
    MOV R3,48                   ;guarda 48 em r3
    SUB R0,R3                   ;converte o valor de r0 em decimal
    CMP R0,1                    ;compara se é 1
    JEQ A5euros                 ;caso seja vai para o caso de ser inserida uma moeda de 5 euros
    CMP R0,2                    ;compara se é 2
    JEQ A2euros                 ;caso seja vai para o caso de ser inserida uma moeda de 2 euros
    CMP R0,3                    ;compara se é 3
    JEQ A1euros                 ;caso seja vai para o caso de ser inserida uma moeda de 1 euro
    CMP R0,4                    ;compara se é 4
    JEQ A50Cent                 ;caso seja vai para o caso de ser inserida uma moeda de 50 centimos
    CMP R0,5                    ;compara se é 5
    JEQ A20Cent                 ;caso seja vai para o caso de ser inserida uma moeda de 20 centimos
    CMP R0,6                    ;compara se é 6
    JEQ A10Cent                 ;caso seja vai para o caso de ser inserida uma moeda de 10 centimos
A5euros:                        ;caso seja inserido 5 euros
    MOV R1,SCinco1              ;guarda a posicao do stock das dezenas
    MOV R2,SCinco2              ;guarda a posicao do stock das unidades
    JMP aumenta                 ;salta para o aumentar
A2euros:                        ;Caso seja inserido 2 euros 
    MOV R1,SDois1               ;-------------------------------
    MOV R2,SDois2               ;repete para as moedas de 2 euros
    JMP aumenta                 ;--------------------------------
A1euros:                        ;Caso seja inserido 1 euro
    MOV R1,SUm1                 ;--------------------------------
    MOV R2,SUm2                 ;repete para as moedas de 1 euro
    JMP aumenta                 ;--------------------------------
A50Cent:                        ;Caso seja inserido 50 centimos
    MOV R1,SCinquenta1          ;------------------------------------
    MOV R2,SCinquenta2          ;repete para as moedas de 50 centimos
    JMP aumenta                 ;------------------------------------
A20Cent:                        ;Caso seja inserido 20 centimos
    MOV R1,SVinte1              ;------------------------------------
    MOV R2,SVinte2              ;repete para as moedas de 20 centimos
    JMP aumenta                 ;------------------------------------
A10Cent:                        ;Caso seja inserido 10 centimos
    MOV R1,SDez1                ;------------------------------------
    MOV R2,SDez2                ;repete para as moedas de 10 centimos
    JMP aumenta                 ;------------------------------------
aumenta:                        ;
    MOV R4,10                   ;guarda o valor 10 em r4
    MOV R5,1                    ;guarda o valor 1 em r5
    MOVB R6,[R1]                ;recebe o valor das dezenas do stock
    MOVB R7,[R2]                ;recebe o valor das unidades do stock
    SUB R6,R3                   ;cenverte para decimal
    SUB R7,R3                   ;converte para decimal
    MUL R6,R4                   ;mete o valor em dezenas
    ADD R6,R7                   ;soma os dois digitos
    ADD R6,R5                   ;aumenta o valor do stock em 1
    MOV R7,R6                   ;copia o r6 para r7
    MOD R7,R4                   ;guarda o resto da divisao por 10 em r7
    DIV R6,R4                   ;guarda o valor da divisao por 10 em r6
    ADD R6,R3                   ;converte para ASCII
    ADD R7,R3                   ;converte para ASCII
    MOVB [R1],R6                ;guarda o novo valor das dezenas do stock da moeda
    MOVB [R2],R7                ;guarda o novo valor das unidades do stock da moeda
    RET   
;-------------------- 
;Menu TALAO
;-------------------- 
OTalao:
    CALL CicloEscolhaMoedas             ;chama o ciclo com as escolhas de moedas
    CALL CicloTroco                     ;chama o ciclo para calcular o troco
    CALL CicloDiminuiStockProd          ;chama o ciclo para diminuir o stock
    CALL CicloMoedasTrocos              ;chama o ciclo para calcular quantas vezes cada moeda foi utilizada para troco
    CALL CicloAumentaMoedas             ;ciclo que aumenta no stock a moeda inserida pelo utilizador
    CALL CicloDiminuiStockMoedas        ;ciclo que diminui a moedas do stock utilizadas no troco
    MOV R2,Talao                        ;guarda em r2 o display para o talao
    CALL MostraDisplay                  ;mostra o display
    CALL LimpaPerif                     ;limpa os perifericos
    MOV R0,Nr_Menu                      ;guarda a posicao do periferico de entrada
    JMP FimTalao                        ;salta para o fim do talao
SemTroco:
    MOV R2,ErroTroco                    ;Guarda em r2 o display caso nao exista troco no stock
    CALL MostraDisplay                  ;mostra o display
    CALL LimpaPerif                     ;limpa os perifeicos
    MOV R0,Nr_Menu                      ;guarda a posicao do periferico de entrada
    JMP FimTalao                        ;salta para o fim do talao
SemStock:
    MOV R2,ErroStock                    ;Guarda em r2 o display caso nao exista produto no stock
    CALL MostraDisplay                  ;mostra o display
    CALL LimpaPerif                     ;limpa os perifeicos
    MOV R0,Nr_Menu                      ;guarda a posicao do periferico de entrada
    JMP FimTalao                        ;salta para o fim do talao
FimTalao:
    MOVB R1,[R0]                        ;guarda o valor que o utilizador introduziod
    CMP R1,0                            ;caso seja 0 volta ao fim do talao para voltar a ler o valor 
    JEQ FimTalao                        ;salta para o fim do talao
    CMP R1,7                            ;caso seja 7 o valor introduzido pelo utilizador
    JEQ jumpLigado2                     ;salta para o menu principal
    CALL RotinaErro                     ;caso seja outro valor apresenta sinal de erro 
    JMP jumpLigado2                     ;salta para a rotina ligado
;--------------------
;Jump absoluto
;--------------------
 jumpLigado2:  ;visto que a instruçao JEQ tem um limite de 255 instruçoes foi criada uma etiqueta com um JMP
    JMP jumpLigado1
;--------------------
;Escreve passe Display
;-------------------- 
EscreveDisp:
    MOV R2,PasseInserida     ; Guarda em R2 o enderço da passeInserida
    MOV R4,InicioPasseIn     ; Guarda em R4 o endereco do inicia da passe predefinida
EscreveDispPasse:
    MOVB R3,[R4]             ; move para R3 um byte de R4
    CMP R3,0                 ; compara R3 com 0
    JEQ CicloOK              ; caso seja igual salta para o CicloOK
    MOV R3,2AH               ; coloca em R3 o carater * para efeitos de escrita da passe no display
    MOVB [R2],R3             ; move de R3 o * em coloca na primeria posiçao de R2
    ADD R2,1                 ; adiciona um a R2
    ADD R4,1                 ; adiciona um a R4
    JMP EscreveDispPasse     ; salta para o inicio
CicloOK:                     
    MOV R0,OK                ; guarda em R0 o valor de OK
    MOVB R1,[R0]             ; move para R1 um byte de R0 
    CMP R1,0                 ; compara R1 com 0 
    JEQ CicloOK              ; em caso de igualdade salta para o inicio do ciclo 
    MOV R5,Nr_Menu           ; guarda em R5 o endereço de memoria de NR_menu   
    MOVB R6,[R5]             ; move um byte de R5 para R6 que será a escolha do utilizador 
    CMP R6,0                 ; compara o valor em R6 com 0 
    JEQ EscreveDispPasse     ; caso seja igual salta para o EscreveDispPasse
    CALL VerificaPasse       ; chamada para a rotina VerificaPasse
    JMP EscreveDispPasse     ; salta para a rotina EscreveDispPasse
    CALL RotinaErro          ; em caso de erro executa a chamada para a RotinaErro
    RET                      ; return
;--------------------   
;Varifica Passe
;-------------------- 
VerificaPasse:
    MOV R0,InicioPasseIn  ; coloca em R0 o endereco de memoria do inicio da Passe
    MOV R1,FinalPasseIn   ; coloca em R1 o endereco de memoria do fim da Passe
    MOV R2,Passe          ; coloca em R2 o endereco de memoria da Passe predefinida
    MOV R4,8    ;Registo auxiliar com o tamanho da Palavra Passe
CompararPasse:
    MOV R5,[R0]    ; coloca em R5 o valor presento no endereco guardado em R0
    MOV R6,[R2]    ; coloca em R6 o valor presento no endereco guardado em R2
    CMP R6,R5      ; compara os Dois registos
    JEQ PasseIgual ; caso seja igual salta para a rotina passIgual
CicloPasseErrada:   
    Call LimpaPerif ; chamada para a limpeza dos perifericos 
    MOV R2,PasseErrada  ; guarda em R2 o endereco do diplay 
    CALL MostraDisplay  ; chamda para mostrar o display
    MOV R0,Nr_Menu  ; guarda em R0 o endereco de NR_MENU
    MOVB R1,[R0]    ; passa para R1 o byte presente em R0
    CMP R1,0        ; compara com 0 
    JEQ CicloPasseErrada    ; caso seja igual salta para CicloPasseErrada
    CMP R1,7        ; compara R1 com 7  
    JEQ jumpLigado2   ; caso seja igual volta para o menu stock
    JMP CicloFinal          ; salta para os Pops
PasseIgual:
    ADD R0,2        ; adiciona a R0 ,2 
    ADD R2,2        ; adiciona a R2 ,2
    CMP R0,R1       ; compara R0 com R2
    JLE CompararPasse   ; se for menor ou igual salta para o ciclo compararPasse
    JMP OMostraStock1   ; salta para a rotina MostrarStock1
CicloFinal:
; os pops servem para colocar os respetivos registos no topo da pilha
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
    MOV R2,MenuErro     ; coloca em R2 o enderco onde esta o MenuErro
    CALL MostraDisplay  ; faz a chamada para mostrar o display
    CALL LimpaPerif     ; chamada para a limpeza dos perifeircos
    MOV R0,Nr_Menu      ; guarda em R0 o endereco de NR_MENU
ERRO:
    MOVB R1,[R0]        ; passa para R1 o byte presente em R0
    CMP R1,7            ; compara o valor de R1 com 7 
    JNE ERRO            ; caso nao seja igual salta para o ERRO
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
    MOV R0, Display      ; coloca em R0 o endereco de inicio do display
    MOV R1, DISPLAY_END  ; coloca em R1 o endereco de fim de display
CicloMostrar:
    MOV R3,[R2]          ; passa para R3 o conteudo presente em R2
    MOV [R0],R3          ; passa para conteudo de R0 o que esta em R3
    ADD R2,2             ; adiciona 2 a R2
    ADD R0,2             ; adiciona 2 a R0
    CMP R0,R1            ; verifica se esta no fim do display
    JLE CicloMostrar     ; caso seja menor ou igual salta para o ciclo mostrar
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
    MOV R0,ON_OFF      ; guarda em R0 o valor do endereco de ON_OFF
    MOV R1,Nr_Menu     ; guarda em R1 o valor do endereco de Nr_Menu
    MOV R2,OK          ; guarda em R2 o valor do endereco de OK
    MOV R3,0           ; guarda em R3 o valor 0
    MOVB [R0],R3       ; passa a 0 o que esta em R0 
    MOVB [R1],R3       ; passa a 0 o que esta em R1
    MOVB [R2],R3       ; passa a 0 o que esta em R2
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
    MOV R0,Display      ; move para R0 o endereco de Diplay
    MOV R1,DISPLAY_END  ; move para R1 o endereco de Display_end
CicloLimpar:         ; Ciclo para a limpeza caracter a caracter  
    MOV R2,CaracterVazio    ; coloca em R2 o valor guardado em CaracterVazio
    MOVB [R0],R2     ; Move para R2 o byte de R0 
    ADD R0,1         ; adiciona a R0, 1
    CMP R0,R1        ; compara r0 com r1 
    JLE CicloLimpar  ; salta em caso de ser menor ou igual 
    POP R3
    POP R1
    POP R0
    RET
