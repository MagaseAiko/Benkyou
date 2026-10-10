G = [
dict(
n=11,
jp="〜だけに",
rd="dake ni",
tr="Justamente por / Exatamente porque / Como era de se esperar",
ex="""だけに é usado para dizer que, justamente por causa de uma condição ou situação, o resultado é especialmente intenso. Equivale a "justamente por", "exatamente porque" ou "como era de se esperar de".

Ele tem dois tons principais.

O primeiro é de expectativa correspondida, parecido com だけあって: "por ter muita experiência, ele trabalha rápido".

O segundo, muito comum, é de intensificação de um sentimento: justamente porque havia expectativa ou esforço, a decepção ou a alegria é maior. Por exemplo, "justamente por ter esperado tanto, fiquei decepcionado" ou "justamente por ter me preparado tanto, a frustração de errar foi grande".

Diferente de だけあって, que é quase sempre positivo, だけに pode ter tom positivo ou negativo.""",
st="""Verbo / Adjetivo (forma simples) + だけに、 + Resultado intensificado
Adjetivo な + な + だけに
Substantivo + だけに / であるだけに""",
no="""Com sentimentos negativos, だけに aparece muito com 残念, がっかり e 悔しい.

A frase だけに… sozinha às vezes é usada de forma humorística, depois de um trocadilho.

Comparando: だけあって = "faz jus a"; だけに = "justamente por isso, ainda mais".""",
bf="だけに",
rx="だけに",
tk=["だけ", "に"],
va=["だけに"],
E=[
("期待していただけに、がっかりした。", "きたいしていただけに、がっかりした。", "Justamente por ter tanta expectativa, fiquei decepcionado."),
("彼は経験が長いだけに、仕事が速い。", "かれはけいけんがながいだけに、しごとがはやい。", "Justamente por ter muita experiência, ele trabalha rápido."),
("有名な店だけに、値段も高い。", "ゆうめいなみせだけに、ねだんもたかい。", "Como era de se esperar de uma loja famosa, o preço também é alto."),
("一生懸命準備しただけに、失敗して悔しい。", "いっしょうけんめいじゅんびしただけに、しっぱいしてくやしい。", "Justamente por ter me preparado tanto, a frustração de errar é grande."),
("若いだけに、回復が早い。", "わかいだけに、かいふくがはやい。", "Justamente por ser jovem, a recuperação é rápida."),
],
R=[
("ずっと楽しみにしていた____、中止になって残念だ。", "Justamente por estar esperando tanto, que pena que foi cancelado.", ["だけに"]),
("彼は医者の息子な____、体のことに詳しい。", "Justamente por ser filho de médico, ele entende bem de saúde.", ["だけに"]),
("高かった____、壊れてショックだ。", "Justamente por ter sido caro, fiquei chocado quando quebrou.", ["だけに"]),
("毎日練習した____、勝ててうれしい。", "Justamente por ter treinado todo dia, estou feliz por ter vencido.", ["だけに"]),
("人気のある店な____、予約が取りにくい。", "Como era de se esperar de uma loja popular, é difícil conseguir reserva.", ["だけに"]),
],
),
dict(
n=12,
jp="〜だけのことはある",
rd="dake no koto wa aru",
tr="Faz jus a / Vale o que / Não é à toa que",
ex="""だけのことはある é usado para dizer que um resultado bom faz jus à condição, ao esforço ou ao preço. Equivale a "faz jus a", "vale o que..." ou "não é à toa que".

A ideia é que a qualidade observada corresponde exatamente ao que se esperava, ou ao que foi investido. Por exemplo, "este hotel faz jus ao preço: o serviço é ótimo" ou "não é à toa que treinou dez anos".

Ela fica geralmente no final da frase. Com て (だけのことはあって), liga-se à avaliação que vem em seguida.

O sentido é muito parecido com だけあって, mas だけのことはある costuma aparecer no fim da frase, como uma conclusão de admiração. さすが combina muito com essa expressão.""",
st="""Verbo / Adjetivo (forma simples) + だけのことはある
Substantivo + だけのことはある
… + だけのことはあって、 + Avaliação positiva
さすが + … + だけのことはある""",
no="""O tom é sempre positivo, de admiração ou elogio.

É comum depois de uma constatação: primeiro a pessoa vê o resultado, depois diz だけのことはある.

Em avaliações de produtos caros, 高いだけのことはある ("vale o preço") é muito comum.""",
bf="だけのことはある",
rx="だけのことはあ",
tk=["だけ", "の", "こと", "は", "ある"],
va=["だけのことはある", "だけのことはあって", "だけのことはあります"],
E=[
("このホテルは高いだけのことはある。サービスが最高だ。", "このホテルはたかいだけのことはある。サービスがさいこうだ。", "Este hotel faz jus ao preço. O serviço é ótimo."),
("すごい演奏だ。さすが十年も練習しただけのことはある。", "すごいえんそうだ。さすがじゅうねんもれんしゅうしただけのことはある。", "Que apresentação incrível. Não é à toa que treinou dez anos."),
("有名な店だけのことはあって、とてもおいしい。", "ゆうめいなみせだけのことはあって、とてもおいしい。", "Faz jus à fama da loja: é muito gostoso."),
("苦労しただけのことはあって、いい結果が出た。", "くろうしただけのことはあって、いいけっかがでた。", "Valeu todo o esforço: o resultado foi bom."),
("見事なプレーだった。彼はプロだけのことはある。", "みごとなプレーだった。かれはプロだけのことはある。", "Foi uma jogada brilhante. Não é à toa que ele é profissional."),
],
R=[
("この料理はおいしい。一流のシェフが作った____。", "Esta comida é deliciosa. Faz jus a ter sido feita por um chef de primeira.", ["だけのことはある"]),
("彼女の英語は上手だ。アメリカに住んでいた____。", "O inglês dela é ótimo. Não é à toa que morou nos Estados Unidos.", ["だけのことはある"]),
("景色が素晴らしい。三時間も山を登った____。", "A paisagem é maravilhosa. Valeu as três horas de subida.", ["だけのことはある"]),
("この時計は丈夫だ。高かった____。", "Este relógio é resistente. Faz jus ao preço que paguei.", ["だけのことはある"]),
("よく覚えているね。毎日勉強している____。", "Você lembra muito bem, hein. Não é à toa que estuda todo dia.", ["だけのことはある"]),
],
),
dict(
n=13,
jp="〜だけは",
rd="dake wa",
tr="Pelo menos / Ao menos isso / Só isso (não)",
ex="""だけは é usado para destacar uma única coisa como exceção ou como o mínimo garantido. Equivale a "pelo menos", "ao menos isso" ou "só isso".

Ele tem alguns usos principais:
• Destacar a única qualidade positiva: "ele não vai bem nos estudos, mas pelo menos é bom em esportes".
• Pedir ou proibir algo com ênfase: "isso, pelo menos, não esqueça" ou "só mentir eu não perdoo".
• Garantir o mínimo: "não sei o resultado, mas pelo menos fiz tudo o que podia" (やるだけはやった).

A ideia é: "o resto pode ser como for, mas isso aqui é diferente".""",
st="""Substantivo + だけは + Frase
これ / それ + だけは + Pedido / Proibição
Verbo + だけは + Verbo (pelo menos fazer o máximo)
Verbo + ことだけは + Frase""",
no="""だけは é diferente de だけ (só). だけは destaca uma exceção em contraste com o resto.

Em pedidos, これだけはお願いします significa "pelo menos isto, por favor".

A forma やるだけはやった é comum para mostrar que a pessoa deu o seu máximo.""",
bf="だけは",
rx="だけは",
tk=["だけ", "は"],
va=["だけは"],
E=[
("これだけは忘れないでください。", "これだけはわすれないでください。", "Isso, pelo menos, não esqueça."),
("彼は勉強はできないが、スポーツだけは得意だ。", "かれはべんきょうはできないが、スポーツだけはとくいだ。", "Ele não vai bem nos estudos, mas pelo menos é bom em esportes."),
("お金はないが、時間だけはある。", "おかねはないが、じかんだけはある。", "Não tenho dinheiro, mas tempo, pelo menos, eu tenho."),
("試験の結果はわからないが、やるだけはやった。", "しけんのけっかはわからないが、やるだけはやった。", "Não sei o resultado da prova, mas pelo menos fiz tudo o que podia."),
("嘘をつくことだけは許せない。", "うそをつくことだけはゆるせない。", "Só mentir eu não perdoo."),
],
R=[
("料理は苦手だが、カレー____作れる。", "Não sou bom na cozinha, mas curry, pelo menos, eu sei fazer.", ["だけは"]),
("このこと____誰にも言わないで。", "Isso, pelo menos, não conte a ninguém.", ["だけは"]),
("体力はないけど、元気____ある。", "Não tenho muita força física, mas pelo menos tenho energia.", ["だけは"]),
("他のことはいいが、遅刻____しないでください。", "O resto tudo bem, mas atrasos, pelo menos, não admito.", ["だけは"]),
("できることはやった。準備____十分した。", "Fiz o que pude. A preparação, pelo menos, foi suficiente.", ["だけは"]),
],
),
dict(
n=14,
jp="だって",
rd="datte",
tr="Mas é que / Porque / Até mesmo / Também",
ex="""だって é uma palavra casual com dois usos principais.

O primeiro, no começo da frase, é dar uma desculpa ou justificativa, como "mas é que..." ou "porque...". É muito comum em respostas a perguntas como "por quê?", principalmente entre crianças e pessoas próximas. Muitas vezes, a frase termina com もん ou もの, que reforçam o tom de justificativa.

O segundo, depois de substantivos, significa "até mesmo" ou "também", como uma forma casual de でも ou も. Por exemplo, "até uma criança entende isso" ou "eu também queria ir".

Com palavras interrogativas, como いつ e 誰, だって significa "qualquer": いつだって (a qualquer hora, sempre), 誰だって (qualquer pessoa).""",
st="""だって、 + Justificativa + もん / もの (desculpa)
Substantivo + だって (até mesmo / também)
Palavra interrogativa + だって (qualquer: いつだって / 誰だって)""",
no="""だって no começo da frase pode soar infantil ou teimoso se usado demais.

Em situações formais, use でも ou なぜなら no lugar de だって.

Não confunda com たって (mesmo que), que vem depois de verbos na forma た.""",
bf="だって",
rx="だって",
tk=["だって"],
va=["だって"],
E=[
("だって、知らなかったんだもん。", "だって、しらなかったんだもん。", "Mas é que eu não sabia!"),
("そんなこと、子供だってわかる。", "そんなこと、こどもだってわかる。", "Uma coisa dessas, até uma criança entende."),
("私だって、行きたかったよ。", "わたしだって、いきたかったよ。", "Eu também queria ir, sabia?"),
("「どうして食べないの？」「だって、おいしくないんだもん。」", "「どうしてたべないの？」「だって、おいしくないんだもん。」", "\"Por que você não come?\" \"Porque não está gostoso!\""),
("いつだって、君の味方だよ。", "いつだって、きみのみかただよ。", "Sempre vou estar do seu lado."),
],
R=[
("「なんで遅れたの？」「____、電車が止まったんだもん。」", "\"Por que você se atrasou?\" \"Mas é que o trem parou!\"", ["だって"]),
("先生____、間違えることはある。", "Até os professores às vezes erram.", ["だって"]),
("私____、そのくらいできるよ。", "Até eu consigo fazer isso.", ["だって"]),
("誰____、失敗はする。", "Qualquer pessoa erra.", ["だって"]),
("「早く寝なさい。」「____、まだ眠くないんだもん。」", "\"Vá dormir.\" \"Mas é que ainda não estou com sono!\"", ["だって"]),
],
),
dict(
n=15,
jp="〜でしかない",
rd="de shika nai",
tr="Não passa de / É apenas / Não é mais do que",
ex="""でしかない é usado para dizer que algo não passa de uma coisa simples ou de pouco valor. Equivale a "não passa de", "é apenas" ou "não é mais do que".

Ele vem diretamente depois de substantivos. A ideia é diminuir a importância daquilo, mostrando que é só aquilo e nada mais.

Por exemplo, "isso não passa de uma desculpa" ou "eu sou apenas um estudante".

O tom pode ser de crítica ("é só um boato"), de modéstia ("sou apenas um funcionário") ou de avaliação realista ("dinheiro é apenas uma ferramenta").

O sentido é parecido com にすぎない, que também aparece no N2.""",
st="""Substantivo + でしかない
Substantivo + でしかありません (educado)
Passado: でしかなかった""",
no="""でしかない é um pouco mais forte e expressivo que にすぎない.

É comum em reflexões e opiniões, como em ensaios e discursos.

Também aparece em frases de modéstia sobre a própria posição: 私は一社員でしかない.""",
bf="でしかない",
rx="でしかない|でしかありません|でしかなかった",
tk=["で", "しか", "ない"],
va=["でしかない", "でしかありません", "でしかなかった"],
E=[
("それは言い訳でしかない。", "それはいいわけでしかない。", "Isso não passa de uma desculpa."),
("私はただの学生でしかない。", "わたしはただのがくせいでしかない。", "Eu sou apenas um estudante."),
("彼の話は噂でしかない。", "かれのはなしはうわさでしかない。", "O que ele diz não passa de boato."),
("あの頃、この計画は夢でしかなかった。", "あのころ、このけいかくはゆめでしかなかった。", "Naquela época, este plano não passava de um sonho."),
("お金は道具でしかない。", "おかねはどうぐでしかない。", "O dinheiro não é mais do que uma ferramenta."),
],
R=[
("証拠がないなら、それは君の想像____。", "Se não há provas, isso não passa de imaginação sua.", ["でしかない"]),
("私は一社員____から、決める権利はない。", "Sou apenas um funcionário, então não tenho o direito de decidir.", ["でしかない"]),
("彼にとって、仕事はお金を稼ぐ手段____。", "Para ele, o trabalho não passa de um meio para ganhar dinheiro.", ["でしかない"]),
("その考えはすばらしいが、理想____。", "Essa ideia é maravilhosa, mas não passa de um ideal.", ["でしかない"]),
("子供のころ、優勝は夢____と思っていた。", "Quando criança, eu achava que ser campeão não passava de um sonho.", ["でしかない"]),
],
),
dict(
n=16,
jp="〜どころではない",
rd="dokoro de wa nai",
tr="Não é hora para / Não dá nem para pensar em / Longe de",
ex="""どころではない é usado para dizer que, por causa de uma situação difícil, não há condições de fazer algo. Equivale a "não é hora para", "não dá nem para pensar em" ou "longe de".

A primeira parte da frase costuma explicar o problema (estar ocupado, doente, sem dinheiro), e どころではない mostra o que fica impossível ou fora de questão por causa disso.

Por exemplo, "estou tão ocupado que viajar está fora de questão" ou "estava com febre, então estudar não dava nem para pensar".

Ele vem depois de substantivos e de verbos na forma de dicionário.

Na fala, どころではない costuma virar どころじゃない.""",
st="""Substantivo + どころではない
Verbo na forma de dicionário + どころではない

Educado: どころではありません
Passado: どころではなかった
Fala: どころじゃない""",
no="""どころではない é diferente de どころか. どころではない indica que algo é impossível na situação; どころか indica que a realidade é o oposto ou muito mais extrema.

O tom costuma ser de estresse ou urgência.

É muito usado em conversas sobre trabalho e problemas pessoais.""",
bf="どころではない",
rx="どころではない|どころじゃない|どころではありません|どころではなかった|どころじゃなかった",
tk=["どころ", "では", "ない"],
va=["どころではない", "どころじゃない", "どころではありません", "どころではなかった"],
E=[
("忙しくて、旅行どころではない。", "いそがしくて、りょこうどころではない。", "Estou tão ocupado que viajar está fora de questão."),
("明日は試験だから、遊ぶどころではない。", "あしたはしけんだから、あそぶどころではない。", "Amanhã tem prova, então não é hora para se divertir."),
("熱があって、勉強どころではなかった。", "ねつがあって、べんきょうどころではなかった。", "Estava com febre, então estudar não dava nem para pensar."),
("お金がなくて、結婚どころじゃない。", "おかねがなくて、けっこんどころじゃない。", "Estou sem dinheiro, então casamento nem pensar."),
("歯が痛くて、食事どころではありません。", "はがいたくて、しょくじどころではありません。", "Estou com tanta dor de dente que comer está fora de questão."),
],
R=[
("仕事が山ほどあって、休み____。", "Tenho uma montanha de trabalho, então nem dá para pensar em folga.", ["どころではない", "どころじゃない"]),
("子供が泣いていて、テレビを見る____。", "A criança está chorando, então não é hora de ver TV.", ["どころではない", "どころじゃない"]),
("事故があって、パーティー____。", "Houve um acidente, então a festa ficou fora de questão.", ["どころではなかった", "どころじゃなかった"]),
("借金があって、旅行____。", "Tenho dívidas, então viajar nem pensar.", ["どころじゃない", "どころではない"]),
("外は寒すぎて、散歩____。", "Lá fora está frio demais, então passear está fora de questão.", ["どころではない", "どころじゃない"]),
],
),
dict(
n=17,
jp="〜どころか",
rd="dokoro ka",
tr="Longe de / Muito pelo contrário / Nem sequer",
ex="""どころか é usado para dizer que a realidade é muito diferente do esperado, geralmente o oposto ou algo ainda mais extremo. Equivale a "longe de", "muito pelo contrário" ou "nem sequer".

Ele tem dois usos principais.

O primeiro é contradizer a expectativa, mostrando o oposto: "longe de pedir desculpas, ele ficou bravo" ou "a chuva, longe de parar, ficou ainda mais forte".

O segundo é intensificar uma negação: "não sei escrever nem hiragana, quanto mais kanji" (漢字どころか、ひらがなも書けない). A coisa mais difícil vem antes de どころか, e a mais simples, depois.

Ele vem depois de substantivos e da forma simples de verbos e adjetivos.""",
st="""Substantivo + どころか、 + Oposto / Algo mais extremo
Verbo / Adjetivo (forma simples) + どころか
A + どころか、 + B + も / さえ + Negativo (nem B, quanto mais A)""",
no="""どころか expressa surpresa ou frustração porque a realidade foi o contrário do esperado.

Compare com どころではない, que indica que algo está fora de questão por causa da situação.

É muito usado em conversas e textos para enfatizar contrastes fortes.""",
bf="どころか",
rx="どころか",
tk=["どころ", "か"],
va=["どころか"],
E=[
("彼は謝るどころか、怒り出した。", "かれはあやまるどころか、おこりだした。", "Longe de pedir desculpas, ele começou a ficar bravo."),
("雨はやむどころか、ますます強くなった。", "あめはやむどころか、ますますつよくなった。", "A chuva, longe de parar, ficou cada vez mais forte."),
("今月は貯金どころか、借金がある。", "こんげつはちょきんどころか、しゃっきんがある。", "Este mês, longe de economizar, estou com dívidas."),
("彼は漢字どころか、ひらがなも書けない。", "かれはかんじどころか、ひらがなもかけない。", "Ele não sabe escrever nem hiragana, quanto mais kanji."),
("薬を飲んだら、よくなるどころか悪くなった。", "くすりをのんだら、よくなるどころかわるくなった。", "Tomei o remédio e, muito pelo contrário, piorei."),
],
R=[
("彼は手伝う____、邪魔ばかりする。", "Longe de ajudar, ele só atrapalha.", ["どころか"]),
("彼は英語____、日本語も話せない。", "Ele não fala nem japonês, quanto mais inglês.", ["どころか"]),
("ダイエットをしたのに、痩せる____、太ってしまった。", "Fiz dieta e, longe de emagrecer, acabei engordando.", ["どころか"]),
("親切にしたのに、感謝される____、怒られた。", "Fui gentil e, muito pelo contrário de ser agradecido, levei bronca.", ["どころか"]),
("最近は休み____、毎日残業している。", "Ultimamente, longe de ter folga, faço hora extra todo dia.", ["どころか"]),
],
),
dict(
n=18,
jp="どうやら",
rd="dou yara",
tr="Parece que / Pelo visto / Ao que tudo indica",
ex="""どうやら é um advérbio usado para fazer uma suposição com base no que se observa ou se percebe. Equivale a "parece que", "pelo visto" ou "ao que tudo indica".

Ele quase sempre aparece junto com らしい, ようだ, みたいだ ou そうだ no final da frase, reforçando a ideia de suposição.

Por exemplo, "pelo visto vai chover" ou "parece que errei o caminho".

O tom é de alguém chegando a uma conclusão aos poucos, a partir de pistas. Às vezes, também expressa alívio, como em "parece que vou conseguir chegar a tempo".""",
st="""どうやら + … + らしい / ようだ / みたいだ / そうだ""",
no="""どうやら é parecido com たぶん (provavelmente), mas どうやら se baseia mais em evidências observadas.

Sem らしい ou ようだ no fim, どうやら soa incompleto.

É muito comum em narrativas e em monólogos internos.""",
bf="どうやら",
rx="どうやら",
tk=["どうやら"],
va=["どうやら"],
E=[
("空が暗くなってきた。どうやら雨が降りそうだ。", "そらがくらくなってきた。どうやらあめがふりそうだ。", "O céu está escurecendo. Pelo visto vai chover."),
("どうやら彼は来ないらしい。", "どうやらかれはこないらしい。", "Ao que tudo indica, ele não vem."),
("この景色は初めてだ。どうやら道を間違えたようだ。", "このけしきははじめてだ。どうやらみちをまちがえたようだ。", "Nunca vi esta paisagem. Parece que errei o caminho."),
("喉が痛い。どうやら風邪をひいたみたいだ。", "のどがいたい。どうやらかぜをひいたみたいだ。", "Estou com dor de garganta. Pelo visto peguei um resfriado."),
("急いだので、どうやら試験に間に合いそうだ。", "いそいだので、どうやらしけんにまにあいそうだ。", "Corri, então parece que vou chegar a tempo para a prova."),
],
R=[
("ポケットにない。____、財布を家に忘れてきたようだ。", "Não está no bolso. Pelo visto esqueci a carteira em casa.", ["どうやら"]),
("返事がない。____彼女は怒っているらしい。", "Ela não responde. Ao que tudo indica, está brava.", ["どうやら"]),
("空が明るくなってきた。____雪がやみそうだ。", "O céu está clareando. Parece que a neve vai parar.", ["どうやら"]),
("シャッターが閉まっている。____この店は今日休みのようだ。", "A porta de aço está fechada. Pelo visto esta loja está fechada hoje.", ["どうやら"]),
("みんなが言っているから、____彼の話は本当らしい。", "Todos estão dizendo, então ao que tudo indica a história dele é verdade.", ["どうやら"]),
],
),
dict(
n=19,
jp="どうせ",
rd="douse",
tr="De qualquer jeito / Já que vai / De todo modo",
ex="""どうせ é um advérbio que expressa a ideia de que o resultado já está decidido e não vai mudar. Ele tem dois tons principais.

O primeiro é de resignação ou pessimismo: "de qualquer jeito, não vai dar tempo", "de todo modo, eu não consigo", "ele não vem mesmo". Muitas vezes, mostra desânimo ou falta de esperança.

O segundo é mais positivo, com なら: どうせ〜なら significa "já que vai... de qualquer jeito, então...". Por exemplo, "já que vou comprar, quero algo bom" ou "já que vamos fazer, vamos fazer com alegria".

Por isso, どうせ pode soar negativo ou motivador, dependendo da frase.""",
st="""どうせ + Frase (resignação / pessimismo)
どうせ + Verbo + なら、 + Decisão (já que vai...)
どうせ + … + から、 + …""",
no="""Usar どうせ demais, principalmente sobre si mesmo, pode soar autodepreciativo, como どうせ私なんか.

どうせ〜なら é uma expressão muito comum para tirar o melhor proveito de algo inevitável.

Comparado a どちらにしても (de qualquer forma), どうせ é mais emocional.""",
bf="どうせ",
rx="どうせ",
tk=["どうせ"],
va=["どうせ"],
E=[
("どうせ間に合わないから、ゆっくり行こう。", "どうせまにあわないから、ゆっくりいこう。", "De qualquer jeito não vai dar tempo, então vamos com calma."),
("どうせ私には無理だ。", "どうせわたしにはむりだ。", "De todo modo, isso é impossível para mim."),
("どうせ買うなら、いい物を買いたい。", "どうせかうなら、いいものをかいたい。", "Já que vou comprar mesmo, quero algo bom."),
("待っても無駄だよ。どうせ彼は来ないよ。", "まってもむだだよ。どうせかれはこないよ。", "Não adianta esperar. Ele não vem mesmo."),
("どうせやるなら、楽しくやろう。", "どうせやるなら、たのしくやろう。", "Já que vamos fazer, vamos fazer com alegria."),
],
R=[
("____失敗するなら、挑戦してみよう。", "Se é para fracassar de qualquer jeito, vamos pelo menos tentar.", ["どうせ"]),
("____言っても、彼は聞かない。", "De qualquer jeito, mesmo que eu fale, ele não escuta.", ["どうせ"]),
("____行くなら、早く行こう。", "Já que vamos mesmo, vamos logo.", ["どうせ"]),
("____私なんか、誰も気にしない。", "De qualquer jeito, ninguém liga para mim.", ["どうせ"]),
("____雨で出かけられないから、家で映画を見よう。", "Já que não dá para sair com essa chuva, vamos ver um filme em casa.", ["どうせ"]),
],
),
dict(
n=20,
jp="〜得ない",
rd="enai / uenai",
tr="Ser impossível / Não poder / Não haver como",
ex="""得ない é usado para dizer que algo é impossível ou não pode acontecer. Equivale a "ser impossível", "não poder" ou "não haver como".

Ele vem depois do verbo na forma ます sem ます. É a forma negativa de 得る (ser possível), que aparece no próximo item.

A forma mais conhecida é あり得ない (ありえない), que significa "é impossível", "não pode ser" e é muito usada na fala, inclusive como expressão de choque: "não acredito!".

Em outros verbos, 得ない soa formal e escrito, como em 理解し得ない (não é possível compreender) ou 想像し得ない (inimaginável).

A leitura costuma ser えない. Em textos formais, うる / うない também aparecem em algumas formas.""",
st="""Verbo na forma ます sem ます + 得ない (えない)
ある → あり得ない (impossível)
する → し得ない

Educado: 得ません
Escrita: 得ない / えない""",
no="""ありえない é muito comum entre jovens para expressar indignação ou surpresa: "isso é absurdo!".

Não confunda com ざるを得ない (não ter escolha a não ser), que é outra gramática do N2.

Fora de あり得ない, 得ない aparece principalmente em textos formais.""",
bf="得ない",
rx="得ない|えない|得ません",
tk=["得ない"],
va=["得ない", "えない", "あり得ない", "得ません"],
E=[
("そんなことはあり得ない。", "そんなことはありえない。", "Isso é impossível."),
("彼が犯人だなんて、考え得ない。", "かれがはんにんだなんて、かんがええない。", "É impossível pensar que ele seja o culpado."),
("この問題は一人では解決し得ない。", "このもんだいはひとりではかいけつしえない。", "Este problema não pode ser resolvido por uma pessoa sozinha."),
("人間の想像し得ないことが起きた。", "にんげんのそうぞうしえないことがおきた。", "Aconteceu algo que ninguém poderia imaginar."),
("彼の行動は理解し得ない。", "かれのこうどうはりかいしえない。", "O comportamento dele é impossível de compreender."),
],
R=[
("彼女がうそをつくなんて、あり____。", "Ela mentir? Isso é impossível.", ["得ない", "えない"]),
("安全対策をしたので、このような事故は二度と起こり____。", "Tomamos medidas de segurança, então um acidente desses não pode acontecer de novo.", ["得ない"]),
("子供には理解し____内容だ。", "É um conteúdo impossível de compreender para crianças.", ["得ない"]),
("それは想像し____ほどの美しさだった。", "Era de uma beleza inimaginável.", ["得ない"]),
("一日でこの量を終わらせることはあり____。", "Terminar esta quantidade em um dia é impossível.", ["得ない", "えない"]),
],
),
]
