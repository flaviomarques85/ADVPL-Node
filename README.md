# ADVPL-Node
Projeto de integração do ADVPL com o Nodejs
<br>
usando o metodo HttpGet() ou HttpPost() do apvpl é possivel enviar informações para uma aplicação Node,<br>
deixar com que ela faça a percistencia da informação e retorno com um response padrao. <br><br>

'
// Inclusão via HttpGet   
	data := "sua string de dados"
	htmlReturn := HttpGet(server, data)
	conout("Via HttpGet - No AppServer")
	conout("Dados: " + data)
	conout("ID...: " + htmlReturn, '')
'
