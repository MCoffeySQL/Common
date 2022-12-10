USE common;
GO

SET NOCOUNT ON

DECLARE 
  @char SMALLINT = 0,
  @message NVARCHAR(2000)

WHILE @char <= 255
BEGIN
  INSERT INTO dbo.symbols(
    id,
    symbol,
    hex,
    html,
    morse,
    shortDescription
    )
  SELECT 
    @char,
    CHAR(@char) AS symbol,
    CONVERT(VARCHAR(MAX),CONVERT(BINARY(1),@char),2) AS hex,
    CASE 
      WHEN @char >= 32 AND @char <= 127
      THEN '&#' + CAST(@char AS VARCHAR(3)) + ';'
      ELSE NULL
    END AS HTML,
    CASE
      WHEN @char = 0 THEN '-----'
      WHEN @char = 1 THEN '.----'
      WHEN @char = 2 THEN '..---'
      WHEN @char = 3 THEN '...--'
      WHEN @char = 4 THEN '....-'
      WHEN @char = 5 THEN '.....'
      WHEN @char = 6 THEN '-....'
      WHEN @char = 7 THEN '--...'
      WHEN @char = 9 THEN '----.'
      WHEN @char = 65 OR @char = 97 THEN '.-'
      WHEN @char = 66 OR @char = 98 THEN '-...'
      WHEN @char = 67 OR @char = 99 THEN '-.-.'
      WHEN @char = 68 OR @char = 100 THEN '-..'
      WHEN @char = 69 OR @char = 101 THEN '.'
      WHEN @char = 70 OR @char = 102 THEN '..-.'
      WHEN @char = 71 OR @char = 103 THEN '--.'
      WHEN @char = 72 OR @char = 104 THEN '....'
      WHEN @char = 73 OR @char = 105 THEN '..'
      WHEN @char = 74 OR @char = 106 THEN '.---'
      WHEN @char = 75 OR @char = 107 THEN '-.-'
      WHEN @char = 76 OR @char = 108 THEN '.-..'
      WHEN @char = 77 OR @char = 109 THEN '--'
      WHEN @char = 78 OR @char = 110 THEN '-.'
      WHEN @char = 79 OR @char = 111 THEN '---'
      WHEN @char = 80 OR @char = 112 THEN '.--.'
      WHEN @char = 81 OR @char = 113 THEN '--.-'
      WHEN @char = 82 OR @char = 114 THEN '.-.'
      WHEN @char = 83 OR @char = 115 THEN '...'
      WHEN @char = 84 OR @char = 116 THEN '-'
      WHEN @char = 85 OR @char = 117 THEN '..-'
      WHEN @char = 86 OR @char = 118 THEN '...-'
      WHEN @char = 87 OR @char = 119 THEN '.--'
      WHEN @char = 88 OR @char = 120 THEN '-..-'
      WHEN @char = 89 OR @char = 121 THEN '-.--'
      WHEN @char = 90 OR @char = 122 THEN '--..'
      WHEN @char = 34 THEN '.-..-.'
      WHEN @char = 44 THEN '--..--'
      WHEN @char = 58 THEN '---...'
      WHEN @char = 63 THEN '..--..'
      WHEN @char = 39 THEN '.----.'
      WHEN @char = 45 THEN '-....-'
      WHEN @char = 47 THEN '-..-.'
      WHEN @char = 40 OR @char = 41 THEN '-.--.-'
      WHEN @char = 64 THEN '.--.-.'
      WHEN @char = 61 THEN '-...-'
      WHEN @char = 196 THEN '.-.-'
      WHEN @char = 193 THEN '.--.-'
      WHEN @char = 197 THEN '.--.-'
      WHEN @char = 201 THEN '..-..'
      WHEN @char = 209 THEN '--.--'
      WHEN @char = 214 THEN '---.'
      WHEN @char = 220 THEN '..--'
   END AS morse,
   'Symbols' AS shortDescription;
    
  SET @char += 1;
END

