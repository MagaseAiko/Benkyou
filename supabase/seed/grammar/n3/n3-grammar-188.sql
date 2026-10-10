-- n3-grammar-188 — 〜とのことだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-188',
    'grammar',
    'N3',
    $$〜とのことだ$$,
    $$to no koto da$$,
    $$Dizem que / Mandou dizer que / Segundo o recado$$,
    $$とのことだ é usado para repassar uma informação ou um recado que se recebeu de outra pessoa, de forma formal e objetiva. Equivale a "dizem que", "mandou dizer que" ou "segundo o recado".

Ele é muito comum no trabalho, para transmitir mensagens: "o Tanaka ligou e disse que vai se atrasar um pouco" ou "o gerente mandou avisar que vai faltar hoje".

Também aparece com によると, para indicar a fonte da informação, como uma previsão do tempo ou um comunicado.

とのことだ é mais formal que そうだ e que ということだ. Por isso, é muito usado em e-mails, recados e relatos profissionais.

A forma とのことでした, no passado, é comum ao repassar um recado já recebido.$$,
    $$Em recados por telefone no trabalho, とのことです é uma das formas mais naturais de transmitir a mensagem.

〜からよろしくとのことでした ("fulano mandou lembranças") é uma frase muito comum.

Na conversa casual, os japoneses preferem そうだ ou って.$$,
    $$Frase (forma simples) + とのことだ / とのことです
Pessoa + から、 + Frase + とのことでした (recado recebido)
Fonte + によると、 + Frase + とのことです$$,
    $$とのことだ$$,
    $$とのことだ|とのことです|とのこと$$,
    ARRAY['との', 'こと', 'だ']::text[],
    ARRAY['とのことだ', 'とのことです', 'とのことでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-188', $$田中さんから電話があって、少し遅れるとのことです。$$, $$たなかさんからでんわがあって、すこしおくれるとのことです。$$, $$O Tanaka ligou e disse que vai se atrasar um pouco.$$),
    ('n3-grammar-188', $$部長は今日、休むとのことだ。$$, $$ぶちょうはきょう、やすむとのことだ。$$, $$O gerente mandou avisar que vai faltar hoje.$$),
    ('n3-grammar-188', $$天気予報によると、明日は晴れるとのことです。$$, $$てんきよほうによると、あしたははれるとのことです。$$, $$Segundo a previsão do tempo, amanhã vai fazer sol.$$),
    ('n3-grammar-188', $$先生によると、試験は来週行われるとのことです。$$, $$せんせいによると、しけんはらいしゅうおこなわれるとのことです。$$, $$Segundo o professor, a prova será na semana que vem.$$),
    ('n3-grammar-188', $$社長から、皆さんによろしくとのことでした。$$, $$しゃちょうから、みなさんによろしくとのことでした。$$, $$O presidente mandou lembranças a todos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$山田さんから連絡があり、会議に出られない____。$$, $$O Yamada entrou em contato e disse que não poderá participar da reunião.$$),
        (2, $$受付から、お客様は三時にいらっしゃる____。$$, $$Segundo a recepção, o cliente virá às três.$$),
        (3, $$母から、今日は早く帰ってきなさい____。$$, $$Minha mãe mandou dizer para eu voltar cedo hoje.$$),
        (4, $$医者によると、一週間で治る____。$$, $$Segundo o médico, vai sarar em uma semana.$$),
        (5, $$課長から、明日は休みにする____。$$, $$O chefe de seção mandou avisar que amanhã será folga.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-188', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とのことです$$),
        (1, $$とのことだ$$),
        (2, $$とのことです$$),
        (2, $$とのことだ$$),
        (3, $$とのことです$$),
        (3, $$とのことだ$$),
        (3, $$とのことでした$$),
        (4, $$とのことです$$),
        (4, $$とのことだ$$),
        (5, $$とのことです$$),
        (5, $$とのことだ$$),
        (5, $$とのことでした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
