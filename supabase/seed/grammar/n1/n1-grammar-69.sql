-- n1-grammar-69 — 〜までだ / 〜までのことだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-69',
    'grammar',
    'N1',
    $$〜までだ / 〜までのことだ$$,
    $$made da / made no koto da$$,
    $$Simplesmente / É só / Não há outra saída a não ser$$,
    $$までだ e までのことだ têm dois usos principais.

O primeiro, depois da forma dicionário, indica que, se uma opção não der certo, a pessoa vai simplesmente fazer outra coisa, sem drama. Equivale a "é só..." ou "não há outra saída a não ser". Por exemplo, "se o trem não vier, é só ir de táxi".

O segundo, depois da forma た, indica que a pessoa fez algo apenas por um motivo simples, sem intenção especial. Equivale a "simplesmente". Por exemplo, "só disse o que pensava".$$,
    $$No primeiro uso, muitas vezes vem depois de uma condição com なら ou ば.

No segundo uso, a pessoa minimiza a própria ação, como uma justificativa.$$,
    $$Verbo (forma dicionário) + までだ / までのことだ (decisão)
Verbo (forma た) + までだ / までのことだ (motivo simples)$$,
    $$までだ$$,
    $$までだ|までのことだ|までです|までのことです$$,
    ARRAY['まで', 'だ']::text[],
    ARRAY['までだ', 'までのことだ', 'までです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-69', $$電車が動かないなら、タクシーで行くまでだ。$$, $$でんしゃがうごかないなら、タクシーでいくまでだ。$$, $$Se o trem não andar, é só ir de táxi.$$),
    ('n1-grammar-69', $$思ったことを言ったまでです。$$, $$おもったことをいったまでです。$$, $$Só disse o que pensava.$$),
    ('n1-grammar-69', $$誰も手伝ってくれないなら、一人でやるまでのことだ。$$, $$だれもてつだってくれないなら、ひとりでやるまでのことだ。$$, $$Se ninguém vai ajudar, não há outra saída a não ser fazer sozinho.$$),
    ('n1-grammar-69', $$特別なことはしていません。規則に従ったまでのことです。$$, $$とくべつなことはしていません。きそくにしたがったまでのことです。$$, $$Não fiz nada de especial. Só segui as regras.$$),
    ('n1-grammar-69', $$失敗したら、またやり直すまでだ。$$, $$しっぱいしたら、またやりなおすまでだ。$$, $$Se der errado, é só recomeçar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$反対されても、自分の道を進む____。$$, $$Mesmo que sejam contra, é só seguir o meu caminho.$$),
        (2, $$お礼を言われるようなことではありません。当然のことをした____。$$, $$Não precisa agradecer. Só fiz o que era natural.$$),
        (3, $$今年がだめなら、来年また受ける____。$$, $$Se não der este ano, é só fazer a prova de novo no ano que vem.$$),
        (4, $$念のため、確認した____。$$, $$Só verifiquei por precaução.$$),
        (5, $$店が閉まっていたら、別の店に行く____。$$, $$Se a loja estiver fechada, é só ir a outra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-69', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$までだ$$),
        (1, $$までのことだ$$),
        (2, $$までです$$),
        (2, $$までのことです$$),
        (3, $$までだ$$),
        (3, $$までのことだ$$),
        (4, $$までだ$$),
        (4, $$までです$$),
        (5, $$までだ$$),
        (5, $$までのことだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