update dbo.symbols set shortDescription = 'nul - null' WHERE id = 0;
update dbo.symbols set shortDescription = 'soh - start of heading' WHERE id = 1;
update dbo.symbols set shortDescription = 'stx - start of text' WHERE id = 2;
update dbo.symbols set shortDescription = 'etx - end of text' WHERE id = 3;
update dbo.symbols set shortDescription = 'eot - end of transmission' WHERE id = 4;
update dbo.symbols set shortDescription = 'enq - enquiry' WHERE id = 5;
update dbo.symbols set shortDescription = 'ack - acknowledge' WHERE id = 6;
update dbo.symbols set shortDescription = 'bel - bell' WHERE id = 7;
update dbo.symbols set shortDescription = 'bak - backspace' WHERE id = 8;
update dbo.symbols set shortDescription = 'tab - horizontal tab' WHERE id = 9;
update dbo.symbols set shortDescription = 'lf - line feed - new line' WHERE id = 10;
update dbo.symbols set shortDescription = 'vt - vertical tab' WHERE id = 11;
update dbo.symbols set shortDescription = 'ff - form feed - new page' WHERE id = 12;
update dbo.symbols set shortDescription = 'cr - carrage return' WHERE id = 13;
update dbo.symbols set shortDescription = 'so - shift out' WHERE id = 14;
update dbo.symbols set shortDescription = 'si - shift in' WHERE id = 15;
update dbo.symbols set shortDescription = 'dle - data link escape' WHERE id = 16;
update dbo.symbols set shortDescription = 'dc1 - device control 1' WHERE id = 17;
update dbo.symbols set shortDescription = 'dc2 - device control 2' WHERE id = 18;
update dbo.symbols set shortDescription = 'dc3 - device control 3' WHERE id = 19;
update dbo.symbols set shortDescription = 'dc4 - device control 4' WHERE id = 20;
update dbo.symbols set shortDescription = 'nak - negative acknowledge' WHERE id = 21;
update dbo.symbols set shortDescription = 'syn - synchronous idle' WHERE id = 22;
update dbo.symbols set shortDescription = 'etb - end of tranmsission block' WHERE id = 23; 
update dbo.symbols set shortDescription = 'can - cancel' WHERE id = 24;
update dbo.symbols set shortDescription = 'em - end of medium' WHERE id = 25; 
update dbo.symbols set shortDescription = 'sub - substitute' WHERE id = 26;
update dbo.symbols set shortDescription = 'esc - escape' WHERE id = 27;
update dbo.symbols set shortDescription = 'fs - file separator' WHERE id = 28;
update dbo.symbols set shortDescription = 'gs - group separator' WHERE id = 29;
update dbo.symbols set shortDescription = 'rs - record separator' WHERE id = 30;
update dbo.symbols set shortDescription = 'us - unit separator' WHERE id = 31;
update dbo.symbols set shortDescription = 'space' WHERE id = 32;
update dbo.symbols set shortDescription = 'exclamation mark' WHERE id = 33;
update dbo.symbols set shortDescription = 'double quotaion mark' WHERE id = 34;
update dbo.symbols set shortDescription = 'number sign' WHERE id = 35;
update dbo.symbols set shortDescription = 'dollar sign' WHERE id = 36;
update dbo.symbols set shortDescription = 'percent sign' WHERE id = 37;
update dbo.symbols set shortDescription = 'ampersand' WHERE id = 38;
update dbo.symbols set shortDescription = 'single quotation mark' WHERE id = 39;
update dbo.symbols set shortDescription = 'left parenthesis' WHERE id = 40;
update dbo.symbols set shortDescription = 'right parenthesis' WHERE id = 41;
update dbo.symbols set shortDescription = 'asterisk' WHERE id = 42;
update dbo.symbols set shortDescription = 'plus sign' WHERE id = 43;
update dbo.symbols set shortDescription = 'comma' WHERE id = 44;
update dbo.symbols set shortDescription = 'minus sign' WHERE id = 45; 
update dbo.symbols set shortDescription = 'period' WHERE id = 46;
update dbo.symbols set shortDescription = 'slash' WHERE id = 47;

update dbo.symbols set shortDescription = 'number zero' WHERE id = 48;
update dbo.symbols set shortDescription = 'number one' WHERE id = 49;
update dbo.symbols set shortDescription = 'number two' WHERE id = 50;
update dbo.symbols set shortDescription = 'number three' WHERE id = 51;
update dbo.symbols set shortDescription = 'number four' WHERE id = 52;
update dbo.symbols set shortDescription = 'number five' WHERE id = 53;
update dbo.symbols set shortDescription = 'number six' WHERE id = 54;
update dbo.symbols set shortDescription = 'number seven' WHERE id = 55;
update dbo.symbols set shortDescription = 'number eight' WHERE id = 56;
update dbo.symbols set shortDescription = 'number nine' WHERE id = 57;

