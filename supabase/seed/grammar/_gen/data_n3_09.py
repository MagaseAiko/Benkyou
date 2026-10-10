G = [
dict(
n=81,
jp="〜にしたがって",
rd="ni shitagatte",
tr="De acordo com / Seguindo / À medida que",
ex="""にしたがって tem dois usos principais.

O primeiro é "de acordo com" ou "seguindo": fazer algo obedecendo a instruções, regras, ordens ou um mapa. Por exemplo, "siga as instruções do professor" ou "jogue o lixo de acordo com as regras". Nesse uso, ele vem depois de substantivos.

O segundo é "à medida que": uma mudança acompanha outra, de forma proporcional. Por exemplo, "à medida que envelhecemos, perdemos força física". Nesse uso, ele vem depois de verbos na forma de dicionário, geralmente verbos de mudança.

O verbo 従う significa "seguir" ou "obedecer". A forma にしたがい, sem て, é mais formal e aparece na escrita.""",
st="""Substantivo (指示 / 規則 / 地図) + にしたがって + Verbo (seguindo)
Verbo de mudança (forma de dicionário) + にしたがって + Mudança (à medida que)

Formal: にしたがい
Escrita: にしたがって / に従って""",
no="""No uso de "à medida que", にしたがって é parecido com につれて. につれて é um pouco mais comum na conversa, e にしたがって é mais formal.

Em avisos de emergência, 係員の指示に従って ("sigam as instruções dos funcionários") é uma frase muito comum.

No uso de "seguindo", a segunda parte costuma ser uma ação que alguém realiza.""",
bf="にしたがって",
rx="にしたがって|に従って|にしたがい|に従い",
tk=["に", "したがって"],
va=["にしたがって", "に従って", "にしたがい", "に従い"],
E=[
("先生の指示にしたがって、作業を進めてください。", "せんせいのしじにしたがって、さぎょうをすすめてください。", "Sigam as instruções do professor e continuem o trabalho."),
("年をとるにしたがって、体力が落ちてきた。", "としをとるにしたがって、たいりょくがおちてきた。", "À medida que envelheço, minha força física vem diminuindo."),
("地図にしたがって歩くと、駅に着いた。", "ちずにしたがってあるくと、えきについた。", "Seguindo o mapa, cheguei à estação."),
("町が発展するにしたがって、人口も増えた。", "まちがはってんするにしたがって、じんこうもふえた。", "À medida que a cidade se desenvolveu, a população também aumentou."),
("規則に従って、ゴミを出してください。", "きそくにしたがって、ゴミをだしてください。", "Coloque o lixo para fora de acordo com as regras."),
],
R=[
("説明書____、組み立ててください。", "Monte seguindo o manual, por favor.", ["にしたがって", "に従って"]),
("山の上に登る____、気温が下がる。", "À medida que se sobe a montanha, a temperatura cai.", ["にしたがって", "に従って"]),
("国民は法律____、税金を払う。", "Os cidadãos pagam impostos de acordo com a lei.", ["にしたがって", "に従って"]),
("日本語が上手になる____、日本の生活が楽しくなった。", "À medida que meu japonês melhorou, a vida no Japão ficou mais divertida.", ["にしたがって", "に従って"]),
("火事の時は、係員の案内____、避難してください。", "Em caso de incêndio, evacuem seguindo as orientações dos funcionários.", ["にしたがって", "に従って"]),
],
),
dict(
n=82,
jp="〜にしても",
rd="ni shite mo",
tr="Mesmo que / Ainda que / Mesmo sendo",
ex="""にしても é usado para admitir uma situação e, mesmo assim, apresentar uma opinião, uma crítica ou uma exigência que continua valendo. Equivale a "mesmo que", "ainda que" ou "mesmo sendo".

A primeira parte reconhece um fato ou uma possibilidade ("mesmo que esteja ocupado", "mesmo que fosse brincadeira"). A segunda parte mostra que, ainda assim, algo deveria ser diferente ("pelo menos ligar dá", "ela ficou magoada").

O tom é muitas vezes de crítica ou de cobrança.

Ele também aparece em pares, A にしても B にしても, com o sentido de "seja A ou B", mostrando que a conclusão vale para qualquer caso.

Vem depois da forma simples de verbos e adjetivos, e diretamente depois de substantivos.""",
st="""Verbo / Adjetivo (forma simples) + にしても、 + Opinião / Crítica
Substantivo + にしても
A + にしても、 + B + にしても (seja A ou B)

Variações formais: にせよ / にしろ""",
no="""それにしても, no começo da frase, significa "mesmo assim" ou "de qualquer forma", e é muito usado na conversa.

Em textos mais formais, にせよ e にしろ têm o mesmo sentido, e aparecem no N2.

Diferente de ても, にしても costuma expressar uma opinião de quem fala, muitas vezes com tom de crítica.""",
bf="にしても",
rx="にしても",
tk=["に", "しても"],
va=["にしても", "にしても〜にしても"],
E=[
("冗談にしても、言っていいことと悪いことがある。", "じょうだんにしても、いっていいこととわるいことがある。", "Mesmo sendo brincadeira, há coisas que se pode e que não se pode dizer."),
("忙しいにしても、電話くらいはできるでしょう。", "いそがしいにしても、でんわくらいはできるでしょう。", "Mesmo ocupado, pelo menos uma ligação dá para fazer, né?"),
("行くにしても、行かないにしても、早く連絡してください。", "いくにしても、いかないにしても、はやくれんらくしてください。", "Vá ou não vá, me avise logo, por favor."),
("遅れるにしても、連絡はするべきだ。", "おくれるにしても、れんらくはするべきだ。", "Mesmo que vá se atrasar, deveria avisar."),
("冗談だったにしても、彼女は傷ついた。", "じょうだんだったにしても、かのじょはきずついた。", "Mesmo que tenha sido brincadeira, ela ficou magoada."),
],
R=[
("疲れている____、挨拶ぐらいはしなさい。", "Mesmo cansado, pelo menos cumprimente as pessoas.", ["にしても"]),
("失敗した____、あきらめないで。", "Mesmo que tenha falhado, não desista.", ["にしても"]),
("パーティーに来ない____、連絡はしてほしい。", "Mesmo que não venha à festa, queria que avisasse.", ["にしても"]),
("子供のいたずら____、これはひどすぎる。", "Mesmo sendo travessura de criança, isso é demais.", ["にしても"]),
("高い____、一度は行ってみたい。", "Mesmo sendo caro, quero ir pelo menos uma vez.", ["にしても"]),
],
),
dict(
n=83,
jp="〜にしては",
rd="ni shite wa",
tr="Para (alguém que é...) / Considerando que",
ex="""にしては é usado para dizer que algo é diferente do que se esperaria, considerando uma condição. Equivale a "para..." ou "considerando que...".

A primeira parte apresenta uma condição que cria uma expectativa ("para um estrangeiro", "para a primeira vez", "para outubro"). A segunda parte mostra que a realidade foi diferente dessa expectativa.

Por exemplo, "para um estrangeiro, ele fala japonês muito bem" ou "para outubro, hoje está quente".

O resultado pode ser positivo (um elogio) ou negativo (uma decepção). O importante é o contraste com o que seria normal.

Ele vem depois de substantivos e da forma simples de verbos.""",
st="""Substantivo + にしては + Avaliação inesperada
Verbo (forma simples) + にしては + Avaliação inesperada""",
no="""A diferença entre にしては e にしても: にしては mostra surpresa porque o resultado foi diferente do esperado; にしても admite algo e mantém uma opinião ou crítica.

Elogios com にしては podem soar condescendentes se a condição for sensível, como idade ou nacionalidade. Use com cuidado.

Com expressões de quantidade, にしては também funciona: "para um preço de mil ienes, é muito bom".""",
bf="にしては",
rx="にしては",
tk=["に", "しては"],
va=["にしては"],
E=[
("彼は外国人にしては、日本語がとても上手だ。", "かれはがいこくじんにしては、にほんごがとてもじょうずだ。", "Para um estrangeiro, ele fala japonês muito bem."),
("初めてにしては、よくできましたね。", "はじめてにしては、よくできましたね。", "Para a primeira vez, você se saiu muito bem."),
("この店は駅前にしては、値段が安い。", "このみせはえきまえにしては、ねだんがやすい。", "Para uma loja em frente à estação, os preços são baratos."),
("十月にしては、今日は暑い。", "じゅうがつにしては、きょうはあつい。", "Para outubro, hoje está quente."),
("小学生にしては、難しい言葉を知っている。", "しょうがくせいにしては、むずかしいことばをしっている。", "Para um aluno do primário, ele conhece palavras difíceis."),
],
R=[
("子供____、よく食べますね。", "Para uma criança, você come bastante, hein.", ["にしては"]),
("夏____、涼しい日が続いている。", "Para o verão, os dias têm sido frescos.", ["にしては"]),
("初心者____、上手ですね。", "Para um iniciante, você é bom, hein.", ["にしては"]),
("有名なレストラン____、あまりおいしくなかった。", "Para um restaurante famoso, não era muito gostoso.", ["にしては"]),
("一生懸命勉強した____、点数が悪かった。", "Considerando que estudei muito, a nota foi ruim.", ["にしては"]),
],
),
dict(
n=84,
jp="〜に対して",
rd="ni taishite",
tr="Para com / Em relação a / Em contraste com",
ex="""に対して tem três usos principais.

O primeiro é indicar o alvo de uma ação ou atitude: "para com", "em relação a". Por exemplo, a forma de falar com um professor, a resposta a uma pergunta ou o tratamento dado aos clientes.

O segundo é indicar contraste entre duas coisas: "enquanto A é..., B é...". Nesse caso, usa-se のに対して depois de uma frase. Por exemplo, "enquanto o irmão mais velho é alto, o mais novo é baixo".

O terceiro, com に対する, vem antes de um substantivo para dizer o objeto de um sentimento ou interesse: 環境問題に対する関心 (o interesse pelos problemas ambientais).

É uma expressão um pouco formal, muito usada na escrita e em situações sérias.""",
st="""Substantivo (pessoa / coisa) + に対して + Verbo / Atitude
Frase + のに対して、 + Frase contrastante
Substantivo + に対する + Substantivo
Substantivo + に対しては + … (no caso de...)

Formal: に対し""",
no="""Para falar do assunto de algo (sobre), usa-se について. に対して é para o alvo de uma ação ou atitude.

No uso de contraste, のに対して é comum em textos que comparam dados, como estatísticas.

A expressão 〜に対して失礼だ (ser mal-educado com alguém) é bem frequente.""",
bf="に対して",
rx="に対して|に対する|に対し|にたいして",
tk=["に", "対して"],
va=["に対して", "に対する", "に対し", "のに対して"],
E=[
("先生に対して、失礼なことを言ってはいけない。", "せんせいにたいして、しつれいなことをいってはいけない。", "Não se deve dizer coisas mal-educadas ao professor."),
("彼は質問に対して、丁寧に答えた。", "かれはしつもんにたいして、ていねいにこたえた。", "Ele respondeu à pergunta com cuidado."),
("兄は背が高いのに対して、弟は低い。", "あにはせがたかいのにたいして、おとうとはひくい。", "Enquanto o irmão mais velho é alto, o mais novo é baixo."),
("最近、環境問題に対する関心が高まっている。", "さいきん、かんきょうもんだいにたいするかんしんがたかまっている。", "Ultimamente, o interesse pelos problemas ambientais tem aumentado."),
("お客様に対しては、いつも笑顔で接してください。", "おきゃくさまにたいしては、いつもえがおでせっしてください。", "Com os clientes, trate sempre com um sorriso."),
],
R=[
("日本では、目上の人____、敬語を使う。", "No Japão, usa-se linguagem honorífica com pessoas mais velhas ou superiores.", ["に対して"]),
("彼の意見____、反対する人が多い。", "Muitas pessoas são contra a opinião dele.", ["に対して"]),
("子供____教育は大切だ。", "A educação das crianças é importante.", ["に対する"]),
("東京は人が多いの____、田舎は少ない。", "Enquanto Tóquio tem muita gente, o interior tem pouca.", ["に対して"]),
("親切にしてもらったこと____、お礼を言った。", "Agradeci pela gentileza que recebi.", ["に対して"]),
],
),
dict(
n=85,
jp="〜にとって",
rd="ni totte",
tr="Para (alguém) / Do ponto de vista de",
ex="""にとって é usado para indicar o ponto de vista de alguém, ou seja, para quem algo é importante, difícil, necessário ou especial. Equivale a "para" ou "do ponto de vista de".

Ele vem depois de uma pessoa, um grupo ou uma coisa, e a segunda parte traz uma avaliação, geralmente com adjetivos como 大切, 難しい, 必要 e 特別.

Por exemplo, "para mim, a família é o mais importante" ou "para estrangeiros, kanji é difícil".

Com は, にとっては destaca o contraste: "para os estudantes, pelo menos, as férias são a maior alegria". Com の, にとっての vem antes de um substantivo.

にとって é usado para avaliações e opiniões, e não para ações feitas para alguém. Para isso, usa-se のために.""",
st="""Pessoa / Grupo / Coisa + にとって + Avaliação (大切 / 難しい / 必要 / 特別)
Pessoa + にとっては + … (contraste)
Pessoa + にとっての + Substantivo""",
no="""Um erro comum é usar にとって com verbos de ação. Para "fiz um bolo para minha mãe", usa-se のために ou に, e não にとって.

Comparando: にとって indica para quem algo tem certo valor; に対して indica para quem uma ação é direcionada.

Em redações, 私にとって〜とは ("para mim, X é...") é uma forma comum de começar uma reflexão.""",
bf="にとって",
rx="にとって|にとっては|にとっての",
tk=["に", "とって"],
va=["にとって", "にとっては", "にとっての"],
E=[
("私にとって、家族が一番大切です。", "わたしにとって、かぞくがいちばんたいせつです。", "Para mim, a família é o mais importante."),
("この写真は私にとって大切な宝物だ。", "このしゃしんはわたしにとってたいせつなたからものだ。", "Esta foto é um tesouro precioso para mim."),
("子供にとって、遊ぶことも勉強だ。", "こどもにとって、あそぶこともべんきょうだ。", "Para as crianças, brincar também é aprender."),
("外国人にとって、漢字は難しい。", "がいこくじんにとって、かんじはむずかしい。", "Para os estrangeiros, kanji é difícil."),
("学生にとっては、夏休みが一番の楽しみだ。", "がくせいにとっては、なつやすみがいちばんのたのしみだ。", "Para os estudantes, as férias de verão são a maior alegria."),
],
R=[
("私____、音楽はなくてはならないものだ。", "Para mim, a música é algo indispensável.", ["にとって"]),
("植物____、水と光は必要だ。", "Para as plantas, água e luz são necessárias.", ["にとって"]),
("経験が長い彼____、この仕事は簡単すぎる。", "Para ele, que tem muita experiência, este trabalho é fácil demais.", ["にとって"]),
("子供たち____、公園は大切な場所だ。", "Para as crianças, o parque é um lugar importante.", ["にとって"]),
("日本人____、桜は特別な花です。", "Para os japoneses, a cerejeira é uma flor especial.", ["にとって"]),
],
),
dict(
n=86,
jp="〜について",
rd="ni tsuite",
tr="Sobre / A respeito de / Acerca de",
ex="""について é usado para indicar o assunto ou o tema de uma ação, como falar, pensar, estudar, perguntar ou escrever. Equivale a "sobre", "a respeito de" ou "acerca de".

Ele vem depois de um substantivo e antes de verbos como 話す, 考える, 勉強する, 調べる, 書く e 聞く.

Antes de um substantivo, usa-se についての: 環境についてのレポート (um relatório sobre o meio ambiente).

Com は, については destaca o tema, às vezes com contraste: "quanto a esse assunto, explico depois".

について é a forma mais comum e neutra para "sobre". Em situações mais formais, usa-se に関して.""",
st="""Substantivo + について + Verbo (話す / 考える / 調べる / 書く)
Substantivo + についての + Substantivo
Substantivo + については + …

Formal: に関して / に関する""",
no="""Na fala, について é muito mais comum que に関して.

Para dizer "um livro sobre X", existem duas opções: Xについての本 e Xに関する本. A segunda soa mais formal.

について também aparece em perguntas de opinião: 〜についてどう思いますか (o que você acha de...?).""",
bf="について",
rx="について|についての|については",
tk=["に", "ついて"],
va=["について", "についての", "については"],
E=[
("大学で日本の文化について勉強しています。", "だいがくでにほんのぶんかについてべんきょうしています。", "Na faculdade, estou estudando sobre a cultura japonesa."),
("この問題について、どう思いますか。", "このもんだいについて、どうおもいますか。", "O que você acha deste problema?"),
("将来について、両親と話した。", "しょうらいについて、りょうしんとはなした。", "Conversei com meus pais sobre o futuro."),
("環境についてのレポートを書いた。", "かんきょうについてのレポートをかいた。", "Escrevi um relatório sobre o meio ambiente."),
("その件については、後で説明します。", "そのけんについては、あとでせつめいします。", "Quanto a esse assunto, explico depois."),
],
R=[
("日本の歴史____、もっと知りたい。", "Quero saber mais sobre a história do Japão.", ["について"]),
("旅行の計画____、話し合いましょう。", "Vamos conversar sobre o plano da viagem.", ["について"]),
("授業で、自分の国____発表した。", "Na aula, fiz uma apresentação sobre o meu país.", ["について"]),
("彼の意見____、どう思いますか。", "O que você acha da opinião dele?", ["について"]),
("新しい商品____説明を聞いた。", "Ouvi uma explicação sobre o novo produto.", ["についての"]),
],
),
dict(
n=87,
jp="〜につれて",
rd="ni tsurete",
tr="À medida que / Conforme / Com o passar de",
ex="""につれて é usado para dizer que, à medida que uma coisa muda, outra coisa também muda gradualmente. Equivale a "à medida que", "conforme" ou "com o passar de".

Ele vem depois de verbos de mudança na forma de dicionário, como たつ (passar), 近づく (aproximar-se), 大きくなる (crescer) e 上手になる (melhorar).

A segunda parte também descreve uma mudança gradual, que acompanha a primeira. Por exemplo, "conforme o tempo passou, a tristeza foi desaparecendo".

Por isso, a segunda parte não pode ser uma ação pontual ou uma vontade. Ela precisa ser uma mudança natural e progressiva.""",
st="""Verbo de mudança (forma de dicionário) + につれて、 + Mudança gradual
Substantivo de mudança + につれて (時代 / 成長)

Formal: につれ""",
no="""につれて e にしたがって são muito parecidos no sentido de "à medida que". につれて é um pouco mais comum na conversa.

A segunda parte costuma ter formas como てくる, ていく, ようになる ou adjetivos com なる, que indicam mudança.

É muito usado em reflexões sobre o tempo, o crescimento e o envelhecimento.""",
bf="につれて",
rx="につれて|につれ",
tk=["に", "つれて"],
va=["につれて", "につれ"],
E=[
("時間がたつにつれて、悲しみが消えていった。", "じかんがたつにつれて、かなしみがきえていった。", "Com o passar do tempo, a tristeza foi desaparecendo."),
("年をとるにつれて、体が弱くなる。", "としをとるにつれて、からだがよわくなる。", "À medida que envelhecemos, o corpo fica mais fraco."),
("町が大きくなるにつれて、交通が不便になった。", "まちがおおきくなるにつれて、こうつうがふべんになった。", "Conforme a cidade cresceu, o trânsito ficou pior."),
("日本語が上手になるにつれて、友達が増えた。", "にほんごがじょうずになるにつれて、ともだちがふえた。", "À medida que meu japonês melhorou, fiz mais amigos."),
("試験が近づくにつれて、緊張してきた。", "しけんがちかづくにつれて、きんちょうしてきた。", "Conforme a prova se aproximava, fui ficando nervoso."),
],
R=[
("冬が近づく____、寒くなってきた。", "À medida que o inverno se aproxima, vem esfriando.", ["につれて"]),
("子供が成長する____、家が狭く感じる。", "Conforme as crianças crescem, a casa parece menor.", ["につれて"]),
("時代が変わる____、人々の考え方も変わる。", "Com a mudança dos tempos, o modo de pensar das pessoas também muda.", ["につれて"]),
("山を登る____、空気が冷たくなった。", "À medida que subíamos a montanha, o ar ficava mais frio.", ["につれて"]),
("彼の話を聞く____、彼の気持ちがわかってきた。", "Conforme ouvia o que ele dizia, fui entendendo os sentimentos dele.", ["につれて"]),
],
),
dict(
n=88,
jp="〜には（目的）",
rd="ni wa (mokuteki)",
tr="Para (fazer) / A fim de",
ex="""Nesse uso, には indica um objetivo, e a segunda parte explica o que é necessário ou recomendado para alcançá-lo. Equivale a "para" ou "a fim de".

Ele vem depois do verbo na forma de dicionário. Por exemplo, "para ir à estação, pegue este ônibus" ou "para entrar na faculdade, é preciso passar no exame".

A segunda parte costuma ser uma condição, uma necessidade, um conselho ou uma informação útil, com expressões como 必要だ, なければならない, がいい, が便利だ ou かかる.

A diferença em relação a ために é que ために expressa uma intenção ou um esforço para alcançar algo, enquanto には apresenta o objetivo de forma geral e diz o que é preciso para chegar lá.""",
st="""Verbo na forma de dicionário + には + Condição / Necessidade / Conselho
… + には + 〜が必要だ / 〜なければならない / 〜がいい / 〜が便利だ / 〜かかる""",
no="""Não confunda com には de lugar e tempo, que é a partícula に com は de destaque, como em 東京には (em Tóquio).

Essa estrutura é muito útil para pedir e dar informações práticas, como caminhos e requisitos.

Com substantivos, a ideia de objetivo é expressa com のには ou com ために.""",
bf="には",
rx="には",
tk=["に", "は"],
va=["には"],
E=[
("駅に行くには、このバスに乗ってください。", "えきにいくには、このバスにのってください。", "Para ir à estação, pegue este ônibus."),
("日本語が上手になるには、毎日練習することが大切だ。", "にほんごがじょうずになるには、まいにちれんしゅうすることがたいせつだ。", "Para melhorar o japonês, é importante praticar todo dia."),
("その大学に入るには、試験に合格しなければならない。", "そのだいがくにはいるには、しけんにごうかくしなければならない。", "Para entrar nessa faculdade, é preciso passar no exame."),
("この料理を作るには、三時間かかる。", "このりょうりをつくるには、さんじかんかかる。", "Para fazer esta comida, leva três horas."),
("健康を保つには、よく寝ることが一番だ。", "けんこうをたもつには、よくねることがいちばんだ。", "Para manter a saúde, o melhor é dormir bem."),
],
R=[
("富士山に登る____、準備が必要だ。", "Para subir o Monte Fuji, é preciso se preparar.", ["には"]),
("この会社に入る____、英語ができなければならない。", "Para entrar nesta empresa, é preciso saber inglês.", ["には"]),
("空港へ行く____、電車が便利です。", "Para ir ao aeroporto, o trem é prático.", ["には"]),
("夢をかなえる____、努力が必要だ。", "Para realizar um sonho, é preciso esforço.", ["には"]),
("車を運転する____、免許がいる。", "Para dirigir um carro, é preciso ter carteira.", ["には"]),
],
),
dict(
n=89,
jp="〜によると・〜によれば",
rd="ni yoru to / ni yoreba",
tr="Segundo / De acordo com",
ex="""によると e によれば são usados para indicar a fonte de uma informação. Equivalem a "segundo" ou "de acordo com".

A fonte vem antes, como a previsão do tempo, o jornal, uma notícia, uma pesquisa ou o que alguém disse. Depois vem a informação.

A frase costuma terminar com expressões que mostram que a informação foi ouvida ou lida, como そうだ, らしい, ということだ ou とのことだ. Isso deixa claro que quem fala está repassando uma informação, e não dando a própria opinião.

As duas formas têm o mesmo sentido. によれば soa um pouco mais formal.""",
st="""Fonte + によると、 + Informação + そうだ / らしい / ということだ
Fonte + によれば、 + Informação + そうだ / らしい

Fontes comuns: 天気予報 / ニュース / 新聞 / 調査 / 〜の話""",
no="""Sem o final そうだ ou らしい, a frase pode soar incompleta ou como se quem fala estivesse afirmando algo por conta própria.

〜の話によると ("segundo o que fulano disse") é muito comum na conversa.

Em textos acadêmicos, 調査によれば ("segundo a pesquisa") aparece com frequência.""",
bf="によると",
rx="によると|によれば",
tk=["に", "よると"],
va=["によると", "によれば"],
E=[
("天気予報によると、明日は雪だそうです。", "てんきよほうによると、あしたはゆきだそうです。", "Segundo a previsão do tempo, amanhã vai nevar."),
("ニュースによると、昨日大きな地震があったらしい。", "ニュースによると、きのうおおきなじしんがあったらしい。", "De acordo com o noticiário, parece que houve um grande terremoto ontem."),
("先生の話によれば、試験は来週だそうだ。", "せんせいのはなしによれば、しけんはらいしゅうだそうだ。", "Segundo o que o professor disse, a prova é na semana que vem."),
("新聞によると、来月から物価が上がるそうです。", "しんぶんによると、らいげつからぶっかがあがるそうです。", "Segundo o jornal, os preços vão subir a partir do mês que vem."),
("調査によれば、若者の読書量が減っている。", "ちょうさによれば、わかもののどくしょりょうがへっている。", "De acordo com a pesquisa, a quantidade de leitura entre os jovens está diminuindo."),
],
R=[
("友達の話____、あの店は安いそうだ。", "Segundo o que meu amigo disse, aquela loja é barata.", ["によると", "によれば"]),
("天気予報____、明日は晴れるそうです。", "Segundo a previsão do tempo, amanhã vai fazer sol.", ["によると", "によれば"]),
("医者____、手術は必要ないそうです。", "Segundo o médico, a cirurgia não é necessária.", ["によると", "によれば"]),
("新聞の記事____、事故の原因はスピードの出しすぎだったそうだ。", "Segundo a matéria do jornal, a causa do acidente foi excesso de velocidade.", ["によると", "によれば"]),
("噂____、二人は結婚するらしい。", "Pelo que dizem por aí, os dois vão se casar.", ["によると", "によれば"]),
],
),
dict(
n=90,
jp="〜によって・〜による",
rd="ni yotte / ni yoru",
tr="Por / Devido a / Dependendo de / Por meio de",
ex="""によって é uma expressão com vários usos importantes no N3.

• Agente da passiva: indica quem fez algo, principalmente em obras, descobertas e criações. Por exemplo, "este quadro foi pintado por Picasso".
• Causa: indica o motivo de algo, geralmente acontecimentos como desastres. Por exemplo, "muitas casas foram destruídas por causa do tufão".
• Meio: indica o meio pelo qual algo é feito. Por exemplo, "a vida ficou mais prática por meio da internet".
• Variação: indica que algo muda conforme cada caso. Por exemplo, "os costumes variam de país para país".

Antes de um substantivo, usa-se による: 地震による被害 (os danos causados pelo terremoto). A forma により é mais formal e aparece em avisos e notícias.""",
st="""Substantivo + によって + Verbo passivo (agente)
Substantivo + によって / により + Resultado (causa)
Substantivo + によって + Verbo (meio)
Substantivo + によって + 違う / 異なる (variação)
Substantivo + による + Substantivo""",
no="""No uso de variação, によって costuma vir com 違う, 異なる ou 変わる.

Em avisos de trens, 〜により運転を見合わせています ("o serviço está suspenso por causa de...") é muito comum.

Na passiva comum do dia a dia, como "fui elogiado pelo professor", usa-se に, e não によって.""",
bf="によって",
rx="によって|による|により",
tk=["に", "よって"],
va=["によって", "による", "により"],
E=[
("この絵はピカソによって描かれた。", "このえはピカソによってかかれた。", "Este quadro foi pintado por Picasso."),
("国によって、習慣が違う。", "くにによって、しゅうかんがちがう。", "Os costumes variam de país para país."),
("台風によって、多くの家が壊れた。", "たいふうによって、おおくのいえがこわれた。", "Muitas casas foram destruídas por causa do tufão."),
("インターネットによって、生活が便利になった。", "インターネットによって、せいかつがべんりになった。", "A vida ficou mais prática por meio da internet."),
("地震による被害は大きかった。", "じしんによるひがいはおおきかった。", "Os danos causados pelo terremoto foram grandes."),
],
R=[
("この小説は有名な作家____書かれた。", "Este romance foi escrito por um autor famoso.", ["によって"]),
("人____、考え方は違う。", "O modo de pensar varia de pessoa para pessoa.", ["によって"]),
("大雨____、電車が止まった。", "Os trens pararam por causa da chuva forte.", ["によって", "により"]),
("事故____けが人は三人だった。", "Houve três feridos por causa do acidente.", ["による"]),
("話し合い____、問題を解決した。", "Resolvemos o problema por meio do diálogo.", ["によって"]),
],
),
]
