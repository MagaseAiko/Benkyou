G = [
dict(
n=231,
jp="〜ってば / 〜ったら",
rd="tteba / ttara",
tr="Já disse / Ora essa / Puxa",
ex="""ってば e ったら são partículas coloquiais usadas no fim da frase ou depois de um nome. Têm dois usos principais.

O primeiro, no fim da frase, mostra impaciência porque a pessoa já disse algo e o outro não escuta. Equivale a "já disse!" ou "estou falando!". Por exemplo, "já disse que estou bem!".

O segundo, depois de um nome, mostra irritação, surpresa ou carinho em relação à pessoa. Equivale a "ora essa" ou "puxa". Por exemplo, "puxa, minha mãe esqueceu de novo".""",
st="""Frase + ってば / ったら
Substantivo (pessoa) + ったら / ってば + Frase""",
no="""São usados apenas em conversas informais com pessoas próximas.

ったら depois de um nome é parecido com ときたら, mas soa mais leve.""",
bf="ってば",
rx="ってば|ったら",
tk=["ってば"],
va=["ってば", "ったら"],
E=[
("大丈夫だってば。心配しないで。", "だいじょうぶだってば。しんぱいしないで。", "Já disse que estou bem. Não se preocupe."),
("早くしてってば。", "はやくしてってば。", "Anda logo, estou falando!"),
("お母さんったら、また鍵を忘れたの？", "おかあさんったら、またかぎをわすれたの？", "Puxa, mãe, esqueceu a chave de novo?"),
("もう、あなたったら。", "もう、あなたったら。", "Ora essa, você hein."),
("行かないってば。何度言ったらわかるの。", "いかないってば。なんどいったらわかるの。", "Já disse que não vou. Quantas vezes vou ter que repetir?"),
],
R=[
("知らない____。本当だよ。", "Já disse que não sei. É verdade.", ["ってば"]),
("もう寝る____。", "Já disse que vou dormir.", ["ってば"]),
("うちの犬____、またスリッパをかんでいる。", "Puxa, nosso cachorro está mordendo o chinelo de novo.", ["ったら", "ってば"]),
("ねえ、聞いてる____。", "Ei, está me ouvindo ou não?", ["ってば", "ったら"]),
("お父さん____、また同じ話をしている。", "Ora essa, o papai está contando a mesma história de novo.", ["ったら", "ってば"]),
],
),
dict(
n=232,
jp="〜うちに入らない",
rd="uchi ni hairanai",
tr="Não conta como / Nem dá para chamar de / Não chega a ser",
ex="""うちに入らない indica que algo é tão pequeno ou simples que nem merece ser considerado como aquilo. Equivale a "não conta como" ou "nem dá para chamar de".

A pessoa minimiza algo, muitas vezes por modéstia ou comparação. Por exemplo, "correr cinco minutos nem conta como exercício".

É uma expressão comum na fala.""",
st="""Substantivo + のうちに入らない
Verbo (forma dicionário) + うちに入らない""",
no="""É parecido com とは言えない.

Muitas vezes vem com expressões como こんなの ou これくらい.""",
bf="うちに入らない",
rx="うちに入らない|うちにはいらない|うちに入りません",
tk=["うち", "に", "入らない"],
va=["うちに入らない", "うちに入りません"],
E=[
("五分歩くだけでは、運動のうちに入らない。", "ごふんあるくだけでは、うんどうのうちにはいらない。", "Andar só cinco minutos nem conta como exercício."),
("これくらいの雨は、雨のうちに入らない。", "これくらいのあめは、あめのうちにはいらない。", "Uma chuva dessas nem dá para chamar de chuva."),
("一時間の残業なんて、残業のうちに入らないよ。", "いちじかんのざんぎょうなんて、ざんぎょうのうちにはいらないよ。", "Uma hora extra nem conta como hora extra."),
("私の料理は、料理のうちに入りません。", "わたしのりょうりは、りょうりのうちにはいりません。", "O que eu faço nem dá para chamar de culinária."),
("少し話しただけで、知り合いのうちに入らない。", "すこしはなしただけで、しりあいのうちにはいらない。", "Só conversamos um pouco, não chega a ser um conhecido."),
],
R=[
("この程度の寒さは、寒さの____。", "Um frio desses nem conta como frio.", ["うちに入らない", "うちに入りません"]),
("十分の勉強なんて、勉強の____。", "Dez minutos de estudo nem dá para chamar de estudo.", ["うちに入らない", "うちに入りません"]),
("こんなけがは、けがの____よ。", "Um machucado desses nem conta como machucado.", ["うちに入らない"]),
("一回会っただけでは、友達の____。", "Ter se encontrado uma vez só não chega a ser amizade.", ["うちに入らない", "うちに入りません"]),
("このくらいの量は、食べた____。", "Uma quantidade dessas nem conta como ter comido.", ["うちに入らない", "うちに入りません"]),
],
),
dict(
n=233,
jp="〜わ",
rd="wa",
tr="Viu / Hein / Ora",
ex="""わ, no fim da frase, é uma partícula que dá ênfase leve ou mostra emoção, como surpresa ou decisão. Equivale a "viu", "hein" ou "ora".

No japonês padrão, é usada principalmente por mulheres, de forma suave. No dialeto de Kansai, é usada por todos, com um tom mais forte.

Também aparece como わよ e わね, para chamar a atenção do outro ou buscar concordância.""",
st="""Frase (forma simples) + わ
Frase + わよ / わね""",
no="""No japonês padrão, soa feminino e um pouco antiquado.

No dialeto de Kansai, é muito comum, como em 行くわ ou ええわ.

Não se usa em situações formais.""",
bf="わ",
rx="わ。|わよ|わね",
tk=["わ"],
va=["わ", "わよ", "わね"],
E=[
("もう帰るわ。", "もうかえるわ。", "Já vou embora, viu."),
("この服、すてきだわ。", "このふく、すてきだわ。", "Esta roupa é linda, hein."),
("私も行きたいわね。", "わたしもいきたいわね。", "Eu também quero ir, né."),
("それは知らなかったわ。", "それはしらなかったわ。", "Isso eu não sabia, ora."),
("早く来ないと、置いていくわよ。", "はやくこないと、おいていくわよ。", "Se não vier logo, vou te deixar para trás, viu."),
],
R=[
("今日はとても疲れた____。", "Hoje estou muito cansada, viu.", ["わ"]),
("あら、雨が降ってきた____。", "Ah, começou a chover, hein.", ["わ"]),
("この料理、おいしい____ね。", "Esta comida está gostosa, né.", ["わ"]),
("遅れたら、先生に怒られる____よ。", "Se se atrasar, o professor vai brigar, viu.", ["わ"]),
("じゃあ、私が行く____。", "Então eu vou, ora.", ["わ"]),
],
),
dict(
n=234,
jp="〜はどうであれ",
rd="wa dou de are",
tr="Seja como for / Independentemente de / Não importa como",
ex="""はどうであれ indica que, não importa como algo seja, a conclusão não muda. Equivale a "seja como for" ou "independentemente de".

A pessoa deixa de lado um aspecto para destacar outro mais importante. Por exemplo, "independentemente do resultado, você se esforçou muito".

É uma expressão formal.""",
st="""Substantivo + はどうであれ
Substantivo + がどうであれ""",
no="""É parecido com はともかく e に関わらず.

Expressões comuns são 結果はどうであれ, 理由はどうであれ e 事情はどうであれ.""",
bf="はどうであれ",
rx="はどうであれ|がどうであれ|はどうあれ",
tk=["は", "どう", "で", "あれ"],
va=["はどうであれ", "がどうであれ"],
E=[
("結果はどうであれ、よく頑張った。", "けっかはどうであれ、よくがんばった。", "Seja qual for o resultado, você se esforçou muito."),
("理由はどうであれ、暴力は許されない。", "りゆうはどうであれ、ぼうりょくはゆるされない。", "Independentemente do motivo, a violência não é perdoável."),
("他人がどうであれ、自分は自分の道を行く。", "たにんがどうであれ、じぶんはじぶんのみちをいく。", "Não importa como os outros sejam, eu sigo o meu caminho."),
("事情はどうであれ、約束は守るべきだ。", "じじょうはどうであれ、やくそくはまもるべきだ。", "Sejam quais forem as circunstâncias, deve-se cumprir a promessa."),
("見た目はどうであれ、味はいい。", "みためはどうであれ、あじはいい。", "Não importa a aparência, o sabor é bom."),
],
R=[
("動機____、彼のしたことは正しい。", "Seja qual for a motivação, o que ele fez está certo.", ["はどうであれ"]),
("周りの意見____、私は自分で決める。", "Não importa a opinião dos outros, eu decido sozinho.", ["はどうであれ"]),
("過去____、大切なのは今だ。", "Seja como for o passado, o importante é o agora.", ["はどうであれ"]),
("形____、気持ちが大切だ。", "Independentemente da forma, o que importa é a intenção.", ["はどうであれ"]),
("やり方____、結果を出すことが大事だ。", "Não importa o método, o importante é ter resultados.", ["はどうであれ"]),
],
),
dict(
n=235,
jp="〜はおろか",
rd="wa oroka",
tr="Sem falar de / Nem mesmo / Muito menos",
ex="""はおろか indica que, se nem o caso mais simples é possível, o caso mais difícil é ainda menos possível. Equivale a "sem falar de" ou "nem mesmo".

A primeira parte é algo mais óbvio ou grande, e a segunda é algo mais básico, que também não acontece. Por exemplo, "não sei nem escrever hiragana, sem falar de kanji".

É uma expressão formal, geralmente com tom negativo.""",
st="""Substantivo + はおろか + Substantivo + も / さえ / すら + Frase negativa""",
no="""É parecido com どころか e はもちろん, mas はおろか costuma ter tom negativo e de surpresa.

A segunda parte costuma ter も, さえ ou すら.""",
bf="はおろか",
rx="はおろか",
tk=["は", "おろか"],
va=["はおろか"],
E=[
("彼は漢字はおろか、ひらがなも書けない。", "かれはかんじはおろか、ひらがなもかけない。", "Ele não sabe escrever nem hiragana, sem falar de kanji."),
("忙しくて、旅行はおろか、休む時間もない。", "いそがしくて、りょこうはおろか、やすむじかんもない。", "Estou tão ocupado que não tenho nem tempo para descansar, muito menos para viajar."),
("車はおろか、自転車も持っていない。", "くるまはおろか、じてんしゃももっていない。", "Não tenho nem bicicleta, sem falar de carro."),
("彼女は外国語はおろか、日本語の敬語さえ使えない。", "かのじょはがいこくごはおろか、にほんごのけいごさえつかえない。", "Ela não consegue usar nem a linguagem honorífica do japonês, muito menos línguas estrangeiras."),
("けがで、走ることはおろか、歩くこともできない。", "けがで、はしることはおろか、あるくこともできない。", "Com a lesão, não consigo nem andar, muito menos correr."),
],
R=[
("彼は料理____、お湯も沸かせない。", "Ele não sabe nem ferver água, sem falar de cozinhar.", ["はおろか"]),
("貯金____、生活費も足りない。", "Não tenho nem para as despesas do dia a dia, muito menos para poupar.", ["はおろか"]),
("この村には病院____、コンビニさえない。", "Esta vila não tem nem loja de conveniência, sem falar de hospital.", ["はおろか"]),
("彼は謝罪____、挨拶すらしなかった。", "Ele não cumprimentou nem sequer, muito menos pediu desculpas.", ["はおろか"]),
("海外旅行____、国内旅行もしたことがない。", "Nunca viajei nem dentro do país, sem falar do exterior.", ["はおろか"]),
],
),
dict(
n=236,
jp="〜はさておき",
rd="wa sateoki",
tr="Deixando de lado / Seja como for / Por enquanto não falemos de",
ex="""はさておき indica que um assunto é deixado de lado por enquanto, para falar de algo mais importante. Equivale a "deixando de lado" ou "por enquanto não falemos de".

Por exemplo, "deixando o preço de lado, vamos ver primeiro a qualidade".

Também aparece como 冗談はさておき, "brincadeiras à parte", para mudar para um assunto sério.""",
st="""Substantivo + はさておき
Frase + かどうか + はさておき""",
no="""É parecido com はともかく e は別として.

Expressões comuns são 冗談はさておき, それはさておき e 何はさておき.

何はさておき significa "antes de mais nada".""",
bf="はさておき",
rx="はさておき|はさて置き",
tk=["は", "さておき"],
va=["はさておき"],
E=[
("値段はさておき、まず品質を確認しよう。", "ねだんはさておき、まずひんしつをかくにんしよう。", "Deixando o preço de lado, vamos primeiro verificar a qualidade."),
("冗談はさておき、本題に入りましょう。", "じょうだんはさておき、ほんだいにはいりましょう。", "Brincadeiras à parte, vamos ao assunto principal."),
("何はさておき、無事でよかった。", "なにはさておき、ぶじでよかった。", "Antes de mais nada, que bom que está tudo bem."),
("できるかどうかはさておき、やってみよう。", "できるかどうかはさておき、やってみよう。", "Deixando de lado se dá ou não, vamos tentar."),
("それはさておき、明日の予定はどうなっている？", "それはさておき、あしたのよていはどうなっている？", "Deixando isso de lado, como estão os planos para amanhã?"),
],
R=[
("細かいこと____、全体の計画を立てよう。", "Deixando os detalhes de lado, vamos fazer o plano geral.", ["はさておき"]),
("勝ち負け____、楽しむことが大切だ。", "Deixando de lado ganhar ou perder, o importante é se divertir.", ["はさておき"]),
("何____、まず休みたい。", "Antes de mais nada, quero descansar.", ["はさておき"]),
("費用の問題____、場所を決めましょう。", "Deixando a questão dos custos de lado, vamos decidir o local.", ["はさておき"]),
("それ____、最近元気？", "Deixando isso de lado, como você está?", ["はさておき"]),
],
),
dict(
n=237,
jp="〜はそっちのけで / 〜をそっちのけで",
rd="wa socchinoke de / wo socchinoke de",
tr="Deixando de lado / Esquecendo de / Sem dar atenção a",
ex="""そっちのけで indica que alguém deixou de lado algo importante para se dedicar a outra coisa. Equivale a "deixando de lado" ou "sem dar atenção a".

O tom costuma ser de crítica, porque a pessoa negligencia algo que deveria fazer. Por exemplo, "deixando os estudos de lado, só joga videogame".

É uma expressão coloquial.""",
st="""Substantivo + はそっちのけで / をそっちのけで + Outra atividade""",
no="""É parecido com をよそに e を後回しにして.

A forma そっちのけにする também é usada.""",
bf="そっちのけで",
rx="そっちのけで|そっちのけに|そっちのけ",
tk=["そっちのけ", "で"],
va=["はそっちのけで", "をそっちのけで", "そっちのけにする"],
E=[
("勉強はそっちのけで、ゲームばかりしている。", "べんきょうはそっちのけで、ゲームばかりしている。", "Deixando os estudos de lado, só fica jogando videogame."),
("仕事をそっちのけで、おしゃべりをしている。", "しごとをそっちのけで、おしゃべりをしている。", "Estão conversando sem dar atenção ao trabalho."),
("子供たちは宿題そっちのけで、外で遊んでいる。", "こどもたちはしゅくだいそっちのけで、そとであそんでいる。", "As crianças estão brincando lá fora, esquecendo a lição de casa."),
("彼は家族をそっちのけで、趣味に夢中だ。", "かれはかぞくをそっちのけで、しゅみにむちゅうだ。", "Ele está vidrado no hobby, deixando a família de lado."),
("主役はそっちのけで、みんな料理に夢中だった。", "しゅやくはそっちのけで、みんなりょうりにむちゅうだった。", "Todos estavam vidrados na comida, esquecendo o homenageado."),
],
R=[
("練習____、彼はスマホを見ている。", "Deixando o treino de lado, ele fica olhando o celular.", ["はそっちのけで", "をそっちのけで"]),
("自分の仕事を____、人の手伝いばかりしている。", "Deixando o próprio trabalho de lado, só fica ajudando os outros.", ["そっちのけで", "そっちのけにして"]),
("試験勉強____、漫画を読んでいる。", "Deixando o estudo para a prova de lado, está lendo mangá.", ["はそっちのけで", "をそっちのけで"]),
("彼女は彼氏____、友達と話している。", "Ela está conversando com as amigas, sem dar atenção ao namorado.", ["をそっちのけで", "はそっちのけで"]),
("会議の議題____、雑談ばかりだった。", "Deixando a pauta da reunião de lado, foi só conversa fiada.", ["はそっちのけで", "をそっちのけで"]),
],
),
dict(
n=238,
jp="〜わ〜わで",
rd="wa ~ wa de",
tr="Entre... e / Não só... como também / Um atrás do outro",
ex="""わ〜わで serve para listar vários problemas que aconteceram ao mesmo tempo, mostrando que a situação foi muito difícil. Equivale a "entre... e" ou "não só..., como também".

A pessoa reclama de uma série de coisas ruins. Por exemplo, "entre chuva e vento, foi um dia horrível".

É uma expressão coloquial.""",
st="""Verbo / Adjetivo い (forma simples) + わ + Verbo / Adjetivo い + わで""",
no="""Costuma terminar com 大変だった ou さんざんだった.

A forma 〜わ〜わ também aparece sem で, como 出るわ出るわ, "sai um atrás do outro".""",
bf="わ〜わで",
rx="わで",
tk=["わ", "わ", "で"],
va=["わ〜わで", "わ〜わ"],
E=[
("雨は降るわ風は吹くわで、ひどい一日だった。", "あめはふるわかぜはふくわで、ひどいいちにちだった。", "Entre chuva e vento, foi um dia horrível."),
("財布はなくすわ電車は遅れるわで、さんざんだった。", "さいふはなくすわでんしゃはおくれるわで、さんざんだった。", "Perdi a carteira e o trem atrasou, foi um desastre."),
("子供は泣くわ犬はほえるわで、うるさくて眠れない。", "こどもはなくわいぬはほえるわで、うるさくてねむれない。", "Entre a criança chorando e o cachorro latindo, não dá para dormir de tanto barulho."),
("熱は出るわ咳は止まらないわで、大変だった。", "ねつはでるわせきはとまらないわで、たいへんだった。", "Tive febre e a tosse não parava, foi muito difícil."),
("道は混んでいるわ店は休みだわで、旅行は失敗だった。", "みちはこんでいるわみせはやすみだわで、りょこうはしっぱいだった。", "A estrada estava cheia e a loja fechada, a viagem foi um fracasso."),
],
R=[
("寝坊するわ、忘れ物をする____、今日はついていない。", "Dormi demais e esqueci coisas, hoje não é meu dia.", ["わで"]),
("値段は高いわ、味はまずい____、二度と行かない。", "Era caro e a comida ruim, nunca mais vou.", ["わで"]),
("仕事は多いわ、上司は厳しい____、毎日つらい。", "Tem muito trabalho e o chefe é rígido, todo dia é duro.", ["わで"]),
("足は痛いわ、荷物は重い____、もう歩けない。", "O pé dói e a bagagem está pesada, não consigo mais andar.", ["わで"]),
("宿題はあるわ、試験はある____、遊ぶ暇がない。", "Tem lição de casa e prova, não sobra tempo para brincar.", ["わで"]),
],
),
dict(
n=239,
jp="〜や否や",
rd="ya ina ya",
tr="Mal / Assim que / No instante em que",
ex="""や否や indica que, logo depois de uma ação, outra aconteceu imediatamente. Equivale a "mal..." ou "no instante em que".

É uma expressão muito formal e literária, que destaca a rapidez. Por exemplo, "mal soou o sinal, os alunos saíram correndo".

A forma curta や também tem o mesmo sentido.""",
st="""Verbo (forma dicionário) + や否や + Ação seguinte (passado)
Verbo (forma dicionário) + や + Ação seguinte""",
no="""É parecido com が早いか e とたんに.

A segunda parte é um fato já ocorrido, por isso costuma estar no passado.

Não se usa com intenções ou pedidos.""",
bf="や否や",
rx="や否や|やいなや",
tk=["や", "否", "や"],
va=["や否や", "やいなや"],
E=[
("ベルが鳴るや否や、生徒たちは教室を飛び出した。", "ベルがなるやいなや、せいとたちはきょうしつをとびだした。", "Mal tocou o sinal, os alunos saíram correndo da sala."),
("彼は家に着くや否や、ベッドに倒れ込んだ。", "かれはいえにつくやいなや、ベッドにたおれこんだ。", "Mal chegou em casa, ele desabou na cama."),
("その知らせを聞くや否や、彼女は泣き出した。", "そのしらせをきくやいなや、かのじょはなきだした。", "No instante em que ouviu a notícia, ela começou a chorar."),
("新商品は発売されるや否や、売り切れた。", "しんしょうひんははつばいされるやいなや、うりきれた。", "Mal foi lançado, o novo produto esgotou."),
("ドアが開くや否や、客が店内に殺到した。", "ドアがあくやいなや、きゃくがてんないにさっとうした。", "No instante em que a porta abriu, os clientes invadiram a loja."),
],
R=[
("試合が終わる____、選手たちは抱き合った。", "Mal a partida terminou, os jogadores se abraçaram.", ["や否や", "やいなや"]),
("彼は電車に乗る____、眠ってしまった。", "Mal entrou no trem, ele adormeceu.", ["や否や", "やいなや"]),
("先生が教室を出る____、学生たちは騒ぎ始めた。", "No instante em que o professor saiu da sala, os alunos começaram a fazer bagunça.", ["や否や", "やいなや"]),
("チケットは販売が始まる____、完売した。", "Mal começaram as vendas, os ingressos esgotaram.", ["や否や", "やいなや"]),
("犬は私の顔を見る____、しっぽを振った。", "Assim que viu meu rosto, o cachorro abanou o rabo.", ["や否や", "やいなや"]),
],
),
dict(
n=240,
jp="〜やしない",
rd="ya shinai",
tr="Nem / De jeito nenhum / Nunca que",
ex="""やしない é uma forma coloquial e enfática de negação. Equivale a "nem..." ou "de jeito nenhum".

A pessoa nega algo com força, muitas vezes com irritação ou desânimo. Por exemplo, "ninguém me ouve nem um pouco" ou "isso nunca que vai dar certo".

Na fala, também aparece como やしねえ ou ゃしない.""",
st="""Verbo (forma ます sem ます) + やしない
する → しやしない
来る → 来やしない""",
no="""É uma forma enfática de ない, usada na fala.

Expressões comuns são わかりやしない, できやしない e 来やしない.""",
bf="やしない",
rx="やしない|やしません|ゃしない",
tk=["や", "しない"],
va=["やしない", "やしません"],
E=[
("そんなこと、誰も信じやしない。", "そんなこと、だれもしんじやしない。", "Ninguém vai acreditar numa coisa dessas, de jeito nenhum."),
("いくら説明しても、彼はわかりやしない。", "いくらせつめいしても、かれはわかりやしない。", "Por mais que eu explique, ele nem entende."),
("こんなに遅いと、間に合いやしない。", "こんなにおそいと、まにあいやしない。", "Desse jeito tão lento, nunca que vai dar tempo."),
("待っても、彼は来やしないよ。", "まっても、かれはきやしないよ。", "Mesmo esperando, ele não vem de jeito nenhum."),
("そんな簡単に、夢がかないやしない。", "そんなかんたんに、ゆめがかないやしない。", "Sonhos não se realizam assim tão fácil, de jeito nenhum."),
],
R=[
("こんな問題、子供にでき____。", "Uma criança nunca que consegue fazer um problema desses.", ["やしない"]),
("怒鳴っても、犬は言うことを聞き____。", "Mesmo gritando, o cachorro não obedece de jeito nenhum.", ["やしない"]),
("そんなに急いでも、終わり____。", "Mesmo correndo tanto, não vai terminar de jeito nenhum.", ["やしない"]),
("一人で行っても、楽しくあり____。", "Ir sozinho não tem graça nenhuma.", ["やしない"]),
("彼女は私の話なんか聞き____。", "Ela nem ouve o que eu digo.", ["やしない"]),
],
),
]