update dbo.symbols set shortDescription = 'uppercase A' WHERE id = 65;
update dbo.symbols set shortDescription = 'uppercase B' WHERE id = 66;
update dbo.symbols set shortDescription = 'uppercase C' WHERE id = 67;
update dbo.symbols set shortDescription = 'uppercase D' WHERE id = 68;
update dbo.symbols set shortDescription = 'uppercase E' WHERE id = 69;
update dbo.symbols set shortDescription = 'uppercase F' WHERE id = 70;
update dbo.symbols set shortDescription = 'uppercase G' WHERE id = 71;
update dbo.symbols set shortDescription = 'uppercase H' WHERE id = 72;
update dbo.symbols set shortDescription = 'uppercase I' WHERE id = 73;
update dbo.symbols set shortDescription = 'uppercase J' WHERE id = 74;
update dbo.symbols set shortDescription = 'uppercase K' WHERE id = 75;
update dbo.symbols set shortDescription = 'uppercase L' WHERE id = 76;
update dbo.symbols set shortDescription = 'uppercase M' WHERE id = 77;
update dbo.symbols set shortDescription = 'uppercase N' WHERE id = 78;
update dbo.symbols set shortDescription = 'uppercase O' WHERE id = 79;
update dbo.symbols set shortDescription = 'uppercase P' WHERE id = 80;
update dbo.symbols set shortDescription = 'uppercase Q' WHERE id = 81;
update dbo.symbols set shortDescription = 'uppercase R' WHERE id = 82;
update dbo.symbols set shortDescription = 'uppercase S' WHERE id = 83;
update dbo.symbols set shortDescription = 'uppercase T' WHERE id = 84;
update dbo.symbols set shortDescription = 'uppercase U' WHERE id = 85;
update dbo.symbols set shortDescription = 'uppercase V' WHERE id = 86;
update dbo.symbols set shortDescription = 'uppercase W' WHERE id = 87;
update dbo.symbols set shortDescription = 'uppercase X' WHERE id = 88;
update dbo.symbols set shortDescription = 'uppercase Y' WHERE id = 89;
update dbo.symbols set shortDescription = 'uppercase Z' WHERE id = 90;

update dbo.symbols set shortDescription = 'left square bracket' WHERE id = 91;
update dbo.symbols set shortDescription = 'back slash' WHERE id = 92;
update dbo.symbols set shortDescription = 'right square bracket' WHERE id = 93;
update dbo.symbols set shortDescription = 'circumflex accent' WHERE id = 94;
update dbo.symbols set shortDescription = 'underscore' WHERE id = 95;
update dbo.symbols set shortDescription = 'grave accent' WHERE id = 96;

update dbo.symbols set shortDescription = 'lowercase a' WHERE id = 97;
update dbo.symbols set shortDescription = 'lowercase b' WHERE id = 98;
update dbo.symbols set shortDescription = 'lowercase c' WHERE id = 99;
update dbo.symbols set shortDescription = 'lowercase d' WHERE id = 100;
update dbo.symbols set shortDescription = 'lowercase e' WHERE id = 101;
update dbo.symbols set shortDescription = 'lowercase f' WHERE id = 102;
update dbo.symbols set shortDescription = 'lowercase g' WHERE id = 103;
update dbo.symbols set shortDescription = 'lowercase h' WHERE id = 104;
update dbo.symbols set shortDescription = 'lowercase i' WHERE id = 105;
update dbo.symbols set shortDescription = 'lowercase j' WHERE id = 106;
update dbo.symbols set shortDescription = 'lowercase k' WHERE id = 107;
update dbo.symbols set shortDescription = 'lowercase l' WHERE id = 108;
update dbo.symbols set shortDescription = 'lowercase m' WHERE id = 109;
update dbo.symbols set shortDescription = 'lowercase o' WHERE id = 111;
update dbo.symbols set shortDescription = 'lowercase p' WHERE id = 112;
update dbo.symbols set shortDescription = 'lowercase q' WHERE id = 113;
update dbo.symbols set shortDescription = 'lowercase r' WHERE id = 114;
update dbo.symbols set shortDescription = 'lowercase s' WHERE id = 115;
update dbo.symbols set shortDescription = 'lowercase t' WHERE id = 116;
update dbo.symbols set shortDescription = 'lowercase u' WHERE id = 117;
update dbo.symbols set shortDescription = 'lowercase v' WHERE id = 118;
update dbo.symbols set shortDescription = 'lowercase w' WHERE id = 119;
update dbo.symbols set shortDescription = 'lowercase x' WHERE id = 120;
update dbo.symbols set shortDescription = 'lowercase y' WHERE id = 121;
update dbo.symbols set shortDescription = 'lowercase z' WHERE id = 122;

