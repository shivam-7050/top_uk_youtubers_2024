DECLARE @conversionRate FLOAT = 0.02;
DECLARE @productCost MONEY = 5.0;
DECLARE @campaignCost MONEY = 50000.0;


WITH ChannelData AS (
SELECT channel_name, total_views,total_videos,ROUND((CAST(total_views AS FLOAT) / total_videos), -4) AS rounded_avg_views_per_video,(total_views / total_videos) AS original_avg_views_per_video
FROM top_UK_youtubers__2024
)
 
SELECT channel_name,
rounded_avg_views_per_video,
(rounded_avg_views_per_video * @conversionRate) AS potential_units_sold_per_video,
(rounded_avg_views_per_video * @conversionRate * @productCost) AS potential_revenue_per_video,
(rounded_avg_views_per_video * @conversionRate * @productCost) - @campaignCost as net_profit
FROM ChannelData

/*

/*	youtubers_with_most_subs */
WHERE 
    channel_name in ('NoCopyrightSounds', 'DanTDM', 'Dan Rhodes')    

ORDER BY
	net_profit DESC;
	
*/


/*

/*	youtubers_with_most_videos

WHERE
    channel_name IN ('GRM Daily', 'Man City', 'YOGSCAST Lewis & Simon ')

ORDER BY
    net_profit DESC;
*/


/*

/* youtubers_with_most_views */

WHERE
    channel_name IN ('Mister Max', 'DanTDM', 'Dan Rhodes')

ORDER BY
    net_profit DESC;
*/ 