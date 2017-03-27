package top.chsis.dao;

import java.util.List;

import top.chsis.model.RoleResource;
import top.chsis.vo.RoleResourceVO;

public interface IRoleResourceMapper {
    int deleteByPrimaryKey(String uuid);

    int insert(RoleResource record);

    int insertBatch(List<RoleResourceVO> list);
    
    int deleteBatchByUuid(List<String> list);
    
    int insertSelective(RoleResource record);

    RoleResource selectByPrimaryKey(String uuid);

    List<RoleResource> selectAll();
    
    List<RoleResource> selectByRoleUuid(String roleUuid);
    
    int updateByPrimaryKeySelective(RoleResource record);

    int updateByPrimaryKey(RoleResource record);
}