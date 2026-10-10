G = [
dict(
n=41,
jp="いかにも",
rd="ikanimo",
tr="Realmente / Bem típico de / Com toda a cara de",
ex="""いかにも indica que algo parece muito ser aquilo, ou que combina perfeitamente com uma imagem. Equivale a "realmente", "bem típico de" ou "com toda a cara de".

Muitas vezes vem junto com らしい ou そうだ. Por exemplo, "é uma atitude bem típica dele" ou "parece muito gostoso".

Também pode ser usado como resposta para concordar, com o sentido de "exatamente", mas esse uso é antiquado.""",
st="""いかにも + Substantivo + らしい
いかにも + Adjetivo / Verbo + そうだ
いかにも + Adjetivo""",
no="""Às vezes tem um tom de crítica, quando algo parece falso ou exagerado, como いかにも嘘っぽい.

É parecido com 本当に e まさに.""",
bf="いかにも",
rx="いかにも",
tk=["いかにも"],
va=["いかにも"],
E=[
("それはいかにも彼らしい考えだ。", "それはいかにもかれらしいかんがえだ。", "Essa é uma ideia bem típica dele."),
("このケーキはいかにもおいしそうだ。", "このケーキはいかにもおいしそうだ。", "Este bolo tem toda a cara de ser gostoso."),
("彼はいかにも困ったという顔をした。", "かれはいかにもこまったというかおをした。", "Ele fez uma cara de quem estava realmente em apuros."),
("いかにも日本らしい景色だ。", "いかにもにほんらしいけしきだ。", "É uma paisagem bem típica do Japão."),
("その話はいかにも嘘っぽい。", "そのはなしはいかにもうそっぽい。", "Essa história tem toda a cara de mentira."),
],
R=[
("____京都らしい町並みだ。", "É uma paisagem urbana bem típica de Kyoto.", ["いかにも"]),
("彼女は____楽しそうに笑った。", "Ela riu com toda a cara de quem estava se divertindo.", ["いかにも"]),
("____高そうな車が止まっている。", "Tem um carro estacionado com toda a cara de ser caro.", ["いかにも"]),
("それは____子供らしい質問だ。", "Essa é uma pergunta bem típica de criança.", ["いかにも"]),
("彼は____知っているような顔をした。", "Ele fez cara de quem realmente sabia.", ["いかにも"]),
],
),
dict(
n=42,
jp="いずれにしても / いずれにしろ / いずれにせよ",
rd="izure ni shite mo / izure ni shiro / izure ni seyo",
tr="De qualquer forma / Seja como for / Em todo caso",
ex="""いずれにしても, いずれにしろ e いずれにせよ servem para dizer que, seja qual for a situação ou a escolha, a conclusão é a mesma. Equivalem a "de qualquer forma" ou "seja como for".

São usadas para encerrar uma discussão e ir direto ao ponto principal. Por exemplo, "seja como for, precisamos decidir até amanhã".

いずれにせよ é a forma mais formal, e いずれにしても é a mais comum na fala.""",
st="""いずれにしても / いずれにしろ / いずれにせよ、 + Conclusão""",
no="""São parecidas com とにかく e どちらにしても.

Costumam aparecer no começo da frase, depois de uma discussão com várias possibilidades.""",
bf="いずれにしても",
rx="いずれにしても|いずれにしろ|いずれにせよ",
tk=["いずれ", "に", "しても"],
va=["いずれにしても", "いずれにしろ", "いずれにせよ"],
E=[
("いずれにしても、明日までに決めなければならない。", "いずれにしても、あしたまでにきめなければならない。", "De qualquer forma, temos que decidir até amanhã."),
("行くか行かないか、いずれにせよ連絡してください。", "いくかいかないか、いずれにせよれんらくしてください。", "Indo ou não, em todo caso, entre em contato."),
("いずれにしろ、もう一度話し合う必要がある。", "いずれにしろ、もういちどはなしあうひつようがある。", "Seja como for, é preciso conversar mais uma vez."),
("原因はわからないが、いずれにしても修理が必要だ。", "げんいんはわからないが、いずれにしてもしゅうりがひつようだ。", "Não sei a causa, mas de qualquer forma precisa de conserto."),
("いずれにせよ、結果はすぐにわかるだろう。", "いずれにせよ、けっかはすぐにわかるだろう。", "Seja como for, o resultado deve sair logo."),
],
R=[
("____、早めに準備しておこう。", "De qualquer forma, vamos nos preparar com antecedência.", ["いずれにしても", "いずれにしろ", "いずれにせよ"]),
("賛成でも反対でも、____意見を聞かせてください。", "A favor ou contra, em todo caso, me diga sua opinião.", ["いずれにしても", "いずれにしろ", "いずれにせよ"]),
("____、彼の責任は重い。", "Seja como for, a responsabilidade dele é grande.", ["いずれにしても", "いずれにしろ", "いずれにせよ"]),
("電車でもバスでも、____一時間はかかる。", "De trem ou de ônibus, de qualquer forma leva uma hora.", ["いずれにしても", "いずれにしろ", "いずれにせよ"]),
("____、今日はもう遅いから帰ろう。", "Seja como for, já está tarde hoje, vamos embora.", ["いずれにしても", "いずれにしろ", "いずれにせよ"]),
],
),
dict(
n=43,
jp="〜じみた",
rd="jimita",
tr="Com jeito de / Que parece / Infantil",
ex="""じみた indica que algo parece ou tem características de algo, geralmente de forma negativa. Equivale a "com jeito de" ou "que parece".

Por exemplo, 子供じみた significa "infantil", e 脅迫じみた significa "com tom de ameaça".

É usado para criticar uma atitude ou um comportamento.""",
st="""Substantivo + じみた + Substantivo
Substantivo + じみている""",
no="""Expressões comuns são 子供じみた, 年寄りじみた, 芝居じみた, 脅迫じみた e 狂気じみた.

É parecido com めいた e っぽい, mas じみた tem um tom mais crítico.""",
bf="じみた",
rx="じみた|じみて",
tk=["じみた"],
va=["じみた", "じみている", "じみて"],
E=[
("そんな子供じみたことはやめなさい。", "そんなこどもじみたことはやめなさい。", "Pare com essa infantilidade."),
("彼の言い方は脅迫じみていた。", "かれのいいかたはきょうはくじみていた。", "O jeito como ele falou tinha um tom de ameaça."),
("芝居じみた態度に、みんなあきれた。", "しばいじみたたいどに、みんなあきれた。", "Todos ficaram pasmos com aquela atitude teatral."),
("まだ若いのに、年寄りじみたことを言う。", "まだわかいのに、としよりじみたことをいう。", "Ainda é jovem, mas fala como um velho."),
("狂気じみた行動に驚いた。", "きょうきじみたこうどうにおどろいた。", "Fiquei surpreso com aquele comportamento que parecia loucura."),
],
R=[
("大人なのに、子供____いたずらをする。", "Mesmo sendo adulto, faz travessuras infantis.", ["じみた"]),
("彼の話は説教____いて、聞きたくない。", "O que ele fala parece um sermão, não quero ouvir.", ["じみて"]),
("芝居____言い訳はやめてくれ。", "Pare com essas desculpas teatrais.", ["じみた"]),
("その手紙には脅迫____内容が書かれていた。", "Aquela carta tinha um conteúdo com tom de ameaça.", ["じみた"]),
("彼女の服装は少し年寄り____。", "As roupas dela têm um pouco de jeito de velha.", ["じみている", "じみていた"]),
],
),
dict(
n=44,
jp="〜か否か",
rd="ka ina ka",
tr="Se... ou não / Sim ou não / Ou não",
ex="""か否か indica duas possibilidades opostas, com o sentido de "se... ou não". É a forma formal de かどうか.

É muito usada em textos, notícias, documentos e discursos. Por exemplo, "ainda não se sabe se o plano vai dar certo ou não".

否 significa "não", então か否か é literalmente "sim ou não".""",
st="""Verbo (forma simples) + か否か
Adjetivo い + か否か
Adjetivo な / Substantivo + (である) + か否か""",
no="""É mais formal que かどうか.

Costuma vir com verbos como わからない, 決める, 問題だ e 判断する.""",
bf="か否か",
rx="か否か|かいなか",
tk=["か", "否", "か"],
va=["か否か"],
E=[
("計画が成功するか否かは、まだわからない。", "けいかくがせいこうするかいなかは、まだわからない。", "Ainda não se sabe se o plano vai dar certo ou não."),
("参加するか否か、明日までに決めてください。", "さんかするかいなか、あしたまでにきめてください。", "Decida até amanhã se vai participar ou não."),
("彼が犯人であるか否かが問題だ。", "かれがはんにんであるかいなかがもんだいだ。", "A questão é se ele é o culpado ou não."),
("この薬が安全か否か、調べる必要がある。", "このくすりがあんぜんかいなか、しらべるひつようがある。", "É preciso investigar se este remédio é seguro ou não."),
("合格するか否かは、本人の努力次第だ。", "ごうかくするかいなかは、ほんにんのどりょくしだいだ。", "Passar ou não depende do esforço da própria pessoa."),
],
R=[
("その話が本当____、確かめたい。", "Quero confirmar se essa história é verdade ou não.", ["か否か"]),
("留学する____、まだ迷っている。", "Ainda estou em dúvida se faço intercâmbio ou não.", ["か否か"]),
("試合が行われる____は、天気によって決まる。", "Se a partida será realizada ou não depende do tempo.", ["か否か"]),
("彼が来る____、誰も知らない。", "Ninguém sabe se ele vem ou não.", ["か否か"]),
("この意見が正しい____、議論が続いている。", "A discussão continua sobre se esta opinião está correta ou não.", ["か否か"]),
],
),
dict(
n=45,
jp="〜かと思いきや",
rd="ka to omoikiya",
tr="Quando se pensava que / Achei que... mas / Contrariando as expectativas",
ex="""かと思いきや indica que a pessoa esperava um resultado, mas aconteceu algo diferente, para a surpresa dela. Equivale a "quando se pensava que..." ou "achei que..., mas".

A primeira parte mostra a expectativa, e a segunda mostra o resultado inesperado. Por exemplo, "achei que ia chover, mas fez sol".

É uma expressão um pouco literária, comum na escrita.""",
st="""Frase (forma simples) + かと思いきや + Resultado inesperado
Substantivo + かと思いきや""",
no="""Não se usa para falar de algo que aconteceu de acordo com o esperado.

É parecido com と思ったら e と思っていたのに.""",
bf="かと思いきや",
rx="かと思いきや|かとおもいきや|と思いきや",
tk=["か", "と", "思いきや"],
va=["かと思いきや", "と思いきや"],
E=[
("雨が降るかと思いきや、晴れてきた。", "あめがふるかとおもいきや、はれてきた。", "Achei que ia chover, mas abriu o sol."),
("簡単な試験かと思いきや、とても難しかった。", "かんたんなしけんかとおもいきや、とてもむずかしかった。", "Pensei que fosse uma prova fácil, mas foi muito difícil."),
("彼は怒るかと思いきや、笑い出した。", "かれはおこるかとおもいきや、わらいだした。", "Achei que ele ia ficar bravo, mas começou a rir."),
("もう終わったかと思いきや、まだ半分も残っていた。", "もうおわったかとおもいきや、まだはんぶんものこっていた。", "Achei que já tinha acabado, mas ainda faltava metade."),
("高いと思いきや、意外に安かった。", "たかいとおもいきや、いがいにやすかった。", "Pensei que fosse caro, mas foi surpreendentemente barato."),
],
R=[
("彼女は泣く____、笑顔で別れを告げた。", "Achei que ela fosse chorar, mas se despediu sorrindo.", ["かと思いきや", "かとおもいきや"]),
("あの店は閉まっている____、まだ営業していた。", "Achei que aquela loja estivesse fechada, mas ainda estava funcionando.", ["かと思いきや", "かとおもいきや"]),
("弱いチームだ____、優勝してしまった。", "Pensei que fosse um time fraco, mas acabou vencendo.", ["と思いきや"]),
("春になった____、また雪が降った。", "Pensei que a primavera tinha chegado, mas nevou de novo.", ["かと思いきや", "かとおもいきや"]),
("すぐに返事が来る____、一週間たっても来ない。", "Achei que a resposta viria logo, mas nem depois de uma semana chegou.", ["かと思いきや", "かとおもいきや"]),
],
),
dict(
n=46,
jp="〜限りだ",
rd="kagiri da",
tr="Extremamente / Muitíssimo / Não poderia estar mais",
ex="""限りだ expressa um sentimento muito forte da pessoa que fala. Equivale a "extremamente" ou "não poderia estar mais...".

Costuma vir com adjetivos de emoção, como feliz, triste, solitário, invejoso ou envergonhado. Por exemplo, "estou extremamente feliz em reencontrar todos".

É uma expressão formal, comum em cartas, discursos e cerimônias.""",
st="""Adjetivo い + 限りだ
Adjetivo な + な + 限りだ
Substantivo + の + 限りだ""",
no="""É usado apenas com sentimentos da primeira pessoa.

Expressões comuns são うれしい限りだ, 寂しい限りだ, うらやましい限りだ e 残念な限りだ.""",
bf="限りだ",
rx="限りだ|限りです|かぎりだ",
tk=["限り", "だ"],
va=["限りだ", "限りです"],
E=[
("皆さんにまた会えて、うれしい限りです。", "みなさんにまたあえて、うれしいかぎりです。", "Estou extremamente feliz por reencontrar todos vocês."),
("友達がみんな引っ越してしまって、寂しい限りだ。", "ともだちがみんなひっこしてしまって、さびしいかぎりだ。", "Todos os meus amigos se mudaram, estou muito solitário."),
("毎年海外旅行に行けるなんて、うらやましい限りだ。", "まいとしかいがいりょこうにいけるなんて、うらやましいかぎりだ。", "Poder viajar para o exterior todo ano, que inveja enorme."),
("こんな結果になって、残念な限りです。", "こんなけっかになって、ざんねんなかぎりです。", "É uma enorme pena que tenha dado neste resultado."),
("子供の成長は頼もしい限りだ。", "こどものせいちょうはたのもしいかぎりだ。", "O crescimento dos filhos me dá extrema confiança."),
],
R=[
("優勝できて、うれしい____。", "Estou extremamente feliz por ter vencido.", ["限りだ", "限りです"]),
("恩師が亡くなって、悲しい____。", "Meu antigo professor faleceu, estou muitíssimo triste.", ["限りだ", "限りです"]),
("あんな失敗をして、恥ずかしい____。", "Cometi um erro daqueles, estou extremamente envergonhado.", ["限りだ", "限りです"]),
("一人で夕食を食べるのは、心細い____。", "Jantar sozinho me deixa muito desamparado.", ["限りだ", "限りです"]),
("若い人が頑張っている姿は、心強い____。", "Ver os jovens se esforçando me dá muita confiança.", ["限りだ", "限りです"]),
],
),
dict(
n=47,
jp="〜甲斐もなく",
rd="kai mo naku",
tr="Apesar de / Em vão / Sem resultado",
ex="""甲斐もなく indica que, apesar de um esforço, o resultado esperado não veio. Equivale a "apesar de..., em vão" ou "sem resultado".

A pessoa lamenta que todo o empenho não serviu para nada. Por exemplo, "apesar do tratamento, ele faleceu" ou "apesar de ter estudado, reprovei".

Também aparece como 甲斐がある, com o sentido de "vale a pena".""",
st="""Verbo (forma た) + 甲斐もなく
Substantivo + の + 甲斐もなく""",
no="""Também é escrito かいもなく. Depois de outras palavras, pode virar がい, como em やりがい e 生きがい.

Expressões comuns são 努力の甲斐もなく, 看病の甲斐もなく e 応援の甲斐もなく.""",
bf="甲斐もなく",
rx="甲斐もなく|かいもなく|甲斐なく",
tk=["甲斐", "も", "なく"],
va=["甲斐もなく", "かいもなく", "甲斐なく"],
E=[
("家族の看病の甲斐もなく、祖父は亡くなった。", "かぞくのかんびょうのかいもなく、そふはなくなった。", "Apesar dos cuidados da família, meu avô faleceu."),
("一生懸命練習した甲斐もなく、試合に負けた。", "いっしょうけんめいれんしゅうしたかいもなく、しあいにまけた。", "Treinei com todo o empenho, mas em vão: perdemos a partida."),
("応援の甲斐もなく、チームは予選で敗退した。", "おうえんのかいもなく、チームはよせんではいたいした。", "Apesar da torcida, a equipe foi eliminada nas eliminatórias."),
("努力の甲斐もなく、計画は失敗に終わった。", "どりょくのかいもなく、けいかくはしっぱいにおわった。", "Apesar dos esforços, o plano acabou em fracasso."),
("手術の甲斐なく、犬は助からなかった。", "しゅじゅつのかいなく、いぬはたすからなかった。", "Apesar da cirurgia, o cachorro não sobreviveu."),
],
R=[
("毎日勉強した____、不合格だった。", "Estudei todos os dias, mas em vão: reprovei.", ["甲斐もなく", "かいもなく"]),
("医者の治療の____、病気は悪化した。", "Apesar do tratamento médico, a doença piorou.", ["甲斐もなく", "かいもなく", "甲斐なく"]),
("早起きした____、電車に乗り遅れた。", "Acordei cedo, mas em vão: perdi o trem.", ["甲斐もなく", "かいもなく"]),
("説得の____、彼は会社を辞めた。", "Apesar das tentativas de convencê-lo, ele saiu da empresa.", ["甲斐もなく", "かいもなく", "甲斐なく"]),
("ダイエットした____、体重は減らなかった。", "Fiz dieta, mas sem resultado: não perdi peso.", ["甲斐もなく", "かいもなく"]),
],
),
dict(
n=48,
jp="〜可能性がある",
rd="kanousei ga aru",
tr="Há possibilidade de / Pode ser que / É possível que",
ex="""可能性がある indica que existe a possibilidade de algo acontecer ou ser verdade. Equivale a "há possibilidade de" ou "pode ser que".

É uma expressão objetiva, muito usada em notícias, relatórios, previsões e explicações. Por exemplo, "há possibilidade de chover amanhã".

Pode ser usada tanto para coisas boas quanto ruins.""",
st="""Verbo (forma simples) + 可能性がある
Adjetivo い + 可能性がある
Adjetivo な / Substantivo + である + 可能性がある""",
no="""Para indicar alta probabilidade, usa-se 可能性が高い. Para baixa, 可能性が低い.

É mais formal e objetivo que かもしれない.

Não se confunde com 恐れがある, que é usado apenas para coisas ruins.""",
bf="可能性がある",
rx="可能性がある|可能性があります|可能性が|可能性も|可能性は|かのうせいがある",
tk=["可能性", "が", "ある"],
va=["可能性がある", "可能性があります", "可能性が高い", "可能性もある"],
E=[
("明日は雨が降る可能性がある。", "あしたはあめがふるかのうせいがある。", "Há possibilidade de chover amanhã."),
("この薬は副作用が出る可能性があります。", "このくすりはふくさようがでるかのうせいがあります。", "Este remédio pode causar efeitos colaterais."),
("彼が犯人である可能性が高い。", "かれがはんにんであるかのうせいがたかい。", "É bem possível que ele seja o culpado."),
("計画が変更される可能性もある。", "けいかくがへんこうされるかのうせいもある。", "Também é possível que o plano seja alterado."),
("この技術は将来、大きく発展する可能性がある。", "このぎじゅつはしょうらい、おおきくはってんするかのうせいがある。", "Esta tecnologia tem possibilidade de se desenvolver muito no futuro."),
],
R=[
("電車が遅れる____。", "Há possibilidade de o trem atrasar.", ["可能性がある", "可能性があります"]),
("この問題は、すぐに解決できる____。", "É possível que este problema seja resolvido logo.", ["可能性がある", "可能性があります"]),
("彼女が優勝する____高い。", "A possibilidade de ela vencer é alta.", ["可能性が", "可能性は"]),
("このデータは間違っている____。", "Pode ser que estes dados estejam errados.", ["可能性がある", "可能性があります"]),
("台風が上陸する____。", "Há possibilidade de o tufão chegar à terra.", ["可能性がある", "可能性があります"]),
],
),
dict(
n=49,
jp="〜からある / 〜からする / 〜からの",
rd="kara aru / kara suru / kara no",
tr="Mais de / Nada menos que / Pelo menos",
ex="""からある, からする e からの vêm depois de números e destacam que a quantidade é muito grande. Equivalem a "mais de" ou "nada menos que".

からある é usado com tamanho, peso ou distância, como "um peixe de mais de dez quilos". からする é usado com preços, como "um relógio de mais de um milhão de ienes". からの é usado com quantidade de pessoas ou coisas, como "mais de mil pessoas".

A pessoa mostra surpresa diante do número.""",
st="""Número + からある + Substantivo (tamanho / peso / distância)
Número + からする + Substantivo (preço)
Número + からの + Substantivo (quantidade)""",
no="""O número costuma ser redondo e grande, como 百, 千 ou 一万.

É parecido com 以上の, mas expressa mais surpresa.""",
bf="からある",
rx="からある|からする|からの",
tk=["から", "ある"],
va=["からある", "からする", "からの"],
E=[
("彼は百キロからある荷物を一人で運んだ。", "かれはひゃっキロからあるにもつをひとりではこんだ。", "Ele carregou sozinho uma bagagem de mais de cem quilos."),
("百万円からする時計を買った。", "ひゃくまんえんからするとけいをかった。", "Comprou um relógio de nada menos que um milhão de ienes."),
("会場には一万人からの観客が集まった。", "かいじょうにはいちまんにんからのかんきゃくがあつまった。", "Mais de dez mil espectadores se reuniram no local."),
("二十キロからある道を歩いて帰った。", "にじゅっキロからあるみちをあるいてかえった。", "Voltou a pé por um caminho de mais de vinte quilômetros."),
("一泊十万円からするホテルに泊まった。", "いっぱくじゅうまんえんからするホテルにとまった。", "Ficou num hotel que custa mais de cem mil ienes por noite."),
],
R=[
("三メートル____大きな魚が釣れた。", "Pescaram um peixe enorme de mais de três metros.", ["からある"]),
("一台一千万円____車だ。", "É um carro que custa mais de dez milhões de ienes.", ["からする"]),
("千人____人が、デモに参加した。", "Mais de mil pessoas participaram da manifestação.", ["からの"]),
("彼女は五百ページ____本を一日で読んだ。", "Ela leu num dia um livro de mais de quinhentas páginas.", ["からある"]),
("この絵は一億円____と言われている。", "Dizem que este quadro custa mais de cem milhões de ienes.", ["からする"]),
],
),
dict(
n=50,
jp="〜かれ〜かれ",
rd="kare ~ kare",
tr="Mais ou menos / Seja... seja / Em maior ou menor grau",
ex="""かれ〜かれ é uma forma antiga usada com pares de adjetivos opostos, indicando que, em qualquer caso, a conclusão é a mesma. Equivale a "seja... seja" ou "em maior ou menor grau".

É usada principalmente em expressões fixas, como 多かれ少なかれ, "mais ou menos", e 遅かれ早かれ, "mais cedo ou mais tarde".

Por exemplo, "mais cedo ou mais tarde, a verdade vai aparecer".""",
st="""Adjetivo い (sem い) + かれ + Adjetivo oposto (sem い) + かれ""",
no="""Só funciona com alguns pares fixos, como 多かれ少なかれ, 遅かれ早かれ e 良かれ悪しかれ.

É uma expressão formal, comum na escrita e em discursos.""",
bf="かれ〜かれ",
rx="かれ",
tk=["かれ"],
va=["かれ〜かれ", "多かれ少なかれ", "遅かれ早かれ", "良かれ悪しかれ"],
E=[
("多かれ少なかれ、誰にでも悩みはある。", "おおかれすくなかれ、だれにでもなやみはある。", "Em maior ou menor grau, todo mundo tem preocupações."),
("遅かれ早かれ、真実は明らかになるだろう。", "おそかれはやかれ、しんじつはあきらかになるだろう。", "Mais cedo ou mais tarde, a verdade vai aparecer."),
("良かれ悪しかれ、彼は会社に大きな影響を与えた。", "よかれあしかれ、かれはかいしゃにおおきなえいきょうをあたえた。", "Para o bem ou para o mal, ele teve grande influência na empresa."),
("人は多かれ少なかれ、親の影響を受けている。", "ひとはおおかれすくなかれ、おやのえいきょうをうけている。", "As pessoas são, mais ou menos, influenciadas pelos pais."),
("遅かれ早かれ、彼も気づくはずだ。", "おそかれはやかれ、かれもきづくはずだ。", "Mais cedo ou mais tarde, ele também vai perceber."),
],
R=[
("多____少なかれ、誰でも失敗はする。", "Em maior ou menor grau, todo mundo erra.", ["かれ"]),
("遅かれ早____、この問題に向き合わなければならない。", "Mais cedo ou mais tarde, teremos que encarar este problema.", ["かれ"]),
("良____悪しかれ、それが現実だ。", "Para o bem ou para o mal, essa é a realidade.", ["かれ"]),
("遅____早かれ、彼は会社を辞めるだろう。", "Mais cedo ou mais tarde, ele vai sair da empresa.", ["かれ"]),
("人は多かれ少な____、うそをつくものだ。", "As pessoas, em maior ou menor grau, mentem.", ["かれ"]),
],
),
]
