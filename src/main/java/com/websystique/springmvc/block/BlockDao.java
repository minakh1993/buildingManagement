package com.websystique.springmvc.block;

import com.websystique.springmvc.User.Employee;
import com.websystique.springmvc.dao.AbstractDao;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author mina khoshnevisan
 * 12/10/2018
 */

@Repository("blockDao")
public class BlockDao extends AbstractDao<Long, Block>{

    public void saveBlock(Block employee) {


    }

    public void deleteBlock(Long id) {

    }

    public List<Block> findAllBlocks() {

        Query criteria = getSession().createQuery("from Block" );
        return criteria.list();
    }
}