-- n3-grammar-141 — 〜と言うと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-141',
    'grammar',
    'N3',
    $$〜と言うと$$,
    $$to iu to$$,
    $$Falando de / Quando se fala em / Quer dizer que$$,
    $$と言うと tem dois usos principais.

O primeiro é associar uma palavra à imagem mais comum ligada a ela. Equivale a "falando de..." ou "quando se fala em...". Por exemplo, "quando se fala em culinária japonesa, a primeira coisa que vem à mente é sushi". Esse uso é parecido com と言えば.

O segundo é retomar algo que o outro disse, para pedir mais detalhes ou confirmar uma conclusão. Equivale a "e então...?", "quer dizer que...?". Por exemplo, alguém diz "amanhã é folga", e você responde "quer dizer que a reunião foi cancelada?".

Nesse segundo uso, と言うと pode até aparecer sozinho, no começo da frase, sem repetir a palavra: "と言うと、どういうこと？".$$,
    $$と言うと e と言えば são muito parecidos no uso de associação. と言うと é mais comum quando se pede mais detalhes.

A resposta と言うと？ sozinha significa "como assim?" e pede uma explicação.

Na escrita, quando o sentido é abstrato, costuma-se usar hiragana: というと.$$,
    $$Substantivo + と言うと、 + Associação típica
(Retomando a fala do outro) Palavra + と言うと、 + Pergunta
と言うと、 + Pergunta (quer dizer que...?)

Variações: というと / って言うと$$,
    $$と言うと$$,
    $$と言うと|というと|って言うと$$,
    ARRAY['と', '言うと']::text[],
    ARRAY['と言うと', 'というと', 'って言うと']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-141', $$日本料理と言うと、まずすしを思い浮かべる。$$, $$にほんりょうりというと、まずすしをおもいうかべる。$$, $$Quando se fala em culinária japonesa, a primeira coisa que vem à mente é sushi.$$),
    ('n3-grammar-141', $$「来週、北海道に行くんだ。」「北海道と言うと、雪がすごいでしょう。」$$, $$「らいしゅう、ほっかいどうにいくんだ。」「ほっかいどうというと、ゆきがすごいでしょう。」$$, $$"Semana que vem vou a Hokkaido." "Falando de Hokkaido, deve ter muita neve, né?"$$),
    ('n3-grammar-141', $$「明日は休みです。」「と言うと、会議は中止ですか。」$$, $$「あしたはやすみです。」「というと、かいぎはちゅうしですか。」$$, $$"Amanhã é folga." "Quer dizer que a reunião foi cancelada?"$$),
    ('n3-grammar-141', $$京都と言うと、お寺や神社が有名ですね。$$, $$きょうとというと、おてらやじんじゃがゆうめいですね。$$, $$Falando de Kyoto, os templos e santuários são famosos, né?$$),
    ('n3-grammar-141', $$「問題がある」と言うと、どんな問題ですか。$$, $$「もんだいがある」というと、どんなもんだいですか。$$, $$Quando você diz que há um problema, que tipo de problema é?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夏____、何を思い出しますか。$$, $$Quando se fala em verão, do que você se lembra?$$),
        (2, $$「彼は来ないよ。」「____、パーティーは中止？」$$, $$"Ele não vem." "Quer dizer que a festa foi cancelada?"$$),
        (3, $$イタリア____、パスタとピザだね。$$, $$Falando de Itália, é massa e pizza, né?$$),
        (4, $$「お祭りがあるんだ。」「お祭り____、いつ？」$$, $$"Vai ter um festival." "Festival? Quando?"$$),
        (5, $$「彼女は先生です。」「先生____、何の先生ですか。」$$, $$"Ela é professora." "Professora de quê?"$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-141', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と言うと$$),
        (1, $$というと$$),
        (2, $$と言うと$$),
        (2, $$というと$$),
        (3, $$と言うと$$),
        (3, $$というと$$),
        (4, $$と言うと$$),
        (4, $$というと$$),
        (5, $$と言うと$$),
        (5, $$というと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
