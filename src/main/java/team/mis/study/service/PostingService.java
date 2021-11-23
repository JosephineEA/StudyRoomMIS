package team.mis.study.service;

import team.mis.study.entity.Posting;

import java.util.List;

/**
 * Time: 2021/9/10 13:30
 * Description: TODO
 */
public interface PostingService {
    List<Posting> findAll();

    void add(Posting posting);

    Posting findByPk(String id);

    void deleteByPk(String id);
}
