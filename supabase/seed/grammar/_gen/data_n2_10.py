G = [
dict(
n=91,
jp="〜に関わらず",
rd="ni kakawarazu",
tr="Independentemente de / Seja qual for / Não importa",
ex="""に関わらず indica que algo vale para todos os casos, sem depender de uma condição. Equivale a "independentemente de" ou "não importa".

Costuma vir depois de palavras que indicam diferença ou opostos, como idade, sexo, tempo, quantidade, ou de pares como "chover ou não chover". Por exemplo, "independentemente da idade, qualquer pessoa pode participar".

É uma expressão formal, muito usada em avisos e regras.""",
st="""Substantivo (diferença / tipo) + に関わらず
Verbo (forma dicionário) + Verbo (forma ない) + に関わらず
Adjetivo い + Adjetivo い (forma ない) + に関わらず""",
no="""Pares comuns são 好き嫌いに関わらず, 経験の有無に関わらず e 参加するしないに関わらず.

É parecido com を問わず. Também pode ser escrito にかかわらず.

Não se confunde com にも関わらず, que significa "apesar de".""",
bf="に関わらず",
rx="に関わらず|にかかわらず|に関わりなく|にかかわりなく",
tk=["に", "関わらず"],
va=["に関わらず", "にかかわらず", "に関わりなく"],
E=[
("年齢に関わらず、誰でも参加できます。", "ねんれいにかかわらず、だれでもさんかできます。", "Independentemente da idade, qualquer pessoa pode participar."),
("天気に関わらず、試合は行われます。", "てんきにかかわらず、しあいはおこなわれます。", "A partida será realizada seja qual for o tempo."),
("経験の有無に関わらず、応募できます。", "けいけんのうむにかかわらず、おうぼできます。", "É possível se candidatar com ou sem experiência."),
("好き嫌いにかかわらず、全部食べなさい。", "すききらいにかかわらず、ぜんぶたべなさい。", "Gostando ou não, coma tudo."),
("参加するしないに関わらず、連絡してください。", "さんかするしないにかかわらず、れんらくしてください。", "Participando ou não, entre em contato."),
],
R=[
("性別____、能力のある人を採用します。", "Independentemente do sexo, contratamos pessoas capacitadas.", ["に関わらず", "にかかわらず", "に関わりなく"]),
("雨が降る降らない____、イベントは開催します。", "Chovendo ou não, o evento será realizado.", ["に関わらず", "にかかわらず", "に関わりなく"]),
("国籍____、誰でも利用できます。", "Independentemente da nacionalidade, qualquer pessoa pode usar.", ["に関わらず", "にかかわらず", "に関わりなく"]),
("金額の大小____、寄付は大歓迎です。", "Não importa se o valor é grande ou pequeno, doações são muito bem-vindas.", ["に関わらず", "にかかわらず", "に関わりなく"]),
("昼夜____、この店は営業している。", "Esta loja funciona seja de dia ou de noite.", ["に関わらず", "にかかわらず", "に関わりなく"]),
],
),
dict(
n=92,
jp="〜に関わる",
rd="ni kakawaru",
tr="Relacionado a / Que afeta / Que envolve",
ex="""に関わる indica que algo tem uma relação direta e importante com outra coisa, muitas vezes de forma séria. Equivale a "relacionado a", "que afeta" ou "que envolve".

Costuma aparecer com palavras de grande peso, como vida, honra, futuro ou reputação. Por exemplo, "uma doença que põe a vida em risco" ou "um problema que afeta o futuro da empresa".

Também pode indicar participação em algo, como "trabalhar envolvido com educação".""",
st="""Substantivo + に関わる + Substantivo
Substantivo + に関わって + Verbo""",
no="""Expressões comuns são 命に関わる, 名誉に関わる e 将来に関わる.

É parecido com に関する, mas に関わる transmite que a relação é séria ou que tem influência forte.""",
bf="に関わる",
rx="に関わる|にかかわる|に関わって|に関わった|に関わり",
tk=["に", "関わる"],
va=["に関わる", "にかかわる", "に関わって", "に関わった", "に関わります"],
E=[
("これは命に関わる病気だ。", "これはいのちにかかわるびょうきだ。", "Esta é uma doença que põe a vida em risco."),
("会社の将来に関わる問題なので、慎重に考えよう。", "かいしゃのしょうらいにかかわるもんだいなので、しんちょうにかんがえよう。", "É um problema que afeta o futuro da empresa, então vamos pensar com cuidado."),
("彼は長年教育に関わる仕事をしている。", "かれはながねんきょういくにかかわるしごとをしている。", "Ele trabalha há muitos anos com educação."),
("そんな失敗は店の評判に関わる。", "そんなしっぱいはみせのひょうばんにかかわる。", "Um erro desses afeta a reputação da loja."),
("この事件に関わった人は全員調べられた。", "このじけんにかかわったひとはぜんいんしらべられた。", "Todas as pessoas envolvidas neste caso foram investigadas."),
],
R=[
("それは私の名誉____問題だ。", "Isso é um problema que envolve a minha honra.", ["に関わる", "にかかわる"]),
("子供の安全____ことは、すぐに対応すべきだ。", "Questões que afetam a segurança das crianças devem ser tratadas imediatamente.", ["に関わる", "にかかわる"]),
("彼女は環境保護____活動をしている。", "Ela faz atividades relacionadas à proteção do meio ambiente.", ["に関わる", "にかかわる"]),
("けがは軽く、命____ものではなかった。", "O ferimento foi leve e não pôs a vida em risco.", ["に関わる", "にかかわる"]),
("この決定は社員全員の生活____。", "Esta decisão afeta a vida de todos os funcionários.", ["に関わる", "にかかわる", "に関わります"]),
],
),
dict(
n=93,
jp="〜に決まっている",
rd="ni kimatte iru",
tr="Com certeza / É claro que / Só pode ser",
ex="""に決まっている expressa uma certeza forte, baseada na opinião da pessoa que fala. Equivale a "com certeza" ou "é claro que".

A pessoa está tão convencida que não admite outra possibilidade. Por exemplo, "se ele não estudou, é claro que vai reprovar".

É uma expressão de conversa e transmite emoção. Na fala, aparece muito como に決まってる.""",
st="""Verbo (forma simples) + に決まっている
Adjetivo い + に決まっている
Adjetivo な / Substantivo + に決まっている""",
no="""É mais subjetivo e emocional que に違いない.

Na fala informal, aparece como に決まってる ou に決まってるじゃん.""",
bf="に決まっている",
rx="に決まって|にきまって",
tk=["に", "決まって", "いる"],
va=["に決まっている", "に決まってる", "に決まっています"],
E=[
("そんなに食べたら、太るに決まっている。", "そんなにたべたら、ふとるにきまっている。", "Se comer tanto assim, é claro que vai engordar."),
("勉強しなかったんだから、落ちるに決まってるよ。", "べんきょうしなかったんだから、おちるにきまってるよ。", "Você não estudou, então com certeza vai reprovar."),
("あんな高い店、おいしいに決まっている。", "あんなたかいみせ、おいしいにきまっている。", "Uma loja cara daquelas, é claro que é gostosa."),
("犯人はあの男に決まっている。", "はんにんはあのおとこにきまっている。", "O culpado só pode ser aquele homem."),
("みんなに言ったら、反対されるに決まっています。", "みんなにいったら、はんたいされるにきまっています。", "Se contar para todos, com certeza vão ser contra."),
],
R=[
("一人で行くなんて、危ない____。", "Ir sozinho? É claro que é perigoso.", ["に決まっている", "に決まってる", "に決まっています"]),
("彼が勝つ____。", "Com certeza ele vai ganhar.", ["に決まっている", "に決まってる", "に決まっています"]),
("こんな時間に電話したら、迷惑____。", "Ligar a esta hora, é claro que vai incomodar.", ["に決まっている", "に決まってる", "に決まっています"]),
("そんな話、嘘____。", "Uma história dessas só pode ser mentira.", ["に決まっている", "に決まってる", "に決まっています"]),
("毎日練習すれば、上手になる____。", "Se praticar todo dia, com certeza vai melhorar.", ["に決まっている", "に決まってる", "に決まっています"]),
],
),
dict(
n=94,
jp="〜に越したことはない",
rd="ni koshita koto wa nai",
tr="O ideal é / Nada melhor que / O melhor seria",
ex="""に越したことはない indica que algo é o mais desejável ou o mais seguro, de acordo com o bom senso. Equivale a "o ideal é" ou "nada melhor que".

A pessoa reconhece que aquilo é o melhor, mas muitas vezes sem obrigar. Por exemplo, "o ideal é ter mais dinheiro" ou "o melhor é tomar cuidado".

É uma expressão de conselho geral, usada tanto na fala quanto na escrita.""",
st="""Verbo (forma dicionário / forma ない) + に越したことはない
Adjetivo い + に越したことはない
Adjetivo な / Substantivo + に越したことはない""",
no="""É comum com palavras como 安い, 早い, 気をつける, 健康 ou 用心.

Muitas vezes aparece com が depois, indicando uma ressalva, como "o ideal seria..., mas...".""",
bf="に越したことはない",
rx="に越したことはない|にこしたことはない|に越したことはありません",
tk=["に", "越した", "ことはない"],
va=["に越したことはない", "にこしたことはない", "に越したことはありません"],
E=[
("お金はあるに越したことはない。", "おかねはあるにこしたことはない。", "Ter dinheiro nunca é demais."),
("用心するに越したことはない。", "ようじんするにこしたことはない。", "O melhor é tomar cuidado."),
("値段は安いに越したことはないが、質も大切だ。", "ねだんはやすいにこしたことはないが、しつもたいせつだ。", "O ideal é que o preço seja baixo, mas a qualidade também importa."),
("健康に越したことはありません。", "けんこうにこしたことはありません。", "Nada melhor que ter saúde."),
("早く着くに越したことはない。", "はやくつくにこしたことはない。", "O ideal é chegar cedo."),
],
R=[
("体は丈夫な____。", "O ideal é ter um corpo forte.", ["に越したことはない", "にこしたことはない", "に越したことはありません"]),
("準備は早めにする____。", "O melhor é fazer os preparativos com antecedência.", ["に越したことはない", "にこしたことはない", "に越したことはありません"]),
("部屋は広い____。", "O ideal é um quarto espaçoso.", ["に越したことはない", "にこしたことはない", "に越したことはありません"]),
("けがをしない____。", "O melhor é não se machucar.", ["に越したことはない", "にこしたことはない", "に越したことはありません"]),
("仕事は楽な____が、それだけでは選べない。", "O ideal seria um trabalho tranquilo, mas não dá para escolher só por isso.", ["に越したことはない", "にこしたことはない"]),
],
),
dict(
n=95,
jp="〜に応えて",
rd="ni kotaete",
tr="Atendendo a / Em resposta a / Correspondendo a",
ex="""に応えて indica que alguém age para atender a um pedido, uma expectativa ou um desejo de outras pessoas. Equivale a "atendendo a" ou "em resposta a".

Costuma vir com palavras como pedido, expectativa, desejo, voz e apoio. Por exemplo, "atendendo aos pedidos dos fãs, a banda fez um bis".

É uma expressão formal, comum em notícias e anúncios.""",
st="""Substantivo + に応えて
Substantivo + に応える + Substantivo""",
no="""Palavras comuns antes são 期待, 要望, 声援, 希望 e リクエスト.

Não se confunde com に答えて, que é responder a uma pergunta.""",
bf="に応えて",
rx="に応えて|に応え|にこたえて|に応える",
tk=["に", "応えて"],
va=["に応えて", "に応え", "に応える", "にこたえて"],
E=[
("ファンの声援に応えて、選手は手を振った。", "ファンのせいえんにこたえて、せんしゅはてをふった。", "Em resposta à torcida, o atleta acenou."),
("客の要望に応えて、営業時間を延長した。", "きゃくのようぼうにこたえて、えいぎょうじかんをえんちょうした。", "Atendendo ao pedido dos clientes, ampliamos o horário de funcionamento."),
("両親の期待に応えて、彼は医者になった。", "りょうしんのきたいにこたえて、かれはいしゃになった。", "Correspondendo às expectativas dos pais, ele se tornou médico."),
("アンコールに応え、もう一曲歌った。", "アンコールにこたえ、もういっきょくうたった。", "Atendendo ao pedido de bis, cantou mais uma música."),
("市民の声に応える政治が必要だ。", "しみんのこえにこたえるせいじがひつようだ。", "É preciso uma política que responda à voz dos cidadãos."),
],
R=[
("リクエスト____、その曲をもう一度演奏した。", "Atendendo ao pedido, tocaram aquela música mais uma vez.", ["に応えて", "に応え", "にこたえて"]),
("社員の希望____、在宅勤務を導入した。", "Atendendo ao desejo dos funcionários, adotamos o trabalho remoto.", ["に応えて", "に応え", "にこたえて"]),
("皆さんの期待____、全力で頑張ります。", "Para corresponder às expectativas de todos, vou me esforçar ao máximo.", ["に応えて", "に応え", "にこたえて"]),
("読者の要望____、続編が出版された。", "Atendendo ao pedido dos leitores, a continuação foi publicada.", ["に応えて", "に応え", "にこたえて"]),
("観客の拍手____、歌手は再び登場した。", "Em resposta aos aplausos do público, a cantora voltou ao palco.", ["に応えて", "に応え", "にこたえて"]),
],
),
dict(
n=96,
jp="〜に加えて",
rd="ni kuwaete",
tr="Além de / Somado a / Junto com",
ex="""に加えて indica que algo é acrescentado a outra coisa. Equivale a "além de" ou "somado a".

Muitas vezes é usado para juntar dois fatores do mesmo tipo, como duas qualidades ou dois problemas. Por exemplo, "além da chuva, o vento também estava forte".

É uma expressão formal, comum em textos, notícias e explicações.""",
st="""Substantivo + に加えて
Substantivo + に加え""",
no="""É parecido com だけでなく e の上に, mas に加えて é mais formal.

A forma それに加えて aparece no começo de frase com o sentido de "além disso".""",
bf="に加えて",
rx="に加えて|に加え|にくわえて",
tk=["に", "加えて"],
va=["に加えて", "に加え", "それに加えて"],
E=[
("雨に加えて、風も強くなってきた。", "あめにくわえて、かぜもつよくなってきた。", "Além da chuva, o vento também ficou forte."),
("彼は英語に加えて、中国語も話せる。", "かれはえいごにくわえて、ちゅうごくごもはなせる。", "Além de inglês, ele também fala chinês."),
("給料に加え、ボーナスも出る。", "きゅうりょうにくわえ、ボーナスもでる。", "Além do salário, também há bônus."),
("物価の上昇に加えて、税金も上がった。", "ぶっかのじょうしょうにくわえて、ぜいきんもあがった。", "Somado ao aumento dos preços, os impostos também subiram."),
("この店は味に加えて、サービスもいい。", "このみせはあじにくわえて、サービスもいい。", "Além do sabor, o atendimento desta loja também é bom."),
],
R=[
("頭痛____、熱も出てきた。", "Além da dor de cabeça, também comecei a ter febre.", ["に加えて", "に加え", "にくわえて"]),
("彼女は美しさ____、知性も持っている。", "Além da beleza, ela também tem inteligência.", ["に加えて", "に加え", "にくわえて"]),
("仕事____、家事もしなければならない。", "Além do trabalho, também tenho que fazer as tarefas de casa.", ["に加えて", "に加え", "にくわえて"]),
("交通費____、宿泊費も会社が払う。", "Além do transporte, a empresa também paga a hospedagem.", ["に加えて", "に加え", "にくわえて"]),
("人手不足____、資金も足りない。", "Somado à falta de pessoal, também falta verba.", ["に加えて", "に加え", "にくわえて"]),
],
),
dict(
n=97,
jp="〜に基づいて",
rd="ni motozuite",
tr="Com base em / Baseado em / De acordo com",
ex="""に基づいて indica que algo é feito tendo outra coisa como base, fundamento ou referência. Equivale a "com base em" ou "baseado em".

Costuma vir com palavras como dados, fatos, leis, experiência e pesquisa. Por exemplo, "um filme baseado em fatos reais" ou "decidir com base nos dados".

É uma expressão formal, comum em textos, relatórios e notícias.""",
st="""Substantivo + に基づいて + Verbo
Substantivo + に基づく + Substantivo
Substantivo + に基づいた + Substantivo""",
no="""É parecido com をもとに, mas に基づいて é mais formal e indica uma base mais rígida, como regras ou dados.

As formas に基づく e に基づいた vêm antes de substantivos.""",
bf="に基づいて",
rx="に基づいて|に基づき|に基づく|に基づいた|にもとづいて",
tk=["に", "基づいて"],
va=["に基づいて", "に基づき", "に基づく", "に基づいた"],
E=[
("この映画は実話に基づいて作られた。", "このえいがはじつわにもとづいてつくられた。", "Este filme foi feito com base em uma história real."),
("データに基づいて、計画を立てた。", "データにもとづいて、けいかくをたてた。", "Fizemos o plano com base nos dados."),
("法律に基づき、処分が決められた。", "ほうりつにもとづき、しょぶんがきめられた。", "A punição foi decidida de acordo com a lei."),
("経験に基づくアドバイスは役に立つ。", "けいけんにもとづくアドバイスはやくにたつ。", "Conselhos baseados em experiência são úteis."),
("調査に基づいた報告書を提出した。", "ちょうさにもとづいたほうこくしょをていしゅつした。", "Entreguei um relatório baseado na pesquisa."),
],
R=[
("アンケートの結果____、商品を改良した。", "Melhoramos o produto com base no resultado da pesquisa.", ["に基づいて", "に基づき", "にもとづいて"]),
("規則____、手続きを行ってください。", "Faça os procedimentos de acordo com as regras.", ["に基づいて", "に基づき", "にもとづいて"]),
("事実____記事を書くべきだ。", "Deve-se escrever artigos com base em fatos.", ["に基づいて", "に基づき", "にもとづいて"]),
("科学的な根拠____判断する。", "Decido com base em fundamentos científicos.", ["に基づいて", "に基づき", "にもとづいて"]),
("この小説は作者の体験____書かれた。", "Este romance foi escrito com base nas experiências do autor.", ["に基づいて", "に基づき", "にもとづいて"]),
],
),
dict(
n=98,
jp="〜に向かって",
rd="ni mukatte",
tr="Em direção a / Para / Rumo a",
ex="""に向かって indica uma direção ou um alvo. Equivale a "em direção a", "para" ou "rumo a".

Pode indicar uma direção física, como "andar em direção ao mar", ou a pessoa para quem se fala, como "gritar para alguém".

Também pode indicar um objetivo a ser alcançado, como "esforçar-se rumo ao sonho".""",
st="""Substantivo (lugar / pessoa / objetivo) + に向かって + Verbo
Substantivo + に向かう / に向けて""",
no="""Com pessoas, muitas vezes indica uma atitude de confronto ou falta de respeito, como "falar desse jeito com o pai".

に向けて é parecido, mas é mais usado para objetivos e preparação.""",
bf="に向かって",
rx="に向かって|に向かい|にむかって",
tk=["に", "向かって"],
va=["に向かって", "に向かい", "にむかって"],
E=[
("船は南に向かって進んだ。", "ふねはみなみにむかってすすんだ。", "O navio seguiu em direção ao sul."),
("夢に向かって頑張っている。", "ゆめにむかってがんばっている。", "Estou me esforçando rumo ao meu sonho."),
("親に向かって、そんな口をきくな。", "おやにむかって、そんなくちをきくな。", "Não fale desse jeito com seus pais."),
("彼は海に向かって大声で叫んだ。", "かれはうみにむかっておおごえでさけんだ。", "Ele gritou bem alto em direção ao mar."),
("台風は東に向かい、勢力を強めている。", "たいふうはひがしにむかい、せいりょくをつよめている。", "O tufão segue para o leste e está ganhando força."),
],
R=[
("子供たちは学校____走っていった。", "As crianças saíram correndo em direção à escola.", ["に向かって", "にむかって"]),
("目標____、毎日練習している。", "Treino todo dia rumo ao meu objetivo.", ["に向かって", "にむかって"]),
("先生____、失礼なことを言ってはいけない。", "Não se deve dizer coisas rudes para o professor.", ["に向かって", "にむかって"]),
("鏡____笑ってみた。", "Tentei sorrir para o espelho.", ["に向かって", "にむかって"]),
("飛行機は東京____飛び立った。", "O avião decolou rumo a Tóquio.", ["に向かって", "にむかって"]),
],
),
dict(
n=99,
jp="〜に応じて",
rd="ni oujite",
tr="De acordo com / Conforme / Dependendo de",
ex="""に応じて indica que algo muda ou se adapta conforme outra coisa. Equivale a "de acordo com", "conforme" ou "dependendo de".

Costuma vir com palavras que indicam variação, como idade, nível, quantidade, necessidade ou situação. Por exemplo, "o salário muda de acordo com a experiência".

Também pode significar "atender a" um pedido, como "atender a uma entrevista".""",
st="""Substantivo + に応じて + Verbo
Substantivo + に応じた + Substantivo""",
no="""É parecido com によって, mas に応じて destaca que algo é ajustado de forma adequada.

A forma に応じた vem antes de substantivos, como 能力に応じた仕事.""",
bf="に応じて",
rx="に応じて|に応じ|に応じた|におうじて",
tk=["に", "応じて"],
va=["に応じて", "に応じ", "に応じた"],
E=[
("経験に応じて、給料が決まる。", "けいけんにおうじて、きゅうりょうがきまる。", "O salário é definido de acordo com a experiência."),
("予算に応じて、プランを選んでください。", "よさんにおうじて、プランをえらんでください。", "Escolha o plano conforme o seu orçamento."),
("季節に応じて、メニューが変わる。", "きせつにおうじて、メニューがかわる。", "O cardápio muda dependendo da estação."),
("レベルに応じた授業を受けられる。", "レベルにおうじたじゅぎょうをうけられる。", "É possível ter aulas de acordo com o seu nível."),
("必要に応じて、資料を追加します。", "ひつようにおうじて、しりょうをついかします。", "Conforme a necessidade, acrescentaremos materiais."),
],
R=[
("年齢____、料金が違います。", "O preço muda de acordo com a idade.", ["に応じて", "に応じ", "におうじて"]),
("天気____、予定を変更します。", "Mudaremos os planos dependendo do tempo.", ["に応じて", "に応じ", "におうじて"]),
("売り上げ____、ボーナスが支払われる。", "O bônus é pago conforme as vendas.", ["に応じて", "に応じ", "におうじて"]),
("能力____仕事を任せる。", "Confio as tarefas de acordo com a capacidade de cada um.", ["に応じて", "に応じ", "におうじて"]),
("客の注文____、料理を作る。", "Faço os pratos conforme o pedido do cliente.", ["に応じて", "に応じ", "におうじて"]),
],
),
dict(
n=100,
jp="〜に際して",
rd="ni saishite",
tr="Por ocasião de / Ao / No momento de",
ex="""に際して indica o momento em que algo especial é feito. Equivale a "por ocasião de" ou "ao".

É usado em situações formais, antes ou durante um acontecimento importante, como uma inscrição, uma viagem ou uma cerimônia. Por exemplo, "ao se inscrever, apresente um documento de identidade".

É comum em avisos, discursos e documentos oficiais.""",
st="""Substantivo + に際して / に際し
Verbo (forma dicionário) + に際して / に際し""",
no="""É muito parecido com にあたって. A diferença é pequena, mas に際して foca mais no momento em si, enquanto にあたって destaca uma etapa importante.

に際し é ainda mais formal.""",
bf="に際して",
rx="に際して|に際し|にさいして",
tk=["に", "際して"],
va=["に際して", "に際し", "に際しての"],
E=[
("申し込みに際して、身分証明書が必要です。", "もうしこみにさいして、みぶんしょうめいしょがひつようです。", "Ao fazer a inscrição, é necessário um documento de identidade."),
("出発に際して、注意事項を説明します。", "しゅっぱつにさいして、ちゅういじこうをせつめいします。", "Antes da partida, vou explicar os cuidados necessários."),
("入学に際し、学長がお祝いの言葉を述べた。", "にゅうがくにさいし、がくちょうがおいわいのことばをのべた。", "Por ocasião da entrada na universidade, o reitor deu uma mensagem de felicitações."),
("契約するに際して、内容をよく読んでください。", "けいやくするにさいして、ないようをよくよんでください。", "Ao assinar o contrato, leia bem o conteúdo."),
("帰国に際して、友人たちがパーティーを開いてくれた。", "きこくにさいして、ゆうじんたちがパーティーをひらいてくれた。", "Por ocasião da minha volta ao país, meus amigos fizeram uma festa."),
],
R=[
("ご利用____、以下の点にご注意ください。", "Ao utilizar, preste atenção aos pontos abaixo.", ["に際して", "に際し", "にさいして"]),
("退職____、お世話になった方々に挨拶をした。", "Por ocasião da minha aposentadoria, cumprimentei as pessoas que me ajudaram.", ["に際して", "に際し", "にさいして"]),
("工事を行う____、ご迷惑をおかけします。", "Durante a realização da obra, pedimos desculpas pelo incômodo.", ["に際して", "に際し", "にさいして"]),
("就職____、スーツを新しく買った。", "Por ocasião do novo emprego, comprei um terno novo.", ["に際して", "に際し", "にさいして"]),
("試験を受ける____、受験票を忘れないでください。", "Ao fazer a prova, não esqueça o comprovante de inscrição.", ["に際して", "に際し", "にさいして"]),
],
),
]
