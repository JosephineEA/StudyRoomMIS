package team.mis.study.dao;

import team.mis.study.entity.Posting;

import java.util.List;

/**
 * Time: 2021/9/10 13:36
 * Description: TODO
 */
public interface PostingDao {
    List<Posting> findAll();

    void add(Posting posting);

    Posting findByPk(String id);

    void deleteByPk(String id);
}
