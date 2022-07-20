def climbingLeaderboard(ranked, players)
    myranking = 0
    player_ranking = []
    rankings = []
    ranking_number = 1
    checker = ranked[0]
    #getting Players rank from leaderboard
    ranked.each do |i|
         if i < checker
             checker = i
             ranking_number+= 1
         end
         rankings.push(ranking_number)
    end
    #ranking: Player rankings by positions(1,2,3)
   puts
   flag = false
   #finding players rank by their score by iterating through player scores
   players.each do |i|
      flag = false
      scoreChecking = []
      ranked.each do |j|
          # if player score is found greater than any score then giving ranking above that rank
          if i > j
             index = ranked.find_index(j)
             if scoreChecking.include?rankings[index] - 1
                 player_ranking.push(rankings[index])
             else
                 player_ranking.push(rankings[index] - 1)
             end
             flag = true
             break
         elsif i == j
             # if player score is found equal then giving that rank
             index = ranked.find_index(j)
             player_ranking.push(rankings[index])
             flag = true
             break
          end
          index = ranked.find_index(j)
          scoreChecking.push(rankings[index]) 
      end
     #  If player score is not even in leaderboard giving least rank
     if flag == false
         myranking = rankings.length
         myranking = rankings[myranking - 1]
         myranking += 1
         player_ranking.push(myranking)
     end
   end
   puts 
   puts "PLayer Ranking : "
   # mapping array to convert all zeros to one as no rank is zero
   player_ranking =  player_ranking.map {|i| i == 0? 1: i}
   # returning final array
   return player_ranking
end
 
#main    
ranked_arr = []
players_arr = []
puts "-----------Constraints are: -----------"
puts "1 <= n <= 2 x 10^5"
puts "1 <= m <= 2 x 10^5"
puts "0 <= ranked[i] <= 10^9"
puts "0 <= player[i] <= 10^9"
puts "----------------------------------------"
# getting n input
puts "Enter the number of Players (n): "
n = gets.chomp.to_i
if n < 1 || n > (2 * 10 ** 5)
 n = 1
end
for i in 0..n-1 do
 puts "Enter Score:"
 var = gets.chomp.to_i
 if var < 0 || var > (10**9)
    var = 0 
 end
 ranked_arr.push(var)
end
# getting m input 
puts "Enter the number of Games for Player Alice (m): "
m = gets.chomp.to_i
if m < 1 || m > (2 * 10 ** 5)
 m = 1
end
for i in 0..m-1 do
 puts "Enter Score for Player Alice:"
 var = gets.chomp.to_i
 if var < 0 || var > (10**9)
    var = 0 
 end
 players_arr.push(var)
end
# printing alicescores and leaderboard
puts "------------------ The AliceScores and LeaderBoard -------------------"
puts
ranked_arr = ranked_arr.sort.reverse()
players_arr = players_arr.sort()
puts players_arr
puts 
puts ranked_arr
puts "------------------ Player ranking with respect to scores is -------------------"
puts
finalRank = climbingLeaderboard(ranked_arr,players_arr)
# printing final array of player rankings
puts finalRank
