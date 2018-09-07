def dictionary(word)
  dictionary_hash = {
    "hello" => "hi",
    "to" => '2',
    "two" => '2',
    "too" => '2',
    "for" => '4',
    'four' => '4',
    'be' => 'b',
    'you' => 'u',
    'at' => '@',
    'and' => '&'
  }
  if dictionary_hash.keys.include?(word.downcase)
    if word.downcase == word
      word = dictionary_hash[word]
    else
      word = dictionary_hash[word.downcase]
    end
  end
  word
end

def word_substituter(string)
  string_array = string.split
  final_array = []
  for i in 0...string_array.length
    final_array << dictionary(string_array[i])
  end
  final_array.join(' ')
end

def bulk_tweet_shortener(tweet)
  tweet.each do |tweets|
    puts word_substituter(tweets)
  end
end

def shortened_tweet_truncator(string)
  string[0..139]
end

def selective_tweet_shortner(tweet)
  if tweet.length > 140
    final_tweet = ''
    final_tweet = word_substituter(tweet)
    
    if final_tweet.length > 140
      final_tweet = shortened_tweet_truncator(tweet)
    end
    
    return final_tweet
  else
    return tweet
  end
end

