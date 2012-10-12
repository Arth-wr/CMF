package cmf



import java.text.SimpleDateFormat
import java.util.Date;

import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Peca)
class PecaTests {
	
	//SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
	
	//Date data = new Date()
	

    void testSave() {
		
		Peca p = new Peca()
		p.nome = 'PecaTeste'
		p.referencia = 'ReferenciaTeste'
		p.referencia2 = 'Referencia2Teste'
		p.marca = 'MarcaTeste'
		p.valorCompra = 5.00
		p.localizacao = 'A2'
		p.quantidadeMinima = 2
		p.quantidade = 0
		
		p.save()
		Peca pTeste = Peca.get(p.id)
		
		assertEquals(pTeste.nome, 'PecaTeste')
		assertEquals(pTeste.referencia, 'ReferenciaTeste')
		assertEquals(pTeste.referencia2, 'Referencia2Teste')
		assertEquals(pTeste.marca, 'MarcaTeste')
		assertEquals(pTeste.valorCompra, 5.00)
		assertEquals(pTeste.localizacao, 'A2')
		assertEquals(pTeste.quantidadeMinima, 2)
		assertEquals(pTeste.quantidade, 0)
       //fail "Implement me"
    }
}
