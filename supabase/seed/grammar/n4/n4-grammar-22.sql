-- n4-grammar-22 — 意向形（〜う・〜よう）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-22',
    'grammar',
    'N4',
    $$意向形（〜う・〜よう）$$,
    $$ikoukei$$,
    $$Vamos... / Vou... / Forma volitiva$$,
    $$意向形 é a forma volitiva dos verbos. Ela expressa a vontade de fazer algo e tem dois usos principais.

O primeiro é convidar ou propor algo, de forma informal. É a versão casual de ましょう: "vamos comer", "vamos voltar".

O segundo é expressar a própria decisão ou intenção, muitas vezes falando consigo mesmo: "vou estudar a partir de hoje".

A formação depende do grupo do verbo. No grupo 1, o último som muda de "u" para "o" e recebe う. No grupo 2, tira-se る e acrescenta-se よう. Os irregulares ficam しよう e 来よう (こよう).

Com か no final, a forma volitiva vira uma sugestão em forma de pergunta, como "vamos descansar um pouco?". E ela é a base de outras gramáticas, como ようと思う e ようとする.$$,
    $$Com superiores, a forma volitiva sozinha soa informal demais. Nesses casos, use ましょう ou ましょうか.

Entre amigos, é comum acrescentar よ (行こうよ) para soar mais animado, ou か (行こうか) para soar mais suave.

Verbos como 帰る e 入る são do grupo 1, então ficam 帰ろう e 入ろう.$$,
    $$Grupo 1: último som "u" → "o" + う (行く → 行こう / 飲む → 飲もう / 買う → 買おう)
Grupo 2: tire る + よう (食べる → 食べよう / 見る → 見よう)
Irregulares: する → しよう / 来る → 来よう (こよう)

Convite educado: ましょう
Sugestão: 〜う / 〜よう + か
Intenção: 〜う / 〜よう + と思う$$,
    $$う / よう$$,
    $$おう|こう|ごう|そう|とう|のう|ぼう|もう|ろう|よう$$,
    ARRAY['う', 'よう']::text[],
    ARRAY['う', 'よう', 'おう', 'こう', 'しよう', '来よう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-22', $$もう遅いから、一緒に帰ろう。$$, $$もうおそいから、いっしょにかえろう。$$, $$Já está tarde, vamos voltar juntos.$$),
    ('n4-grammar-22', $$明日は早いから、もう寝よう。$$, $$あしたははやいから、もうねよう。$$, $$Amanhã acordo cedo, vou dormir.$$),
    ('n4-grammar-22', $$今度の休みに、海へ行こうよ。$$, $$こんどのやすみに、うみへいこうよ。$$, $$Na próxima folga, vamos à praia!$$),
    ('n4-grammar-22', $$疲れたね。ちょっと休もうか。$$, $$つかれたね。ちょっとやすもうか。$$, $$Cansamos, né. Vamos descansar um pouco?$$),
    ('n4-grammar-22', $$今日から毎日運動しよう。$$, $$きょうからまいにちうんどうしよう。$$, $$A partir de hoje, vou fazer exercício todo dia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お腹がすいたね。何か食べ____。$$, $$Estou com fome. Vamos comer alguma coisa.$$),
        (2, $$雨がやんだから、外で遊____。$$, $$A chuva parou, vamos brincar lá fora.$$),
        (3, $$時間がないから、急____。$$, $$Não temos tempo, vamos nos apressar.$$),
        (4, $$じゃ、明日駅で会____。$$, $$Então, vamos nos encontrar na estação amanhã.$$),
        (5, $$よし、今日こそ部屋を掃除し____。$$, $$Muito bem, hoje sem falta vou limpar o quarto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-22', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$よう$$),
        (2, $$ぼう$$),
        (3, $$ごう$$),
        (4, $$おう$$),
        (5, $$よう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
