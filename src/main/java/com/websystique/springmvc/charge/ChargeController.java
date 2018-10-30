package com.websystique.springmvc.charge;

import com.websystique.springmvc.block.BlockService;
import com.websystique.springmvc.dto.ChargeDTO;
import com.websystique.springmvc.dto.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

/**
 * @author mina khoshnevisan
 * 12/10/2018
 */

@Controller
@RequestMapping("/Charge")
public class ChargeController {

    @Autowired
    private BlockService blockService;
    @Autowired
    private ChargeService chargeService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String loadPage(ModelAndView model) {

        Map<Long, String> BlockNumberMap = blockService.createBlockMap();
        model.addObject("blockNumberMap", BlockNumberMap);
        return "charge";
    }

    @RequestMapping(value = "/addCharge", method = RequestMethod.POST)
    @ResponseBody
    public Response addCharge(@RequestBody ChargeDTO chargeDTO) {


        Response response = chargeService.addCharge(chargeDTO);
        return response;

        //save DTO and return tracking number
    }
}
