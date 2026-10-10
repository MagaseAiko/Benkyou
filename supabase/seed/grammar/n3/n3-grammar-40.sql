-- n3-grammar-40 — 結局
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-40',
    'grammar',
    'N3',
    $$結局$$,
    $$kekkyoku$$,
    $$No fim / Afinal / No final das contas$$,
    $$結局 é um advérbio que indica o resultado final de uma situação, depois de várias possibilidades, esforços ou dúvidas. Equivale a "no fim", "afinal" ou "no final das contas".

Muitas vezes, o resultado é diferente do esperado ou não compensa o esforço. Por exemplo, "esperei uma hora, mas no fim ele não veio" ou "pensei muito, mas no fim não fui".

Também pode indicar que, depois de muitas opções, voltou-se ao ponto inicial: "no fim, decidimos pela primeira proposta".

No começo de uma frase, 結局 pode introduzir uma conclusão geral: "no fim das contas, o mais importante é a saúde". E, em perguntas, pode pedir que alguém vá direto ao ponto: "afinal, o que você quer dizer?".$$,
    $$Comparado a やっと, que traz alívio por um resultado desejado, 結局 é neutro ou até um pouco decepcionado.

ついに também indica um resultado final, mas com um tom de "finalmente aconteceu", enquanto 結局 tem um tom de "no fim, foi isso".

Em discussões, 結局 pode soar impaciente quando usado em perguntas.$$,
    $$…が / けど、 + 結局 + Resultado
結局、 + Conclusão
結局 + Palavra interrogativa + … + か (afinal, o que...?)

Escrita: 結局 / けっきょく$$,
    $$結局$$,
    $$結局|けっきょく$$,
    ARRAY['結局']::text[],
    ARRAY['結局', 'けっきょく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-40', $$いろいろ考えたが、結局行かなかった。$$, $$いろいろかんがえたが、けっきょくいかなかった。$$, $$Pensei muito, mas no fim não fui.$$),
    ('n3-grammar-40', $$一時間待ったけど、結局彼は来なかった。$$, $$いちじかんまったけど、けっきょくかれはこなかった。$$, $$Esperei uma hora, mas no fim ele não veio.$$),
    ('n3-grammar-40', $$結局、最初の案に決まった。$$, $$けっきょく、さいしょのあんにきまった。$$, $$No fim, decidimos pela primeira proposta.$$),
    ('n3-grammar-40', $$何度も話し合ったが、結局問題は解決しなかった。$$, $$なんどもはなしあったが、けっきょくもんだいはかいけつしなかった。$$, $$Conversamos várias vezes, mas no fim o problema não foi resolvido.$$),
    ('n3-grammar-40', $$結局、何が言いたいんですか。$$, $$けっきょく、なにがいいたいんですか。$$, $$Afinal, o que você quer dizer?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$迷ったけど、____買わなかった。$$, $$Fiquei em dúvida, mas no fim não comprei.$$),
        (2, $$雨が降って、____試合は中止になった。$$, $$Choveu e, no fim, a partida foi cancelada.$$),
        (3, $$三日間探したが、____見つからなかった。$$, $$Procurei por três dias, mas no fim não encontrei.$$),
        (4, $$いろいろあるけど、____、一番大切なのは健康だ。$$, $$Há muitas coisas, mas no fim das contas o mais importante é a saúde.$$),
        (5, $$色々な店を見て、____最初の店で買った。$$, $$Olhei várias lojas e, no fim, comprei na primeira.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-40', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$結局$$),
        (1, $$けっきょく$$),
        (2, $$結局$$),
        (2, $$けっきょく$$),
        (3, $$結局$$),
        (3, $$けっきょく$$),
        (4, $$結局$$),
        (4, $$けっきょく$$),
        (5, $$結局$$),
        (5, $$けっきょく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
