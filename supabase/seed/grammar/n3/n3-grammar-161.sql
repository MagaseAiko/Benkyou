-- n3-grammar-161 — 〜上で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-161',
    'grammar',
    'N3',
    $$〜上で$$,
    $$ue de$$,
    $$Depois de / Após / Para (fazer) / Em$$,
    $$上で tem dois usos principais.

O primeiro, com o verbo na forma た ou com substantivo + の, significa "depois de" ou "após": primeiro se faz uma coisa com cuidado, e depois, com base nela, se faz outra. Por exemplo, "decida depois de pensar bem" ou "responderei depois de conversar com meus pais". O tom é formal e sério.

O segundo, com o verbo na forma de dicionário, significa "para" ou "em": indica uma área ou atividade em que algo é importante ou necessário. Por exemplo, "para viver no Japão, o japonês é importante" ou "no trabalho, o mais importante é a confiança".

Com o, a forma 上での vem antes de um substantivo: 仕事上での注意 (cuidados no trabalho).$$,
    $$No primeiro uso, 上で destaca que a primeira ação é uma preparação necessária para a segunda.

Em contratos e formulários, よく読んだ上で ("depois de ler com atenção") é muito comum.

Não confunda com 上に (além disso), que soma informações.$$,
    $$Verbo na forma た + 上で、 + Ação seguinte (depois de)
Substantivo + の + 上で、 + Ação seguinte
Verbo na forma de dicionário + 上で、 + Algo importante / necessário (para / em)

Escrita: 上で / うえで$$,
    $$上で$$,
    $$上で|うえで|上での$$,
    ARRAY['上', 'で']::text[],
    ARRAY['上で', 'うえで', '上での']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-161', $$よく考えた上で、決めてください。$$, $$よくかんがえたうえで、きめてください。$$, $$Decida depois de pensar bem.$$),
    ('n3-grammar-161', $$両親と相談した上で、返事をします。$$, $$りょうしんとそうだんしたうえで、へんじをします。$$, $$Vou responder depois de conversar com meus pais.$$),
    ('n3-grammar-161', $$説明を聞いた上で、申し込んでください。$$, $$せつめいをきいたうえで、もうしこんでください。$$, $$Inscreva-se depois de ouvir a explicação.$$),
    ('n3-grammar-161', $$日本で生活する上で、日本語は大切だ。$$, $$にほんでせいかつするうえで、にほんごはたいせつだ。$$, $$Para viver no Japão, o japonês é importante.$$),
    ('n3-grammar-161', $$仕事をする上で、一番大切なのは信頼です。$$, $$しごとをするうえで、いちばんたいせつなのはしんらいです。$$, $$No trabalho, o mais importante é a confiança.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$契約書の内容を確認した____、サインしてください。$$, $$Assine depois de conferir o conteúdo do contrato.$$),
        (2, $$家族と話し合った____、留学を決めた。$$, $$Decidi fazer intercâmbio depois de conversar com a família.$$),
        (3, $$外国語を学ぶ____、毎日の練習が必要だ。$$, $$Para aprender uma língua estrangeira, é preciso praticar todo dia.$$),
        (4, $$実物を見た____、買うかどうか決めます。$$, $$Vou decidir se compro depois de ver o produto pessoalmente.$$),
        (5, $$健康に生活する____、睡眠は大切だ。$$, $$Para viver com saúde, o sono é importante.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-161', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$上で$$),
        (2, $$上で$$),
        (3, $$上で$$),
        (4, $$上で$$),
        (5, $$上で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
