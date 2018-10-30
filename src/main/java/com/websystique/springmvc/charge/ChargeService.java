package com.websystique.springmvc.charge;

import com.websystique.springmvc.block.Block;
import com.websystique.springmvc.block.BlockService;
import com.websystique.springmvc.dto.ChargeDTO;
import com.websystique.springmvc.dto.Response;
import com.websystique.springmvc.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author mina khoshnevisan
 * 12/10/2018
 */

@Service("chargeService")
public class ChargeService {

    @Autowired
    private ChargeDao chargeDao;
    @Autowired
    private BlockService blockService;

    public Response addCharge(ChargeDTO chargeDTO) {

        Charge charge=changeDtoEntity(chargeDTO);
        chargeDao.save(charge);
        charge.setTrackingNumber("s" + charge.getId());
        chargeDao.update(charge);
        Response response = new Response();
        response.setId(charge.getId());
        response.setTrackingNumber(charge.getTrackingNumber());
        return response;
    }

    private Charge changeDtoEntity(ChargeDTO chargeDTO) {

        Charge charge = new Charge();
        charge.setDepositTime(DateUtils.jalaliToGregorian(chargeDTO.getDate()));
        charge.setAmount(Double.valueOf(chargeDTO.getAmount()));
        charge.setDescription(chargeDTO.getDescription());
        charge.setBlock(blockService.findById(Long.valueOf(chargeDTO.getBlockNumber())));
        charge.setId((long) 0);
        return charge;
    }
}
