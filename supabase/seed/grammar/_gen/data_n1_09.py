G = [
dict(
n=81,
jp="〜ものを",
rd="mono wo",
tr="Se tivesse... teria / Mas / E no entanto",
ex="""ものを expressa lamento, reclamação ou frustração porque algo não aconteceu como deveria. Equivale a "se tivesse..., teria" ou "e no entanto...".

Muitas vezes a pessoa diz que, se outra coisa tivesse sido feita, o resultado seria melhor. Por exemplo, "se tivesse me contado, eu teria ajudado".

É parecido com のに, mas soa mais formal e literário.""",
st="""Verbo / Adjetivo (forma simples) + ものを
Verbo (forma ば) + 〜ものを""",
no="""Muitas vezes vem com ば ou たら, falando de algo que não aconteceu.

Também pode ficar no fim da frase, como uma reclamação.""",
bf="ものを",
rx="ものを",
tk=["もの", "を"],
va=["ものを"],
E=[
("言ってくれれば手伝ったものを。", "いってくれればてつだったものを。", "Se tivesse me dito, eu teria ajudado."),
("早く病院に行けば治ったものを、彼は我慢してしまった。", "はやくびょういんにいけばなおったものを、かれはがまんしてしまった。", "Se tivesse ido logo ao hospital, teria sarado, mas ele aguentou calado."),
("素直に謝ればいいものを、彼は言い訳ばかりする。", "すなおにあやまればいいものを、かれはいいわけばかりする。", "Bastava pedir desculpas com sinceridade, mas ele só dá desculpas."),
("黙っていればわからなかったものを。", "だまっていればわからなかったものを。", "Se tivesse ficado calado, ninguém teria descoberto."),
("一言相談してくれれば、いい方法を教えたものを。", "ひとことそうだんしてくれれば、いいほうほうをおしえたものを。", "Se tivesse me consultado, eu teria ensinado um bom jeito."),
],
R=[
("もう少し早く出れば間に合った____。", "Se tivesse saído um pouco mais cedo, teria dado tempo.", ["ものを"]),
("知っていれば教えてあげた____。", "Se eu soubesse, teria te contado.", ["ものを"]),
("断ればいい____、彼女は引き受けてしまった。", "Bastava recusar, mas ela acabou aceitando.", ["ものを"]),
("勉強していれば合格できた____。", "Se tivesse estudado, teria passado.", ["ものを"]),
("連絡してくれれば迎えに行った____。", "Se tivesse me avisado, eu teria ido te buscar.", ["ものを"]),
],
),
dict(
n=82,
jp="〜ものと思われる / 〜ものと見られる",
rd="mono to omowareru / mono to mirareru",
tr="Acredita-se que / Supõe-se que / Estima-se que",
ex="""ものと思われる e ものと見られる expressam uma suposição de forma objetiva e formal. Equivalem a "acredita-se que" ou "supõe-se que".

São muito usadas em notícias, relatórios e documentos oficiais, quando a informação ainda não é certa. Por exemplo, "acredita-se que a causa do incêndio foi um cigarro".

ものと見られる é ainda mais comum em notícias.""",
st="""Verbo / Adjetivo (forma simples) + ものと思われる
Verbo / Adjetivo (forma simples) + ものと見られる""",
no="""Também aparece como ものとみられる, em hiragana.

É parecido com と考えられる, mas ものと見られる é típico de jornalismo.""",
bf="ものと思われる",
rx="ものと思われる|ものと見られる|ものとみられる|ものと思われます|ものと見られます|ものと見られて",
tk=["もの", "と", "思われる"],
va=["ものと思われる", "ものと見られる", "ものとみられる"],
E=[
("火事の原因はたばこの火によるものと思われる。", "かじのげんいんはたばこのひによるものとおもわれる。", "Acredita-se que a causa do incêndio foi a brasa de um cigarro."),
("犯人はまだ市内にいるものと見られている。", "はんにんはまだしないにいるものとみられている。", "Supõe-se que o culpado ainda esteja na cidade."),
("今年の売り上げは、去年より増えるものと見られる。", "ことしのうりあげは、きょねんよりふえるものとみられる。", "Estima-se que as vendas deste ano aumentem em relação ao ano passado."),
("この遺跡は千年前のものと思われます。", "このいせきはせんねんまえのものとおもわれます。", "Acredita-se que estas ruínas sejam de mil anos atrás."),
("台風は明日の朝、上陸するものと見られる。", "たいふうはあしたのあさ、じょうりくするものとみられる。", "Estima-se que o tufão chegue à terra amanhã de manhã."),
],
R=[
("事故の原因は、運転手の不注意による____。", "Acredita-se que a causa do acidente foi descuido do motorista.", ["ものと思われる", "ものと見られる", "ものとみられる"]),
("この絵は有名な画家が描いた____。", "Acredita-se que este quadro foi pintado por um pintor famoso.", ["ものと思われる", "ものと見られる", "ものと思われます"]),
("景気は今後、回復に向かう____。", "Estima-se que a economia caminhe para a recuperação daqui em diante.", ["ものと見られる", "ものとみられる", "ものと思われる"]),
("被害は広い範囲に及んでいる____。", "Supõe-se que os danos atinjam uma grande área.", ["ものと見られる", "ものとみられる", "ものと思われる"]),
("投票率は前回を下回る____。", "Estima-se que a taxa de votação fique abaixo da anterior.", ["ものと見られる", "ものとみられる", "ものと思われる"]),
],
),
dict(
n=83,
jp="〜ものとする",
rd="mono to suru",
tr="Fica estabelecido que / Considera-se que / Deve-se",
ex="""ものとする é usado para estabelecer uma regra, uma condição ou uma interpretação oficial. Equivale a "fica estabelecido que" ou "considera-se que".

É uma expressão típica de contratos, leis, regulamentos e documentos formais. Por exemplo, "o contrato será considerado válido a partir da assinatura" ou "o pagamento deve ser feito até o fim do mês".""",
st="""Verbo (forma dicionário) + ものとする
Verbo (forma ない) + ものとする""",
no="""Quase não é usado na fala do dia a dia.

Também aparece como ものとします, na forma educada, e ものとみなす, "considera-se como".""",
bf="ものとする",
rx="ものとする|ものとします",
tk=["もの", "と", "する"],
va=["ものとする", "ものとします"],
E=[
("契約は署名した日から有効になるものとする。", "けいやくはしょめいしたひからゆうこうになるものとする。", "Fica estabelecido que o contrato é válido a partir da data da assinatura."),
("家賃は毎月末日までに支払うものとする。", "やちんはまいげつまつじつまでにしはらうものとする。", "O aluguel deve ser pago até o último dia de cada mês."),
("連絡がない場合は、欠席したものとします。", "れんらくがないばあいは、けっせきしたものとします。", "Em caso de falta de aviso, considera-se ausência."),
("この規則は来月から適用するものとする。", "このきそくはらいげつからてきようするものとする。", "Fica estabelecido que esta regra será aplicada a partir do mês que vem."),
("期限を過ぎた申し込みは受け付けないものとする。", "きげんをすぎたもうしこみはうけつけないものとする。", "Fica estabelecido que inscrições fora do prazo não serão aceitas."),
],
R=[
("会員は年会費を前払いする____。", "Os sócios devem pagar a anuidade adiantado.", ["ものとする", "ものとします"]),
("返事がない場合は、賛成した____。", "Em caso de não haver resposta, considera-se que concorda.", ["ものとする", "ものとします"]),
("会議は月に一回開く____。", "Fica estabelecido que a reunião será realizada uma vez por mês.", ["ものとする", "ものとします"]),
("本契約は一年間有効な____。", "Fica estabelecido que este contrato é válido por um ano.", ["ものとする", "ものとします"]),
("違反した場合は、罰金を支払う____。", "Em caso de infração, deve-se pagar uma multa.", ["ものとする", "ものとします"]),
],
),
dict(
n=84,
jp="〜ものとして",
rd="mono to shite",
tr="Supondo que / Considerando que / Como se",
ex="""ものとして indica que algo é tratado ou considerado de uma certa forma, mesmo que não seja totalmente certo. Equivale a "supondo que" ou "considerando que".

A pessoa age como se aquilo fosse verdade. Por exemplo, "considerando que ele vem, vamos preparar a comida".

É uma expressão formal, comum no trabalho e em documentos.""",
st="""Verbo / Adjetivo (forma simples) + ものとして + Verbo
Substantivo + の + ものとして""",
no="""É parecido com と仮定して e と考えて.

A forma ものとして扱う significa "tratar como".""",
bf="ものとして",
rx="ものとして",
tk=["もの", "と", "して"],
va=["ものとして"],
E=[
("全員参加するものとして、席を用意した。", "ぜんいんさんかするものとして、せきをよういした。", "Preparamos os lugares considerando que todos vão participar."),
("返事がない人は、欠席するものとして扱います。", "へんじがないひとは、けっせきするものとしてあつかいます。", "Quem não responder será tratado como ausente."),
("この計画は成功するものとして、次の準備を始めよう。", "このけいかくはせいこうするものとして、つぎのじゅんびをはじめよう。", "Supondo que este plano dê certo, vamos começar a preparar o próximo."),
("事故はなかったものとして、話を進めてください。", "じこはなかったものとして、はなしをすすめてください。", "Continue a conversa como se o acidente não tivesse acontecido."),
("雨が降るものとして、傘を持っていこう。", "あめがふるものとして、かさをもっていこう。", "Considerando que vai chover, vamos levar guarda-chuva."),
],
R=[
("予算は増えない____、計画を立てる。", "Vamos fazer o plano considerando que o orçamento não vai aumentar.", ["ものとして"]),
("彼は来ない____、四人で始めましょう。", "Considerando que ele não vem, vamos começar em quatro.", ["ものとして"]),
("今の話は聞かなかった____、忘れてください。", "Esqueça, como se você não tivesse ouvido o que eu disse.", ["ものとして"]),
("問題は解決した____、次の議題に移ります。", "Considerando que o problema foi resolvido, passaremos à próxima pauta.", ["ものとして"]),
("参加者は百人いる____、会場を予約した。", "Reservamos o local supondo que haverá cem participantes.", ["ものとして"]),
],
),
dict(
n=85,
jp="もしくは",
rd="moshiku wa",
tr="Ou / Ou então / Ou ainda",
ex="""もしくは serve para apresentar opções, com o sentido de "ou" ou "ou então". É uma forma formal de または e か.

É muito usado em documentos, avisos, regras e explicações oficiais. Por exemplo, "entre em contato por telefone ou por e-mail".

Na fala do dia a dia, usa-se mais か ou または.""",
st="""Substantivo + もしくは + Substantivo
Frase + もしくは + Frase""",
no="""É parecido com または e あるいは.

Em textos legais, もしくは é usado para opções menores dentro de um grupo, e または para grupos maiores.""",
bf="もしくは",
rx="もしくは|若しくは",
tk=["もしくは"],
va=["もしくは"],
E=[
("お問い合わせは電話もしくはメールでお願いします。", "おといあわせはでんわもしくはメールでおねがいします。", "Entre em contato por telefone ou por e-mail."),
("本人もしくは家族の署名が必要です。", "ほんにんもしくはかぞくのしょめいがひつようです。", "É necessária a assinatura da própria pessoa ou de um familiar."),
("黒もしくは青のペンで記入してください。", "くろもしくはあおのペンできにゅうしてください。", "Preencha com caneta preta ou azul."),
("参加できない場合は、事前に連絡するか、もしくは代理人を立ててください。", "さんかできないばあいは、じぜんにれんらくするか、もしくはだいりにんをたててください。", "Se não puder participar, avise antes ou então indique um representante."),
("会議は月曜日もしくは火曜日に行います。", "かいぎはげつようびもしくはかようびにおこないます。", "A reunião será na segunda ou na terça-feira."),
],
R=[
("申し込みは窓口____郵送で受け付けます。", "As inscrições são aceitas no guichê ou pelo correio.", ["もしくは"]),
("パスポート____運転免許証を見せてください。", "Mostre o passaporte ou a carteira de motorista.", ["もしくは"]),
("支払いは現金____カードでお願いします。", "O pagamento pode ser em dinheiro ou cartão.", ["もしくは"]),
("詳しくは担当者____受付にお尋ねください。", "Para mais detalhes, pergunte ao responsável ou na recepção.", ["もしくは"]),
("明日____明後日にお届けします。", "Entregaremos amanhã ou depois de amanhã.", ["もしくは"]),
],
),
dict(
n=86,
jp="〜んばかりに",
rd="n bakari ni",
tr="Como se fosse / Quase a ponto de / Como quem",
ex="""んばかりに indica que algo está quase acontecendo, ou que alguém age como se fosse fazer algo. Equivale a "como se fosse..." ou "quase a ponto de".

Muitas vezes descreve gestos ou expressões intensas. Por exemplo, "ele me olhou como quem dizia 'saia daqui'" ou "chorou como se fosse se desmanchar".

É uma expressão literária, mais comum na escrita.""",
st="""Verbo (forma ない sem ない) + んばかりに
Verbo (forma ない sem ない) + んばかりの + Substantivo
Verbo (forma ない sem ない) + んばかりだ
する → せんばかりに""",
no="""Atenção à forma de する, que vira せんばかり.

Expressões comuns são 泣かんばかりに, 言わんばかりに e あふれんばかりの.

O sujeito costuma ser outra pessoa, não a primeira pessoa.""",
bf="んばかりに",
rx="んばかりに|んばかりの|んばかりだ|んばかり",
tk=["ん", "ばかり", "に"],
va=["んばかりに", "んばかりの", "んばかりだ"],
E=[
("彼は早く帰れと言わんばかりに、時計を見た。", "かれははやくかえれといわんばかりに、とけいをみた。", "Ele olhou o relógio como quem dizia: vá embora logo."),
("彼女は泣かんばかりに頼んできた。", "かのじょはなかんばかりにたのんできた。", "Ela me pediu quase chorando."),
("会場はあふれんばかりの人だった。", "かいじょうはあふれんばかりのひとだった。", "O local estava a ponto de transbordar de tanta gente."),
("子供は飛び上がらんばかりに喜んだ。", "こどもはとびあがらんばかりによろこんだ。", "A criança ficou tão feliz que quase pulou."),
("彼は今にも怒り出さんばかりの顔をしていた。", "かれはいまにもおこりださんばかりのかおをしていた。", "Ele estava com uma cara de quem ia explodir de raiva a qualquer momento."),
],
R=[
("彼はお前が悪いと言わ____、私をにらんだ。", "Ele me encarou como quem dizia: a culpa é sua.", ["んばかりに"]),
("母は泣か____、私の合格を喜んだ。", "Minha mãe comemorou a minha aprovação quase chorando.", ["んばかりに"]),
("あふれ____笑顔で、彼女は迎えてくれた。", "Ela me recebeu com um sorriso radiante.", ["んばかりの"]),
("彼は土下座せ____謝った。", "Ele pediu desculpas quase se ajoelhando.", ["んばかりに"]),
("割れ____拍手が起こった。", "Houve aplausos a ponto de fazer o teto vir abaixo.", ["んばかりの"]),
],
),
dict(
n=87,
jp="〜んがために",
rd="n ga tame ni",
tr="Com o único propósito de / Só para / A fim de",
ex="""んがために indica um objetivo forte e determinado. Equivale a "com o único propósito de" ou "a fim de".

A pessoa mostra que fez algo, muitas vezes difícil ou extremo, apenas para alcançar aquele objetivo. Por exemplo, "mentiu só para vencer".

É uma forma antiga e muito formal de ために, usada na escrita.""",
st="""Verbo (forma ない sem ない) + んがために
Verbo (forma ない sem ない) + んがための + Substantivo
する → せんがために""",
no="""Atenção à forma de する, que vira せんがために.

Expressões comuns são 勝たんがために, 生きんがために e 知らんがために.""",
bf="んがために",
rx="んがために|んがための|んがため",
tk=["ん", "が", "ために"],
va=["んがために", "んがための", "んがため"],
E=[
("勝たんがために、彼はうそをついた。", "かたんがために、かれはうそをついた。", "Ele mentiu só para vencer."),
("生きんがために、必死で働いた。", "いきんがために、ひっしではたらいた。", "Trabalhou desesperadamente só para sobreviver."),
("真実を知らんがために、彼は調査を続けた。", "しんじつをしらんがために、かれはちょうさをつづけた。", "Ele continuou a investigação com o único propósito de saber a verdade."),
("夢を実現せんがために、海外へ渡った。", "ゆめをじつげんせんがために、かいがいへわたった。", "Foi para o exterior com o único propósito de realizar seu sonho."),
("合格せんがための努力は、決して無駄ではない。", "ごうかくせんがためのどりょくは、けっしてむだではない。", "O esforço feito com o objetivo de passar nunca é em vão."),
],
R=[
("家族を守ら____、彼はすべてを捨てた。", "Ele abandonou tudo só para proteger a família.", ["んがために", "んがため"]),
("目的を達成せ____、手段を選ばなかった。", "Para alcançar o objetivo, não mediu meios.", ["んがために", "んがため"]),
("注目を集め____、彼は派手な服を着た。", "Ele usou roupas chamativas só para chamar a atenção.", ["んがために", "んがため"]),
("記録を破ら____、毎日練習した。", "Treinou todos os dias com o único propósito de quebrar o recorde.", ["んがために", "んがため"]),
("売ら____宣伝ばかりで、中身がない。", "É só propaganda para vender, sem conteúdo.", ["んがための"]),
],
),
dict(
n=88,
jp="〜ながらに / 〜ながらの",
rd="nagara ni / nagara no",
tr="Desde / Ainda em / Tal como",
ex="""ながらに e ながらの indicam que um estado continua igual, sem mudanças. Equivalem a "desde", "ainda em" ou "tal como".

Aparecem em expressões fixas. Por exemplo, 生まれながらに significa "desde o nascimento", 涙ながらに significa "em lágrimas", e 昔ながらの significa "tal como antigamente".

ながらの vem antes de substantivos, e ながらに funciona como advérbio.""",
st="""Substantivo / Verbo (forma ます sem ます) + ながらに + Verbo
Substantivo / Verbo (forma ます sem ます) + ながらの + Substantivo""",
no="""Só funciona com algumas palavras fixas, como 生まれながら, 涙ながら, 昔ながら, いながらにして e 居ながら.

Não se confunde com ながら de "enquanto".""",
bf="ながらに",
rx="ながらに|ながらの|ながら",
tk=["ながら", "に"],
va=["ながらに", "ながらの", "ながらにして"],
E=[
("彼は生まれながらに音楽の才能があった。", "かれはうまれながらにおんがくのさいのうがあった。", "Ele tinha talento para música desde o nascimento."),
("この町には昔ながらの町並みが残っている。", "このまちにはむかしながらのまちなみがのこっている。", "Nesta cidade, ainda resta uma paisagem urbana tal como antigamente."),
("彼女は涙ながらに事故の様子を語った。", "かのじょはなみだながらにじこのようすをかたった。", "Ela contou em lágrimas como foi o acidente."),
("インターネットで、家にいながらにして買い物ができる。", "インターネットで、いえにいながらにしてかいものができる。", "Com a internet, dá para fazer compras sem sair de casa."),
("昔ながらの製法で作られたしょうゆだ。", "むかしながらのせいほうでつくられたしょうゆだ。", "É um shoyu feito com o método tradicional de antigamente."),
],
R=[
("この店は昔____味を守っている。", "Esta loja mantém o sabor tal como antigamente.", ["ながらの"]),
("彼女は涙____別れを告げた。", "Ela se despediu em lágrimas.", ["ながらに"]),
("人は生まれ____平等である。", "As pessoas são iguais desde o nascimento.", ["ながらに"]),
("昔____祭りが今も続いている。", "Um festival tal como antigamente continua até hoje.", ["ながらの"]),
("家にい____、世界中の人と話せる。", "Sem sair de casa, dá para conversar com pessoas do mundo todo.", ["ながらにして", "ながらに"]),
],
),
dict(
n=89,
jp="〜ないまでも",
rd="nai made mo",
tr="Mesmo que não / Se não... pelo menos / Ainda que não",
ex="""ないまでも indica que, mesmo que não se alcance um nível alto, pelo menos se espera um nível menor. Equivale a "mesmo que não..., pelo menos".

A primeira parte mostra o ideal, que talvez não seja possível, e a segunda mostra o mínimo desejado. Por exemplo, "mesmo que não seja todo dia, pelo menos três vezes por semana quero me exercitar".

A segunda parte costuma ter せめて, くらいは ou expressões de desejo.""",
st="""Verbo (forma ない) + までも + Mínimo desejado""",
no="""É parecido com ないにしても.

A segunda parte costuma ter たい, べきだ, てほしい ou ほうがいい.""",
bf="ないまでも",
rx="ないまでも",
tk=["ない", "まで", "も"],
va=["ないまでも"],
E=[
("毎日とは言わないまでも、週に三回は運動したい。", "まいにちとはいわないまでも、しゅうにさんかいはうんどうしたい。", "Mesmo que não seja todo dia, quero me exercitar pelo menos três vezes por semana."),
("優勝できないまでも、三位以内には入りたい。", "ゆうしょうできないまでも、さんいいないにははいりたい。", "Mesmo que não vença, quero pelo menos ficar entre os três primeiros."),
("手伝わないまでも、邪魔はしないでほしい。", "てつだわないまでも、じゃまはしないでほしい。", "Se não vai ajudar, pelo menos não atrapalhe."),
("完璧ではないまでも、かなりいい出来だ。", "かんぺきではないまでも、かなりいいできだ。", "Mesmo que não seja perfeito, ficou bem bom."),
("会いに行かないまでも、電話くらいはするべきだ。", "あいにいかないまでも、でんわくらいはするべきだ。", "Mesmo que não vá visitá-lo, deveria pelo menos ligar."),
],
R=[
("満点は取れ____、合格点は取りたい。", "Mesmo que não tire nota máxima, quero pelo menos a nota de aprovação.", ["ないまでも"]),
("お礼を言わ____、挨拶くらいはしなさい。", "Se não vai agradecer, pelo menos cumprimente.", ["ないまでも"]),
("プロにはなれ____、趣味として続けたい。", "Mesmo que não vire profissional, quero continuar como hobby.", ["ないまでも"]),
("毎日料理をし____、週末くらいは作ろう。", "Mesmo que não cozinhe todo dia, vamos pelo menos cozinhar no fim de semana.", ["ないまでも"]),
("全部は覚えられ____、半分は覚えたい。", "Mesmo que não consiga decorar tudo, quero decorar pelo menos a metade.", ["ないまでも"]),
],
),
dict(
n=90,
jp="〜ないものでもない",
rd="nai mono demo nai",
tr="Não é impossível / Até que dá para / Não deixa de ser possível",
ex="""ないものでもない é uma dupla negação que expressa uma possibilidade fraca. Equivale a "não é impossível" ou "até que dá para".

A pessoa admite que algo é possível, mas sem muita vontade ou certeza. Por exemplo, "se você insistir, até que dá para eu ajudar".

É uma expressão formal e indireta.""",
st="""Verbo (forma ない) + ものでもない
Verbo (forma potencial, forma ない) + ものでもない""",
no="""É parecido com なくはない e ないこともない, mas ないものでもない é mais formal.

Muitas vezes vem com uma condição, como ば ou なら.""",
bf="ないものでもない",
rx="ないものでもない|ないものでもありません",
tk=["ない", "もの", "でも", "ない"],
va=["ないものでもない", "ないものでもありません"],
E=[
("急げば、間に合わないものでもない。", "いそげば、まにあわないものでもない。", "Se correr, não é impossível chegar a tempo."),
("条件次第では、引き受けないものでもない。", "じょうけんしだいでは、ひきうけないものでもない。", "Dependendo das condições, até que dá para eu aceitar."),
("頼まれれば、手伝わないものでもない。", "たのまれれば、てつだわないものでもない。", "Se me pedirem, até que posso ajudar."),
("その気持ちはわからないものでもない。", "そのきもちはわからないものでもない。", "Esse sentimento não deixa de ser compreensível."),
("二人で頑張れば、できないものでもありません。", "ふたりでがんばれば、できないものでもありません。", "Se nós dois nos esforçarmos, não é impossível."),
],
R=[
("値段によっては、買わ____。", "Dependendo do preço, até que eu compro.", ["ないものでもない", "ないものでもありません"]),
("練習すれば、勝て____。", "Se treinar, não é impossível vencer.", ["ないものでもない", "ないものでもありません"]),
("彼が謝るなら、許さ____。", "Se ele pedir desculpas, até que dá para perdoar.", ["ないものでもない", "ないものでもありません"]),
("時間があれば、行か____。", "Se eu tiver tempo, até que posso ir.", ["ないものでもない", "ないものでもありません"]),
("この問題は難しいが、解け____。", "Este problema é difícil, mas não é impossível de resolver.", ["ないものでもない", "ないものでもありません"]),
],
),
]
