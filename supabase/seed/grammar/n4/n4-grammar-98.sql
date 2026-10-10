-- n4-grammar-98 — 〜てみる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-98',
    'grammar',
    'N4',
    $$〜てみる$$,
    $$te miru$$,
    $$Experimentar / Tentar (fazer para ver)$$,
    $$てみる é usado para dizer que alguém faz algo para experimentar ou ver como é. Equivale a "experimentar", "tentar" ou "fazer para ver".

Ele junta a forma て do verbo com みる (ver). A ideia literal é "fazer e ver o resultado".

É muito usado para falar de experiências novas: provar uma comida, visitar um lugar, vestir uma roupa, ler um livro.

Com たい, forma てみたい, que expressa vontade de experimentar algo. Com ください, forma てみてください, que convida alguém a experimentar.

No passado, てみた muitas vezes é seguido do resultado da experiência, como "fui ver, mas não era muito bom".$$,
    $$Nesse uso, みる é sempre escrito em hiragana, mesmo que venha do verbo 見る.

てみる não é usado no sentido de "tentar e não conseguir". Para isso, o japonês usa ようとする, que aparece no N3.

A expressão 〜てみてもいいですか é uma forma educada de pedir para experimentar algo, como uma roupa numa loja.$$,
    $$Verbo na forma て + みる

Vontade: てみたい
Convite: てみてください
Passado: てみた / てみました
Sugestão: てみたらどう

Escrita: みる (em hiragana, nesse uso)$$,
    $$てみる$$,
    $$てみ|でみ$$,
    ARRAY['て', 'みる']::text[],
    ARRAY['てみる', 'てみたい', 'てみた', 'てみてください']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-98', $$このケーキを食べてみてください。$$, $$このケーキをたべてみてください。$$, $$Experimente este bolo, por favor.$$),
    ('n4-grammar-98', $$一度日本に行ってみたいです。$$, $$いちどにほんにいってみたいです。$$, $$Quero ir ao Japão pelo menos uma vez.$$),
    ('n4-grammar-98', $$新しい店に行ってみたけど、あまりおいしくなかった。$$, $$あたらしいみせにいってみたけど、あまりおいしくなかった。$$, $$Fui conhecer a loja nova, mas não era muito gostosa.$$),
    ('n4-grammar-98', $$わからないなら、先生に聞いてみたらどう？$$, $$わからないなら、せんせいにきいてみたらどう？$$, $$Se não entende, que tal perguntar ao professor?$$),
    ('n4-grammar-98', $$すみません、この服、着てみてもいいですか。$$, $$すみません、このふく、きてみてもいいですか。$$, $$Com licença, posso experimentar esta roupa?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このシャツを着____もいいですか。$$, $$Posso experimentar esta camisa?$$),
        (2, $$一度、富士山に登っ____たいです。$$, $$Quero subir o Monte Fuji pelo menos uma vez.$$),
        (3, $$新しいゲームをし____けど、難しかった。$$, $$Experimentei o jogo novo, mas era difícil.$$),
        (4, $$その本、おもしろそうだから読ん____。$$, $$Esse livro parece interessante, então vou ler para ver.$$),
        (5, $$先週、初めて自分で料理を作っ____ました。$$, $$Semana passada, experimentei cozinhar sozinho pela primeira vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-98', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てみて$$),
        (2, $$てみ$$),
        (3, $$てみた$$),
        (4, $$でみます$$),
        (4, $$でみる$$),
        (4, $$でみよう$$),
        (5, $$てみ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
