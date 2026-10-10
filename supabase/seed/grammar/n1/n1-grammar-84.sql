-- n1-grammar-84 — 〜ものとして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-84',
    'grammar',
    'N1',
    $$〜ものとして$$,
    $$mono to shite$$,
    $$Supondo que / Considerando que / Como se$$,
    $$ものとして indica que algo é tratado ou considerado de uma certa forma, mesmo que não seja totalmente certo. Equivale a "supondo que" ou "considerando que".

A pessoa age como se aquilo fosse verdade. Por exemplo, "considerando que ele vem, vamos preparar a comida".

É uma expressão formal, comum no trabalho e em documentos.$$,
    $$É parecido com と仮定して e と考えて.

A forma ものとして扱う significa "tratar como".$$,
    $$Verbo / Adjetivo (forma simples) + ものとして + Verbo
Substantivo + の + ものとして$$,
    $$ものとして$$,
    $$ものとして$$,
    ARRAY['もの', 'と', 'して']::text[],
    ARRAY['ものとして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-84', $$全員参加するものとして、席を用意した。$$, $$ぜんいんさんかするものとして、せきをよういした。$$, $$Preparamos os lugares considerando que todos vão participar.$$),
    ('n1-grammar-84', $$返事がない人は、欠席するものとして扱います。$$, $$へんじがないひとは、けっせきするものとしてあつかいます。$$, $$Quem não responder será tratado como ausente.$$),
    ('n1-grammar-84', $$この計画は成功するものとして、次の準備を始めよう。$$, $$このけいかくはせいこうするものとして、つぎのじゅんびをはじめよう。$$, $$Supondo que este plano dê certo, vamos começar a preparar o próximo.$$),
    ('n1-grammar-84', $$事故はなかったものとして、話を進めてください。$$, $$じこはなかったものとして、はなしをすすめてください。$$, $$Continue a conversa como se o acidente não tivesse acontecido.$$),
    ('n1-grammar-84', $$雨が降るものとして、傘を持っていこう。$$, $$あめがふるものとして、かさをもっていこう。$$, $$Considerando que vai chover, vamos levar guarda-chuva.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$予算は増えない____、計画を立てる。$$, $$Vamos fazer o plano considerando que o orçamento não vai aumentar.$$),
        (2, $$彼は来ない____、四人で始めましょう。$$, $$Considerando que ele não vem, vamos começar em quatro.$$),
        (3, $$今の話は聞かなかった____、忘れてください。$$, $$Esqueça, como se você não tivesse ouvido o que eu disse.$$),
        (4, $$問題は解決した____、次の議題に移ります。$$, $$Considerando que o problema foi resolvido, passaremos à próxima pauta.$$),
        (5, $$参加者は百人いる____、会場を予約した。$$, $$Reservamos o local supondo que haverá cem participantes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-84', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものとして$$),
        (2, $$ものとして$$),
        (3, $$ものとして$$),
        (4, $$ものとして$$),
        (5, $$ものとして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
