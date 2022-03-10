# ggplot2 Visualizations

# CYCLISTIC PROJECT
# Midpoint ride length by subscription type

all_trips_stats%>%
  ggplot(mapping=aes(x=weekday, y=median, fill=member_casual))+geom_col(position = "dodge")+
  labs(title = "Midpoint ride length by subscription type", fill="Subscription type")+ylab("Time (in seconds)")+xlab(NULL)+
  scale_fill_manual(values = c("casual" = "#72a8d5",
                               "member" = "#96cd69"), labels = c("Casual rider", "Annual member"))+ theme_light()

# Bike type usage by subscription

all_trips_biketype%>%
  ggplot(mapping = aes(x=member_casual, y=total, fill=rideable_type))+geom_col(position="dodge")+
  labs(title = "Bike type usage by subscription type", fill="Bike type")+ylab("Number of rides")+xlab(NULL)+
  scale_x_discrete(labels = c('Casual rider','Annual member'))+
  scale_fill_manual(values = c("classic_bike" = "#c0475f",
                               "electric_bike" = "#e6c200"), labels = c("Classic bike", "Electric bike"))+ theme_light()

# Monthly midpoint ride length by subscription type

all_trips%>%
  group_by(member_casual, month)%>%
  summarize(median = median(ride_length_sec))%>%
  ggplot(mapping=aes(x=month, y=median, fill=member_casual))+geom_col(position = "dodge")+
  labs(title = "Monthly midpoint ride length by subscription type", fill="Subscription type")+ylab("Time (in seconds)")+xlab(NULL)+
  scale_fill_manual(values = c("casual" = "#72a8d5",
                               "member" = "#96cd69"), labels = c("Casual rider", "Annual member"))+theme_light()

# Bike type usage over the year

all_trips%>%
  group_by(date, rideable_type)%>%
  summarize(total = n())%>%
  ggplot(mapping = aes(x=date, y=total, fill=rideable_type))+geom_area(position="dodge")+
  scale_x_date(date_labels = "%y/%m",  date_breaks = "1 month")+
  labs(title = "Bike type usage over the year", fill="Bike type")+ylab("Number of rides")+xlab("Year and Month")+
  scale_fill_manual(values = c("classic_bike" = "#c0475f",
                               "electric_bike" = "#e6c200"), labels = c("Classic bike", "Electric bike"))+ theme_light()

# Nº of members and casual riders over the year

all_trips%>%
  group_by(date, member_casual)%>%
  summarize(total = n())%>%
  ggplot(mapping = aes(x=date, y=total, fill=member_casual))+geom_area()+
  scale_x_date(date_labels = "%y/%m",  date_breaks = "1 month")+
  labs(title = "Nº of members and casual riders over the year", fill="Subscription type")+ylab("Number of rides")+xlab("Year and Month")+
  scale_fill_manual(values = c("casual" = "#72a8d5",
                               "member" = "#96cd69"), labels = c("Casual rider", "Annual member"))+ theme_light()

#BELLABEAT PROJECT
# Sedentary hours per weekday

avg_activity %>%
  ggplot(mapping=aes(x=weekday, y=avg_sedentary_hours, fill=avg_sedentary_hours))+geom_col()+
  labs(title = "Sedentary hours per weekday", fill="Sedentary hours")+ylab("Sedentary hours")+xlab(NULL)

# Average distance per weekday

avg_activity%>%
  ggplot(mapping=aes(x=weekday, y=avg_distance_km, fill=avg_distance_km))+geom_col()+
  labs(title = "Average distance per weekday", fill="Kilometres")+ylab("Distance (in km)")+xlab(NULL)

# Relation between time in bed and time asleep

daily_activity %>%
  ggplot(mapping=aes(x=total_minutes_asleep/60, y=total_time_in_bed/60))+geom_point()+stat_smooth()+
  labs(title = "Relation between time in bed and time asleep")+
  ylab("Hours in bed")+xlab("Hours asleep")

# Time awake in bed

avg_sleep %>%
  ggplot(mapping= aes(x=weekday, y=min_awake_in_bed, fill=min_awake_in_bed))+geom_col()+
  labs(title = "Time awake in bed", fill = "Minutes")+
  ylab("Minutes in bed (awake)")+xlab(NULL)