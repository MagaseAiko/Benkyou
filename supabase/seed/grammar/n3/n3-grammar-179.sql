-- n3-grammar-179 — 〜ようとする
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-179',
    'grammar',
    'N3',
    $$〜ようとする$$,
    $$you to suru$$,
    $$Tentar / Estar prestes a / Ir fazer$$,
    $$ようとする tem dois usos principais.

O primeiro é "tentar": a pessoa se esforça para fazer algo, mas muitas vezes não consegue. Por exemplo, "tentei dormir, mas não consegui pegar no sono" ou "ele tentou dizer algo, mas desistiu".

O segundo é "estar prestes a": algo está quase acontecendo. Com とき, indica o momento exato antes de uma ação: "quando eu ia sair de casa, o telefone tocou". Com coisas e fenômenos, como o sol se pondo ou as portas se fechando, ようとしている descreve algo que está começando a acontecer.

Ele junta a forma volitiva do verbo com とする.$$,
    $$Comparado a てみる (experimentar), ようとする destaca o esforço e, muitas vezes, o fracasso da tentativa.

Na forma negativa, ようとしない significa "não quer fazer", com outro sentido.

Com sujeitos que não são pessoas, como o sol ou a porta, ようとしている descreve o momento imediatamente antes de algo acontecer.$$,
    $$Forma volitiva + とする / とした (tentar)
Forma volitiva + とした + とき (quando ia...)
Forma volitiva + としている (está prestes a)

Exemplos: 寝る → 寝ようとする / 言う → 言おうとする / 出る → 出ようとする$$,
    $$ようとする$$,
    $$ようとする|うとする|ようとした|うとした|うとして$$,
    ARRAY['よう', 'と', 'する']::text[],
    ARRAY['ようとする', 'うとする', 'ようとした', 'ようとしている']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-179', $$家を出ようとしたとき、電話が鳴った。$$, $$いえをでようとしたとき、でんわがなった。$$, $$Quando eu ia sair de casa, o telefone tocou.$$),
    ('n3-grammar-179', $$赤ちゃんが一人で立とうとしている。$$, $$あかちゃんがひとりでたとうとしている。$$, $$O bebê está tentando ficar de pé sozinho.$$),
    ('n3-grammar-179', $$寝ようとしたが、なかなか眠れなかった。$$, $$ねようとしたが、なかなかねむれなかった。$$, $$Tentei dormir, mas não consegui pegar no sono.$$),
    ('n3-grammar-179', $$彼は何か言おうとしたが、やめた。$$, $$かれはなにかいおうとしたが、やめた。$$, $$Ele tentou dizer algo, mas desistiu.$$),
    ('n3-grammar-179', $$電車のドアが閉まろうとしている。$$, $$でんしゃのドアがしまろうとしている。$$, $$As portas do trem estão prestes a se fechar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$出かけよ____とき、雨が降り出した。$$, $$Quando eu ia sair, começou a chover.$$),
        (2, $$名前を思い出そ____が、思い出せない。$$, $$Tentei lembrar o nome, mas não consigo.$$),
        (3, $$彼女は重いドアを開けよ____いた。$$, $$Ela estava tentando abrir a porta pesada.$$),
        (4, $$太陽が沈も____いる。$$, $$O sol está prestes a se pôr.$$),
        (5, $$寝よ____が、隣がうるさくて眠れなかった。$$, $$Tentei dormir, mas o vizinho estava barulhento e não consegui.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-179', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$うとした$$),
        (2, $$うとした$$),
        (3, $$うとして$$),
        (4, $$うとして$$),
        (5, $$うとした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
