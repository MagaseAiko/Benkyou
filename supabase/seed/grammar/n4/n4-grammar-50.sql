-- n4-grammar-50 — 〜ながら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-50',
    'grammar',
    'N4',
    $$〜ながら$$,
    $$nagara$$,
    $$Enquanto / Ao mesmo tempo que$$,
    $$ながら é usado para dizer que uma pessoa faz duas ações ao mesmo tempo. Equivale a "enquanto" ou "ao mesmo tempo que".

Ele é formado tirando ます do verbo e acrescentando ながら. A ação com ながら é a secundária, que acompanha. A ação principal vem no final da frase.

Por exemplo, em "estudar ouvindo música", a ação principal é estudar, e ouvir música é o que acompanha.

As duas ações precisam ser feitas pela mesma pessoa. Para ações de pessoas diferentes ao mesmo tempo, usa-se 間 ou とき.

Também é usado para atividades de longo prazo feitas em paralelo, como trabalhar enquanto estuda na faculdade.$$,
    $$Um erro comum é colocar a ação principal com ながら. Pense sempre: a ação mais importante fica no final.

ながら só funciona com o mesmo sujeito. Para "enquanto minha mãe cozinhava, eu limpei", usa-se 間.

Em níveis mais avançados, ながら também pode significar "apesar de", como em 残念ながら (infelizmente).$$,
    $$Verbo na forma ます sem ます + ながら + Verbo principal$$,
    $$ながら$$,
    $$ながら$$,
    ARRAY['ながら']::text[],
    ARRAY['ながら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-50', $$音楽を聞きながら勉強します。$$, $$おんがくをききながらべんきょうします。$$, $$Estudo ouvindo música.$$),
    ('n4-grammar-50', $$テレビを見ながらご飯を食べないでください。$$, $$テレビをみながらごはんをたべないでください。$$, $$Não coma vendo TV, por favor.$$),
    ('n4-grammar-50', $$歩きながら電話するのは危ないです。$$, $$あるきながらでんわするのはあぶないです。$$, $$É perigoso falar ao telefone enquanto anda.$$),
    ('n4-grammar-50', $$彼は働きながら大学に通っています。$$, $$かれははたらきながらだいがくにかよっています。$$, $$Ele trabalha enquanto faz faculdade.$$),
    ('n4-grammar-50', $$笑いながら話す人が好きです。$$, $$わらいながらはなすひとがすきです。$$, $$Gosto de pessoas que falam sorrindo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎朝、コーヒーを飲み____新聞を読みます。$$, $$Toda manhã, leio o jornal tomando café.$$),
        (2, $$母は歌を歌い____料理をします。$$, $$Minha mãe cozinha cantando.$$),
        (3, $$運転し____携帯電話を使ってはいけません。$$, $$Não se deve usar o celular enquanto dirige.$$),
        (4, $$彼女は子供を育て____仕事を続けています。$$, $$Ela continua trabalhando enquanto cria os filhos.$$),
        (5, $$地図を見____歩きました。$$, $$Andei olhando o mapa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-50', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ながら$$),
        (2, $$ながら$$),
        (3, $$ながら$$),
        (4, $$ながら$$),
        (5, $$ながら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
