G = [
dict(
n=41,
jp="〜か〜ないかのうちに",
rd="ka ~ nai ka no uchi ni",
tr="Mal / Assim que / Nem bem",
ex="""か〜ないかのうちに é usado para dizer que, quase no mesmo instante em que uma ação começa ou termina, outra coisa já acontece. Equivale a "mal...", "assim que..." ou "nem bem...".

A estrutura repete o mesmo verbo duas vezes: primeiro na forma de dicionário (ou た) + か, depois na forma ない + かのうちに. A ideia literal é "no momento em que nem se sabe se aconteceu ou não".

Por exemplo, "mal o sinal tocou, os alunos saíram da sala" ou "nem bem se sentou, ele já dormiu".

O tom é de algo extremamente rápido, quase simultâneo.

A segunda parte é um fato observado, geralmente no passado, e não uma ação planejada.""",
st="""Verbo (forma de dicionário / た) + か + Verbo (forma ない) + かのうちに、 + Acontecimento imediato""",
no="""Essa estrutura é parecida com たとたん, mas destaca ainda mais que as duas ações quase se sobrepõem.

É um pouco literária e aparece muito em narrativas.

A segunda parte não pode ser uma vontade ou um pedido.""",
bf="か〜ないかのうちに",
rx="ないかのうちに",
tk=["か", "ない", "か", "の", "うちに"],
va=["か〜ないかのうちに"],
E=[
("ベルが鳴るか鳴らないかのうちに、学生たちは教室を出た。", "ベルがなるかならないかのうちに、がくせいたちはきょうしつをでた。", "Mal o sinal tocou, os alunos já saíram da sala."),
("彼は座るか座らないかのうちに、寝てしまった。", "かれはすわるかすわらないかのうちに、ねてしまった。", "Nem bem se sentou, ele já caiu no sono."),
("電車が止まるか止まらないかのうちに、彼はドアに向かった。", "でんしゃがとまるかとまらないかのうちに、かれはドアにむかった。", "Mal o trem parou, ele já foi em direção à porta."),
("夜が明けるか明けないかのうちに、出発した。", "よるがあけるかあけないかのうちに、しゅっぱつした。", "Partimos assim que o dia começou a clarear."),
("試合が始まるか始まらないかのうちに、雨が降り出した。", "しあいがはじまるかはじまらないかのうちに、あめがふりだした。", "Mal a partida começou, já começou a chover."),
],
R=[
("彼女は家に着くか着か____、また出かけた。", "Ela mal chegou em casa e já saiu de novo.", ["ないかのうちに"]),
("料理を出すか出さ____、子供たちは食べ始めた。", "Mal servi a comida, as crianças já começaram a comer.", ["ないかのうちに"]),
("疲れていて、横になるかなら____、眠ってしまった。", "Estava tão cansado que, nem bem me deitei, já dormi.", ["ないかのうちに"]),
("信号が青になるかなら____、車が走り出した。", "Mal o sinal ficou verde, os carros já arrancaram.", ["ないかのうちに"]),
("先生の話が終わるか終わら____、彼は質問した。", "Mal o professor terminou de falar, ele já fez uma pergunta.", ["ないかのうちに"]),
],
),
dict(
n=42,
jp="かえって",
rd="kaette",
tr="Pelo contrário / Ao invés disso / Até piorou",
ex="""かえって é um advérbio que indica que o resultado foi o oposto do que se esperava, geralmente pior. Equivale a "pelo contrário", "ao invés disso" ou "até piorou".

A ideia é que uma ação feita para melhorar algo acabou tendo o efeito contrário. Por exemplo, "tomei o remédio e, pelo contrário, piorei" ou "fui de táxi e, ao invés de ganhar tempo, demorei mais".

Ela é muito parecida com 逆に, mas かえって destaca mais a frustração de uma tentativa que deu errado.

Também aparece em frases como "a explicação é tão detalhada que, ao invés de ajudar, fica mais difícil de entender".""",
st="""Ação (com intenção de melhorar) + かえって + Resultado oposto

Escrita: かえって / 却って""",
no="""かえって não é o verbo かえる (voltar). É um advérbio com sentido de inversão.

A frase かえってご迷惑をおかけしました ("acabei causando mais incômodo") é uma forma educada de pedir desculpas.

Comparado a むしろ, かえって costuma ter tom negativo, de resultado indesejado.""",
bf="かえって",
rx="かえって|却って",
tk=["かえって"],
va=["かえって", "却って"],
E=[
("薬を飲んだら、かえって悪くなった。", "くすりをのんだら、かえってわるくなった。", "Tomei o remédio e, pelo contrário, piorei."),
("手伝ったら、かえって邪魔になった。", "てつだったら、かえってじゃまになった。", "Tentei ajudar e, ao invés disso, acabei atrapalhando."),
("渋滞で、タクシーで行ったら、かえって時間がかかった。", "じゅうたいで、タクシーでいったら、かえってじかんがかかった。", "Com o trânsito, fui de táxi e acabei demorando ainda mais."),
("説明が詳しすぎて、かえってわかりにくい。", "せつめいがくわしすぎて、かえってわかりにくい。", "A explicação é tão detalhada que, ao invés de ajudar, fica difícil de entender."),
("安い物を買ったら、すぐ壊れてかえって高くついた。", "やすいものをかったら、すぐこわれてかえってたかくついた。", "Comprei algo barato, quebrou logo e acabou saindo mais caro."),
],
R=[
("休んだら、____疲れた。", "Descansei e, pelo contrário, fiquei mais cansado.", ["かえって"]),
("急いだら、____遅くなった。", "Corri e, ao invés de chegar antes, cheguei mais tarde.", ["かえって"]),
("慰めたら、____彼女を泣かせてしまった。", "Tentei consolar e, pelo contrário, fiz ela chorar.", ["かえって"]),
("近道をしたら、____道に迷った。", "Peguei um atalho e, ao invés disso, me perdi.", ["かえって"]),
("親切にしたつもりが、____迷惑をかけた。", "Achei que estava sendo gentil, mas acabei incomodando.", ["かえって"]),
],
),
dict(
n=43,
jp="〜限り",
rd="kagiri",
tr="Enquanto / Na medida em que / Até onde / A menos que",
ex="""限り tem vários usos, todos ligados à ideia de "limite".

• Enquanto uma condição durar: "enquanto eu tiver saúde, quero continuar trabalhando".
• Até onde vai o conhecimento ou a percepção: "até onde eu sei, ele não mente".
• O máximo possível: できる限り (o máximo possível), 時間が許す限り (enquanto o tempo permitir).
• Com a forma ない, "a menos que": "a menos que chova, a partida será realizada". Nesse uso, ない限り indica a única condição que mudaria o resultado.

Ele vem depois da forma simples de verbos, de adjetivos い, de adjetivos な com な ou である, e de substantivos com である ou の.""",
st="""Verbo / Adjetivo (forma simples) + 限り (enquanto)
知っている / 覚えている / 見た + 限り (até onde)
できる + 限り (o máximo possível)
Verbo na forma ない + 限り (a menos que)

Escrita: 限り / かぎり""",
no="""私の知る限り ("até onde eu sei") é uma expressão muito útil para dar informações com cautela.

限り também aparece em 今日限り (só hoje, a partir de hoje não mais) e 一回限り (uma única vez).

Comparado a うちは, 限り soa mais formal e mais firme.""",
bf="限り",
rx="限り|かぎり",
tk=["限り"],
va=["限り", "かぎり", "ない限り"],
E=[
("体が元気な限り、働き続けたい。", "からだがげんきなかぎり、はたらきつづけたい。", "Enquanto eu tiver saúde, quero continuar trabalhando."),
("私が知っている限り、彼はうそをつかない。", "わたしがしっているかぎり、かれはうそをつかない。", "Até onde eu sei, ele não mente."),
("できる限り早く返事をください。", "できるかぎりはやくへんじをください。", "Responda o mais rápido possível, por favor."),
("雨が降らない限り、試合は行われる。", "あめがふらないかぎり、しあいはおこなわれる。", "A menos que chova, a partida será realizada."),
("努力しない限り、成功はない。", "どりょくしないかぎり、せいこうはない。", "Sem esforço, não há sucesso."),
],
R=[
("私が覚えている____、彼は一度も遅刻したことがない。", "Até onde eu me lembro, ele nunca se atrasou.", ["限り", "かぎり"]),
("生きている____、夢をあきらめない。", "Enquanto eu viver, não vou desistir do meu sonho.", ["限り", "かぎり"]),
("結果はともかく、できる____のことはした。", "Independentemente do resultado, fiz tudo o que era possível.", ["限り", "かぎり"]),
("彼が謝らない____、許さない。", "A menos que ele peça desculpas, não vou perdoar.", ["限り", "かぎり"]),
("時間が許す____、お手伝いします。", "Enquanto o tempo permitir, vou ajudar.", ["限り", "かぎり"]),
],
),
dict(
n=44,
jp="〜甲斐がある",
rd="kai ga aru",
tr="Valer a pena / Ter valido o esforço",
ex="""甲斐がある é usado para dizer que um esforço valeu a pena, porque trouxe o resultado esperado. Equivale a "valer a pena" ou "ter valido o esforço".

甲斐 (かい) significa "valor", "resultado do esforço". Assim, a estrutura indica que a ação feita teve um retorno positivo.

Ela vem depois do verbo na forma た e de substantivos com の. Na forma て (甲斐があって), liga-se ao resultado positivo: "estudei muito e valeu a pena: passei na prova".

Na forma negativa, 甲斐がない ou 甲斐もなく significa "não valeu a pena" ou "em vão".

Combinada com verbos, かい também forma palavras como 生きがい (razão de viver) e やりがい (motivação, algo que vale a pena fazer). Nesses casos, a leitura vira がい.""",
st="""Verbo na forma た + 甲斐がある / 甲斐があった
Verbo た + 甲斐があって、 + Resultado positivo
Substantivo + の + 甲斐がある
Negativo: 甲斐がない / 甲斐もなく

Escrita: 甲斐 / かい""",
no="""やりがいがある (ser gratificante) é muito usado para falar de trabalhos e atividades.

O kanji 甲斐 é difícil e muitas vezes é escrito em hiragana: かい.

甲斐もなく (N1) aparece em frases como 努力の甲斐もなく ("apesar de todo o esforço, em vão").""",
bf="甲斐がある",
rx="甲斐があ|かいがあ|甲斐もな|かいもな|甲斐がな|かいがな",
tk=["甲斐", "が", "ある"],
va=["甲斐がある", "甲斐があった", "甲斐があって", "かいがある"],
E=[
("一生懸命勉強した甲斐があって、合格できた。", "いっしょうけんめいべんきょうしたかいがあって、ごうかくできた。", "Estudei muito e valeu a pena: consegui passar."),
("早起きした甲斐があって、きれいな日の出が見られた。", "はやおきしたかいがあって、きれいなひのでがみられた。", "Valeu a pena acordar cedo: vi um nascer do sol lindo."),
("ついに完成した。苦労した甲斐があった。", "ついにかんせいした。くろうしたかいがあった。", "Finalmente ficou pronto. Todo o sofrimento valeu a pena."),
("長い時間待った甲斐がなかった。", "ながいじかんまったかいがなかった。", "Não valeu a pena esperar tanto tempo."),
("毎日練習した甲斐があって、試合に勝った。", "まいにちれんしゅうしたかいがあって、しあいにかった。", "Treinar todo dia valeu a pena: vencemos a partida."),
],
R=[
("一年間準備した____、イベントは成功した。", "Um ano de preparação valeu a pena: o evento foi um sucesso.", ["甲斐があって", "かいがあって"]),
("遠くまで来た____た。景色が最高だ。", "Valeu a pena vir até aqui. A paisagem é incrível.", ["甲斐があっ", "かいがあっ"]),
("頑張った____、昇進できた。", "Me esforcei e valeu a pena: fui promovido.", ["甲斐があって", "かいがあって"]),
("毎日ピアノを練習した____、上手になった。", "Praticar piano todo dia valeu a pena: melhorei bastante.", ["甲斐があって", "かいがあって"]),
("せっかく作ったのに、誰も食べなかった。作った____なかった。", "Fiz com tanto cuidado, mas ninguém comeu. Não valeu a pena ter feito.", ["甲斐が", "かいが"]),
],
),
dict(
n=45,
jp="〜かねない",
rd="kanenai",
tr="Pode acabar / Há o risco de / Não é impossível que",
ex="""かねない é usado para dizer que existe o risco de algo ruim acontecer. Equivale a "pode acabar...", "há o risco de..." ou "não é impossível que...".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, 事故になりかねない (pode acabar virando um acidente) ou 誤解されかねない (há o risco de ser mal interpretado).

O resultado é sempre negativo. A ideia é alertar para um perigo ou uma consequência indesejada, muitas vezes como aviso ou crítica.

Também pode descrever uma pessoa capaz de fazer algo ruim: "ele seria capaz de dizer uma coisa dessas".

Apesar da forma negativa, o sentido é afirmativo: "pode acontecer".""",
st="""Verbo na forma ます sem ます + かねない
Verbo sem ます + かねません (educado)

Escrita: かねない / 兼ねない""",
no="""かねない é usado só para possibilidades negativas. Para algo positivo, usa-se かもしれない.

É muito comum em avisos, notícias e alertas de segurança.

Não confunda com かねる (N2), que significa "não poder fazer" de forma educada.""",
bf="かねない",
rx="かねない|かねません|兼ねない",
tk=["かねない"],
va=["かねない", "かねません"],
E=[
("このままでは、大きな事故になりかねない。", "このままでは、おおきなじこになりかねない。", "Se continuar assim, pode acabar virando um grande acidente."),
("そんなことを言ったら、誤解されかねない。", "そんなことをいったら、ごかいされかねない。", "Se disser uma coisa dessas, há o risco de ser mal interpretado."),
("無理をすると、病気になりかねない。", "むりをすると、びょうきになりかねない。", "Se exagerar, pode acabar ficando doente."),
("彼なら、そんなひどいことも言いかねない。", "かれなら、そんなひどいこともいいかねない。", "Ele seria capaz de dizer até uma coisa tão cruel dessas."),
("スピードを出しすぎると、事故を起こしかねません。", "スピードをだしすぎると、じこをおこしかねません。", "Correr demais pode acabar causando um acidente."),
],
R=[
("寝不足が続くと、体を壊し____。", "Se continuar dormindo pouco, pode acabar prejudicando a saúde.", ["かねない", "かねません"]),
("このままでは、会社が倒産し____。", "Se continuar assim, a empresa pode acabar falindo.", ["かねない", "かねません"]),
("不注意な一言が、人を傷つけ____。", "Uma palavra descuidada pode acabar magoando alguém.", ["かねない", "かねません"]),
("彼はうそもつき____人だ。", "Ele é uma pessoa capaz de mentir.", ["かねない"]),
("確認しないと、大きなミスにつながり____。", "Se não conferir, pode acabar levando a um grande erro.", ["かねない", "かねません"]),
],
),
dict(
n=46,
jp="〜かねる",
rd="kaneru",
tr="Não poder / Ser difícil de / Não estar em condições de",
ex="""かねる é usado para dizer, de forma educada e indireta, que não é possível fazer algo. Equivale a "não poder", "ser difícil de" ou "não estar em condições de".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, お答えしかねます (não posso responder), 応じかねます (não podemos atender).

O ponto principal é a educação. Em vez de dizer diretamente できません, que pode soar frio, かねます mostra que a pessoa gostaria de fazer, mas, por regras ou circunstâncias, não pode.

Por isso, é muito usado no atendimento ao cliente, em empresas e em e-mails formais.

Apesar da forma afirmativa, o sentido é negativo: "não posso".""",
st="""Verbo na forma ます sem ます + かねる
Verbo sem ます + かねます (educado, mais comum)
お / ご + Verbo + しかねます (muito educado)

Escrita: かねる / 兼ねる""",
no="""Não confunda かねる (não posso, educado) com かねない (pode acabar acontecendo algo ruim).

A forma わかりかねます ("não sei informar") é muito usada por atendentes.

Em contextos formais, かねる soa muito mais suave do que できない.""",
bf="かねる",
rx="かねる|かねます|兼ねる|兼ねます",
tk=["かねる"],
va=["かねる", "かねます"],
E=[
("申し訳ありませんが、その質問にはお答えしかねます。", "もうしわけありませんが、そのしつもんにはおこたえしかねます。", "Desculpe, mas não posso responder a essa pergunta."),
("申し訳ありませんが、ご要望には応じかねます。", "もうしわけありませんが、ごようぼうにはおうじかねます。", "Lamentamos, mas não podemos atender a esse pedido."),
("彼の意見には賛成しかねる。", "かれのいけんにはさんせいしかねる。", "Não posso concordar com a opinião dele."),
("個人情報はお教えしかねます。", "こじんじょうほうはおおしえしかねます。", "Não podemos fornecer informações pessoais."),
("この件については、私には判断しかねます。", "このけんについては、わたしにははんだんしかねます。", "Sobre este assunto, não estou em condições de decidir."),
],
R=[
("恐れ入りますが、セール品の返品はお受けし____。", "Lamentamos, mas não aceitamos devolução de itens em promoção.", ["かねます"]),
("その条件では、契約し____。", "Com essas condições, não podemos fechar o contrato.", ["かねます"]),
("彼の行動は理解し____。", "O comportamento dele é difícil de entender.", ["かねる", "かねます"]),
("申し訳ございませんが、そのご質問にはお答えし____。", "Pedimos desculpas, mas não podemos responder a essa pergunta.", ["かねます"]),
("私一人では決め____ので、上司に相談します。", "Não posso decidir sozinho, então vou consultar meu chefe.", ["かねます"]),
],
),
dict(
n=47,
jp="〜から言うと",
rd="kara iu to",
tr="Do ponto de vista de / Considerando / Em termos de",
ex="""から言うと é usado para indicar a perspectiva, o critério ou o ponto de vista a partir do qual se faz um julgamento. Equivale a "do ponto de vista de", "considerando" ou "em termos de".

A primeira parte mostra o critério (a experiência, o preço, a posição de alguém, a capacidade), e a segunda apresenta a opinião ou conclusão baseada nesse critério.

Por exemplo, "pela minha experiência, este método é o melhor" ou "em termos de preço, este é mais vantajoso".

A expressão 結論から言うと significa "indo direto à conclusão" e é muito usada em apresentações e e-mails.

As formas から言えば e から言って têm o mesmo sentido.""",
st="""Substantivo (critério / ponto de vista) + から言うと / から言えば / から言って、 + Julgamento

Expressões comuns: 経験から言うと / 結論から言うと / 立場から言うと""",
no="""Comparado a から見ると, から言うと destaca mais o critério usado para julgar, enquanto から見ると destaca o ponto de vista de alguém.

結論から言うと é uma forma muito comum de ir direto ao ponto em reuniões.

Na escrita, também aparece em hiragana: からいうと.""",
bf="から言うと",
rx="から言うと|からいうと|から言えば|からいえば|から言って|からいって",
tk=["から", "言うと"],
va=["から言うと", "から言えば", "から言って"],
E=[
("私の経験から言うと、この方法が一番いい。", "わたしのけいけんからいうと、このほうほうがいちばんいい。", "Pela minha experiência, este método é o melhor."),
("値段から言えば、こちらのほうがお得だ。", "ねだんからいえば、こちらのほうがおとくだ。", "Em termos de preço, este é mais vantajoso."),
("私の立場から言うと、賛成はできない。", "わたしのたちばからいうと、さんせいはできない。", "Da minha posição, não posso concordar."),
("結論から言うと、計画は中止です。", "けつろんからいうと、けいかくはちゅうしです。", "Indo direto à conclusão, o plano está cancelado."),
("実力から言って、彼が優勝するだろう。", "じつりょくからいって、かれがゆうしょうするだろう。", "Considerando a habilidade, ele deve ser o campeão."),
],
R=[
("結論____、この案に賛成です。", "Indo direto à conclusão, sou a favor desta proposta.", ["から言うと", "から言えば"]),
("品質____、この商品が一番だ。", "Em termos de qualidade, este produto é o melhor.", ["から言うと", "から言えば"]),
("教師の立場____、もっと勉強してほしい。", "Do ponto de vista de professor, gostaria que estudassem mais.", ["から言うと", "から言えば"]),
("私の経験____、それは無理だ。", "Pela minha experiência, isso é impossível.", ["から言うと", "から言えば"]),
("距離____、電車のほうが早い。", "Considerando a distância, o trem é mais rápido.", ["から言うと", "から言えば"]),
],
),
dict(
n=48,
jp="〜からこそ",
rd="kara koso",
tr="Justamente porque / É exatamente por isso que",
ex="""からこそ é usado para enfatizar que um motivo específico é o verdadeiro ou o mais importante. Equivale a "justamente porque" ou "é exatamente por isso que".

Ele junta から (porque) com こそ (ênfase). A ideia é destacar o motivo, muitas vezes de forma surpreendente ou contrária ao senso comum.

Por exemplo, "falo com rigor justamente porque gosto de você" ou "é justamente por ter falhado que se pode aprender".

Muitas vezes, o motivo pareceria negativo à primeira vista, mas, na verdade, é a razão de algo positivo. Por exemplo, "é justamente por estar ocupado que o descanso é importante".

A frase costuma terminar com のだ ou です, reforçando a explicação.""",
st="""Verbo / Adjetivo (forma simples) + からこそ、 + Resultado / Opinião
Substantivo / Adjetivo な + だ + からこそ
… + からこそ + 〜のだ / 〜んです""",
no="""からこそ não é usado com motivos negativos para resultados negativos simples. Ele destaca um motivo especial, muitas vezes com valor positivo.

Em discursos e cartas, からこそ é usado para expressar convicção e gratidão.

Comparado a ばこそ (N1), からこそ é mais comum na conversa.""",
bf="からこそ",
rx="からこそ",
tk=["から", "こそ"],
va=["からこそ"],
E=[
("あなたのことが好きだからこそ、厳しく言うのです。", "あなたのことがすきだからこそ、きびしくいうのです。", "Falo com rigor justamente porque gosto de você."),
("失敗したからこそ、学べることもある。", "しっぱいしたからこそ、まなべることもある。", "É justamente por ter falhado que há coisas que se pode aprender."),
("毎日努力したからこそ、成功できた。", "まいにちどりょくしたからこそ、せいこうできた。", "Foi justamente por ter me esforçado todo dia que consegui ter sucesso."),
("忙しいからこそ、休みが大切だ。", "いそがしいからこそ、やすみがたいせつだ。", "É justamente por estar ocupado que o descanso é importante."),
("家族がいるからこそ、頑張れる。", "かぞくがいるからこそ、がんばれる。", "É justamente por ter a família que consigo me esforçar."),
],
R=[
("友達だ____、本当のことを言う。", "Justamente por sermos amigos, digo a verdade.", ["からこそ"]),
("苦労した____、今の幸せがある。", "É justamente por ter passado dificuldades que tenho a felicidade de hoje.", ["からこそ"]),
("この仕事は難しい____、やりがいがある。", "É justamente por ser difícil que este trabalho é gratificante.", ["からこそ"]),
("好きだ____、毎日続けられる。", "É justamente por gostar que consigo continuar todos os dias.", ["からこそ"]),
("大切な人だ____、守りたい。", "Justamente por ser uma pessoa importante, quero protegê-la.", ["からこそ"]),
],
),
dict(
n=49,
jp="〜から見ると",
rd="kara miru to",
tr="Do ponto de vista de / Visto por / Para",
ex="""から見ると é usado para indicar o ponto de vista de alguém ou de um grupo, mostrando como algo parece a partir dessa perspectiva. Equivale a "do ponto de vista de", "visto por" ou "para".

A primeira parte indica quem está olhando (crianças, estrangeiros, pais, especialistas), e a segunda mostra a impressão ou o julgamento a partir desse olhar.

Por exemplo, "do ponto de vista das crianças, os adultos parecem saber tudo" ou "para os estrangeiros, os costumes japoneses são curiosos".

As formas から見れば, から見て e から見ても também são usadas. から見ても significa "mesmo do ponto de vista de", reforçando a avaliação.

Também pode indicar um ponto de vista físico: "vista de fora, esta casa parece muito velha".""",
st="""Substantivo (pessoa / grupo) + から見ると / から見れば / から見て、 + Impressão / Julgamento
Substantivo + から見ても + … (mesmo do ponto de vista de)

Escrita: から見ると / からみると""",
no="""Comparado a から言うと, から見ると foca mais na percepção de alguém, e から言うと, no critério usado para julgar.

É muito útil para falar de diferenças culturais.

Para a própria opinião, 私から見て ("do meu ponto de vista") soa natural e modesto.""",
bf="から見ると",
rx="から見ると|からみると|から見れば|からみれば|から見て|から見ても",
tk=["から", "見ると"],
va=["から見ると", "から見れば", "から見て", "から見ても"],
E=[
("子供から見ると、大人は何でも知っているようだ。", "こどもからみると、おとなはなんでもしっているようだ。", "Do ponto de vista das crianças, os adultos parecem saber tudo."),
("外国人から見ると、日本の習慣は不思議だ。", "がいこくじんからみると、にほんのしゅうかんはふしぎだ。", "Para os estrangeiros, os costumes japoneses são curiosos."),
("親から見れば、子供はいつまでも子供だ。", "おやからみれば、こどもはいつまでもこどもだ。", "Para os pais, os filhos são sempre crianças."),
("私から見て、彼は努力家だ。", "わたしからみて、かれはどりょくかだ。", "Do meu ponto de vista, ele é muito esforçado."),
("専門家から見ても、この絵は素晴らしい。", "せんもんかからみても、このえはすばらしい。", "Mesmo do ponto de vista de um especialista, este quadro é maravilhoso."),
],
R=[
("若者____、昔の音楽は新鮮だ。", "Para os jovens, a música antiga é uma novidade.", ["から見ると", "から見れば"]),
("先生____、彼はいい学生だ。", "Do ponto de vista do professor, ele é um bom aluno.", ["から見ると", "から見れば"]),
("外____、この家はとても古く見える。", "Vista de fora, esta casa parece muito velha.", ["から見ると", "から見れば"]),
("日本人____、ブラジルの十二月の夏は不思議だろう。", "Para os japoneses, o verão de dezembro no Brasil deve ser estranho.", ["から見ると", "から見れば"]),
("客の立場____、この店のサービスは悪い。", "Do ponto de vista do cliente, o atendimento desta loja é ruim.", ["から見ると", "から見れば"]),
],
),
dict(
n=50,
jp="〜からには",
rd="kara ni wa",
tr="Já que / Uma vez que / Visto que",
ex="""からには é usado para dizer que, como uma situação ou decisão é assim, existe uma obrigação, uma vontade ou uma determinação natural. Equivale a "já que", "uma vez que" ou "visto que".

A primeira parte apresenta um fato ou uma decisão (vir ao Japão, prometer, participar, ser escolhido). A segunda mostra o que, por isso, deve ou se quer fazer, com expressões como たい, なければならない, べきだ, つもりだ ou uma determinação forte.

Por exemplo, "já que vim ao Japão, quero estudar japonês" ou "uma vez que prometi, tenho que cumprir".

O sentido é praticamente igual ao de 以上は e 上は. からには é o mais comum na conversa.""",
st="""Verbo (forma simples) + からには、 + Obrigação / Vontade / Determinação
Substantivo + である + からには""",
no="""A segunda parte quase sempre expressa determinação, dever ou forte vontade.

やるからには ("já que vou fazer") é uma expressão muito usada para mostrar comprometimento.

以上は soa um pouco mais formal; 上は é o mais formal dos três.""",
bf="からには",
rx="からには",
tk=["から", "には"],
va=["からには"],
E=[
("日本に来たからには、日本語を勉強したい。", "にほんにきたからには、にほんごをべんきょうしたい。", "Já que vim ao Japão, quero estudar japonês."),
("約束したからには、守らなければならない。", "やくそくしたからには、まもらなければならない。", "Uma vez que prometi, tenho que cumprir."),
("試合に出るからには、勝ちたい。", "しあいにでるからには、かちたい。", "Já que vou participar da partida, quero vencer."),
("やると決めたからには、最後までやる。", "やるときめたからには、さいごまでやる。", "Uma vez que decidi fazer, vou até o fim."),
("社長になったからには、会社を成長させたい。", "しゃちょうになったからには、かいしゃをせいちょうさせたい。", "Já que me tornei presidente, quero fazer a empresa crescer."),
],
R=[
("留学する____、その国の文化も学びたい。", "Já que vou fazer intercâmbio, quero aprender também a cultura do país.", ["からには"]),
("仕事を引き受けた____、責任を持つべきだ。", "Uma vez que aceitou o trabalho, deve assumir a responsabilidade.", ["からには"]),
("高いお金を払った____、楽しまないと。", "Já que paguei caro, tenho que aproveitar.", ["からには"]),
("代表に選ばれた____、全力を尽くします。", "Já que fui escolhido como representante, vou dar o meu melhor.", ["からには"]),
("始めた____、途中でやめない。", "Uma vez que comecei, não vou parar no meio.", ["からには"]),
],
),
]
