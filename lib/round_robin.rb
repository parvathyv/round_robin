def schedule_tournament(names)

game = []

round = []

tournament = []

pivot = names.first
rounds_played = 0
names << '*' if names.size.odd?
half_size = names.size/2

while rounds_played < names.size-1
        
        i = 0

        round = [] 
        
        while i < half_size

            game = []

            if names[i] == '*' || names[i + half_size]  == '*'

                if names[i] == '*'
                    game[0] = "#{names[i + half_size]}"
                else
                    game[0] = "#{names[i]}"
                end
            else
                game[0] = "#{names[i]}"
                game[1] = "#{names[i + half_size]}"
            end
             
            round << game
            
            i = i + 1
        
        end
        
        tournament << round

        
        names.shift(1)
        ele = names[half_size - 1]
        names.delete_at(half_size - 1)
        names = names.unshift(ele)
        names = names.unshift(pivot)

        temp = names.slice(half_size, names.size - half_size)
        ele = names[half_size]
        temp.shift
        temp << ele

        names = names.slice(0, half_size).concat(temp)

        rounds_played += 1

    end
   
  tournament
  end

