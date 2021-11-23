package team.mis.study.dao;

import team.mis.study.entity.Posting;
import team.mis.study.entity.Replying;

import java.util.List;

/**
 * Time: 2021/9/10 14:07
 * Description: TODO
 */
public interface ReplyingDao {
    void add(Replying replying);

    List<Replying> findByPosting(Posting posting);

    void deleteByPostingId(String postingId);
}
