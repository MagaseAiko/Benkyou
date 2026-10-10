-- n1-grammar-107 — 〜に引き換え
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-107',
    'grammar',
    'N1',
    $$〜に引き換え$$,
    $$ni hikikae$$,
    $$Em contraste com / Ao contrário de / Já$$,
    $$に引き換え compara duas coisas ou pessoas mostrando que são opostas. Equivale a "em contraste com" ou "ao contrário de".

Muitas vezes a pessoa elogia um lado e critica o outro. Por exemplo, "ao contrário do irmão mais velho, que é sério, o mais novo só brinca".

É uma expressão um pouco formal, com tom de avaliação pessoal.$$,
    $$Também é escrito にひきかえ.

É parecido com に比べて e とは対照的に, mas に引き換え costuma ter julgamento pessoal.$$,
    $$Substantivo + に引き換え
Frase + の + に引き換え
それに引き換え、 + Frase$$,
    $$に引き換え$$,
    $$に引き換え|にひきかえ|に引きかえ$$,
    ARRAY['に', '引き換え']::text[],
    ARRAY['に引き換え', 'にひきかえ', 'それに引き換え']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-107', $$真面目な兄に引き換え、弟は遊んでばかりいる。$$, $$まじめなあににひきかえ、おとうとはあそんでばかりいる。$$, $$Ao contrário do irmão mais velho, que é sério, o mais novo só brinca.$$),
    ('n1-grammar-107', $$去年に引き換え、今年は雨が多い。$$, $$きょねんにひきかえ、ことしはあめがおおい。$$, $$Em contraste com o ano passado, este ano chove muito.$$),
    ('n1-grammar-107', $$姉は料理が上手だ。それに引き換え、私は何も作れない。$$, $$あねはりょうりがじょうずだ。それにひきかえ、わたしはなにもつくれない。$$, $$Minha irmã cozinha bem. Já eu não sei fazer nada.$$),
    ('n1-grammar-107', $$前の店長に引き換え、今の店長はとても優しい。$$, $$まえのてんちょうにひきかえ、いまのてんちょうはとてもやさしい。$$, $$Ao contrário do gerente anterior, o atual é muito gentil.$$),
    ('n1-grammar-107', $$彼が努力しているのに引き換え、私は怠けてばかりだ。$$, $$かれがどりょくしているのにひきかえ、わたしはなまけてばかりだ。$$, $$Em contraste com ele, que se esforça, eu só fico enrolando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$都会の生活____、田舎の生活はのんびりしている。$$, $$Em contraste com a vida na cidade, a vida no interior é tranquila.$$),
        (2, $$母は明るい。それ____、父は無口だ。$$, $$Minha mãe é alegre. Já meu pai é calado.$$),
        (3, $$先月の売り上げ____、今月は好調だ。$$, $$Ao contrário do mês passado, as vendas deste mês vão bem.$$),
        (4, $$友達がみんな結婚したの____、私はまだ一人だ。$$, $$Ao contrário dos meus amigos, que já se casaram, eu continuo sozinho.$$),
        (5, $$昔の静かな町____、今はにぎやかだ。$$, $$Em contraste com a cidade tranquila de antigamente, hoje é movimentada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-107', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に引き換え$$),
        (1, $$にひきかえ$$),
        (2, $$に引き換え$$),
        (2, $$にひきかえ$$),
        (3, $$に引き換え$$),
        (3, $$にひきかえ$$),
        (4, $$に引き換え$$),
        (4, $$にひきかえ$$),
        (5, $$に引き換え$$),
        (5, $$にひきかえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
