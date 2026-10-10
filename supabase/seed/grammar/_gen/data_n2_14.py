G = [
dict(
n=131,
jp="及び",
rd="oyobi",
tr="E / Bem como / Assim como",
ex="""及び serve para ligar dois ou mais substantivos, com o sentido de "e" ou "bem como".

É uma palavra formal, usada principalmente na escrita, em documentos oficiais, leis, avisos e notícias. Na fala do dia a dia, usa-se と.

Por exemplo, "o nome e o endereço" ou "estudantes, bem como professores".""",
st="""Substantivo + 及び + Substantivo
Substantivo、Substantivo + 及び + Substantivo""",
no="""Quando há vários itens, 及び costuma ficar antes do último.

Também é escrito em hiragana, および.

É parecido com 並びに, que também é formal.""",
bf="及び",
rx="及び|および",
tk=["及び"],
va=["及び", "および"],
E=[
("氏名及び住所を記入してください。", "しめいおよびじゅうしょをきにゅうしてください。", "Preencha o nome e o endereço."),
("学生及び教職員は、この入口を使ってください。", "がくせいおよびきょうしょくいんは、このいりぐちをつかってください。", "Estudantes e funcionários, usem esta entrada."),
("会場内での飲食及び喫煙は禁止です。", "かいじょうないでのいんしょくおよびきつえんはきんしです。", "É proibido comer, beber e fumar dentro do local."),
("東京、大阪及び名古屋で説明会を開きます。", "とうきょう、おおさかおよびなごやでせつめいかいをひらきます。", "Faremos reuniões informativas em Tóquio, Osaka e Nagoya."),
("日本語および英語で対応いたします。", "にほんごおよびえいごでたいおういたします。", "Atendemos em japonês e em inglês."),
],
R=[
("申込書____写真を提出すること。", "Entregue o formulário de inscrição e a foto.", ["及び", "および"]),
("本人____家族の同意が必要です。", "É necessário o consentimento da própria pessoa e da família.", ["及び", "および"]),
("駐車場____駐輪場は地下にあります。", "O estacionamento de carros e de bicicletas fica no subsolo.", ["及び", "および"]),
("中学生____高校生を対象とした講座です。", "É um curso voltado a alunos do ensino fundamental e médio.", ["及び", "および"]),
("商品の返品____交換はできません。", "Não é possível devolver nem trocar os produtos.", ["及び", "および"]),
],
),
dict(
n=132,
jp="ろくに〜ない",
rd="roku ni ~ nai",
tr="Mal / Quase não / Direito não",
ex="""ろくに junto com uma forma negativa indica que algo não é feito de forma suficiente ou adequada. Equivale a "mal", "quase não" ou "não... direito".

O tom é negativo e muitas vezes de crítica ou reclamação. Por exemplo, "mal dormi ontem" ou "ele nem cumprimenta direito".

É uma expressão coloquial, comum na fala.""",
st="""ろくに + Verbo (forma ない)
ろくな + Substantivo + がない / ではない""",
no="""A forma ろくな, antes de substantivos, significa "decente" ou "que preste", como em ろくなものがない, "não tem nada que preste".

É parecido com ほとんど〜ない, mas ろくに tem um tom mais crítico.""",
bf="ろくに〜ない",
rx="ろくに|ろくな",
tk=["ろく", "に", "ない"],
va=["ろくに〜ない", "ろくな〜ない"],
E=[
("昨日はろくに寝ていない。", "きのうはろくにねていない。", "Ontem mal dormi."),
("彼はろくに挨拶もしない。", "かれはろくにあいさつもしない。", "Ele nem cumprimenta direito."),
("ろくに勉強しないで試験を受けた。", "ろくにべんきょうしないでしけんをうけた。", "Fiz a prova quase sem estudar."),
("忙しくて、ろくに食事もとれない。", "いそがしくて、ろくにしょくじもとれない。", "Estou tão ocupado que mal consigo comer."),
("この店にはろくな物がない。", "このみせにはろくなものがない。", "Esta loja não tem nada que preste."),
],
R=[
("説明書も____読まずに、使い始めた。", "Comecei a usar sem nem ler o manual direito.", ["ろくに"]),
("彼は人の話を____聞かない。", "Ele mal ouve o que os outros dizem.", ["ろくに"]),
("最近は____休みも取れない。", "Ultimamente mal consigo tirar folga.", ["ろくに"]),
("____調べもしないで、文句を言うな。", "Não reclame sem nem pesquisar direito.", ["ろくに"]),
("あいつは____ことをしない。", "Aquele cara não faz nada que preste.", ["ろくな"]),
],
),
dict(
n=133,
jp="幸いなことに",
rd="saiwai na koto ni",
tr="Felizmente / Por sorte / Para nossa sorte",
ex="""幸いなことに expressa que algo aconteceu de forma favorável, geralmente quando poderia ter sido pior. Equivale a "felizmente" ou "por sorte".

A pessoa mostra alívio ou gratidão pela situação. Por exemplo, "houve um acidente, mas felizmente ninguém se feriu".

O padrão 〜ことに também aparece com outras palavras de sentimento, como 残念なことに e 驚いたことに.""",
st="""幸いなことに、 + Frase
幸いにも、 + Frase""",
no="""A forma 幸い sozinha ou 幸いにも tem o mesmo sentido.

O padrão Adjetivo + ことに expressa o sentimento da pessoa que fala sobre o fato.""",
bf="幸いなことに",
rx="幸いなことに|幸いにも|さいわいなことに|幸い",
tk=["幸い", "な", "こと", "に"],
va=["幸いなことに", "幸いにも", "幸い"],
E=[
("幸いなことに、けが人はいなかった。", "さいわいなことに、けがにんはいなかった。", "Felizmente, não houve feridos."),
("幸いなことに、天気に恵まれた。", "さいわいなことに、てんきにめぐまれた。", "Por sorte, fomos agraciados com bom tempo."),
("財布を落としたが、幸いにも見つかった。", "さいふをおとしたが、さいわいにもみつかった。", "Perdi a carteira, mas felizmente foi encontrada."),
("幸いなことに、電車にはまだ間に合った。", "さいわいなことに、でんしゃにはまだまにあった。", "Por sorte, ainda deu tempo de pegar o trem."),
("幸い、病気は軽かった。", "さいわい、びょうきはかるかった。", "Felizmente, a doença era leve."),
],
R=[
("____、火事はすぐに消えた。", "Felizmente, o incêndio foi logo apagado.", ["幸いなことに", "幸いにも", "幸い"]),
("____、試験に合格できた。", "Por sorte, consegui passar na prova.", ["幸いなことに", "幸いにも", "幸い"]),
("事故に遭ったが、____命は助かった。", "Sofri um acidente, mas felizmente sobrevivi.", ["幸いなことに", "幸いにも", "幸い"]),
("____、雨は降らなかった。", "Por sorte, não choveu.", ["幸いなことに", "幸いにも", "幸い"]),
("____、近くに病院があった。", "Felizmente, havia um hospital por perto.", ["幸いなことに", "幸いにも", "幸い"]),
],
),
dict(
n=134,
jp="〜せいか",
rd="sei ka",
tr="Talvez por causa de / Será que é por / Quem sabe por",
ex="""せいか indica uma causa provável, mas sem certeza. Equivale a "talvez por causa de" ou "será que é por".

A pessoa supõe que algo foi o motivo de um resultado, geralmente negativo. Por exemplo, "talvez por ter dormido pouco, estou com dor de cabeça".

Também pode ser usado com resultados positivos ou neutros, mas é mais comum com coisas ruins.""",
st="""Verbo (forma simples) + せいか
Adjetivo い + せいか
Adjetivo な + な + せいか
Substantivo + の + せいか""",
no="""É uma variação de せいで, mas com dúvida.

Para resultados positivos, também se usa おかげか.

Uma expressão comum é 気のせいか, que significa "talvez seja impressão minha".""",
bf="せいか",
rx="せいか",
tk=["せい", "か"],
va=["せいか", "気のせいか"],
E=[
("寝不足のせいか、頭が痛い。", "ねぶそくのせいか、あたまがいたい。", "Talvez por ter dormido pouco, estou com dor de cabeça."),
("年のせいか、最近疲れやすい。", "としのせいか、さいきんつかれやすい。", "Será que é pela idade? Ultimamente me canso fácil."),
("天気が悪いせいか、客が少ない。", "てんきがわるいせいか、きゃくがすくない。", "Talvez por causa do mau tempo, há poucos clientes."),
("気のせいか、彼女は元気がないように見える。", "きのせいか、かのじょはげんきがないようにみえる。", "Pode ser impressão minha, mas ela parece desanimada."),
("緊張したせいか、うまく話せなかった。", "きんちょうしたせいか、うまくはなせなかった。", "Talvez por ter ficado nervoso, não consegui falar bem."),
],
R=[
("食べすぎた____、お腹が痛い。", "Talvez por ter comido demais, estou com dor de barriga.", ["せいか"]),
("風邪の____、声が出ない。", "Talvez por causa do resfriado, estou sem voz.", ["せいか"]),
("暑い____、食欲がない。", "Talvez por causa do calor, estou sem apetite.", ["せいか"]),
("気の____、彼は少しやせたようだ。", "Pode ser impressão minha, mas ele parece ter emagrecido um pouco.", ["せいか"]),
("コーヒーを飲んだ____、眠れない。", "Talvez por ter tomado café, não consigo dormir.", ["せいか"]),
],
),
dict(
n=135,
jp="せっかく",
rd="sekkaku",
tr="Já que / Com tanto esforço / Logo que",
ex="""せっかく indica que algo é valioso, raro ou foi conseguido com esforço. Equivale a "já que" ou "com tanto esforço".

Tem dois usos comuns. O primeiro é dizer que é uma pena não aproveitar algo, como "já que você veio até aqui, fique mais um pouco".

O segundo é lamentar que um esforço foi desperdiçado, como "com tanto esforço que fiz a comida, ninguém comeu". Nesse caso, costuma vir com のに.""",
st="""せっかく + Verbo (forma た) + のに (lamento)
せっかく + Verbo (forma た) + から / ので (aproveitar)
せっかく + の + Substantivo""",
no="""Expressões comuns são せっかくですが, para recusar educadamente, e せっかくの休み.

É parecido com わざわざ, mas せっかく destaca o valor da oportunidade.""",
bf="せっかく",
rx="せっかく",
tk=["せっかく"],
va=["せっかく", "せっかくの", "せっかくですが"],
E=[
("せっかく作ったのに、誰も食べてくれなかった。", "せっかくつくったのに、だれもたべてくれなかった。", "Com tanto esforço que fiz, ninguém comeu."),
("せっかく京都に来たから、お寺を見に行こう。", "せっかくきょうとにきたから、おてらをみにいこう。", "Já que viemos a Kyoto, vamos ver os templos."),
("せっかくの休みなのに、雨が降っている。", "せっかくのやすみなのに、あめがふっている。", "Logo no meu dia de folga, está chovendo."),
("せっかくですが、今日は用事があります。", "せっかくですが、きょうはようじがあります。", "Agradeço o convite, mas hoje tenho um compromisso."),
("せっかく覚えた単語を忘れてしまった。", "せっかくおぼえたたんごをわすれてしまった。", "Esqueci as palavras que tinha decorado com tanto esforço."),
],
R=[
("____来てくれたのに、留守にしていてごめんね。", "Você veio até aqui e eu não estava em casa, desculpe.", ["せっかく"]),
("____のチャンスを逃してしまった。", "Deixei escapar uma chance preciosa.", ["せっかく"]),
("____ここまで来たんだから、頂上まで登ろう。", "Já que chegamos até aqui, vamos subir até o topo.", ["せっかく"]),
("____ですが、遠慮しておきます。", "Agradeço, mas vou recusar.", ["せっかく"]),
("____準備したのに、パーティーは中止になった。", "Preparei tudo com tanto esforço, mas a festa foi cancelada.", ["せっかく"]),
],
),
dict(
n=136,
jp="せめて",
rd="semete",
tr="Pelo menos / Ao menos / No mínimo",
ex="""せめて indica o mínimo que a pessoa deseja, mesmo que não consiga o ideal. Equivale a "pelo menos" ou "ao menos".

A pessoa aceita que não pode ter tudo, mas espera ou pede ao menos uma pequena parte. Por exemplo, "se não pode vir, pelo menos ligue".

A frase costuma terminar com um desejo, um pedido ou uma intenção, como たい, てほしい ou ください.""",
st="""せめて + Substantivo / Quantidade + だけでも / くらい
せめて + Frase (desejo / pedido)""",
no="""É parecido com 少なくとも, mas せめて expressa desejo, enquanto 少なくとも é mais objetivo.

Costuma aparecer junto com だけでも ou くらい.""",
bf="せめて",
rx="せめて",
tk=["せめて"],
va=["せめて", "せめて〜だけでも"],
E=[
("来られないなら、せめて電話くらいしてほしい。", "こられないなら、せめてでんわくらいしてほしい。", "Se não pode vir, pelo menos ligue."),
("せめて週に一回は運動したい。", "せめてしゅうにいっかいはうんどうしたい。", "Quero me exercitar pelo menos uma vez por semana."),
("優勝は無理でも、せめて三位には入りたい。", "ゆうしょうはむりでも、せめてさんいにははいりたい。", "Mesmo que vencer seja impossível, quero ao menos ficar em terceiro."),
("せめて名前だけでも教えてください。", "せめてなまえだけでもおしえてください。", "Me diga ao menos o seu nome."),
("せめてもう一日休みがあればいいのに。", "せめてもういちにちやすみがあればいいのに。", "Seria bom ter pelo menos mais um dia de folga."),
],
R=[
("____一時間だけでも寝たい。", "Quero dormir pelo menos uma hora.", ["せめて"]),
("忙しくても、____朝ご飯は食べなさい。", "Mesmo ocupado, pelo menos tome o café da manhã.", ["せめて"]),
("____雨がやむまで待ちましょう。", "Vamos esperar ao menos até a chuva parar.", ["せめて"]),
("全部は無理でも、____半分は終わらせたい。", "Mesmo que tudo seja impossível, quero terminar ao menos a metade.", ["せめて"]),
("____お礼だけでも言わせてください。", "Deixe-me ao menos agradecer.", ["せめて"]),
],
),
dict(
n=137,
jp="〜次第",
rd="shidai",
tr="Assim que / Logo que / Tão logo",
ex="""次第, depois da raiz de um verbo, indica que algo será feito imediatamente depois que outra coisa acontecer. Equivale a "assim que" ou "logo que".

A segunda parte costuma ser uma ação intencional, como entrar em contato, enviar ou começar. Por exemplo, "assim que eu chegar, entro em contato".

É uma expressão formal, muito usada no trabalho e em e-mails.""",
st="""Verbo (forma ます sem ます) + 次第
Substantivo (ação) + 次第""",
no="""Não se usa com acontecimentos passados. A frase sempre fala do futuro.

É parecido com たらすぐに, mas 次第 é mais formal.

Não se confunde com 次第で, que significa "dependendo de".""",
bf="次第",
rx="次第|しだい",
tk=["次第"],
va=["次第", "しだい"],
E=[
("着き次第、連絡します。", "つきしだい、れんらくします。", "Assim que eu chegar, entro em contato."),
("準備ができ次第、出発しましょう。", "じゅんびができしだい、しゅっぱつしましょう。", "Assim que tudo estiver pronto, vamos partir."),
("結果がわかり次第、お知らせします。", "けっかがわかりしだい、おしらせします。", "Assim que soubermos o resultado, avisaremos."),
("商品が届き次第、お送りいたします。", "しょうひんがとどきしだい、おおくりいたします。", "Assim que o produto chegar, enviaremos."),
("雨がやみ次第、試合を再開します。", "あめがやみしだい、しあいをさいかいします。", "Assim que a chuva parar, a partida será retomada."),
],
R=[
("仕事が終わり____、そちらに向かいます。", "Assim que o trabalho terminar, vou até aí.", ["次第", "しだい"]),
("詳細が決まり____、ご連絡いたします。", "Assim que os detalhes forem definidos, entraremos em contato.", ["次第", "しだい"]),
("部長が戻り____、会議を始めます。", "Assim que o gerente voltar, começaremos a reunião.", ["次第", "しだい"]),
("確認でき____、お返事します。", "Assim que eu puder confirmar, respondo.", ["次第", "しだい"]),
("席が空き____、ご案内します。", "Assim que vagar uma mesa, nós o levaremos até ela.", ["次第", "しだい"]),
],
),
dict(
n=138,
jp="〜次第で",
rd="shidai de",
tr="Dependendo de / Conforme / De acordo com",
ex="""次第で indica que um resultado depende de algo. Equivale a "dependendo de" ou "conforme".

A primeira parte mostra o fator decisivo, e a segunda mostra que o resultado pode mudar. Por exemplo, "dependendo do esforço, qualquer um pode passar".

Na forma 次第だ, no fim da frase, significa "depende de".""",
st="""Substantivo + 次第で + Frase
Substantivo + 次第だ / 次第です
Substantivo + 次第では""",
no="""A forma 次第では indica uma possibilidade especial, como "dependendo do caso, pode ser que...".

Expressões comuns são 努力次第, 天気次第, あなた次第 e 考え方次第.""",
bf="次第で",
rx="次第で|次第だ|次第です|しだいで",
tk=["次第", "で"],
va=["次第で", "次第では", "次第だ", "次第です"],
E=[
("努力次第で、誰でも上手になれる。", "どりょくしだいで、だれでもじょうずになれる。", "Dependendo do esforço, qualquer um pode melhorar."),
("天気次第で、予定を変えるかもしれない。", "てんきしだいで、よていをかえるかもしれない。", "Dependendo do tempo, talvez mudemos os planos."),
("行くかどうかは、あなた次第です。", "いくかどうかは、あなたしだいです。", "Ir ou não depende de você."),
("考え方次第で、人生は楽しくなる。", "かんがえかたしだいで、じんせいはたのしくなる。", "Conforme o modo de pensar, a vida fica mais divertida."),
("結果次第では、計画を中止する。", "けっかしだいでは、けいかくをちゅうしする。", "Dependendo do resultado, cancelaremos o plano."),
],
R=[
("使い方____、便利にも危険にもなる。", "Dependendo do uso, pode ser útil ou perigoso.", ["次第で", "しだいで"]),
("成功するかどうかは、君の努力____。", "Ter sucesso ou não depende do seu esforço.", ["次第だ", "次第です"]),
("値段____、買うかどうか決めます。", "Vou decidir se compro dependendo do preço.", ["次第で", "しだいで"]),
("体調____、明日の試合に出られないかもしれない。", "Dependendo de como eu estiver de saúde, talvez eu não possa jogar amanhã.", ["次第では"]),
("相手の態度____、こちらの対応も変わる。", "Conforme a atitude do outro, nossa reação também muda.", ["次第で", "しだいで"]),
],
),
dict(
n=139,
jp="次第に",
rd="shidai ni",
tr="Gradualmente / Aos poucos / Pouco a pouco",
ex="""次第に indica que uma mudança acontece de forma gradual, ao longo do tempo. Equivale a "gradualmente" ou "aos poucos".

Costuma vir com verbos de mudança, como なる, 増える, 減る e 変わる. Por exemplo, "aos poucos foi ficando escuro".

É um pouco mais formal que だんだん.""",
st="""次第に + Verbo (mudança)""",
no="""É parecido com だんだん e 徐々に.

だんだん é mais coloquial, 次第に é mais comum na escrita e 徐々に destaca uma mudança lenta e constante.""",
bf="次第に",
rx="次第に|しだいに",
tk=["次第", "に"],
va=["次第に", "しだいに"],
E=[
("空が次第に暗くなってきた。", "そらがしだいにくらくなってきた。", "O céu foi escurecendo aos poucos."),
("日本の生活にも次第に慣れてきた。", "にほんのせいかつにもしだいになれてきた。", "Fui me acostumando gradualmente com a vida no Japão."),
("雨は次第に強くなった。", "あめはしだいにつよくなった。", "A chuva foi ficando mais forte."),
("彼の病気は次第によくなっている。", "かれのびょうきはしだいによくなっている。", "A doença dele está melhorando pouco a pouco."),
("町の人口は次第に減っている。", "まちのじんこうはしだいにへっている。", "A população da cidade está diminuindo gradualmente."),
],
R=[
("春になって、____暖かくなってきた。", "Com a chegada da primavera, foi esquentando aos poucos.", ["次第に", "しだいに"]),
("練習を続けて、____上手になった。", "Continuando a praticar, fui melhorando gradualmente.", ["次第に", "しだいに"]),
("二人の関係は____悪くなった。", "A relação dos dois foi piorando aos poucos.", ["次第に", "しだいに"]),
("緊張も____ほぐれてきた。", "O nervosismo também foi passando pouco a pouco.", ["次第に", "しだいに"]),
("台風が近づき、風が____強まった。", "Com a aproximação do tufão, o vento foi ficando mais forte.", ["次第に", "しだいに"]),
],
),
dict(
n=140,
jp="しかも",
rd="shikamo",
tr="Além disso / E ainda / E mais",
ex="""しかも serve para acrescentar uma informação que reforça a anterior. Equivale a "além disso" ou "e ainda".

A segunda informação costuma ser algo ainda mais surpreendente ou importante. Por exemplo, "este restaurante é gostoso e, além disso, barato".

Também pode ligar ideias contrastantes, com o sentido de "e mesmo assim".""",
st="""Frase (com ponto final) + しかも + Frase
Adjetivo / Substantivo + で、しかも + Frase""",
no="""É parecido com その上 e おまけに. しかも é neutro, おまけに é mais coloquial e その上 é mais formal.

Pode ser usado tanto com coisas boas quanto ruins.""",
bf="しかも",
rx="しかも",
tk=["しかも"],
va=["しかも"],
E=[
("この店はおいしい。しかも安い。", "このみせはおいしい。しかもやすい。", "Esta loja é gostosa. E, além disso, barata."),
("彼は頭がよくて、しかもスポーツも得意だ。", "かれはあたまがよくて、しかもスポーツもとくいだ。", "Ele é inteligente e ainda é bom em esportes."),
("雨が降ってきた。しかも雷まで鳴っている。", "あめがふってきた。しかもかみなりまでなっている。", "Começou a chover. E ainda por cima está trovejando."),
("この部屋は広くて、しかも駅から近い。", "このへやはひろくて、しかもえきからちかい。", "Este quarto é espaçoso e, além disso, perto da estação."),
("彼は試験に合格した。しかも一番の成績で。", "かれはしけんにごうかくした。しかもいちばんのせいせきで。", "Ele passou na prova. E com a melhor nota."),
],
R=[
("このパソコンは軽い。____バッテリーも長持ちする。", "Este computador é leve. Além disso, a bateria dura bastante.", ["しかも"]),
("彼女は美人で、____優しい。", "Ela é bonita e ainda por cima gentil.", ["しかも"]),
("道に迷った。____携帯の電池も切れた。", "Me perdi. E ainda por cima a bateria do celular acabou.", ["しかも"]),
("このホテルは安くて、____朝食付きだ。", "Este hotel é barato e, além disso, inclui café da manhã.", ["しかも"]),
("彼は遅刻した。____宿題も忘れた。", "Ele se atrasou. E ainda esqueceu a lição de casa.", ["しかも"]),
],
),
]
