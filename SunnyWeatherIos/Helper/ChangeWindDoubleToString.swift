//
//  ChangeWindDoubleToString.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/9.
//

import Foundation

func changeWindDoubleToString(speed: Double) -> String {
    if speed<1 {
        return "0级"
    }
    else if  speed>=1 && speed<=5{
        return "1级"
    }
    else if  speed>5 && speed<=11{
        return "2级"
    }
    else if  speed>11 && speed<=19{
        return "3级"
    }
    else if  speed>19 && speed<=28{
        return "4级"
    }
    else if  speed>28 && speed<=38{
        return "5级"
    }
    else if  speed>38 && speed<=49{
        return "6级"
    }
    else if  speed>49 && speed<=61{
        return "7级"
    }
    else if  speed>61 && speed<=74{
        return "8级"
    }
    else if  speed>74 && speed<=88{
        return "9级"
    }
    else if  speed>88 && speed<=102{
        return "10级"
    }
    else if  speed>102 && speed<=117{
        return "11级"
    }
    else if  speed>117 && speed<=133{
        return "12级"
    }
    else if  speed>133 && speed<=149{
        return "13级"
    }
    else if  speed>149 && speed<=166{
        return "14级"
    }
    else if  speed>166 && speed<=183{
        return "15级"
    }
    else if  speed>183 && speed<=201{
        return "16级"
    }
    else{
        return "17级"
    }
}
