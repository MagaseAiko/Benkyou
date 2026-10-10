-- n3-grammar-107 — しばらく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-107',
    'grammar',
    'N3',
    $$しばらく$$,
    $$shibaraku$$,
    $$Um pouco / Por um tempo / Por algum tempo$$,
    $$しばらく é um advérbio que indica um período de tempo, que pode ser curto ou relativamente longo, dependendo do contexto. Equivale a "um pouco", "por um tempo" ou "por algum tempo".

Os usos mais comuns são:
• Pedir que alguém espere um pouco: しばらくお待ちください, muito usado no atendimento.
• Falar de um período sem algo acontecer: "faz tempo que não nos vemos".
• Indicar que algo aconteceu depois de um tempo: しばらくして / しばらくすると (depois de um tempo).
• Planos temporários: しばらくの間 (por algum tempo).

O tamanho do período é vago: pode ser alguns minutos ou alguns meses. O contexto mostra qual é.$$,
    $$A saudação しばらくですね significa "quanto tempo!", parecida com 久しぶりですね, mas um pouco mais formal.

しばらくお待ちください soa mais formal que ちょっと待ってください.

Em mensagens de ausência, しばらく留守にします significa "vou ficar fora por um tempo".$$,
    $$しばらく + Verbo (por um tempo)
しばらく + Verbo negativo (faz tempo que não...)
しばらくして / しばらくすると (depois de um tempo)
しばらくの間 + … (por algum tempo)

Escrita: しばらく / 暫く$$,
    $$しばらく$$,
    $$しばらく|暫く$$,
    ARRAY['しばらく']::text[],
    ARRAY['しばらく', '暫く']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-107', $$しばらくお待ちください。$$, $$しばらくおまちください。$$, $$Aguarde um momento, por favor.$$),
    ('n3-grammar-107', $$しばらく会わないうちに、背が伸びたね。$$, $$しばらくあわないうちに、せがのびたね。$$, $$Faz um tempo que não te vejo, e você cresceu, hein.$$),
    ('n3-grammar-107', $$仕事が忙しくて、しばらく休みが取れない。$$, $$しごとがいそがしくて、しばらくやすみがとれない。$$, $$Estou com o trabalho corrido e não vou conseguir tirar folga por um tempo.$$),
    ('n3-grammar-107', $$しばらくして、雨がやんだ。$$, $$しばらくして、あめがやんだ。$$, $$Depois de um tempo, a chuva parou.$$),
    ('n3-grammar-107', $$しばらくの間、この町に住む予定です。$$, $$しばらくのあいだ、このまちにすむよていです。$$, $$Pretendo morar nesta cidade por algum tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____休んでから、また始めましょう。$$, $$Vamos descansar um pouco e depois recomeçar.$$),
        (2, $$彼とは____連絡を取っていない。$$, $$Faz um tempo que não falo com ele.$$),
        (3, $$駅で待っていると、____すると、電車が来た。$$, $$Esperei na estação e, depois de um tempo, o trem chegou.$$),
        (4, $$来週から、____の間、留守にします。$$, $$A partir da semana que vem, vou ficar fora por algum tempo.$$),
        (5, $$会議室は今使っていますので、____お待ちください。$$, $$A sala de reunião está ocupada agora, então aguarde um pouco, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-107', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$しばらく$$),
        (2, $$しばらく$$),
        (3, $$しばらく$$),
        (4, $$しばらく$$),
        (5, $$しばらく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
