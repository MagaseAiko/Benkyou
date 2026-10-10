-- n2-grammar-33 — いきなり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-33',
    'grammar',
    'N2',
    $$いきなり$$,
    $$ikinari$$,
    $$De repente / Sem aviso / Do nada$$,
    $$いきなり é um advérbio que indica que algo aconteceu de repente, sem aviso nem preparação. Equivale a "de repente", "sem aviso" ou "do nada".

Ele é parecido com 急に e 突然, mas いきなり destaca que a ação pulou etapas ou aconteceu sem nenhum sinal prévio, muitas vezes de forma brusca ou inesperada.

Por exemplo, "ele ficou bravo do nada" ou "uma pessoa desconhecida puxou conversa comigo de repente".

Também é usado em conselhos, para dizer que não se deve começar algo de forma brusca: "é melhor não começar direto pelas questões difíceis".$$,
    $$Comparando: 急に destaca a rapidez; 突然 destaca a surpresa; いきなり destaca a falta de aviso ou de preparação.

いきなり é mais comum na conversa do que na escrita formal.

Em contextos de aprendizado, いきなり aparece em conselhos como "não comece direto pelo mais difícil".$$,
    $$いきなり + Verbo$$,
    $$いきなり$$,
    $$いきなり$$,
    ARRAY['いきなり']::text[],
    ARRAY['いきなり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-33', $$彼はいきなり怒り出した。$$, $$かれはいきなりおこりだした。$$, $$Ele ficou bravo do nada.$$),
    ('n2-grammar-33', $$いきなりドアが開いて、びっくりした。$$, $$いきなりドアがあいて、びっくりした。$$, $$A porta se abriu de repente e levei um susto.$$),
    ('n2-grammar-33', $$駅で知らない人にいきなり話しかけられた。$$, $$えきでしらないひとにいきなりはなしかけられた。$$, $$Na estação, uma pessoa desconhecida puxou conversa comigo do nada.$$),
    ('n2-grammar-33', $$いきなり難しい問題から始めないほうがいい。$$, $$いきなりむずかしいもんだいからはじめないほうがいい。$$, $$É melhor não começar direto pelas questões difíceis.$$),
    ('n2-grammar-33', $$彼女は誰にも言わずに、いきなり会社をやめた。$$, $$かのじょはだれにもいわずに、いきなりかいしゃをやめた。$$, $$Ela saiu da empresa de repente, sem avisar ninguém.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$晴れていたのに、____雨が降ってきた。$$, $$Estava ensolarado, mas de repente começou a chover.$$),
        (2, $$角から犬が____飛び出してきた。$$, $$Um cachorro saiu correndo da esquina do nada.$$),
        (3, $$彼は____私の手を握った。$$, $$Ele segurou a minha mão de repente.$$),
        (4, $$準備もせずに、____本番はできない。$$, $$Sem preparação, não dá para ir direto para a apresentação.$$),
        (5, $$授業中に____名前を呼ばれて、驚いた。$$, $$Fui chamado pelo nome do nada durante a aula e levei um susto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-33', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いきなり$$),
        (2, $$いきなり$$),
        (3, $$いきなり$$),
        (4, $$いきなり$$),
        (5, $$いきなり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
