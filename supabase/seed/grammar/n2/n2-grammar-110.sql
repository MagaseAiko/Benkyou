-- n2-grammar-110 — 〜につけ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-110',
    'grammar',
    'N2',
    $$〜につけ$$,
    $$ni tsuke$$,
    $$Sempre que / Toda vez que / Seja... seja$$,
    $$につけ indica que, sempre que algo acontece, surge naturalmente um sentimento ou uma lembrança. Equivale a "sempre que" ou "toda vez que".

Costuma vir com verbos como ver, ouvir e pensar, e a segunda parte fala de emoções ou lembranças. Por exemplo, "toda vez que vejo esta foto, lembro da minha infância".

Na forma 〜につけ〜につけ, apresenta duas situações opostas com o sentido de "seja... seja". Por exemplo, "nas coisas boas e nas ruins".$$,
    $$A expressão 何かにつけ significa "por qualquer motivo" ou "a todo momento".

É parecido com たびに, mas につけ destaca mais os sentimentos que surgem.

Expressões comuns são いいにつけ悪いにつけ e 雨につけ風につけ.$$,
    $$Verbo (forma dicionário) + につけ
Adjetivo い + につけ + Adjetivo い + につけ
Substantivo + につけ + Substantivo + につけ$$,
    $$につけ$$,
    $$につけ$$,
    ARRAY['に', 'つけ']::text[],
    ARRAY['につけ', 'につけて', '何かにつけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-110', $$この写真を見るにつけ、子供のころを思い出す。$$, $$このしゃしんをみるにつけ、こどものころをおもいだす。$$, $$Toda vez que vejo esta foto, lembro da minha infância.$$),
    ('n2-grammar-110', $$彼の話を聞くにつけ、自分の甘さを感じる。$$, $$かれのはなしをきくにつけ、じぶんのあまさをかんじる。$$, $$Sempre que ouço a história dele, percebo como sou acomodado.$$),
    ('n2-grammar-110', $$いいにつけ悪いにつけ、親の影響は大きい。$$, $$いいにつけわるいにつけ、おやのえいきょうはおおきい。$$, $$Seja para o bem, seja para o mal, a influência dos pais é grande.$$),
    ('n2-grammar-110', $$母は何かにつけて、私のことを心配する。$$, $$はははなにかにつけて、わたしのことをしんぱいする。$$, $$Minha mãe se preocupa comigo a todo momento.$$),
    ('n2-grammar-110', $$ニュースを見るにつけ、平和の大切さを考える。$$, $$ニュースをみるにつけ、へいわのたいせつさをかんがえる。$$, $$Toda vez que vejo o noticiário, penso na importância da paz.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この曲を聞く____、昔の恋人を思い出す。$$, $$Toda vez que ouço esta música, lembro do meu antigo namorado.$$),
        (2, $$嬉しいにつけ悲しい____、彼はいつも日記を書く。$$, $$Feliz ou triste, ele sempre escreve no diário.$$),
        (3, $$彼女の活躍を見る____、勇気をもらう。$$, $$Sempre que vejo o sucesso dela, ganho coragem.$$),
        (4, $$父は何か____、文句を言う。$$, $$Meu pai reclama de qualquer coisa.$$),
        (5, $$故郷の話を聞く____、帰りたくなる。$$, $$Toda vez que ouço falar da minha terra natal, dá vontade de voltar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-110', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$につけ$$),
        (1, $$につけて$$),
        (2, $$につけ$$),
        (3, $$につけ$$),
        (3, $$につけて$$),
        (4, $$につけ$$),
        (4, $$につけて$$),
        (5, $$につけ$$),
        (5, $$につけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
