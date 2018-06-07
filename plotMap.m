function plotMap(country,percentage)
% inputs country index and percentage of population either dead or infected
% based on this percentage, the indexed country will change hues based on 5
% different stages:
% hue 1: 0<x<20
% hue 2: 20<=x<40
% hue 3: 40<=x<60
% hue 4: 60<=x<80
% hue 5: 80<=x

% Author: Dominic Bozzo
% Date: April 14, 2017

if percentage < .2 
    color = .9;
elseif percentage <.4
    color = .75;
elseif percentage <.6
    color = .6;
elseif percentage <.8
    color = .3;
else
    color = 0;
end



switch country
    case 1
        borders('india','facecolor',[1,color,color],'nomap');
        borders('sri lanka','facecolor',[1,color,color],'nomap');
    case 2
        borders('china','facecolor',[1,color,color],'nomap');
        borders('taiwan','facecolor',[1,color,color],'nomap');
    case 3
        % west africa
        borders('benin','facecolor',[1,color,color],'nomap');
        borders('burkina faso','facecolor',[1,color,color],'nomap');
        borders('cape verde','facecolor',[1,color,color],'nomap');
        borders('gambia','facecolor',[1,color,color],'nomap');
        borders('ghana','facecolor',[1,color,color],'nomap');
        borders('guinea','facecolor',[1,color,color],'nomap');
        borders('guinea-bissau','facecolor',[1,color,color],'nomap');
        borders('cote d''Ivoire','facecolor',[1,color,color],'nomap');
        borders('liberia','facecolor',[1,color,color],'nomap');
        borders('mali','facecolor',[1,color,color],'nomap');
        borders('mauritania','facecolor',[1,color,color],'nomap');
        borders('niger','facecolor',[1,color,color],'nomap');
        borders('nigeria','facecolor',[1,color,color],'nomap');
        borders('senegal','facecolor',[1,color,color],'nomap');
        borders('sierra leone','facecolor',[1,color,color],'nomap');
        borders('togo','facecolor',[1,color,color],'nomap');
        borders('western sahara','facecolor',[1,color,color],'nomap');
    case 4
       % east africa
      borders('burundi','facecolor',[1,color,color],'nomap');
       borders('united republic of tanzania','facecolor',[1,color,color],'nomap');
        borders('kenya','facecolor',[1,color,color],'nomap');
        borders('uganda','facecolor',[1,color,color],'nomap');
       borders('djibouti','facecolor',[1,color,color],'nomap');
        borders('eritrea','facecolor',[1,color,color],'nomap');
        borders('ethiopia','facecolor',[1,color,color],'nomap');
        borders('somalia','facecolor',[1,color,color],'nomap');
        borders('mozambique','facecolor',[1,color,color],'nomap');
        borders('malawi','facecolor',[1,color,color],'nomap');
        borders('zambia','facecolor',[1,color,color],'nomap');
        borders('comoros','facecolor',[1,color,color],'nomap');
        borders('mauritius','facecolor',[1,color,color],'nomap');
        borders('seychelles','facecolor',[1,color,color],'nomap');
        borders('reunion','facecolor',[1,color,color],'nomap');
        borders('mayotte','facecolor',[1,color,color],'nomap');
        
       case 5
         borders('united states','facecolor',[1,color,color],'nomap');
    case 6
        % southeast asia
        borders('brunei darussalam','facecolor',[1,color,color],'nomap');
        borders('burma','facecolor',[1,color,color],'nomap');
        borders('cambodia','facecolor',[1,color,color],'nomap');
        borders('lao people''s democratic republic','facecolor',[1,color,color],'nomap');
        borders('malaysia','facecolor',[1,color,color],'nomap');
        borders('singapore','facecolor',[1,color,color],'nomap');
        borders('thailand','facecolor',[1,color,color],'nomap');
        borders('viet nam','facecolor',[1,color,color],'nomap');
    case 7 
         borders('indonesia','facecolor',[1,color,color],'nomap');
    case 8
         borders('brazil','facecolor',[1,color,color],'nomap');
         borders('french guiana','facecolor',[1,color,color],'nomap');
         borders('suriname','facecolor',[1,color,color],'nomap');
         borders('guyana','facecolor',[1,color,color],'nomap');
    case 9
         borders('pakistan','facecolor',[1,color,color],'nomap');
    case 10
         borders('russia','facecolor',[1,color,color],'nomap');
    case 11
       borders('japan','facecolor',[1,color,color],'nomap');
    case 12
         borders('mexico','facecolor',[1,color,color],'nomap');
    case 13
        %central africa
         borders('angola','facecolor',[1,color,color],'nomap');
         borders('cameroon','facecolor',[1,color,color],'nomap');
         borders('central african republic','facecolor',[1,color,color],'nomap');
         borders('chad','facecolor',[1,color,color],'nomap');
         borders('democratic republic of the congo','facecolor',[1,color,color],'nomap');
         borders('congo','facecolor',[1,color,color],'nomap');
         borders('equatorial guinea','facecolor',[1,color,color],'nomap');
         borders('gabon','facecolor',[1,color,color],'nomap');
         borders('rwanda','facecolor',[1,color,color],'nomap');
         borders('namibia','facecolor',[1,color,color],'nomap');
    case 14
         borders('germany','facecolor',[1,color,color],'nomap');
    case 15
         borders('philippines','facecolor',[1,color,color],'nomap');
    case 16
         borders('colombia','facecolor',[1,color,color],'nomap');
         borders('venezuela','facecolor',[1,color,color],'nomap');
    case 17 
         borders('egypt','facecolor',[1,color,color],'nomap');
    case 18
         borders('france','facecolor',[1,color,color],'nomap');
    case 19
         borders('iran islamic republic of','facecolor',[1,color,color],'nomap');
    case 20
         borders('Korea, Democratic People''s Republic of','facecolor',[1,color,color],'nomap');
         borders('Korea, Republic of','facecolor',[1,color,color],'nomap');
    case 21 
       borders('turkey','facecolor',[1,color,color],'nomap');
    case 22
        borders('saudi arabia','facecolor',[1,color,color],'nomap');
    case 23
        borders('United Kingdom','facecolor',[1,color,color],'nomap');
        borders('ireland','facecolor',[1,color,color],'nomap');
    case 24
        %balkan states
        borders('croatia','facecolor',[1,color,color],'nomap');
        borders('bosnia and herzegovina','facecolor',[1,color,color],'nomap');
        borders('slovenia','facecolor',[1,color,color],'nomap');
        borders('serbia','facecolor',[1,color,color],'nomap');
        borders('montenegro','facecolor',[1,color,color],'nomap');
       % borders('kosovo','facecolor',[1,color,color],'nomap');
        %borders('macedonia','facecolor',[1,color,color],'nomap');
        borders('romania','facecolor',[1,color,color],'nomap');
        borders('bulgaria','facecolor',[1,color,color],'nomap');
        borders('albania','facecolor',[1,color,color],'nomap');
        borders('greece','facecolor',[1,color,color],'nomap');
    case 25
        borders('italy','facecolor',[1,color,color],'nomap');
    case 26
        borders('argentina','facecolor',[1,color,color],'nomap');
        borders('uruguay','facecolor',[1,color,color],'nomap');
        borders('chile','facecolor',[1,color,color],'nomap');
    case 27 
        borders('spain','facecolor',[1,color,color],'nomap');
        borders('portugal','facecolor',[1,color,color],'nomap');
    case 28
        borders('south africa','facecolor',[1,color,color],'nomap');
    case 29
        borders('algeria','facecolor',[1,color,color],'nomap');
        borders('tunisia','facecolor',[1,color,color],'nomap');
    case 30
        %central asia
        %borders('kazakhstan','facecolor',[1,color,color],'nomap');
        borders('uzbekistan','facecolor',[1,color,color],'nomap');
        borders('kyrgyzstan','facecolor',[1,color,color],'nomap');
        borders('tajikistan','facecolor',[1,color,color],'nomap');
        borders('turkmenistan','facecolor',[1,color,color],'nomap');
        borders('mongolia','facecolor',[1,color,color],'nomap');
    case 31 
        borders('sudan','facecolor',[1,color,color],'nomap');
    case 32
        %middle east
        borders('syrian arab republic','facecolor',[1,color,color],'nomap');
        borders('israel','facecolor',[1,color,color],'nomap');
        borders('united arab emirates','facecolor',[1,color,color],'nomap');
        borders('palestine','facecolor',[1,color,color],'nomap');
        borders('lebanon','facecolor',[1,color,color],'nomap');
        borders('yemen','facecolor',[1,color,color],'nomap');
        borders('qatar','facecolor',[1,color,color],'nomap');
        borders('jordan','facecolor',[1,color,color],'nomap');
        borders('oman','facecolor',[1,color,color],'nomap');
        borders('bahrain','facecolor',[1,color,color],'nomap');
        borders('kuwait','facecolor',[1,color,color],'nomap');
        borders('cyprus','facecolor',[1,color,color],'nomap');
       
    case 33
        borders('ukraine','facecolor',[1,color,color],'nomap');
    case 34
        %central america
        borders('guatemala','facecolor',[1,color,color],'nomap');
        borders('belize','facecolor',[1,color,color],'nomap');
        borders('el salvador','facecolor',[1,color,color],'nomap');
        borders('honduras','facecolor',[1,color,color],'nomap');
        borders('nicaragua','facecolor',[1,color,color],'nomap');
        borders('costa rica','facecolor',[1,color,color],'nomap');
         borders('panama','facecolor',[1,color,color],'nomap');
        
    case 35
        %central europe
        borders('austria','facecolor',[1,color,color],'nomap');
        borders('czech republic','facecolor',[1,color,color],'nomap');
        borders('hungary','facecolor',[1,color,color],'nomap');
        borders('slovakia','facecolor',[1,color,color],'nomap');
        borders('switzerland','facecolor',[1,color,color],'nomap');
        borders('belgium','facecolor',[1,color,color],'nomap');
        borders('netherlands','facecolor',[1,color,color],'nomap');
        borders('luxembourg','facecolor',[1,color,color],'nomap');
            
    case 36
        borders('poland','facecolor',[1,color,color],'nomap');
    case 37 
        %caribbean
        borders('anguilla','facecolor',[1,color,color],'nomap');
        borders('antigua and barbuda','facecolor',[1,color,color],'nomap');
        borders('aruba','facecolor',[1,color,color],'nomap');
        borders('bahamas','facecolor',[1,color,color],'nomap');
        borders('barbados','facecolor',[1,color,color],'nomap');
        borders('cayman islands','facecolor',[1,color,color],'nomap');
        borders('cuba','facecolor',[1,color,color],'nomap');
        borders('dominican republic','facecolor',[1,color,color],'nomap');
        borders('grenada','facecolor',[1,color,color],'nomap');
        borders('haiti','facecolor',[1,color,color],'nomap');
        borders('jamaica','facecolor',[1,color,color],'nomap');
        borders('martinique','facecolor',[1,color,color],'nomap');
        borders('puerto rico','facecolor',[1,color,color],'nomap');
        borders('trinidad and tobago','facecolor',[1,color,color],'nomap');
        borders('saint lucia','facecolor',[1,color,color],'nomap');
       
    case 38
       borders('canada','facecolor',[1,color,color],'nomap');
    case 39
        borders('iraq','facecolor',[1,color,color],'nomap');
    case 40
        borders('morocco','facecolor',[1,color,color],'nomap');
    case 41 
        borders('afghanistan','facecolor',[1,color,color],'nomap');
    case 42
        borders('peru','facecolor',[1,color,color],'nomap');
        borders('ecuador','facecolor',[1,color,color],'nomap');
    case 43
        borders('australia','facecolor',[1,color,color],'nomap');
    case 44
        borders('madagascar','facecolor',[1,color,color],'nomap');
    case 45
        borders('angola','facecolor',[1,color,color],'nomap');
    case 46
        borders('Kazakhstan','facecolor',[1,color,color],'nomap');
    case 47
        %baltic states
        borders('denmark','facecolor',[1,color,color],'nomap');
        borders('estonia','facecolor',[1,color,color],'nomap');
        borders('latvia','facecolor',[1,color,color],'nomap');
    case 48
        borders('zimbabwe','facecolor',[1,color,color],'nomap');
    case 49
       borders('bolivia','facecolor',[1,color,color],'nomap');
       borders('paraguay','facecolor',[1,color,color],'nomap');
    case 50
        borders('sweden','facecolor',[1,color,color],'nomap');
    case 51
        borders('papua new guinea','facecolor',[1,color,color],'nomap');
        borders('solomon islands','facecolor',[1,color,color],'nomap');
        borders('new caledonia','facecolor',[1,color,color],'nomap');
        borders('vanuatu','facecolor',[1,color,color],'nomap');
    case 52
        borders('libyan arab jamahiriya','facecolor',[1,color,color],'nomap');
    case 53
        borders('finland','facecolor',[1,color,color],'nomap');
    case 54
        borders('norway','facecolor',[1,color,color],'nomap');
    case 55
        borders('new zealand','facecolor',[1,color,color],'nomap');
    case 56
        borders('botswana','facecolor',[1,color,color],'nomap');
    case 57
        borders('iceland','facecolor',[1,color,color],'nomap');
    case 58
        borders('greenland','facecolor',[1,color,color],'nomap');
   
end
axis off

