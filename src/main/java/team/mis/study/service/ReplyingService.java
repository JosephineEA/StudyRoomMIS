package team.mis.study.service;

import team.mis.study.entity.Posting;
import team.mis.study.entity.Replying;

import java.util.List;

/**
 * Time: 2021/9/10 14:05
 * Description: TODO
 */
public interface ReplyingService {
    void add(Replying replying);

    List<Replying> findByPosting(Posting posting);

    void deleteByPostingId(String postingId);
}