update dbo.symbols set shortDescription = 'left brace' WHERE id = 123;
update dbo.symbols set shortDescription = 'vertical bar' WHERE id = 124;
update dbo.symbols set shortDescription = 'right brace' WHERE id = 125;
update dbo.symbols set shortDescription = 'tilde' WHERE id = 126;
update dbo.symbols set shortDescription = 'delete' WHERE id = 127;

update dbo.symbols set shortDescription = 'non-breaking space' WHERE id = 160;
update dbo.symbols set shortDescription = 'inverted exclamation mark' WHERE id = 161;	 
update dbo.symbols set shortDescription = 'cent sign' WHERE id = 162;
update dbo.symbols set shortDescription = 'pound sterling' WHERE id = 163; 
update dbo.symbols set shortDescription = 'general currency' WHERE id = 164;
update dbo.symbols set shortDescription = 'yen' WHERE id = 165;
update dbo.symbols set shortDescription = 'broken vertical bar' WHERE id = 166;	 
update dbo.symbols set shortDescription = 'section sign' WHERE id = 167;
update dbo.symbols set shortDescription = 'dieresis' WHERE id = 168;
update dbo.symbols set shortDescription = 'copyright' WHERE id = 169;
update dbo.symbols set shortDescription = 'feminine ordinal' WHERE id = 170; 
update dbo.symbols set shortDescription = 'left double angle' WHERE id = 171;
update dbo.symbols set shortDescription = 'logical not' WHERE id = 172;
update dbo.symbols set shortDescription = 'soft hyphen' WHERE id = 173;
update dbo.symbols set shortDescription = 'registered trademark' WHERE id = 174;
update dbo.symbols set shortDescription = 'macron long accent' WHERE id = 175;
update dbo.symbols set shortDescription = 'degree sign' WHERE id = 176;
update dbo.symbols set shortDescription = 'plus-or-minus sign' WHERE id = 177; 	 
update dbo.symbols set shortDescription = 'superscript 2' WHERE id = 178;
update dbo.symbols set shortDescription = 'superscript 3' WHERE id = 179;
update dbo.symbols set shortDescription = 'accute accent' WHERE id = 180;
update dbo.symbols set shortDescription = 'micro sign' WHERE id = 181;
update dbo.symbols set shortDescription = 'paragraph' WHERE id = 182;	 
update dbo.symbols set shortDescription = 'middle dot' WHERE id = 183;
update dbo.symbols set shortDescription = 'cedilla' WHERE id = 184;
update dbo.symbols set shortDescription = 'superscript 1' WHERE id = 185;	 
update dbo.symbols set shortDescription = 'masculine ordinal' WHERE id = 186;
update dbo.symbols set shortDescription = 'right double angle quote' WHERE id = 187; 
update dbo.symbols set shortDescription = 'fraction 1/4' WHERE id = 188;
update dbo.symbols set shortDescription = 'fraction 1/2' WHERE id = 189;
update dbo.symbols set shortDescription = 'fraction 3/4' WHERE id = 190;
update dbo.symbols set shortDescription = 'inverted question mark' WHERE id = 191; 

