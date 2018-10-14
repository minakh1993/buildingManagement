package com.websystique.springmvc.block;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author mina khoshnevisan
 * 12/10/2018
 */

@Controller
@RequestMapping("/Block")
public class BlockController {

    @Autowired
    private BlockService blockService;

    @RequestMapping("/")
    public String loadPage(){
        return "Block";
    }
}
