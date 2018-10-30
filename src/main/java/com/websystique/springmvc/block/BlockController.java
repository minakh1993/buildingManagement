package com.websystique.springmvc.block;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

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
    public String loadPage() {
        return "Block";
    }

    @RequestMapping(value = "/getAllBlocks", method = RequestMethod.GET)
    @ResponseBody
    public List<Block> getAllBlocks() {

        List<Block> allBlocks = blockService.findAllBlocks();
        return allBlocks;
    }
}