update dbo.symbols set shortDescription = 'uppercase A grave' WHERE id = 192;	 
update dbo.symbols set shortDescription = 'uppercase A acute' WHERE id = 193;	 
update dbo.symbols set shortDescription = 'uppercase A circumflex' WHERE id = 194; 	 
update dbo.symbols set shortDescription = 'uppercase A tilde' WHERE id = 195;
update dbo.symbols set shortDescription = 'uppercase A dieresis' WHERE id = 196; 
update dbo.symbols set shortDescription = 'uppercase A ring' WHERE id = 197;
update dbo.symbols set shortDescription = 'uppercase AE ligature' WHERE id = 198;	 
update dbo.symbols set shortDescription = 'uppercase C cedilla' WHERE id = 199;
update dbo.symbols set shortDescription = 'uppercase E grave' WHERE id = 200;
update dbo.symbols set shortDescription = 'uppercase E acute' WHERE id = 201;
update dbo.symbols set shortDescription = 'uppercase E circumflex' WHERE id = 202; 	 
update dbo.symbols set shortDescription = 'uppercase E' WHERE id = 203;
update dbo.symbols set shortDescription = 'uppercase I grave' WHERE id = 204;
update dbo.symbols set shortDescription = 'uppercase I acute' WHERE id = 205;	 
update dbo.symbols set shortDescription = 'uppercase I circumflex' WHERE id = 206; 	 
update dbo.symbols set shortDescription = 'uppercase I' WHERE id = 207;
update dbo.symbols set shortDescription = 'uppercase ETH' WHERE id = 208; 
update dbo.symbols set shortDescription = 'uppercase N tilde' WHERE id = 209;	 
update dbo.symbols set shortDescription = 'uppercase O grave' WHERE id = 210;
update dbo.symbols set shortDescription = 'uppercase O acute' WHERE id = 211.
update dbo.symbols set shortDescription = 'uppercase O circumflex' WHERE id = 212; 	 
update dbo.symbols set shortDescription = 'uppercase O tilde' WHERE id = 213;
update dbo.symbols set shortDescription = 'uppercase O' WHERE id = 214;
update dbo.symbols set shortDescription = 'uppercase multiplication sign' WHERE id = 215;	 
update dbo.symbols set shortDescription = 'uppercase O' WHERE id = 216;
update dbo.symbols set shortDescription = 'uppercase U' WHERE id = 217;
update dbo.symbols set shortDescription = 'uppercase U acute' WHERE id = 218	 
update dbo.symbols set shortDescription = 'uppercase U circumflex' WHERE id = 219;	 
update dbo.symbols set shortDescription = 'uppercase U' WHERE id = 220;
update dbo.symbols set shortDescription = 'uppercase Y acute' WHERE id = 221;	 
update dbo.symbols set shortDescription = 'thorn' WHERE id = 222;
update dbo.symbols set shortDescription = 'lowerecase sharp' WHERE id = 223;

update dbo.symbols set shortDescription = 'lowerecase a grave' WHERE id = 224; 
update dbo.symbols set shortDescription = 'lowerecase a acute' WHERE id = 225;
update dbo.symbols set shortDescription = 'lowerecase a circumflex' WHERE id = 226; 	 
update dbo.symbols set shortDescription = 'lowerecase a tilde' WHERE id = 227;
update dbo.symbols set shortDescription = 'lowerecase a dieresis' WHERE id = 228;
update dbo.symbols set shortDescription = 'lowerecase a ring' WHERE id = 229;
update dbo.symbols set shortDescription = 'lowerecase ae ligature' WHERE id = 230; 	 
update dbo.symbols set shortDescription = 'lowerecase c cedilla' WHERE id = 231; 
update dbo.symbols set shortDescription = 'lowerecase e grave' WHERE id = 232;
update dbo.symbols set shortDescription = 'lowerecase e acute' WHERE id = 233;
update dbo.symbols set shortDescription = 'lowerecase e circumflex' WHERE id = 234; 	 
update dbo.symbols set shortDescription = 'lowerecase e dieresis' WHERE id = 235; 	 
update dbo.symbols set shortDescription = 'lowerecase i grave' WHERE id = 236;
update dbo.symbols set shortDescription = 'lowerecase i acute' WHERE id = 237;	 
update dbo.symbols set shortDescription = 'lowerecase i circumflex' WHERE id = 238;	 
update dbo.symbols set shortDescription = 'lowerecase i dieresis' WHERE id = 239;
update dbo.symbols set shortDescription = 'lowerecase eth' WHERE id = 240;
update dbo.symbols set shortDescription = 'lowerecase n tildev' WHERE id = 241;	 
update dbo.symbols set shortDescription = 'lowerecase o grave' WHERE id = 242;
update dbo.symbols set shortDescription = 'lowerecase o acute' WHERE id = 243; 
update dbo.symbols set shortDescription = 'lowerecase o circumflex	' WHERE id = 244;  
update dbo.symbols set shortDescription = 'lowerecase o tilde' WHERE id = 245;
update dbo.symbols set shortDescription = 'lowerecase o dieresis' WHERE id = 246;
update dbo.symbols set shortDescription = 'division sign' WHERE id = 247;
update dbo.symbols set shortDescription = 'lowerecase o slash' WHERE id = 248; 	 
update dbo.symbols set shortDescription = 'lowerecase u grave' WHERE id = 249;
update dbo.symbols set shortDescription = 'lowerecase u acute' WHERE id = 250;
update dbo.symbols set shortDescription = 'lowerecase u circumflex' WHERE id = 251; 	 
update dbo.symbols set shortDescription = 'lowerecase u dieresis' WHERE id = 252;
update dbo.symbols set shortDescription = 'lowerecase y acute' WHERE id = 253;
update dbo.symbols set shortDescription = 'lowerecase thorn' WHERE id = 254;
update dbo.symbols set shortDescription = 'lowerecase y dieresis' WHERE id = 255; 
GO
