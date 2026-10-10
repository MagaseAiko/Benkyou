G = [
dict(
n=1,
jp="〜あげく",
rd="ageku",
tr="Depois de muito... acabou / No fim de tudo / Ao final de",
ex="""あげく é usado para dizer que, depois de um processo longo e difícil, a situação terminou em um resultado, geralmente negativo ou decepcionante. Equivale a "depois de muito..., acabou..." ou "no fim de tudo".

A primeira parte descreve algo que durou bastante e exigiu esforço, como ficar em dúvida, discutir, procurar ou sofrer. A segunda mostra o desfecho, muitas vezes frustrante.

Por exemplo, "depois de ficar em dúvida por muito tempo, acabei não comprando nada" ou "depois de muito discutir, o plano foi cancelado".

Ele vem depois do verbo na forma た e de substantivos com の.

Expressões como さんざん, いろいろ e 長い間 combinam muito com あげく, porque reforçam a ideia de um processo longo.""",
st="""Verbo na forma た + あげく(に)、 + Resultado
Substantivo + の + あげく(に)、 + Resultado

Escrita: あげく / 挙げ句 / 挙句""",
no="""あげく tem um tom quase sempre negativo. Para resultados positivos depois de esforço, usa-se 末に, que também aparece no N2.

あげくの果てに é uma expressão ainda mais forte, como "e, para piorar tudo...".

A segunda parte descreve um fato que já aconteceu, e não uma vontade ou um pedido.""",
bf="あげく",
rx="あげく|挙げ句|挙句",
tk=["あげく"],
va=["あげく", "あげくに", "挙げ句"],
E=[
("さんざん迷ったあげく、何も買わなかった。", "さんざんまよったあげく、なにもかわなかった。", "Depois de ficar muito tempo em dúvida, acabei não comprando nada."),
("長い間話し合ったあげく、計画は中止になった。", "ながいあいだはなしあったあげく、けいかくはちゅうしになった。", "Depois de muito discutir, o plano acabou sendo cancelado."),
("彼は悩んだあげく、会社をやめることにした。", "かれはなやんだあげく、かいしゃをやめることにした。", "Depois de muito sofrer com a decisão, ele resolveu sair da empresa."),
("道に迷ったあげく、約束の時間に遅れてしまった。", "みちにまよったあげく、やくそくのじかんにおくれてしまった。", "Me perdi e, no fim, acabei chegando atrasado ao compromisso."),
("何度も喧嘩したあげく、二人は別れた。", "なんどもけんかしたあげく、ふたりはわかれた。", "Depois de brigarem várias vezes, os dois se separaram."),
],
R=[
("一時間も待たされた____、会議は中止になった。", "Depois de nos fazerem esperar uma hora inteira, a reunião foi cancelada.", ["あげく"]),
("散々考えた____、留学をあきらめた。", "Depois de pensar muito, desisti do intercâmbio.", ["あげく"]),
("色々な店を回った____、最初の店で買った。", "Depois de rodar várias lojas, no fim comprei na primeira.", ["あげく"]),
("何度も失敗した____、彼はついに諦めた。", "Depois de fracassar muitas vezes, ele finalmente desistiu.", ["あげく"]),
("長い議論の____、結論は出なかった。", "Ao final de uma longa discussão, não se chegou a nenhuma conclusão.", ["あげく"]),
],
),
dict(
n=2,
jp="あるいは",
rd="aruiwa",
tr="Ou / Ou então / Talvez",
ex="""あるいは é uma conjunção formal que significa "ou". Ela apresenta alternativas, das quais uma é escolhida.

Ela é muito usada em textos escritos, avisos, formulários, documentos e notícias. Na conversa, os japoneses costumam usar か ou それか.

Por exemplo, "entre em contato por telefone ou e-mail" ou "amanhã vai chover ou nevar".

Além de "ou", あるいは também pode significar "talvez", no começo de uma frase, com かもしれない: "talvez o que ele diz esteja certo". Nesse uso, ela é parecida com もしかすると.

あるいは é um pouco mais formal e literária que または.""",
st="""A + あるいは + B (A ou B)
A、 + あるいは + B
あるいは、 + Frase + かもしれない (talvez)

Escrita: あるいは / 或いは""",
no="""または e あるいは são muito parecidas. あるいは soa mais escrito e é comum em textos jornalísticos.

No uso de "talvez", あるいは deixa a suposição mais suave e literária.

Em formulários, frases como 本人あるいは家族 ("a própria pessoa ou um familiar") aparecem com frequência.""",
bf="あるいは",
rx="あるいは|或いは",
tk=["あるいは"],
va=["あるいは", "或いは"],
E=[
("電話あるいはメールで連絡してください。", "でんわあるいはメールでれんらくしてください。", "Entre em contato por telefone ou e-mail."),
("明日は雨、あるいは雪になるでしょう。", "あしたはあめ、あるいはゆきになるでしょう。", "Amanhã deve chover ou nevar."),
("申し込みは、インターネットあるいは郵送で受け付けます。", "もうしこみは、インターネットあるいはゆうそうでうけつけます。", "As inscrições são aceitas pela internet ou pelo correio."),
("彼はもう帰ったか、あるいはまだ会議中かもしれない。", "かれはもうかえったか、あるいはまだかいぎちゅうかもしれない。", "Talvez ele já tenha ido embora, ou então ainda esteja em reunião."),
("あるいは、彼の言うことが正しいのかもしれない。", "あるいは、かれのいうことがただしいのかもしれない。", "Talvez o que ele diz esteja certo."),
],
R=[
("黒____青のペンで記入してください。", "Preencha com caneta preta ou azul.", ["あるいは"]),
("来週の月曜日、____火曜日に伺います。", "Irei visitá-lo na segunda ou na terça da semana que vem.", ["あるいは"]),
("本人____家族の方が来てください。", "Venha a própria pessoa ou um familiar.", ["あるいは"]),
("____、それが正しい答えかもしれない。", "Talvez essa seja a resposta correta.", ["あるいは"]),
("現金____クレジットカードでお支払いください。", "Pague em dinheiro ou com cartão de crédito.", ["あるいは"]),
],
),
dict(
n=3,
jp="〜ばかり（数量）",
rd="bakari (suuryou)",
tr="Cerca de / Mais ou menos / Uns",
ex="""Depois de números e quantidades, ばかり indica uma quantidade aproximada. Equivale a "cerca de", "mais ou menos" ou "uns".

Por exemplo, "andei cerca de dez minutos" ou "tirei uns dias de folga".

É parecido com ぐらい e ほど, mas soa um pouco mais formal e literário.

Também aparece em expressões como 少しばかり, que significa "um pouquinho" e é usada com modéstia, como ao pedir algo emprestado ou ao oferecer um presente.

Esse uso é diferente do ばかり de "só" e do たばかり de "acabou de".""",
st="""Número + Contador + ばかり
Número + Contador + ばかり + の + Substantivo
少しばかり (um pouquinho)""",
no="""Na conversa do dia a dia, ぐらい é mais comum. ばかり com números soa mais escrito.

少しばかりですが ("é só uma lembrancinha") é uma frase humilde usada ao dar presentes.

O contexto mostra qual ばかり é: depois de números, é quantidade aproximada.""",
bf="ばかり",
rx="ばかり",
tk=["ばかり"],
va=["ばかり", "少しばかり"],
E=[
("駅まで十分ばかり歩いた。", "えきまでじゅっぷんばかりあるいた。", "Andei cerca de dez minutos até a estação."),
("一週間ばかり休みをもらった。", "いっしゅうかんばかりやすみをもらった。", "Tirei mais ou menos uma semana de folga."),
("すまないが、千円ばかり貸してくれないか。", "すまないが、せんえんばかりかしてくれないか。", "Desculpe, mas você poderia me emprestar uns mil ienes?"),
("三日ばかり旅行に行ってきます。", "みっかばかりりょこうにいってきます。", "Vou viajar por uns três dias."),
("会場には十人ばかりの人が集まった。", "かいじょうにはじゅうにんばかりのひとがあつまった。", "Cerca de dez pessoas se reuniram no local."),
],
R=[
("駅で一時間____待った。", "Esperei cerca de uma hora na estação.", ["ばかり"]),
("祖母は五日____入院していた。", "Minha avó ficou internada por uns cinco dias.", ["ばかり"]),
("すみません、少し____お金を貸してください。", "Desculpe, poderia me emprestar um pouquinho de dinheiro?", ["ばかり"]),
("説明会には二十人____の学生が参加した。", "Cerca de vinte estudantes participaram da reunião informativa.", ["ばかり"]),
("去年、一か月____日本を旅行した。", "No ano passado, viajei pelo Japão por cerca de um mês.", ["ばかり"]),
],
),
dict(
n=4,
jp="〜ばかりだ",
rd="bakari da",
tr="Só piorar / Só aumentar / Cada vez mais",
ex="""ばかりだ, depois de um verbo de mudança na forma de dicionário, indica que uma situação muda continuamente em uma única direção, quase sempre para pior. Equivale a "só piora", "só aumenta" ou "fica cada vez mais...".

Por exemplo, "a doença só piora" ou "os preços só sobem, e o salário não aumenta".

O sentido é muito parecido com 一方だ (N3). As duas formas indicam uma tendência que não para. ばかりだ costuma ter um tom ainda mais negativo e preocupado.

Ela é usada com verbos como 悪くなる, 増える, 減る, 上がる e 下がる.

Na forma ばかりで, liga a tendência a uma consequência negativa.""",
st="""Verbo de mudança (forma de dicionário) + ばかりだ / ばかりです
Verbo de mudança + ばかりで、 + Consequência
Passado: ばかりだった""",
no="""ばかりだ, nesse sentido, quase nunca é usado para mudanças positivas. Para algo bom que só aumenta, prefira 一方だ ou ていく.

Não confunda com ばかり de "só / nada além de", que vem depois de substantivos.

Em notícias sobre economia e meio ambiente, essa estrutura aparece com frequência.""",
bf="ばかりだ",
rx="ばかりだ|ばかりです|ばかりで",
tk=["ばかり", "だ"],
va=["ばかりだ", "ばかりです", "ばかりで", "ばかりだった"],
E=[
("祖父の病気は悪くなるばかりだ。", "そふのびょうきはわるくなるばかりだ。", "A doença do meu avô só piora."),
("物価は上がるばかりで、給料は上がらない。", "ぶっかはあがるばかりで、きゅうりょうはあがらない。", "Os preços só sobem, e o salário não aumenta."),
("彼との関係は悪化するばかりだ。", "かれとのかんけいはあっかするばかりだ。", "A relação com ele só piora."),
("この町の人口は減るばかりです。", "このまちのじんこうはへるばかりです。", "A população desta cidade só diminui."),
("カードを使いすぎて、借金は増えるばかりだった。", "カードをつかいすぎて、しゃっきんはふえるばかりだった。", "Usei demais o cartão, e a dívida só aumentava."),
],
R=[
("夜になって、雨は強くなる____。", "À noite, a chuva só fica mais forte.", ["ばかりだ", "ばかりです"]),
("仕事は増える____で、休めない。", "O trabalho só aumenta, e não consigo descansar.", ["ばかり"]),
("最近、彼の成績は下がる____。", "Ultimamente, as notas dele só caem.", ["ばかりだ", "ばかりです"]),
("一人で考えていると、心配は大きくなる____です。", "Quando penso sozinho, a preocupação só aumenta.", ["ばかり"]),
("けんかの後、二人の関係は悪くなる____だった。", "Depois da briga, a relação dos dois só piorava.", ["ばかり"]),
],
),
dict(
n=5,
jp="〜ばかりか",
rd="bakari ka",
tr="Não só... como até / Não apenas... mas também",
ex="""ばかりか é usado para dizer que, além de uma coisa, existe outra ainda mais surpreendente ou extrema. Equivale a "não só..., como até" ou "não apenas..., mas também".

A primeira parte apresenta algo, e a segunda acrescenta algo a mais, geralmente com も, まで ou さえ, que reforçam a ideia de "até mesmo".

Por exemplo, "ele não só não pediu desculpas, como até reclamou" ou "não só choveu, como até começou a trovejar".

Pode ser usado para coisas positivas ou negativas. O ponto principal é que a segunda parte vai além da primeira.

Comparado a ばかりでなく e だけでなく, ばかりか é mais enfático e soa mais formal.""",
st="""Substantivo + ばかりか、 + … + も / まで / さえ
Verbo / Adjetivo い (forma simples) + ばかりか
Adjetivo な + な + ばかりか""",
no="""ばかりか não é usado com pedidos ou ordens na segunda parte. Ela descreve fatos.

まで e さえ na segunda parte deixam a surpresa ainda mais evidente.

É comum em textos escritos e narrativas, para mostrar uma situação que foi se agravando ou melhorando além do esperado.""",
bf="ばかりか",
rx="ばかりか",
tk=["ばかり", "か"],
va=["ばかりか"],
E=[
("彼は英語ばかりか、フランス語も話せる。", "かれはえいごばかりか、フランスごもはなせる。", "Ele fala não só inglês, como também francês."),
("この店は安いばかりか、味もいい。", "このみせはやすいばかりか、あじもいい。", "Esta loja não só é barata, como também é gostosa."),
("彼は謝らないばかりか、文句まで言った。", "かれはあやまらないばかりか、もんくまでいった。", "Ele não só não pediu desculpas, como até reclamou."),
("雨ばかりか、雷まで鳴り出した。", "あめばかりか、かみなりまでなりだした。", "Não só choveu, como até começou a trovejar."),
("彼女は勉強ばかりか、スポーツも得意だ。", "かのじょはべんきょうばかりか、スポーツもとくいだ。", "Ela vai bem não só nos estudos, como também nos esportes."),
],
R=[
("子供____、大人もこのゲームに夢中だ。", "Não só as crianças, como até os adultos estão viciados neste jogo.", ["ばかりか"]),
("彼は約束を忘れた____、うそまでついた。", "Ele não só esqueceu o compromisso, como até mentiu.", ["ばかりか"]),
("この薬は効かない____、副作用もある。", "Este remédio não só não funciona, como ainda tem efeitos colaterais.", ["ばかりか"]),
("旅行中、財布____、パスポートまでなくした。", "Na viagem, perdi não só a carteira, como até o passaporte.", ["ばかりか"]),
("彼女は料理が上手な____、裁縫も得意だ。", "Ela não só cozinha bem, como também é ótima na costura.", ["ばかりか"]),
],
),
dict(
n=6,
jp="〜ばかりに",
rd="bakari ni",
tr="Só por causa de / Simplesmente porque / Por um simples",
ex="""ばかりに é usado para dizer que um único motivo, muitas vezes pequeno, causou um resultado ruim. Equivale a "só por causa de", "simplesmente porque" ou "por um simples...".

O tom é de arrependimento ou lamento: se não fosse aquele motivo, tudo teria dado certo. Por exemplo, "só porque dormi demais, me atrasei para a prova" ou "por ter dito uma palavra a mais, acabei deixando ela brava".

A segunda parte é sempre negativa ou indesejada.

Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な e de substantivos com である.""",
st="""Verbo / Adjetivo い (forma simples) + ばかりに、 + Resultado negativo
Adjetivo な + な + ばかりに
Substantivo + である + ばかりに""",
no="""Com たい, a forma たいばかりに significa "só por querer muito...", mostrando que a pessoa fez algo extremo por um desejo forte: 会いたいばかりに.

A diferença em relação a せいで é que ばかりに destaca que o motivo foi pequeno ou único, o que torna o resultado ainda mais lamentável.

A segunda parte não pode ser uma vontade ou um pedido.""",
bf="ばかりに",
rx="ばかりに",
tk=["ばかり", "に"],
va=["ばかりに", "たいばかりに"],
E=[
("寝坊したばかりに、試験に遅れた。", "ねぼうしたばかりに、しけんにおくれた。", "Só porque dormi demais, me atrasei para a prova."),
("一言言ったばかりに、彼女を怒らせてしまった。", "ひとこといったばかりに、かのじょをおこらせてしまった。", "Por uma simples palavra, acabei deixando ela brava."),
("お金がないばかりに、大学に行けなかった。", "おかねがないばかりに、だいがくにいけなかった。", "Só por falta de dinheiro, não pude ir para a faculdade."),
("確認しなかったばかりに、大きな失敗をした。", "かくにんしなかったばかりに、おおきなしっぱいをした。", "Só por não ter conferido, cometi um grande erro."),
("背が低いばかりに、モデルになれなかった。", "せがひくいばかりに、モデルになれなかった。", "Só por ser baixa, não consegui ser modelo."),
],
R=[
("傘を忘れた____、びしょ濡れになった。", "Só por ter esquecido o guarda-chuva, fiquei encharcado.", ["ばかりに"]),
("一度うそをついた____、信用をなくした。", "Só por ter mentido uma vez, perdi a confiança.", ["ばかりに"]),
("英語ができない____、チャンスを逃した。", "Só por não saber inglês, perdi a oportunidade.", ["ばかりに"]),
("ほんの少し遅れた____、電車に乗れなかった。", "Só por ter me atrasado um pouquinho, não consegui pegar o trem.", ["ばかりに"]),
("余計なことを言った____、けんかになった。", "Só por ter falado o que não devia, virou briga.", ["ばかりに"]),
],
),
dict(
n=7,
jp="ちなみに",
rd="chinami ni",
tr="A propósito / Aliás / Por curiosidade",
ex="""ちなみに é usado para acrescentar uma informação extra, relacionada ao que acabou de ser dito. Equivale a "a propósito", "aliás" ou "por curiosidade".

A informação acrescentada não é a principal, mas é útil ou interessante. Por exemplo, "a reunião é às três. Aliás, o local é no terceiro andar" ou "sou de Tóquio. A propósito, minha esposa é de Osaka".

A diferença em relação a ところで é importante. ところで muda de assunto completamente. ちなみに continua no mesmo assunto, só acrescentando um detalhe.

É muito usado em apresentações, explicações, e-mails e conversas do dia a dia.""",
st="""Frase 1 (com ponto final) + ちなみに、 + Informação extra relacionada

Escrita: ちなみに / 因みに""",
no="""Na internet, ちなみに é muito usado para acrescentar curiosidades ou observações.

Para mudar de assunto, use ところで ou さて, e não ちなみに.

ちなみに deixa a informação com um tom leve, como "só para você saber".""",
bf="ちなみに",
rx="ちなみに|因みに",
tk=["ちなみに"],
va=["ちなみに", "因みに"],
E=[
("会議は三時からです。ちなみに、場所は三階です。", "かいぎはさんじからです。ちなみに、ばしょはさんがいです。", "A reunião é a partir das três. Aliás, o local é no terceiro andar."),
("私は東京出身です。ちなみに、妻は大阪出身です。", "わたしはとうきょうしゅっしんです。ちなみに、つまはおおさかしゅっしんです。", "Eu sou de Tóquio. A propósito, minha esposa é de Osaka."),
("この本はおもしろいよ。ちなみに、作者は私の先生なんだ。", "このほんはおもしろいよ。ちなみに、さくしゃはわたしのせんせいなんだ。", "Este livro é interessante. Por curiosidade, o autor é meu professor."),
("このケーキは千円です。ちなみに、昨日は半額でした。", "このケーキはせんえんです。ちなみに、きのうははんがくでした。", "Este bolo custa mil ienes. Aliás, ontem estava pela metade do preço."),
("今日は雨ですね。ちなみに、明日の天気は晴れだそうです。", "きょうはあめですね。ちなみに、あしたのてんきははれだそうです。", "Hoje está chovendo, né? A propósito, dizem que amanhã vai fazer sol."),
],
R=[
("私の趣味は料理です。____、得意料理はカレーです。", "Meu hobby é cozinhar. Aliás, meu prato especial é curry.", ["ちなみに"]),
("次の試験は来週です。____、範囲は十課までです。", "A próxima prova é na semana que vem. A propósito, a matéria vai até a lição dez.", ["ちなみに"]),
("この店はおいしい。____、値段も安い。", "Esta loja é gostosa. Aliás, o preço também é barato.", ["ちなみに"]),
("田中さんは医者です。____、お兄さんも医者だそうです。", "O Tanaka é médico. A propósito, dizem que o irmão dele também é.", ["ちなみに"]),
("パーティーは七時からです。____、会費は三千円です。", "A festa começa às sete. Aliás, a taxa é de três mil ienes.", ["ちなみに"]),
],
),
dict(
n=8,
jp="ちっとも〜ない",
rd="chittomo ~ nai",
tr="Nem um pouco / Nada / Absolutamente nada",
ex="""ちっとも〜ない é usado para negar algo completamente, com ênfase. Equivale a "nem um pouco", "nada" ou "absolutamente nada".

ちっとも vem antes do verbo ou do adjetivo, e a frase fica sempre na forma negativa. O sentido é igual a 全然〜ない e 少しも〜ない.

A diferença é o tom: ちっとも é mais coloquial e costuma carregar um sentimento de frustração, reclamação ou decepção. Por exemplo, "estudei, mas não entendi nada" ou "ela não me dá notícias, nem um pouco".

Por ser casual, ちっとも é mais usado na fala do que na escrita formal.""",
st="""ちっとも + Verbo na forma negativa
ちっとも + Adjetivo い sem い + くない
ちっとも + Adjetivo な / Substantivo + じゃない""",
no="""Comparando: 全然〜ない é o mais comum; 少しも〜ない é um pouco mais formal; ちっとも〜ない é casual e emotivo.

ちっとも não é usado em frases afirmativas.

Muitas vezes aparece com のに, reforçando a frustração: 頑張っているのに、ちっとも上手にならない.""",
bf="ちっとも",
rx="ちっとも",
tk=["ちっとも", "ない"],
va=["ちっとも"],
E=[
("彼の話はちっともおもしろくない。", "かれのはなしはちっともおもしろくない。", "A história dele não tem graça nenhuma."),
("勉強したのに、ちっともわからなかった。", "べんきょうしたのに、ちっともわからなかった。", "Estudei, mas não entendi absolutamente nada."),
("最近、ちっとも雨が降らない。", "さいきん、ちっともあめがふらない。", "Ultimamente não tem chovido nada."),
("彼女はちっとも連絡をくれない。", "かのじょはちっともれんらくをくれない。", "Ela não me dá notícias, nem um pouco."),
("このダイエットはちっとも効果がない。", "このダイエットはちっともこうかがない。", "Esta dieta não tem efeito nenhum."),
],
R=[
("毎日練習しているのに、____上手にならない。", "Pratico todo dia, mas não melhoro nem um pouco.", ["ちっとも"]),
("彼は____人の話を聞かない。", "Ele não escuta nada do que os outros dizem.", ["ちっとも"]),
("暖房をつけても、この部屋は____暖かくならない。", "Mesmo com o aquecedor ligado, este quarto não esquenta nem um pouco.", ["ちっとも"]),
("ずっと待っていたのに、バスは____来なかった。", "Esperei muito tempo, mas o ônibus não apareceu de jeito nenhum.", ["ちっとも"]),
("疲れていて、映画が____楽しめなかった。", "Estava cansado e não consegui aproveitar o filme nem um pouco.", ["ちっとも"]),
],
),
dict(
n=9,
jp="〜だけあって",
rd="dake atte",
tr="Como era de se esperar de / Não é à toa que / Por ser",
ex="""だけあって é usado para dizer que um resultado positivo corresponde ao que se esperava de alguém ou de algo, por causa de uma qualidade, condição ou esforço. Equivale a "como era de se esperar de", "não é à toa que" ou "por ser...".

A primeira parte indica o motivo da expectativa: ser profissional, ter morado muito tempo no Japão, ser uma loja famosa, ter treinado muito. A segunda mostra que o resultado está à altura dessa expectativa.

Por exemplo, "como era de se esperar de um profissional, a comida é deliciosa" ou "não é à toa que é famosa: a loja está sempre cheia".

O tom é de admiração ou de reconhecimento. Por isso, é usado quase sempre para avaliações positivas.

さすが combina muito com だけあって, reforçando a ideia.""",
st="""Substantivo + だけあって、 + Avaliação positiva
Verbo / Adjetivo い (forma simples) + だけあって
Adjetivo な + な + だけあって
さすが + … + だけあって""",
no="""だけあって é parecido com だけに, mas だけに pode ter tom positivo ou negativo, enquanto だけあって é quase sempre positivo.

A forma だけのことはある (no fim da frase) tem um sentido parecido: "faz jus a...".

Em avaliações de restaurantes e produtos, だけあって aparece com frequência.""",
bf="だけあって",
rx="だけあって|だけある",
tk=["だけ", "あって"],
va=["だけあって", "だけある"],
E=[
("さすがプロだけあって、料理がとてもおいしい。", "さすがプロだけあって、りょうりがとてもおいしい。", "Como era de se esperar de um profissional, a comida é deliciosa."),
("彼は十年日本に住んでいただけあって、日本語がぺらぺらだ。", "かれはじゅうねんにほんにすんでいただけあって、にほんごがぺらぺらだ。", "Não é à toa que morou dez anos no Japão: fala japonês fluentemente."),
("この店は有名なだけあって、いつも混んでいる。", "このみせはゆうめいなだけあって、いつもこんでいる。", "Não é à toa que esta loja é famosa: está sempre cheia."),
("高いだけあって、このかばんは丈夫だ。", "たかいだけあって、このかばんはじょうぶだ。", "Por ser cara, esta bolsa é resistente, como era de se esperar."),
("一生懸命練習しただけあって、彼は優勝した。", "いっしょうけんめいれんしゅうしただけあって、かれはゆうしょうした。", "Não é à toa que treinou tanto: ele foi campeão."),
],
R=[
("毎日練習している____、彼女のピアノは上手だ。", "Não é à toa que ela pratica todo dia: toca piano muito bem.", ["だけあって"]),
("有名なホテル____、サービスが素晴らしい。", "Como era de se esperar de um hotel famoso, o serviço é excelente.", ["だけあって"]),
("値段が高い____、品質がいい。", "Por ser caro, a qualidade é boa, como era de se esperar.", ["だけあって"]),
("元選手____、彼はルールに詳しい。", "Não é à toa que é ex-atleta: conhece bem as regras.", ["だけあって"]),
("人気がある____、チケットがすぐに売り切れた。", "Como era de se esperar de algo tão popular, os ingressos esgotaram na hora.", ["だけあって"]),
],
),
dict(
n=10,
jp="〜だけましだ",
rd="dake mashi da",
tr="Pelo menos / Já é alguma coisa / Ainda bem que",
ex="""だけましだ é usado para dizer que, apesar de uma situação ruim, existe algo que a torna menos grave. Equivale a "pelo menos", "já é alguma coisa" ou "ainda bem que".

まし significa "melhor (entre opções ruins)". Assim, a estrutura diz "só por isso, já está melhor".

A primeira parte costuma apresentar o problema, e a segunda, com だけましだ, mostra o lado menos ruim. Por exemplo, "o salário é baixo, mas pelo menos tenho emprego" ou "me machuquei, mas ainda bem que sobrevivi".

O tom é de consolo, conformismo ou otimismo realista.

Com まだ, a forma だけまだましだ reforça a ideia.""",
st="""Verbo / Adjetivo (forma simples) + だけましだ
Adjetivo な + な + だけましだ
… + だけまだましだ (reforço)
… + だけでもましだ""",
no="""まし sozinho também é usado em comparações, como AよりBのほうがましだ ("B é menos ruim que A").

É uma expressão muito comum para consolar alguém depois de um problema.

O tom é realista: não diz que a situação é boa, apenas que poderia ser pior.""",
bf="だけましだ",
rx="だけましだ|だけまし|だけでもまし|だけまだまし",
tk=["だけ", "まし", "だ"],
va=["だけましだ", "だけまだましだ", "だけでもましだ"],
E=[
("給料は安いが、仕事があるだけましだ。", "きゅうりょうはやすいが、しごとがあるだけましだ。", "O salário é baixo, mas pelo menos tenho emprego."),
("けがはしたけど、命が助かっただけましだ。", "けがはしたけど、いのちがたすかっただけましだ。", "Me machuquei, mas ainda bem que sobrevivi."),
("今日は雨だけど、雪じゃないだけましだ。", "きょうはあめだけど、ゆきじゃないだけましだ。", "Hoje está chovendo, mas pelo menos não é neve."),
("狭い部屋だが、住む所があるだけまだましだ。", "せまいへやだが、すむところがあるだけまだましだ。", "O quarto é pequeno, mas pelo menos tenho onde morar."),
("試合には負けたが、一点取れただけましだった。", "しあいにはまけたが、いってんとれただけましだった。", "Perdemos a partida, mas pelo menos marcamos um ponto."),
],
R=[
("財布は盗まれたが、カードが無事だった____。", "Roubaram minha carteira, mas pelo menos os cartões estavam a salvo.", ["だけましだ"]),
("熱はあるけど、食欲がある____。", "Estou com febre, mas pelo menos tenho apetite.", ["だけましだ"]),
("遅刻したけど、来た____。", "Ele chegou atrasado, mas pelo menos veio.", ["だけましだ"]),
("給料は少ないけど、もらえる____。", "O salário é pouco, mas pelo menos recebo.", ["だけましだ"]),
("寒いけど、風がない____。", "Está frio, mas pelo menos não está ventando.", ["だけましだ"]),
],
),
]
