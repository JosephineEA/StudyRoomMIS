package team.mis.study.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.mis.study.dao.ReplyingDao;
import team.mis.study.entity.Posting;
import team.mis.study.entity.Replying;
import team.mis.study.service.ReplyingService;

import java.util.List;

/**
 * Time: 2021/9/10 14:06
 * Description: TODO
 */
@Service
public class ReplyingServiceImpl implements ReplyingService {
    @Autowired
    ReplyingDao replyingDao;

    @Override
    public void add(Replying replying) {
        replyingDao.add(replying);
    }

    @Override
    public List<Replying> findByPosting(Posting posting) {
        return replyingDao.findByPosting(posting);
    }

    @Override
    public void deleteByPostingId(String postingId) {
        replyingDao.deleteByPostingId(postingId);
    }
}
