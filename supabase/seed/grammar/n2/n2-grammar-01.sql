-- n2-grammar-01 — 〜あげく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-01',
    'grammar',
    'N2',
    $$〜あげく$$,
    $$ageku$$,
    $$Depois de muito... acabou / No fim de tudo / Ao final de$$,
    $$あげく é usado para dizer que, depois de um processo longo e difícil, a situação terminou em um resultado, geralmente negativo ou decepcionante. Equivale a "depois de muito..., acabou..." ou "no fim de tudo".

A primeira parte descreve algo que durou bastante e exigiu esforço, como ficar em dúvida, discutir, procurar ou sofrer. A segunda mostra o desfecho, muitas vezes frustrante.

Por exemplo, "depois de ficar em dúvida por muito tempo, acabei não comprando nada" ou "depois de muito discutir, o plano foi cancelado".

Ele vem depois do verbo na forma た e de substantivos com の.

Expressões como さんざん, いろいろ e 長い間 combinam muito com あげく, porque reforçam a ideia de um processo longo.$$,
    $$あげく tem um tom quase sempre negativo. Para resultados positivos depois de esforço, usa-se 末に, que também aparece no N2.

あげくの果てに é uma expressão ainda mais forte, como "e, para piorar tudo...".

A segunda parte descreve um fato que já aconteceu, e não uma vontade ou um pedido.$$,
    $$Verbo na forma た + あげく(に)、 + Resultado
Substantivo + の + あげく(に)、 + Resultado

Escrita: あげく / 挙げ句 / 挙句$$,
    $$あげく$$,
    $$あげく|挙げ句|挙句$$,
    ARRAY['あげく']::text[],
    ARRAY['あげく', 'あげくに', '挙げ句']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-01', $$さんざん迷ったあげく、何も買わなかった。$$, $$さんざんまよったあげく、なにもかわなかった。$$, $$Depois de ficar muito tempo em dúvida, acabei não comprando nada.$$),
    ('n2-grammar-01', $$長い間話し合ったあげく、計画は中止になった。$$, $$ながいあいだはなしあったあげく、けいかくはちゅうしになった。$$, $$Depois de muito discutir, o plano acabou sendo cancelado.$$),
    ('n2-grammar-01', $$彼は悩んだあげく、会社をやめることにした。$$, $$かれはなやんだあげく、かいしゃをやめることにした。$$, $$Depois de muito sofrer com a decisão, ele resolveu sair da empresa.$$),
    ('n2-grammar-01', $$道に迷ったあげく、約束の時間に遅れてしまった。$$, $$みちにまよったあげく、やくそくのじかんにおくれてしまった。$$, $$Me perdi e, no fim, acabei chegando atrasado ao compromisso.$$),
    ('n2-grammar-01', $$何度も喧嘩したあげく、二人は別れた。$$, $$なんどもけんかしたあげく、ふたりはわかれた。$$, $$Depois de brigarem várias vezes, os dois se separaram.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一時間も待たされた____、会議は中止になった。$$, $$Depois de nos fazerem esperar uma hora inteira, a reunião foi cancelada.$$),
        (2, $$散々考えた____、留学をあきらめた。$$, $$Depois de pensar muito, desisti do intercâmbio.$$),
        (3, $$色々な店を回った____、最初の店で買った。$$, $$Depois de rodar várias lojas, no fim comprei na primeira.$$),
        (4, $$何度も失敗した____、彼はついに諦めた。$$, $$Depois de fracassar muitas vezes, ele finalmente desistiu.$$),
        (5, $$長い議論の____、結論は出なかった。$$, $$Ao final de uma longa discussão, não se chegou a nenhuma conclusão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-01', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あげく$$),
        (2, $$あげく$$),
        (3, $$あげく$$),
        (4, $$あげく$$),
        (5, $$あげく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
