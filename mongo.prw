#include "TOTVS.CH"

//U_nodeHttp()
user function nodeHttp()
	local data, htmlReturn                   //Variais que guardan os dados e o response
	local server := 'http://localhost:3000'  //Endereço do Sever node.js (pode ser IP tbm)

	conout('', 'iniciado Integracao NodeJS + MongoDB', '')
		                                                                                          
	// Inclusão via HttpGet   
	data := "Cliente=Flavio&Produto=Lapis%20Vermelho&Valor=12.99&Metodo=via%20HttpGet"
	htmlReturn := HttpGet(server, data)
	conout("Via HttpGet - No AppServer")
	conout("Dados: " + data)
	conout("ID...: " + htmlReturn, '')

	// Exmplo usando Inclusão via HttpPost (identeico ao HttpGet)
	data := "Cliente=Flavio&Produto=Lapis%20Vermelho&Valor=12.99&Metodo=via%20HttpGet"
	htmlReturn := HttpPost(server, data)
	conout("Via HttpPost - No AppServer")
	conout("Dados: " + data)
	conout("ID...: " + htmlReturn, '')  
return 
      
// Exibe a pagina HTML que vai enviar os dados ao NodeJS
// e receber o ID do registro via WebSocket
// U_nodeWebengine()
user function nodeWebengine()
  oDlg = MsDialog():New( 000, 000, 150, 650, "AdvPL x NodJS x MongoDB",,,.F.,, 0, 16777215,,,.T.,, ,.F. )
 
	// WebSocket responsavel pela comunicacao entre o AdvPL e o HTML
	oWebChannel := TWebChannel():New()
	oWebChannel:connect()
	conout("WebChannel disponivel na porta: " + cValToChar(oWebChannel:nPort))
	oWebChannel:bJsToAdvpl := {|self,codeType,codeContent| conout("", "TWebEngine", codeType, codeContent) } 

	// Browser (Chromium)
	oWeb := oWebEngine := TWebEngine():New(oDlg,0,0,0,0)
	oWeb:navigate("file:///C:/ADVPL/ADVPL-Node/index.html?port=" + cValToChar(oWebChannel:nPort))
	oWeb:Align := 5                                    
	
  oDlg:Activate( oDlg:bLClicked, oDlg:bMoved, oDlg:bPainted,.T.,,,, oDlg:bRClicked, )
Return 
