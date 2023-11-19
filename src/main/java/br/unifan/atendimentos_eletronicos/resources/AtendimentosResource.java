package br.unifan.atendimentos_eletronicos.resources;

import br.unifan.atendimentos_eletronicos.controller.AtendimentosBC;
import br.unifan.atendimentos_eletronicos.security.Autorizar;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.QueryParam;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;


@Path("/")
public class AtendimentosResource {
    private final AtendimentosBC bc = new AtendimentosBC();
    
    @Autorizar
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Atendimentos> obterAtendimentos() {
        return bc.obterAtendimentos();
    }
}
