class NumberPrettifier

  def self.powers_format_map
    {
      12 => "T",
      9 => "B",
      6 => "M"
    }
  end

  def self.is_float(n)
    n.to_s =~ /\./
  end

  def self.prettify(n)
    powers_format_map.keys.sort.reverse.each do|pow|
      if (n / 10**pow >= 1)
        num = Float(n) / Float(10**pow)
        if Float(n) % Float(10**pow) != 0
          num = num.round(1)
        else
          num = Integer(num)
        end
        return (is_float(n) ? num.round(1) : num).to_s + powers_format_map[pow]
      end
    end

    (is_float(n) ? n.round(1) : n).to_s
  end

end