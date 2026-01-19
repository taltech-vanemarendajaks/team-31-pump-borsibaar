package com.borsibaar.mapper;

import com.borsibaar.dto.BarStationResponseDto;
import com.borsibaar.entity.BarStation;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.ReportingPolicy;

import java.util.List;

@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE, uses = { UserMapper.class })
public interface BarStationMapper {

    @Mapping(source = "users", target = "assignedUsers")
    BarStationResponseDto toResponseDto(BarStation barStation);

    List<BarStationResponseDto> toResponseDtoList(List<BarStation> barStations);
}
