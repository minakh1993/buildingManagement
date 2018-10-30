package com.websystique.springmvc.block;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author mina khoshnevisan
 * 12/10/2018
 */

@Service("blockService")
@Transactional
public class BlockService{

    @Autowired
    private BlockDao blockDao;

    public Block findById(Long id) {
        Block block = blockDao.getByKey(id);
        return block;
    }

    public void saveBlock(Block employee) {

    }

    public void updateBlock(Block employee) {

    }

    public void deleteBlockById(Long id) {

    }

    public List<Block> findAllBlocks() {

        return blockDao.findAllBlocks();
    }

    public Map<Long,String> createBlockMap() {

        Map<Long, String> map = new HashMap<Long, String>();

        //get All blocks data
        List<Block> allBlocks = findAllBlocks();
        if (allBlocks == null) {
            return map;
        }
        for (Block block : allBlocks) {
            map.put(block.getId(), block.getFamilyName());
        }
        return map;
    }
}
