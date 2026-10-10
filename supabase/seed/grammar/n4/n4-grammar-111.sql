-- n4-grammar-111 — 〜と言われている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-111',
    'grammar',
    'N4',
    $$〜と言われている$$,
    $$to iwarete iru$$,
    $$Diz-se que / Acredita-se que / Fala-se que$$,
    $$と言われている é usado para apresentar uma opinião geral, uma crença popular ou algo que muitas pessoas dizem. Equivale a "diz-se que", "acredita-se que" ou "fala-se que".

Ele vem de 言う (dizer) na forma passiva (言われる) + ている. A ideia é "isso é dito por muitas pessoas", sem indicar quem exatamente.

É muito usado em textos informativos, notícias, explicações sobre cultura, história, saúde e costumes.

Diferente de そうだ, que repassa uma informação de uma fonte específica, と言われている fala de algo amplamente aceito ou comentado pela sociedade.$$,
    $$Em textos acadêmicos e jornalísticos, também aparecem formas como とされている e と考えられている, com sentido parecido.

Essa estrutura deixa a informação mais objetiva e evita que quem fala pareça estar dando sua opinião pessoal.

É comum em frases sobre lendas e histórias antigas, como a origem de templos e tradições.$$,
    $$Frase (forma simples) + と言われている
Substantivo / Adjetivo な + だ + と言われている

Educado: と言われています
Escrita: と言われている / といわれている$$,
    $$と言われている$$,
    $$と言われてい|といわれてい$$,
    ARRAY['と', '言われて', 'いる']::text[],
    ARRAY['と言われている', 'と言われています', 'といわれている']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-111', $$日本人は時間に厳しいと言われている。$$, $$にほんじんはじかんにきびしいといわれている。$$, $$Diz-se que os japoneses são rigorosos com o horário.$$),
    ('n4-grammar-111', $$この寺は千年前に建てられたと言われています。$$, $$このてらはせんねんまえにたてられたといわれています。$$, $$Diz-se que este templo foi construído há mil anos.$$),
    ('n4-grammar-111', $$緑茶は体にいいと言われています。$$, $$りょくちゃはからだにいいといわれています。$$, $$Acredita-se que o chá verde faz bem para o corpo.$$),
    ('n4-grammar-111', $$この町は日本で一番雨が多いと言われている。$$, $$このまちはにほんでいちばんあめがおおいといわれている。$$, $$Diz-se que esta é a cidade onde mais chove no Japão.$$),
    ('n4-grammar-111', $$朝ご飯を食べると、頭がよく働くと言われています。$$, $$あさごはんをたべると、あたまがよくはたらくといわれています。$$, $$Diz-se que tomar café da manhã faz o cérebro funcionar melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$富士山は日本一美しい山だ____。$$, $$Diz-se que o Monte Fuji é a montanha mais bonita do Japão.$$),
        (2, $$よく笑うことは健康にいい____。$$, $$Diz-se que rir bastante faz bem para a saúde.$$),
        (3, $$この池には大きな魚がいる____。$$, $$Dizem que há um peixe enorme neste lago.$$),
        (4, $$猫は人ではなく家につく____。$$, $$Diz-se que os gatos se apegam à casa, e não às pessoas.$$),
        (5, $$一日に八時間寝るのがいい____。$$, $$Diz-se que o ideal é dormir oito horas por dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-111', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と言われています$$),
        (1, $$と言われている$$),
        (2, $$と言われています$$),
        (2, $$と言われている$$),
        (3, $$と言われています$$),
        (3, $$と言われている$$),
        (4, $$と言われています$$),
        (4, $$と言われている$$),
        (5, $$と言われています$$),
        (5, $$と言われている$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
