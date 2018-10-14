package com.websystique.springmvc.block;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
        return null;
    }

    public void saveBlock(Block employee) {

    }

    public void updateBlock(Block employee) {

    }

    public void deleteBlockById(Long id) {

    }

    public List<Block> findAllBlocks() {
        return null;
    }
}
