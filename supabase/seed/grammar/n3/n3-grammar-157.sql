-- n3-grammar-157 — つまり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-157',
    'grammar',
    'N3',
    $$つまり$$,
    $$tsumari$$,
    $$Ou seja / Quer dizer / Em resumo$$,
    $$つまり é usado para resumir, explicar com outras palavras ou tirar uma conclusão. Equivale a "ou seja", "quer dizer" ou "em resumo".

Ele tem três usos principais:
• Explicar quem ou o que é algo: "ele é o irmão mais velho da minha mãe, ou seja, meu tio".
• Tirar uma conclusão: "ele não respondeu. Quer dizer, ele é contra".
• Pedir que alguém vá direto ao ponto: "afinal, o que você quer dizer?".

つまり tem o mesmo sentido de すなわち, mas é muito mais comum na conversa do dia a dia. すなわち soa formal e literário.

Muitas vezes, a frase com つまり termina com ということだ, reforçando a ideia de conclusão.$$,
    $$Em perguntas, つまり pode soar impaciente se o tom for forte, como se a pessoa quisesse que o outro fosse logo ao ponto.

つまり é muito usado em explicações, aulas e apresentações para resumir uma ideia.

Na fala, também aparece つまりさ ou つまりね, de forma casual.$$,
    $$A、 + つまり + B (A, ou seja, B)
Frase 1 (com ponto final) + つまり、 + Conclusão + ということだ
つまり、 + Pergunta (afinal...?)$$,
    $$つまり$$,
    $$つまり$$,
    ARRAY['つまり']::text[],
    ARRAY['つまり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-157', $$彼は母の兄、つまり私のおじです。$$, $$かれはははのあに、つまりわたしのおじです。$$, $$Ele é o irmão mais velho da minha mãe, ou seja, meu tio.$$),
    ('n3-grammar-157', $$明日は祝日、つまり会議はないということだ。$$, $$あしたはしゅくじつ、つまりかいぎはないということだ。$$, $$Amanhã é feriado, ou seja, não vai ter reunião.$$),
    ('n3-grammar-157', $$話が長いね。つまり、何が言いたいの？$$, $$はなしがながいね。つまり、なにがいいたいの？$$, $$Que conversa longa. Afinal, o que você quer dizer?$$),
    ('n3-grammar-157', $$彼は返事をしなかった。つまり、反対ということだ。$$, $$かれはへんじをしなかった。つまり、はんたいということだ。$$, $$Ele não respondeu. Quer dizer, ele é contra.$$),
    ('n3-grammar-157', $$一週間の休み、つまり七日間の旅行だ。$$, $$いっしゅうかんのやすみ、つまりなのかかんのりょこうだ。$$, $$Uma semana de folga, ou seja, uma viagem de sete dias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$父の妹、____私のおばは東京に住んでいる。$$, $$A irmã mais nova do meu pai, ou seja, minha tia, mora em Tóquio.$$),
        (2, $$彼は来なかった。____、約束を忘れたということだ。$$, $$Ele não veio. Quer dizer, esqueceu o compromisso.$$),
        (3, $$____、あなたは反対なんですか。$$, $$Então, em resumo, você é contra?$$),
        (4, $$締め切りは今月三十日まで、____あと五日しかない。$$, $$O prazo vai até o dia 30 deste mês, ou seja, só faltam cinco dias.$$),
        (5, $$彼女は母の母、____私の祖母です。$$, $$Ela é a mãe da minha mãe, ou seja, minha avó.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-157', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つまり$$),
        (2, $$つまり$$),
        (3, $$つまり$$),
        (4, $$つまり$$),
        (5, $$つまり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
