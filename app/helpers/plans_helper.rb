module PlansHelper
  def real_name(name)
    case name
    when 'W'
      'Semanal'
    when 'CW'
      'Quinzenal'
    when 'M'
      'Mensal'
    when 'FFD'
      '45 dias'
    when 'CM'
      'Bimestral'
    when 'TM'
      '90 dias'
    else
      'Outro'
    end
  end
end
