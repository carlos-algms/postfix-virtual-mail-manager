package com.pvmm.emails;

import com.pvmm.emails.email.Email;
import com.pvmm.emails.email.EmailRepository;
import com.pvmm.utils.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;


@Controller
public class BuscarController {

    @Autowired
    private EmailRepository emailRepository;

    @Autowired
    private HttpServletRequest request;

    private ModelAndView modelAndView;


    @RequestMapping("/emails/buscar")
    public ModelAndView buscarEmails(
                                        @RequestParam(name = "email", defaultValue = "")
                                        String email,
                                        @RequestParam(name = "limit", defaultValue = "25")
                                        String limit,
                                        @RequestParam(name = "page", defaultValue = "1")
                                        String page
                                    ) {

        modelAndView = new ModelAndView("emails/buscar");

        Page<Email> emails = this.searchOnDb(email, limit, page);
        this.preparePaginator(emails);

        return this.renderView();
    }


    private Page<Email> searchOnDb(String email, String limitParam, String pageParam) {

        int limit = Integer.parseInt(limitParam);
        int pageNum = Integer.parseInt(pageParam) - 1;

        Page<Email> emails = emailRepository.findByDomainIdAndEmailContainingOrderByEmail(
            (long)6,//TODO utilizar o dominio do usuário logado
            email,
            new PageRequest(pageNum, limit, Sort.Direction.ASC, "id")
        );

        modelAndView.addObject("emails",  emails);

        return emails;
    }


    private void preparePaginator( Page<Email> emails ) {
        Paginator<Email> paginator = new Paginator<>(emails, request);

        modelAndView.addObject("paginator", paginator);
    }


    private ModelAndView renderView() {
        modelAndView.addObject("title", "Buscar e-mails");

        return modelAndView;
    }
}
