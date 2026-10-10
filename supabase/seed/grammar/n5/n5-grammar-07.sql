-- n5-grammar-07 — 〜でしょう
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-07',
    'grammar',
    'N5',
    $$〜でしょう$$,
    $$deshou$$,
    $$Provavelmente / Deve ser / Não é?$$,
    $$でしょう é a forma educada de だろう. Ele mostra que a pessoa está fazendo uma suposição: acredita que algo é verdade, mas não tem certeza total.

É muito usado na previsão do tempo, em explicações e em conversas educadas. Fica no final da frase, depois de verbos, adjetivos e substantivos.

Com entonação de pergunta, でしょう também serve para pedir confirmação, algo como "não é?". Nesse caso, quem fala espera que o outro concorde.

Já でしょうか é uma forma educada e suave de fazer uma pergunta. Ela soa mais delicada do que ですか, por isso é comum ao pedir informações a desconhecidos ou atender clientes.$$,
    $$A forma reduzida でしょ é bem comum na fala informal para pedir confirmação, com um tom de "eu não disse?" ou "né?".

Na previsão do tempo, でしょう aparece o tempo todo, porque o meteorologista fala de algo provável, mas não garantido.

Apesar de ser educado, でしょう não deve ser usado para falar das suas próprias ações ou intenções; para isso, usa-se a forma ます ou つもり.$$,
    $$Verbo na forma simples + でしょう
Verbo na forma ない + でしょう
Verbo na forma た + でしょう
Adjetivo い + でしょう
Adjetivo な (sem な) + でしょう
Substantivo + でしょう

Pergunta educada: 〜でしょうか
Confirmação: 〜でしょう？ / 〜でしょ？ (informal)$$,
    $$でしょう$$,
    $$でしょう|でしょ$$,
    ARRAY['でしょう']::text[],
    ARRAY['でしょう', 'でしょ', 'でしょうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-07', $$明日は晴れるでしょう。$$, $$あしたははれるでしょう。$$, $$Amanhã provavelmente vai fazer sol.$$),
    ('n5-grammar-07', $$山田さんは来ないでしょう。$$, $$やまださんはこないでしょう。$$, $$O Yamada provavelmente não vem.$$),
    ('n5-grammar-07', $$この時間は、道が空いているでしょう。$$, $$このじかんは、みちがすいているでしょう。$$, $$Neste horário, a rua deve estar vazia.$$),
    ('n5-grammar-07', $$すみません、駅はどこでしょうか。$$, $$すみません、えきはどこでしょうか。$$, $$Com licença, onde fica a estação?$$),
    ('n5-grammar-07', $$このケーキ、おいしいでしょう？$$, $$このケーキ、おいしいでしょう？$$, $$Este bolo é gostoso, não é?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$午後から雨が降る____。$$, $$A partir da tarde provavelmente vai chover.$$),
        (2, $$週末は道が混む____。$$, $$No fim de semana, as ruas provavelmente vão estar cheias.$$),
        (3, $$彼女はもう寝た____。$$, $$Ela já deve ter dormido.$$),
        (4, $$会議は何時から____か。$$, $$A reunião começa a que horas?$$),
        (5, $$ほら、この写真、きれい____？$$, $$Olha, esta foto é bonita, não é?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-07', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でしょう$$),
        (2, $$でしょう$$),
        (3, $$でしょう$$),
        (4, $$でしょう$$),
        (5, $$でしょう$$),
        (5, $$でしょ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
