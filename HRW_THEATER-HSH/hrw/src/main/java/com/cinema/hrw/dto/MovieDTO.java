package com.cinema.hrw.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import net.bytebuddy.build.Plugin.Engine.Summary;

@Getter
@Setter
@NoArgsConstructor
@ToString

public class MovieDTO {
private String title;
private String code;
private String aka;
private String summary;
private String image_url;
private Float advance_reservation_rate;
private Long cumulative_number_of_audience;
private int in_decrease;
private Integer in_decrease_rate;
}
