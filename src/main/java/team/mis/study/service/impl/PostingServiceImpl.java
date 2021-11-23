package team.mis.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.mis.study.dao.PostingDao;
import team.mis.study.entity.Posting;
import team.mis.study.service.PostingService;

import java.util.List;

/**
 * Time: 2021/9/10 13:30
 * Description: TODO
 */
@Service
public class PostingServiceImpl implements PostingService {
    @Autowired
    private PostingDao postingDao;

    @Override
    public List<Posting> findAll() {
        return postingDao.findAll();
    }

    @Override
    public void add(Posting posting) {
        postingDao.add(posting);
    }

    @Override
    public Posting findByPk(String id) {
        return postingDao.findByPk(id);
    }

    @Override
    public void deleteByPk(String id) {
        postingDao.deleteByPk(id);
    }
}
