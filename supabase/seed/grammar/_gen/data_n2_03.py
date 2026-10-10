G = [
dict(
n=21,
jp="〜得る",
rd="uru / eru",
tr="Ser possível / Poder acontecer / Possível",
ex="""得る é usado para dizer que algo é possível ou pode acontecer. Equivale a "ser possível", "poder acontecer" ou, antes de substantivos, "possível".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, 起こり得る (pode acontecer), あり得る (é possível), 考え得る (que se pode pensar).

Ele não indica habilidade pessoal, como a forma potencial (話せる, 食べられる). Indica possibilidade objetiva: algo que pode ocorrer em certas condições.

A leitura mais comum na forma de dicionário é うる, principalmente em linguagem formal (起こりうる, ありうる). Nas outras formas, como 得ます e 得た, a leitura é え.

É uma expressão formal, muito usada em textos, notícias, relatórios e discursos.""",
st="""Verbo na forma ます sem ます + 得る (うる / える)
ある → あり得る (ありうる)
Verbo sem ます + 得る + Substantivo (que pode...)

Negativo: 得ない (えない)
Passado: 得た (えた)""",
no="""あり得る e あり得ない são as formas mais comuns na conversa: "é possível" e "é impossível".

得る não é usado para habilidades pessoais: para "sei nadar", usa-se 泳げる, e não 泳ぎ得る.

考え得る限り significa "tudo o que se pode imaginar" e aparece em textos formais.""",
bf="得る",
rx="得る|得ます|得た|うる",
tk=["得る"],
va=["得る", "うる", "える", "あり得る"],
E=[
("地震はいつでも起こり得る。", "じしんはいつでもおこりうる。", "Terremotos podem acontecer a qualquer momento."),
("それは誰にでもあり得ることだ。", "それはだれにでもありうることだ。", "Isso é algo que pode acontecer com qualquer pessoa."),
("考え得るすべての方法を試した。", "かんがえうるすべてのほうほうをためした。", "Tentei todos os métodos possíveis."),
("事故は起こり得るものとして、準備しておくべきだ。", "じこはおこりうるものとして、じゅんびしておくべきだ。", "Devemos nos preparar considerando que acidentes podem acontecer."),
("彼の失敗は十分予想し得た。", "かれのしっぱいはじゅうぶんよそうしえた。", "O fracasso dele era perfeitamente previsível."),
],
R=[
("失敗は誰にでも起こり____。", "O fracasso pode acontecer com qualquer um.", ["得る", "うる"]),
("それは十分あり____話だ。", "Essa é uma história perfeitamente possível.", ["得る", "うる"]),
("考え____限りの手を尽くした。", "Fizemos tudo o que era possível imaginar.", ["得る", "うる"]),
("このような問題は、どの会社でも起こり____。", "Problemas como este podem acontecer em qualquer empresa.", ["得る", "うる"]),
("予想し____最悪の事態に備える。", "Vamos nos preparar para a pior situação possível.", ["得る", "うる"]),
],
),
dict(
n=22,
jp="再び",
rd="futatabi",
tr="Novamente / De novo / Outra vez",
ex="""再び é um advérbio que significa "novamente", "de novo" ou "outra vez". Ele indica que algo acontece uma segunda vez, depois de ter acontecido antes ou de ter parado.

O sentido é o mesmo de また e もう一度, mas 再び soa mais formal e escrito. Por isso, é comum em notícias, textos, discursos e narrativas.

Por exemplo, "ele visitou o Japão novamente" ou "a chuva voltou a cair".

Também aparece em frases sobre não repetir erros: "tomar cuidado para não cometer o mesmo erro outra vez".""",
st="""再び + Verbo

Escrita: 再び / ふたたび""",
no="""Na conversa casual, また é mais natural. 再び soa solene ou jornalístico.

Palavras relacionadas são 再会 (reencontro) e 再開 (retomada), que usam o mesmo kanji 再.

Em notícias sobre desastres ou crises, 再び aparece para indicar que algo voltou a acontecer.""",
bf="再び",
rx="再び|ふたたび",
tk=["再び"],
va=["再び", "ふたたび"],
E=[
("彼は五年後、再び日本を訪れた。", "かれはごねんご、ふたたびにほんをおとずれた。", "Cinco anos depois, ele visitou o Japão novamente."),
("一度やんだ雨が再び降り出した。", "いちどやんだあめがふたたびふりだした。", "A chuva, que tinha parado, voltou a cair."),
("二人は十年後に再び会った。", "ふたりはじゅうねんごにふたたびあった。", "Os dois se reencontraram dez anos depois."),
("再び同じ失敗をしないように注意する。", "ふたたびおなじしっぱいをしないようにちゅういする。", "Vou tomar cuidado para não cometer o mesmo erro outra vez."),
("休憩の後、会議が再び始まった。", "きゅうけいのあと、かいぎがふたたびはじまった。", "Depois do intervalo, a reunião recomeçou."),
],
R=[
("治療の後、彼は____歩けるようになった。", "Depois do tratamento, ele voltou a conseguir andar.", ["再び", "ふたたび"]),
("一度やんだ雪が____降り始めた。", "A neve, que tinha parado, começou a cair de novo.", ["再び", "ふたたび"]),
("____この町に来られてうれしい。", "Estou feliz por poder vir a esta cidade novamente.", ["再び", "ふたたび"]),
("一度は落ちたが、彼は____試験に挑戦した。", "Ele foi reprovado uma vez, mas tentou a prova outra vez.", ["再び", "ふたたび"]),
("同じ事故が____起きないようにしたい。", "Quero evitar que o mesmo acidente aconteça de novo.", ["再び", "ふたたび"]),
],
),
dict(
n=23,
jp="〜ふうに",
rd="fuu ni",
tr="Deste jeito / Daquele jeito / Desta maneira",
ex="""ふうに é usado para indicar a maneira ou o estilo de fazer algo. Equivale a "deste jeito", "daquele jeito" ou "desta maneira".

Ele aparece muito com こんな, そんな, あんな e どんな, formando こんなふうに (assim, deste jeito), あんなふうに (daquele jeito) e どんなふうに (de que jeito).

Também pode vir depois de verbos e com そういう, como em そういうふうに考えたことはなかった ("nunca pensei desse jeito").

Antes de um substantivo, usa-se ふうな: こんなふうな服 (uma roupa deste estilo).

É um pouco mais casual que のように e muito comum na conversa.""",
st="""こんな / そんな / あんな / どんな + ふうに + Verbo
そういう / こういう + ふうに + Verbo
Verbo (forma simples) + ふうに + Verbo
… + ふうな + Substantivo

Escrita: ふうに / 風に""",
no="""Em perguntas, どんなふうに pede detalhes sobre o modo: "como exatamente você fez?".

風 também aparece como sufixo em palavras como 和風 (estilo japonês) e 洋風 (estilo ocidental).

Comparado a ように, ふうに soa mais coloquial e descritivo.""",
bf="ふうに",
rx="ふうに|風に|ふうな|風な",
tk=["ふう", "に"],
va=["ふうに", "風に", "ふうな"],
E=[
("こんなふうに書いてください。", "こんなふうにかいてください。", "Escreva deste jeito, por favor."),
("彼はいつもあんなふうに笑う。", "かれはいつもあんなふうにわらう。", "Ele sempre ri daquele jeito."),
("このケーキ、どんなふうに作ったんですか。", "このケーキ、どんなふうにつくったんですか。", "De que jeito você fez este bolo?"),
("先生が説明したふうに、やってみました。", "せんせいがせつめいしたふうに、やってみました。", "Tentei fazer do jeito que o professor explicou."),
("そういうふうに考えたことはなかった。", "そういうふうにかんがえたことはなかった。", "Nunca tinha pensado desse jeito."),
],
R=[
("野菜はこんな____切ってください。", "Corte as verduras deste jeito, por favor.", ["ふうに", "風に"]),
("この機械はどんな____使えばいいですか。", "De que jeito devo usar esta máquina?", ["ふうに", "風に"]),
("そういう____言われると、困ります。", "Se você fala desse jeito, fico sem graça.", ["ふうに", "風に"]),
("彼女はいつもあんな____話す人だ。", "Ela é uma pessoa que sempre fala daquele jeito.", ["ふうに", "風に"]),
("彼が言った____、もう一度やってみよう。", "Vamos tentar mais uma vez do jeito que ele disse.", ["ふうに", "風に"]),
],
),
dict(
n=24,
jp="〜がきっかけで",
rd="ga kikkake de",
tr="Por causa de / A partir de / Motivado por",
ex="""がきっかけで é usado para indicar o ponto de partida, o motivo ou a ocasião que deu início a algo. Equivale a "por causa de", "a partir de" ou "motivado por".

きっかけ significa "estímulo", "pontapé inicial" ou "oportunidade". A ideia é que um acontecimento específico levou a uma mudança, a um começo ou a uma decisão.

Por exemplo, "comecei a estudar japonês por causa de uma viagem" ou "uma pequena confusão deu início a uma briga".

A forma をきっかけに tem o mesmo sentido e aparece muito na escrita (veja também o item をきっかけに).

O resultado pode ser positivo ou negativo, mas costuma marcar uma mudança importante.""",
st="""Substantivo + がきっかけで + Mudança / Início
Substantivo + がきっかけになって + …
Frase + のがきっかけで + …

Variação: Substantivo + をきっかけに""",
no="""きっかけ é diferente de 原因 (causa). 原因 é a causa direta de um problema; きっかけ é o estímulo que deu início a algo.

Em entrevistas, perguntas como 日本語を勉強したきっかけは何ですか ("o que te levou a estudar japonês?") são muito comuns.

A segunda parte costuma indicar um começo ou uma mudança de hábito.""",
bf="がきっかけで",
rx="がきっかけで|をきっかけに|きっかけで|きっかけに",
tk=["が", "きっかけ", "で"],
va=["がきっかけで", "をきっかけに", "がきっかけになって"],
E=[
("日本への旅行がきっかけで、日本語を勉強し始めた。", "にほんへのりょこうがきっかけで、にほんごをべんきょうしはじめた。", "Comecei a estudar japonês por causa de uma viagem ao Japão."),
("一冊の本がきっかけで、作家になった。", "いっさつのほんがきっかけで、さっかになった。", "Um único livro foi o que me levou a ser escritor."),
("友達の紹介がきっかけで、彼と知り合った。", "ともだちのしょうかいがきっかけで、かれとしりあった。", "Conheci-o a partir de uma apresentação de um amigo."),
("病気がきっかけで、健康に気をつけるようになった。", "びょうきがきっかけで、けんこうにきをつけるようになった。", "Motivado por uma doença, passei a cuidar da saúde."),
("小さな誤解がきっかけで、けんかになった。", "ちいさなごかいがきっかけで、けんかになった。", "Um pequeno mal-entendido deu início a uma briga."),
],
R=[
("アニメ____、日本に興味を持った。", "Por causa dos animes, passei a me interessar pelo Japão.", ["がきっかけで"]),
("留学____、国際関係の仕事をしたいと思った。", "O intercâmbio me fez querer trabalhar com relações internacionais.", ["がきっかけで"]),
("一つの出会い____、人生が変わった。", "Um único encontro mudou a minha vida.", ["がきっかけで"]),
("一人暮らし____、料理を始めた。", "Comecei a cozinhar por causa de morar sozinho.", ["がきっかけで"]),
("先生の一言____、医者を目指した。", "Uma frase do professor me motivou a querer ser médico.", ["がきっかけで"]),
],
),
dict(
n=25,
jp="〜げ",
rd="ge",
tr="Com ar de / Parecendo / Com jeito de",
ex="""げ é um sufixo que indica a aparência ou a impressão de um sentimento ou estado, a partir do que se observa. Equivale a "com ar de", "parecendo" ou "com jeito de".

Ele vem depois de adjetivos い (sem い), de alguns adjetivos な e da forma たい de verbos (sem い). Por exemplo, 寂しげ (com ar de tristeza), 楽しげ (parecendo se divertir), 言いたげ (com cara de quem quer dizer algo).

O resultado funciona como um adjetivo な: げな antes de substantivos, げに antes de verbos e げだ no fim da frase.

O sentido é parecido com そう (aparência), mas げ soa mais literário e é muito usado em textos, romances e descrições de expressões e emoções.""",
st="""Adjetivo い sem い + げ (寂しげ / 楽しげ / 悲しげ)
Adjetivo な + げ (不安げ / 満足げ / 得意げ)
Verbo たい sem い + げ (言いたげ)
〜げな + Substantivo / 〜げに + Verbo / 〜げだ""",
no="""いい vira よさげ, e ない vira なさげ, como em 自信なさげ (com cara de inseguro).

Expressões como 自信ありげ (com ar de confiante) e 意味ありげ (com ar misterioso) são muito usadas.

Na fala do dia a dia, そう é mais comum que げ.""",
bf="げ",
rx="げな|げに|げだ|げです",
tk=["げ"],
va=["げ", "げな", "げに", "げだ"],
E=[
("彼女は寂しげな顔をしていた。", "かのじょはさびしげなかおをしていた。", "Ela estava com um ar triste."),
("子供たちは楽しげに遊んでいる。", "こどもたちはたのしげにあそんでいる。", "As crianças estão brincando, parecendo se divertir."),
("彼は何か言いたげだった。", "かれはなにかいいたげだった。", "Ele estava com cara de quem queria dizer algo."),
("彼は自信ありげな態度で話した。", "かれはじしんありげなたいどではなした。", "Ele falou com um ar confiante."),
("不安げな表情で、彼女は待っていた。", "ふあんげなひょうじょうで、かのじょはまっていた。", "Ela esperava com uma expressão de ansiedade."),
],
R=[
("彼は悲し____な目で私を見た。", "Ele me olhou com um olhar triste.", ["げ"]),
("料理を食べて、子供は満足____に笑った。", "A criança comeu e sorriu, parecendo satisfeita.", ["げ"]),
("彼女は何か言いた____な顔をしていた。", "Ela estava com cara de quem queria dizer alguma coisa.", ["げ"]),
("一人で留守番している犬が寂し____に鳴いている。", "O cachorro, sozinho em casa, está latindo com um ar triste.", ["げ"]),
("彼は得意____な顔で自分の作品を見せた。", "Ele mostrou o próprio trabalho com cara de orgulhoso.", ["げ"]),
],
),
dict(
n=26,
jp="逆に",
rd="gyaku ni",
tr="Pelo contrário / Ao contrário / Em vez disso",
ex="""逆に é um advérbio que significa "pelo contrário" ou "ao contrário". Ele indica que o resultado foi o oposto do esperado, ou apresenta uma situação contrária a outra.

Ele tem dois usos principais.

O primeiro é mostrar um resultado oposto à intenção: "tomei o remédio e, pelo contrário, passei mal" ou "tentei ajudar e, ao contrário, levei bronca".

O segundo é contrastar duas situações opostas: "Tóquio tem muita gente; já o interior, ao contrário, tem pouca".

逆 significa "inverso" ou "contrário". Na conversa, 逆に também é usado para apresentar um ponto de vista diferente: "pelo contrário, acho que é melhor assim".""",
st="""Ação / Expectativa + 逆に + Resultado oposto
A + は〜が、 + 逆に + B + は〜 (contraste)

Escrita: 逆に / ぎゃくに""",
no="""Na fala jovem, 逆に às vezes é usado de forma exagerada, só para dar ênfase, mesmo sem um contraste real.

Comparado a むしろ, 逆に destaca mais a inversão da situação.

A expressão 逆に言えば significa "por outro lado" ou "dito de outra forma".""",
bf="逆に",
rx="逆に|ぎゃくに",
tk=["逆", "に"],
va=["逆に", "ぎゃくに"],
E=[
("薬を飲んだら、逆に具合が悪くなった。", "くすりをのんだら、ぎゃくにぐあいがわるくなった。", "Tomei o remédio e, pelo contrário, passei mal."),
("助けようとしたら、逆に怒られた。", "たすけようとしたら、ぎゃくにおこられた。", "Tentei ajudar e, ao contrário, levei bronca."),
("安い物を買ったら、すぐ壊れて逆に高くついた。", "やすいものをかったら、すぐこわれてぎゃくにたかくついた。", "Comprei algo barato, quebrou logo e, no fim, saiu mais caro."),
("東京は人が多いが、逆に地方は人が少ない。", "とうきょうはひとがおおいが、ぎゃくにちほうはひとがすくない。", "Tóquio tem muita gente; já o interior, ao contrário, tem pouca."),
("休んだら、逆に疲れてしまった。", "やすんだら、ぎゃくにつかれてしまった。", "Descansei e, pelo contrário, fiquei mais cansado."),
],
R=[
("慰めたつもりが、____彼女を泣かせてしまった。", "Achei que estava consolando, mas, pelo contrário, fiz ela chorar.", ["逆に", "ぎゃくに"]),
("近道をしたら、____時間がかかった。", "Peguei um atalho e, ao contrário, demorei mais.", ["逆に", "ぎゃくに"]),
("詳しい説明を聞いて、____わからなくなった。", "Ouvi uma explicação detalhada e, pelo contrário, fiquei mais confuso.", ["逆に", "ぎゃくに"]),
("この地域は夏は暑いが、____冬はとても寒い。", "Nesta região o verão é quente; já o inverno, ao contrário, é muito frio.", ["逆に", "ぎゃくに"]),
("急いだら、道を間違えて____遅くなった。", "Corri, errei o caminho e, no fim, cheguei mais tarde.", ["逆に", "ぎゃくに"]),
],
),
dict(
n=27,
jp="〜反面",
rd="hanmen",
tr="Por outro lado / Ao mesmo tempo / Mas em compensação",
ex="""反面 é usado para mostrar que uma mesma coisa tem dois lados opostos: um positivo e um negativo. Equivale a "por outro lado", "ao mesmo tempo" ou "mas, em compensação".

A primeira parte apresenta uma característica, e a segunda mostra o lado oposto, da mesma coisa ou pessoa. Por exemplo, "este trabalho é pesado, mas, por outro lado, é gratificante" ou "a internet é prática, mas, ao mesmo tempo, tem riscos".

Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な ou である, e de substantivos com である.

É uma expressão um pouco formal, muito comum em textos argumentativos, comparações e análises.""",
st="""Verbo / Adjetivo い (forma simples) + 反面、 + Lado oposto
Adjetivo な + な / である + 反面
Substantivo + である + 反面

Escrita: 反面 / 半面""",
no="""Comparado a 一方で, 反面 foca nos dois lados de uma mesma coisa. 一方で pode comparar coisas diferentes.

Em redações sobre prós e contras, 反面 aparece com muita frequência.

A palavra 反面教師 significa "um mau exemplo, com o qual se aprende o que não fazer".""",
bf="反面",
rx="反面|はんめん|半面",
tk=["反面"],
va=["反面", "半面"],
E=[
("この仕事は大変な反面、やりがいがある。", "このしごとはたいへんなはんめん、やりがいがある。", "Este trabalho é pesado, mas, por outro lado, é gratificante."),
("都会の生活は便利な反面、ストレスも多い。", "とかいのせいかつはべんりなはんめん、ストレスもおおい。", "A vida na cidade grande é prática, mas, ao mesmo tempo, estressante."),
("彼は優しい反面、厳しいところもある。", "かれはやさしいはんめん、きびしいところもある。", "Ele é gentil, mas, por outro lado, também tem um lado rigoroso."),
("インターネットは便利な反面、危険もある。", "インターネットはべんりなはんめん、きけんもある。", "A internet é prática, mas, ao mesmo tempo, tem riscos."),
("一人暮らしは自由な反面、寂しいこともある。", "ひとりぐらしはじゆうなはんめん、さびしいこともある。", "Morar sozinho dá liberdade, mas, em compensação, às vezes é solitário."),
],
R=[
("この薬はよく効く____、副作用もある。", "Este remédio funciona bem, mas, por outro lado, tem efeitos colaterais.", ["反面"]),
("彼女はいつも明るい____、寂しがりやだ。", "Ela é sempre alegre, mas, ao mesmo tempo, não gosta de ficar sozinha.", ["反面"]),
("この会社は給料が高い____、休みが少ない。", "Esta empresa paga bem, mas, em compensação, tem poucas folgas.", ["反面"]),
("車は便利な____、事故の危険がある。", "O carro é prático, mas, por outro lado, há o risco de acidentes.", ["反面"]),
("有名になると、うれしい____、自由がなくなる。", "Ficar famoso é bom, mas, ao mesmo tempo, você perde a liberdade.", ["反面"]),
],
),
dict(
n=28,
jp="果たして",
rd="hatashite",
tr="Será mesmo que / Afinal / Realmente / Como esperado",
ex="""果たして é um advérbio com dois usos principais.

O primeiro, em perguntas e frases de dúvida, expressa incerteza ou ceticismo: "será mesmo que...?" ou "afinal...?". Ele costuma aparecer com だろうか, のか ou かどうか. Por exemplo, "será mesmo que ele vem?" ou "será que este plano vai mesmo dar certo?".

O segundo, em frases afirmativas, significa "como esperado" ou "de fato": algo aconteceu exatamente como se previa. Por exemplo, "como eu temia, choveu".

O primeiro uso é o mais comum e soa formal e um pouco dramático, típico de textos, notícias e narrativas.""",
st="""果たして + … + だろうか / のか / かどうか (será mesmo que...?)
果たして + … + Verbo no passado (como esperado)

Escrita: 果たして / はたして""",
no="""果たして também é a forma て do verbo 果たす (cumprir), como em 約束を果たして (cumprindo a promessa). O contexto mostra qual é o sentido.

Em títulos de notícias, 果たして aparece para criar suspense: 果たして結果は?

Na conversa casual, os japoneses preferem 本当に〜かな.""",
bf="果たして",
rx="果たして|はたして",
tk=["果たして"],
va=["果たして", "はたして"],
E=[
("果たして彼は来るだろうか。", "はたしてかれはくるだろうか。", "Será mesmo que ele vem?"),
("この計画は果たして成功するのだろうか。", "このけいかくははたしてせいこうするのだろうか。", "Será que este plano vai mesmo dar certo?"),
("心配していたが、果たして予想どおりの結果になった。", "しんぱいしていたが、はたしてよそうどおりのけっかになった。", "Eu estava preocupado e, como esperado, o resultado foi o previsto."),
("果たしてそれは本当なのか。", "はたしてそれはほんとうなのか。", "Afinal, isso é verdade?"),
("果たして、彼の言ったとおりだった。", "はたして、かれのいったとおりだった。", "De fato, foi exatamente como ele disse."),
],
R=[
("____明日は晴れるだろうか。", "Será mesmo que amanhã vai fazer sol?", ["果たして", "はたして"]),
("____この答えは正しいのか。", "Afinal, esta resposta está correta?", ["果たして", "はたして"]),
("雨が心配だったが、____雨が降った。", "Eu temia a chuva e, como esperado, choveu.", ["果たして", "はたして"]),
("____私に、そんなことができるだろうか。", "Será mesmo que eu consigo fazer uma coisa dessas?", ["果たして", "はたして"]),
("____彼女は真実を話しているのだろうか。", "Será mesmo que ela está dizendo a verdade?", ["果たして", "はたして"]),
],
),
dict(
n=29,
jp="一応",
rd="ichiou",
tr="Por via das dúvidas / Mais ou menos / Pelo menos / Por enquanto",
ex="""一応 é um advérbio muito comum na conversa, com alguns usos ligados à ideia de "não é perfeito, mas serve".

• Por via das dúvidas: fazer algo como precaução, mesmo sem ter certeza de que é necessário. Por exemplo, "vou levar o guarda-chuva, por via das dúvidas".
• Mais ou menos / de certa forma: algo está feito ou é verdade, mas não totalmente. Por exemplo, "terminei a lição, mais ou menos, mas não tenho confiança".
• Pelo menos formalmente: algo é assim no nome, mas não na prática. Por exemplo, "ele é professor, pelo menos no papel".

Também é usado para dar modéstia às respostas: "sei cozinhar, mais ou menos".""",
st="""一応 + Verbo (por via das dúvidas)
一応 + Verbo passado (mais ou menos feito)
一応 + Substantivo + だ (pelo menos no papel)

Escrita: 一応 / いちおう""",
no="""念のため também significa "por via das dúvidas" e é mais formal. 一応 é mais casual.

Usar 一応 em respostas pode deixar a frase mais humilde, mostrando que você não quer parecer convencido.

Em e-mails de trabalho, 一応ご確認ください significa "por favor, confira, por via das dúvidas".""",
bf="一応",
rx="一応|いちおう",
tk=["一応"],
va=["一応", "いちおう"],
E=[
("雨は降らないと思うけど、一応、傘を持っていこう。", "あめはふらないとおもうけど、いちおう、かさをもっていこう。", "Acho que não vai chover, mas vou levar o guarda-chuva por via das dúvidas."),
("宿題は一応終わったけど、自信がない。", "しゅくだいはいちおうおわったけど、じしんがない。", "Terminei a lição, mais ou menos, mas não tenho confiança."),
("一応、彼にも連絡しておきます。", "いちおう、かれにもれんらくしておきます。", "Por via das dúvidas, vou avisá-lo também."),
("料理は一応できますが、上手ではありません。", "りょうりはいちおうできますが、じょうずではありません。", "Sei cozinhar mais ou menos, mas não muito bem."),
("念のため、一応確認してください。", "ねんのため、いちおうかくにんしてください。", "Por via das dúvidas, confira, por favor."),
],
R=[
("雨が降るかもしれないので、____傘を持っていく。", "Pode ser que chova, então vou levar guarda-chuva por via das dúvidas.", ["一応", "いちおう"]),
("レポートは____書き終わった。", "Terminei de escrever o relatório, mais ou menos.", ["一応", "いちおう"]),
("彼は____先生だが、あまり教えていない。", "Ele é professor, pelo menos no papel, mas quase não dá aulas.", ["一応", "いちおう"]),
("大丈夫だと思うけど、____病院に行っておこう。", "Acho que está tudo bem, mas vou ao hospital por via das dúvidas.", ["一応", "いちおう"]),
("英語は____話せますが、上手ではないです。", "Falo inglês mais ou menos, mas não bem.", ["一応", "いちおう"]),
],
),
dict(
n=30,
jp="〜以外",
rd="igai",
tr="Exceto / Além de / Fora",
ex="""以外 é usado para indicar exceção: tudo, menos aquilo. Equivale a "exceto", "além de" ou "fora".

Ele vem depois de substantivos e, às vezes, de verbos na forma de dicionário. Por exemplo, "trabalho todo dia, exceto domingo" ou "ninguém veio além dele".

Com は, 以外は destaca a exceção: "fora o domingo, trabalho todo dia".

Antes de um substantivo, usa-se 以外の: 肉以外の料理 (pratos que não sejam de carne).

Com に e ない, 以外に方法がない significa "não há outro jeito além de...".""",
st="""Substantivo + 以外 + は / に / の
Verbo na forma de dicionário + 以外に + ない (não há outra opção além de)
Substantivo + 以外 + 誰も / 何も + Negativo

Escrita: 以外 / いがい""",
no="""Não confunda 以外 (exceto) com 意外 (inesperado). As duas são lidas いがい, mas os kanji e os sentidos são diferentes.

関係者以外立入禁止 ("proibida a entrada de pessoas não autorizadas") é um aviso muito comum.

Para "além de" no sentido de "além disso, também", usa-se 以外にも: 東京以外にも行きたい.""",
bf="以外",
rx="以外|いがい",
tk=["以外"],
va=["以外", "以外は", "以外に", "以外の"],
E=[
("日曜日以外は毎日働いている。", "にちようびいがいはまいにちはたらいている。", "Trabalho todos os dias, exceto domingo."),
("彼以外、誰も来なかった。", "かれいがい、だれもこなかった。", "Ninguém veio além dele."),
("関係者以外は入れません。", "かんけいしゃいがいははいれません。", "Apenas pessoas autorizadas podem entrar."),
("肉以外の料理を注文した。", "にくいがいのりょうりをちゅうもんした。", "Pedi um prato que não fosse de carne."),
("電車が来ないなら、待つ以外に方法がない。", "でんしゃがこないなら、まついがいにほうほうがない。", "Se o trem não vem, não há outro jeito além de esperar."),
],
R=[
("私____は、みんな賛成した。", "Todos concordaram, exceto eu.", ["以外"]),
("魚____の物なら、何でも食べます。", "Como qualquer coisa, menos peixe.", ["以外"]),
("日本語____の言葉は話せない。", "Não falo nenhuma língua além do japonês.", ["以外"]),
("謝る____に、できることはない。", "Não há nada que eu possa fazer além de pedir desculpas.", ["以外"]),
("この部屋は、社員____立ち入り禁止です。", "A entrada nesta sala é proibida para quem não é funcionário.", ["以外"]),
],
),
]
