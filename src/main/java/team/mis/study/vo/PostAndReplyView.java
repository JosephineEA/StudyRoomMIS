package team.mis.study.vo;

import lombok.Data;
import team.mis.study.entity.Posting;
import team.mis.study.entity.Replying;

import java.util.List;

/**
 * Time: 2021/9/11 17:10
 * Description: TODO
 */
@Data
public class PostAndReplyView {
    private Posting posting;
    private List<Replying> replyingList;
}
