-- n4-grammar-72 — さっき
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-72',
    'grammar',
    'N4',
    $$さっき$$,
    $$sakki$$,
    $$Há pouco / Agora há pouco / Ainda agora$$,
    $$さっき significa "há pouco" ou "agora há pouco". Ele indica algo que aconteceu pouco tempo atrás, normalmente no mesmo dia, de minutos a algumas horas antes.

Ele é usado como advérbio, antes do verbo, e pode ser combinado com partículas: さっきまで (até há pouco), さっきから (desde há pouco) e さっきの (de há pouco).

さっき é informal e muito comum na conversa. Em situações formais, usa-se 先ほど, que tem o mesmo sentido.

É diferente de 今 (agora) e de この前 (outro dia): さっき fala de um passado bem recente.$$,
    $$さっきから com a forma ている indica algo que começou há pouco e continua até agora, muitas vezes com um tom de impaciência.

Em e-mails de trabalho e falas com clientes, troque さっき por 先ほど.

Para algo que acabou de acontecer, segundos atrás, o japonês também usa たった今.$$,
    $$さっき + Verbo no passado
さっき + まで (até há pouco)
さっき + から (desde há pouco, até agora)
さっき + の + Substantivo (o... de há pouco)

Formal: 先ほど$$,
    $$さっき$$,
    $$さっき$$,
    ARRAY['さっき']::text[],
    ARRAY['さっき']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-72', $$さっき田中さんから電話がありました。$$, $$さっきたなかさんからでんわがありました。$$, $$Há pouco, o Tanaka ligou.$$),
    ('n4-grammar-72', $$さっき食べたばかりなのに、もうお腹がすいた。$$, $$さっきたべたばかりなのに、もうおなかがすいた。$$, $$Acabei de comer agora há pouco e já estou com fome.$$),
    ('n4-grammar-72', $$さっきの話の続きを聞かせてください。$$, $$さっきのはなしのつづきをきかせてください。$$, $$Me conte o resto daquela história de agora há pouco.$$),
    ('n4-grammar-72', $$彼はさっきまでここにいました。$$, $$かれはさっきまでここにいました。$$, $$Ele estava aqui até agora há pouco.$$),
    ('n4-grammar-72', $$さっきから雨が降っている。$$, $$さっきからあめがふっている。$$, $$Está chovendo desde agora há pouco.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____言ったことは忘れてください。$$, $$Esqueça o que eu disse há pouco.$$),
        (2, $$____までいい天気だったのに、急に雨が降ってきた。$$, $$Até agora há pouco o tempo estava bom, mas de repente começou a chover.$$),
        (3, $$____の人は誰ですか。$$, $$Quem era aquela pessoa de agora há pouco?$$),
        (4, $$「宿題、終わった？」「うん、____終わったよ。」$$, $$"Terminou a lição?" "Sim, terminei agora há pouco."$$),
        (5, $$____から同じところを歩いている気がする。$$, $$Tenho a impressão de que estamos andando pelo mesmo lugar há um tempinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-72', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さっき$$),
        (2, $$さっき$$),
        (3, $$さっき$$),
        (4, $$さっき$$),
        (5, $$さっき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
