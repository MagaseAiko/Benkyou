G = [
dict(
n=31,
jp="〜以上に",
rd="ijou ni",
tr="Mais do que / Além do que / Acima de",
ex="""以上に é usado para dizer que algo superou uma expectativa, uma previsão ou um ponto de comparação. Equivale a "mais do que" ou "além do que".

Ele aparece muito com palavras de expectativa, como 思った (pensei), 予想 (previsão), 想像 (imaginação) e 期待 (expectativa). Por exemplo, "a prova foi mais difícil do que eu pensava" ou "o trabalho é mais pesado do que eu imaginava".

Também é usado para comparar com um padrão anterior: "vou me esforçar ainda mais do que da última vez".

Antes de um substantivo, usa-se 以上の: 期待以上の結果 (um resultado acima das expectativas).

É parecido com より, mas 以上に destaca que a expectativa foi ultrapassada.""",
st="""Verbo (forma simples) + 以上に + Adjetivo / Verbo
Substantivo (予想 / 想像 / 期待 / 前回) + 以上に
… + 以上の + Substantivo""",
no="""Não confunda com 以上は (já que), que tem outro sentido.

Em avaliações de produtos e serviços, 期待以上 ("acima das expectativas") é um elogio comum.

以上 sozinho também significa "acima de" em números, como 二十歳以上 (vinte anos ou mais).""",
bf="以上に",
rx="以上に|以上の",
tk=["以上", "に"],
va=["以上に", "以上の"],
E=[
("試験は思った以上に難しかった。", "しけんはおもったいじょうにむずかしかった。", "A prova foi mais difícil do que eu pensava."),
("彼は予想以上に早く来た。", "かれはよそういじょうにはやくきた。", "Ele chegou mais cedo do que o previsto."),
("この仕事は想像以上に大変だ。", "このしごとはそうぞういじょうにたいへんだ。", "Este trabalho é mais pesado do que eu imaginava."),
("次の大会では、前回以上に頑張ります。", "つぎのたいかいでは、ぜんかいいじょうにがんばります。", "No próximo campeonato, vou me esforçar ainda mais do que da última vez."),
("みんなの努力で、期待以上の結果が出た。", "みんなのどりょくで、きたいいじょうのけっかがでた。", "Graças ao esforço de todos, o resultado foi acima das expectativas."),
],
R=[
("旅行は思った____楽しかった。", "A viagem foi mais divertida do que eu pensava.", ["以上に"]),
("実際に会った彼女は、想像____美しかった。", "Pessoalmente, ela era mais bonita do que eu imaginava.", ["以上に"]),
("今年の夏は去年____暑い。", "Este verão está ainda mais quente do que o do ano passado.", ["以上に"]),
("コンサートには予想____多くの人が集まった。", "Muito mais gente do que o previsto foi ao show.", ["以上に"]),
("それは期待____の成果だった。", "Foi um resultado acima das expectativas.", ["以上"]),
],
),
dict(
n=32,
jp="〜以上は",
rd="ijou wa",
tr="Já que / Uma vez que / Visto que",
ex="""以上は é usado para dizer que, como uma situação é assim, existe uma obrigação, uma decisão ou uma consequência natural. Equivale a "já que", "uma vez que" ou "visto que".

A primeira parte apresenta um fato ou uma decisão já tomada (prometer, aceitar, participar, ser estudante). A segunda mostra o que, por isso, deve ser feito: uma obrigação, uma determinação ou uma conclusão firme.

Por exemplo, "já que prometi, tenho que cumprir" ou "uma vez que vou participar, quero vencer".

A segunda parte costuma ter べきだ, なければならない, つもりだ, たい ou expressões de determinação.

O sentido é muito parecido com からには e 上は. 以上は soa um pouco mais formal. A forma sem は (以上、) também é comum.""",
st="""Verbo (forma simples) + 以上は / 以上、 + Obrigação / Decisão
Substantivo + である + 以上は""",
no="""以上は, からには e 上は são praticamente sinônimos. からには é mais comum na conversa; 上は é o mais formal.

Não confunda com 以上に (mais do que) e com 以上 de números (acima de).

Em contratos e regras, 以上は aparece para indicar responsabilidade: 契約した以上は….""",
bf="以上は",
rx="以上は|以上、",
tk=["以上", "は"],
va=["以上は", "以上"],
E=[
("約束した以上は、守らなければならない。", "やくそくしたいじょうは、まもらなければならない。", "Já que prometi, tenho que cumprir."),
("引き受けた以上、最後までやるべきだ。", "ひきうけたいじょう、さいごまでやるべきだ。", "Uma vez que aceitou, deve ir até o fim."),
("試合に出る以上は、勝ちたい。", "しあいにでるいじょうは、かちたい。", "Já que vou participar da partida, quero vencer."),
("学生である以上、勉強するのは当然だ。", "がくせいであるいじょう、べんきょうするのはとうぜんだ。", "Visto que é estudante, é natural estudar."),
("日本に住む以上は、日本の法律を守るべきだ。", "にほんにすむいじょうは、にほんのほうりつをまもるべきだ。", "Já que mora no Japão, deve respeitar as leis japonesas."),
],
R=[
("自分で決めた____、やるしかない。", "Já que fui eu quem decidiu, não há outra opção a não ser fazer.", ["以上は", "以上"]),
("お金をもらう____、ちゃんと働かなければならない。", "Já que vou receber dinheiro, tenho que trabalhar direito.", ["以上は", "以上"]),
("留学する____、その国の言葉を勉強すべきだ。", "Uma vez que vai fazer intercâmbio, deve estudar a língua do país.", ["以上は", "以上"]),
("参加すると言った____、休むわけにはいかない。", "Já que disse que ia participar, não posso faltar.", ["以上は", "以上"]),
("リーダーである____、責任を持たなければならない。", "Visto que é o líder, tem que assumir a responsabilidade.", ["以上は", "以上"]),
],
),
dict(
n=33,
jp="いきなり",
rd="ikinari",
tr="De repente / Sem aviso / Do nada",
ex="""いきなり é um advérbio que indica que algo aconteceu de repente, sem aviso nem preparação. Equivale a "de repente", "sem aviso" ou "do nada".

Ele é parecido com 急に e 突然, mas いきなり destaca que a ação pulou etapas ou aconteceu sem nenhum sinal prévio, muitas vezes de forma brusca ou inesperada.

Por exemplo, "ele ficou bravo do nada" ou "uma pessoa desconhecida puxou conversa comigo de repente".

Também é usado em conselhos, para dizer que não se deve começar algo de forma brusca: "é melhor não começar direto pelas questões difíceis".""",
st="""いきなり + Verbo""",
no="""Comparando: 急に destaca a rapidez; 突然 destaca a surpresa; いきなり destaca a falta de aviso ou de preparação.

いきなり é mais comum na conversa do que na escrita formal.

Em contextos de aprendizado, いきなり aparece em conselhos como "não comece direto pelo mais difícil".""",
bf="いきなり",
rx="いきなり",
tk=["いきなり"],
va=["いきなり"],
E=[
("彼はいきなり怒り出した。", "かれはいきなりおこりだした。", "Ele ficou bravo do nada."),
("いきなりドアが開いて、びっくりした。", "いきなりドアがあいて、びっくりした。", "A porta se abriu de repente e levei um susto."),
("駅で知らない人にいきなり話しかけられた。", "えきでしらないひとにいきなりはなしかけられた。", "Na estação, uma pessoa desconhecida puxou conversa comigo do nada."),
("いきなり難しい問題から始めないほうがいい。", "いきなりむずかしいもんだいからはじめないほうがいい。", "É melhor não começar direto pelas questões difíceis."),
("彼女は誰にも言わずに、いきなり会社をやめた。", "かのじょはだれにもいわずに、いきなりかいしゃをやめた。", "Ela saiu da empresa de repente, sem avisar ninguém."),
],
R=[
("晴れていたのに、____雨が降ってきた。", "Estava ensolarado, mas de repente começou a chover.", ["いきなり"]),
("角から犬が____飛び出してきた。", "Um cachorro saiu correndo da esquina do nada.", ["いきなり"]),
("彼は____私の手を握った。", "Ele segurou a minha mão de repente.", ["いきなり"]),
("準備もせずに、____本番はできない。", "Sem preparação, não dá para ir direto para a apresentação.", ["いきなり"]),
("授業中に____名前を呼ばれて、驚いた。", "Fui chamado pelo nome do nada durante a aula e levei um susto.", ["いきなり"]),
],
),
dict(
n=34,
jp="一気に",
rd="ikki ni",
tr="De uma vez só / De um fôlego / Rapidamente",
ex="""一気に é um advérbio que significa "de uma vez só" ou "de um fôlego". Ele indica que algo é feito sem parar, com rapidez e intensidade, ou que uma mudança acontece de forma súbita e grande.

Ele tem dois usos principais.

O primeiro é fazer algo sem pausa, até o fim: "bebeu a água de uma vez só", "li o romance inteiro de um fôlego", "resolvi o trabalho todo de uma vez".

O segundo é indicar uma mudança grande e rápida: "a temperatura caiu de repente", "a popularidade se espalhou rapidamente".

Comparado a 一度に (ao mesmo tempo, de uma vez), 一気に destaca a energia e a continuidade da ação.""",
st="""一気に + Verbo

Escrita: 一気に / いっきに""",
no="""一気飲み significa "beber de uma vez só", e em festas japonesas é desencorajado por razões de saúde.

Com verbos de leitura e trabalho, 一気に mostra que a pessoa estava muito envolvida.

Em notícias, 一気に aparece para mudanças bruscas em preços, temperatura e popularidade.""",
bf="一気に",
rx="一気に|いっきに",
tk=["一気", "に"],
va=["一気に", "いっきに"],
E=[
("喉が渇いていたので、彼は水を一気に飲んだ。", "のどがかわいていたので、かれはみずをいっきにのんだ。", "Ele estava com sede e bebeu a água de uma vez só."),
("おもしろくて、小説を一気に読んでしまった。", "おもしろくて、しょうせつをいっきによんでしまった。", "Era tão interessante que li o romance inteiro de um fôlego."),
("週末に、たまった仕事を一気に片付けた。", "しゅうまつに、たまったしごとをいっきにかたづけた。", "No fim de semana, resolvi de uma vez todo o trabalho acumulado."),
("夜になって、気温が一気に下がった。", "よるになって、きおんがいっきにさがった。", "À noite, a temperatura caiu de repente."),
("彼は階段を一気に駆け上がった。", "かれはかいだんをいっきにかけあがった。", "Ele subiu a escada correndo, de uma vez só."),
],
R=[
("暑かったので、ビールを____飲み干した。", "Estava quente, então bebi a cerveja de uma vez só.", ["一気に", "いっきに"]),
("集中して、宿題を____終わらせた。", "Me concentrei e terminei a lição de uma vez.", ["一気に", "いっきに"]),
("暖かくなって、桜が____咲いた。", "Esquentou e as cerejeiras floresceram todas de uma vez.", ["一気に", "いっきに"]),
("テレビで紹介されて、その店の人気が____広がった。", "Depois de aparecer na TV, a popularidade da loja se espalhou rapidamente.", ["一気に", "いっきに"]),
("彼は坂を____走って上った。", "Ele subiu a ladeira correndo, de uma vez só.", ["一気に", "いっきに"]),
],
),
dict(
n=35,
jp="〜一方で",
rd="ippou de",
tr="Por outro lado / Enquanto / Ao mesmo tempo que",
ex="""一方で é usado para contrastar duas situações ou para mostrar duas ações que acontecem ao mesmo tempo. Equivale a "por outro lado", "enquanto" ou "ao mesmo tempo que".

Ele tem três usos principais:
• Contraste entre dois lados de uma mesma coisa: "a cidade é prática, mas, por outro lado, o custo de vida é alto".
• Contraste entre duas coisas diferentes: "o número de crianças diminui, enquanto o de idosos aumenta".
• Duas atividades simultâneas: "ele trabalha e, ao mesmo tempo, faz faculdade".

No começo de uma frase, 一方、 (com vírgula) significa "por outro lado" e liga duas frases contrastantes.

É muito usado em textos, notícias e análises.""",
st="""Verbo / Adjetivo (forma simples) + 一方で、 + Contraste / Ação simultânea
Adjetivo な + な / である + 一方で
Frase 1 (com ponto final) + 一方、 + Frase 2

Escrita: 一方で / いっぽうで""",
no="""Compare: 一方だ (só aumenta / só piora) e 一方で (por outro lado) têm sentidos bem diferentes.

Comparado a 反面, 一方で é mais amplo e pode comparar coisas diferentes, e não só os dois lados de uma mesma coisa.

Em notícias com estatísticas, 一方 é usado para contrastar dados.""",
bf="一方で",
rx="一方で|一方、|いっぽうで",
tk=["一方", "で"],
va=["一方で", "一方"],
E=[
("都会は便利な一方で、物価が高い。", "とかいはべんりないっぽうで、ぶっかがたかい。", "A cidade grande é prática, mas, por outro lado, o custo de vida é alto."),
("兄は活発だ。一方、弟はおとなしい。", "あにはかっぱつだ。いっぽう、おとうとはおとなしい。", "O irmão mais velho é agitado. Por outro lado, o mais novo é quieto."),
("彼は仕事をする一方で、大学にも通っている。", "かれはしごとをするいっぽうで、だいがくにもかよっている。", "Ele trabalha e, ao mesmo tempo, faz faculdade."),
("子供の数が減る一方で、高齢者は増えている。", "こどものかずがへるいっぽうで、こうれいしゃはふえている。", "Enquanto o número de crianças diminui, o de idosos aumenta."),
("輸出が増えた一方で、輸入は減った。", "ゆしゅつがふえたいっぽうで、ゆにゅうはへった。", "As exportações aumentaram, enquanto as importações diminuíram."),
],
R=[
("この仕事は給料がいい____、休みが少ない。", "Este trabalho paga bem, mas, por outro lado, tem poucas folgas.", ["一方で"]),
("彼女は歌手として活動する____、女優もしている。", "Ela trabalha como cantora e, ao mesmo tempo, como atriz.", ["一方で"]),
("東京は人口が増える____、地方は減っている。", "Enquanto a população de Tóquio aumenta, a do interior diminui.", ["一方で"]),
("生活は便利になった____、失ったものもある。", "A vida ficou mais prática, mas, por outro lado, também perdemos coisas.", ["一方で"]),
("父は厳しい____、優しいところもある。", "Meu pai é rigoroso, mas, ao mesmo tempo, também tem um lado gentil.", ["一方で"]),
],
),
dict(
n=36,
jp="いわゆる",
rd="iwayuru",
tr="O chamado / O que se chama de / Como se diz",
ex="""いわゆる é usado antes de uma palavra ou expressão para indicar que ela é um termo conhecido, popular ou comumente usado. Equivale a "o chamado", "o que se chama de" ou "como se diz".

Ele mostra que quem fala está usando uma palavra que todo mundo conhece, às vezes uma gíria, um rótulo ou um conceito popular. Por exemplo, "ele é o que se chama de gênio" ou "trabalhei numa chamada 'empresa abusiva'".

Muitas vezes, a palavra que vem depois aparece entre aspas japonesas 「」, reforçando que é um termo específico.

いわゆる vem antes de substantivos e funciona como um adjetivo.""",
st="""いわゆる + Substantivo
いわゆる + 「Termo」

Escrita: いわゆる / 所謂""",
no="""O kanji 所謂 é raro no dia a dia; o mais comum é escrever em hiragana.

いわゆる também é útil para explicar termos culturais japoneses a estrangeiros, como おもてなし e 帰国子女.

Às vezes, いわゆる tem um tom levemente distante ou crítico, como se quem fala não concordasse totalmente com o rótulo.""",
bf="いわゆる",
rx="いわゆる|所謂",
tk=["いわゆる"],
va=["いわゆる", "所謂"],
E=[
("彼はいわゆる天才だ。", "かれはいわゆるてんさいだ。", "Ele é o que se chama de gênio."),
("これがいわゆる日本の「おもてなし」です。", "これがいわゆるにほんの「おもてなし」です。", "Isto é o chamado \"omotenashi\", a hospitalidade japonesa."),
("彼女はいわゆるお嬢様だ。", "かのじょはいわゆるおじょうさまだ。", "Ela é o que se chama de moça de família rica."),
("以前、いわゆる「ブラック企業」で働いていた。", "いぜん、いわゆる「ブラックきぎょう」ではたらいていた。", "Antes, eu trabalhava numa chamada \"empresa abusiva\"."),
("彼はいわゆるオタクと呼ばれる人だ。", "かれはいわゆるオタクとよばれるひとだ。", "Ele é o que se costuma chamar de otaku."),
],
R=[
("彼は有名大学を出た、____エリートだ。", "Ele se formou numa universidade famosa, é o que se chama de elite.", ["いわゆる"]),
("これが____「和食」です。", "Isto é o chamado \"washoku\", a culinária japonesa.", ["いわゆる"]),
("海外で育った彼女は、____帰国子女だ。", "Ela, que cresceu no exterior, é o que se chama de \"kikoku shijo\".", ["いわゆる"]),
("最近、____「草食系男子」が増えている。", "Ultimamente, estão aumentando os chamados \"homens herbívoros\".", ["いわゆる"]),
("一日中ゲームをしている彼は、____ゲームオタクだ。", "Ele joga videogame o dia inteiro: é o que se chama de viciado em games.", ["いわゆる"]),
],
),
dict(
n=37,
jp="いよいよ",
rd="iyoiyo",
tr="Finalmente / Enfim chegou / Cada vez mais",
ex="""いよいよ é um advérbio com dois usos principais.

O primeiro, mais comum, indica que um momento esperado finalmente chegou ou está prestes a chegar. Equivale a "finalmente" ou "enfim chegou". O tom é de expectativa, emoção ou tensão. Por exemplo, "finalmente, amanhã é a prova" ou "enfim chegou o dia da partida".

O segundo indica que algo está se intensificando cada vez mais. Equivale a "cada vez mais". Por exemplo, "a chuva está ficando cada vez mais forte".

Comparado a ついに e やっと, いよいよ costuma se referir a algo que está acontecendo agora ou prestes a acontecer, com sensação de clímax.""",
st="""いよいよ + Evento próximo / que começa
いよいよ + Adjetivo / Verbo de mudança (cada vez mais)""",
no="""いよいよ é muito usado em anúncios e programas: いよいよ最終回 ("finalmente, o último episódio").

Comparando: やっと = alívio depois de espera; ついに = finalmente aconteceu (após longo processo); いよいよ = o momento esperado está chegando.

No uso de intensificação, いよいよ é parecido com ますます.""",
bf="いよいよ",
rx="いよいよ",
tk=["いよいよ"],
va=["いよいよ"],
E=[
("いよいよ明日は試験だ。", "いよいよあしたはしけんだ。", "Finalmente, amanhã é a prova."),
("いよいよ夏休みが始まる。", "いよいよなつやすみがはじまる。", "Enfim, as férias de verão vão começar."),
("雨がいよいよ強くなってきた。", "あめがいよいよつよくなってきた。", "A chuva está ficando cada vez mais forte."),
("いよいよ出発の日が来た。", "いよいよしゅっぱつのひがきた。", "Enfim chegou o dia da partida."),
("試合はいよいよ最後の五分になった。", "しあいはいよいよさいごのごふんになった。", "A partida finalmente chegou aos últimos cinco minutos."),
],
R=[
("____来週から新しい仕事が始まる。", "Finalmente, o novo trabalho começa na semana que vem.", ["いよいよ"]),
("台風が近づいて、風が____強くなった。", "Com a aproximação do tufão, o vento ficou cada vez mais forte.", ["いよいよ"]),
("____結婚式の日がやってきた。", "Enfim chegou o dia do casamento.", ["いよいよ"]),
("このドラマも、____最終回です。", "Esta novela finalmente chegou ao último episódio.", ["いよいよ"]),
("試験まで____あと一日だ。", "Finalmente, falta só um dia para a prova.", ["いよいよ"]),
],
),
dict(
n=38,
jp="〜上（じょう）",
rd="jou",
tr="Do ponto de vista de / Em termos de / Por razões de",
ex="""上 (lido じょう), como sufixo depois de um substantivo, indica o ponto de vista, a área ou o aspecto a partir do qual algo é considerado. Equivale a "do ponto de vista de", "em termos de" ou "por razões de".

Por exemplo, 健康上 (do ponto de vista da saúde), 法律上 (em termos legais), 安全上 (por razões de segurança), 経験上 (pela experiência), 教育上 (do ponto de vista educacional).

Ele pode ser seguido de は, の, も ou de vírgula:
• 健康上の理由 (motivos de saúde).
• 法律上は問題ない (legalmente, não há problema).
• 安全上、〜してください (por segurança, faça...).

É uma expressão formal, muito usada em documentos, avisos, notícias e linguagem de negócios.""",
st="""Substantivo + 上 (じょう) + の + Substantivo
Substantivo + 上 + は / も + Frase
Substantivo + 上、 + Frase

Exemplos: 健康上 / 法律上 / 安全上 / 経験上 / 教育上 / 歴史上""",
no="""健康上の理由で ("por motivos de saúde") é uma forma educada e vaga de justificar ausências.

O mesmo kanji 上 tem outras leituras e usos, como うえ (em cima) e 上に / 上で, que são outras gramáticas.

Em contratos, 法律上 e 契約上 aparecem com frequência.""",
bf="上",
rx="上は|上の|上、|上も|上で",
tk=["上"],
va=["上", "上の", "上は"],
E=[
("健康上の理由で、会社を休んだ。", "けんこうじょうのりゆうで、かいしゃをやすんだ。", "Faltei ao trabalho por motivos de saúde."),
("このやり方は、法律上は問題ない。", "このやりかたは、ほうりつじょうはもんだいない。", "Este método, do ponto de vista legal, não tem problema."),
("安全上、ここに入らないでください。", "あんぜんじょう、ここにはいらないでください。", "Por razões de segurança, não entre aqui."),
("経験上、この方法が一番いい。", "けいけんじょう、このほうほうがいちばんいい。", "Pela minha experiência, este método é o melhor."),
("その番組は教育上、子供によくない。", "そのばんぐみはきょういくじょう、こどもによくない。", "Esse programa não é bom para as crianças do ponto de vista educacional."),
],
R=[
("健康____の問題で、お酒をやめた。", "Parei de beber por problemas de saúde.", ["上"]),
("日本では法律____、二十歳になるまでお酒は飲めない。", "No Japão, pela lei, não se pode beber antes dos vinte anos.", ["上"]),
("安全____の理由で、イベントは中止になった。", "O evento foi cancelado por razões de segurança.", ["上"]),
("経験____、彼は時間どおりには来ないと思う。", "Pela experiência, acho que ele não vai chegar no horário.", ["上"]),
("この寺は歴史____、重要な場所だ。", "Este templo é um lugar importante do ponto de vista histórico.", ["上"]),
],
),
dict(
n=39,
jp="〜かのように",
rd="ka no you ni",
tr="Como se / Como se fosse",
ex="""かのように é usado para dizer que algo acontece ou é feito como se fosse outra coisa, mesmo que não seja verdade. Equivale a "como se" ou "como se fosse".

A parte antes de かのように descreve uma situação imaginária ou falsa. Por exemplo, "ele agiu como se não soubesse de nada" (mas sabia) ou "está quente como se a primavera tivesse chegado" (mas ainda não chegou).

Muitas vezes, aparece junto com まるで, que reforça a comparação.

Antes de um substantivo, usa-se かのような: 夢を見ているかのような顔 (uma cara de quem está sonhando).

No fim da frase, usa-se かのようだ.""",
st="""Verbo / Adjetivo (forma simples) + かのように + Verbo / Adjetivo
Substantivo + である + かのように
… + かのような + Substantivo
… + かのようだ
まるで + … + かのように""",
no="""Comparado a ように, かのように destaca mais que a situação é falsa ou imaginária.

A expressão 何もなかったかのように ("como se nada tivesse acontecido") é muito comum.

É um pouco literário e aparece muito em romances e descrições.""",
bf="かのように",
rx="かのように|かのような|かのようだ",
tk=["か", "の", "ように"],
va=["かのように", "かのような", "かのようだ"],
E=[
("彼は何も知らないかのように振る舞った。", "かれはなにもしらないかのようにふるまった。", "Ele agiu como se não soubesse de nada."),
("彼女はまるで夢を見ているかのような顔をしていた。", "かのじょはまるでゆめをみているかのようなかおをしていた。", "Ela estava com uma cara de quem estava sonhando."),
("まだ二月なのに、春が来たかのように暖かい。", "まだにがつなのに、はるがきたかのようにあたたかい。", "Ainda é fevereiro, mas está quente como se a primavera tivesse chegado."),
("彼はまるで自分の家にいるかのようにくつろいでいる。", "かれはまるでじぶんのいえにいるかのようにくつろいでいる。", "Ele está à vontade como se estivesse na própria casa."),
("何もなかったかのように、彼は笑った。", "なにもなかったかのように、かれはわらった。", "Ele riu como se nada tivesse acontecido."),
],
R=[
("彼はまるで社長である____話す。", "Ele fala como se fosse o presidente.", ["かのように"]),
("彼女は何も聞かなかった____、黙っていた。", "Ela ficou calada como se não tivesse ouvido nada.", ["かのように"]),
("十月なのに、夏が戻ってきた____暑い日だった。", "Era outubro, mas foi um dia quente como se o verão tivesse voltado.", ["かのような"]),
("彼は全部知っている____顔をしている。", "Ele está com cara de quem sabe de tudo.", ["かのような"]),
("まるで時間が止まった____静かだ。", "Está tão silencioso como se o tempo tivesse parado.", ["かのように"]),
],
),
dict(
n=40,
jp="〜かと思ったら",
rd="ka to omottara",
tr="Mal... e já / Quando parecia que... de repente",
ex="""かと思ったら é usado para dizer que, logo depois de algo acontecer, aconteceu outra coisa inesperada, muitas vezes o oposto. Equivale a "mal... e já..." ou "quando parecia que..., de repente...".

A primeira parte descreve uma ação ou mudança, e a segunda mostra algo que veio imediatamente depois, de forma surpreendente. Por exemplo, "mal começou a chover e já parou" ou "a criança mal chorou e já está rindo".

A ideia é de mudança rápida e inesperada. Por isso, ela é usada para descrever situações que surpreendem quem fala.

As formas かと思うと e かと思えば têm sentido parecido. かと思えば também pode mostrar alternância: "às vezes está quente, de repente fica frio".

Ela vem depois do verbo na forma た, e a segunda parte é um fato observado, não uma ação de quem fala.""",
st="""Verbo na forma た + かと思ったら、 + Mudança inesperada
Verbo na forma た + かと思うと、 + …
Verbo / Adjetivo + かと思えば、 + … (alternância)""",
no="""Essa estrutura não é usada para as próprias ações de quem fala, porque descreve algo observado com surpresa.

Também existe o uso かと思ったら com o sentido de "eu achava que..., mas na verdade...", como em 誰かと思ったら、君か ("achei que fosse outra pessoa, mas era você").

É muito comum em descrições de crianças, do tempo e de comportamentos imprevisíveis.""",
bf="かと思ったら",
rx="かと思ったら|かと思うと|かと思えば",
tk=["か", "と", "思ったら"],
va=["かと思ったら", "かと思うと", "かと思えば"],
E=[
("雨が降ったかと思ったら、すぐにやんだ。", "あめがふったかとおもったら、すぐにやんだ。", "Mal começou a chover e já parou."),
("子供は泣いたかと思ったら、もう笑っている。", "こどもはないたかとおもったら、もうわらっている。", "A criança mal chorou e já está rindo."),
("彼は帰ったかと思ったら、またすぐ戻ってきた。", "かれはかえったかとおもったら、またすぐもどってきた。", "Quando parecia que ele tinha ido embora, voltou logo em seguida."),
("静かになったかと思うと、また騒ぎ始めた。", "しずかになったかとおもうと、またさわぎはじめた。", "Mal ficou quieto e já começou a fazer barulho de novo."),
("最近の天気は、暑いかと思えば、急に寒くなる。", "さいきんのてんきは、あついかとおもえば、きゅうにさむくなる。", "Ultimamente o tempo está assim: parece quente e, de repente, esfria."),
],
R=[
("雷が鳴った____、大雨が降り出した。", "Mal trovejou e já começou uma chuva forte.", ["かと思ったら", "かと思うと"]),
("彼女は来た____、すぐに帰った。", "Ela mal chegou e já foi embora.", ["かと思ったら", "かと思うと"]),
("晴れた____、また曇ってきた。", "Mal abriu o sol e já voltou a ficar nublado.", ["かと思ったら", "かと思うと"]),
("赤ちゃんは寝た____、すぐ起きた。", "O bebê mal dormiu e já acordou.", ["かと思ったら", "かと思うと"]),
("彼は座った____、また立ち上がった。", "Ele mal se sentou e já se levantou de novo.", ["かと思ったら", "かと思うと"]),
],
),
]
