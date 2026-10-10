-- n5-grammar-25 — 〜けど
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n5-grammar-25',
    'grammar',
    'N5',
    $$〜けど$$,
    $$kedo$$,
    $$Mas / Porém / Embora$$,
    $$けど é usado para ligar duas ideias que se contrastam, com o sentido de "mas" ou "embora". Ele fica no final da primeira parte da frase, juntando tudo em uma frase só.

É muito usado na conversa informal. Pode vir depois da forma simples ou da forma educada. Com substantivos e adjetivos な, coloca-se だ antes de けど na forma simples.

Além do contraste, けど também tem uma função muito japonesa: suavizar. Quando uma frase termina com けど e o resto fica "no ar", a pessoa está introduzindo um assunto, fazendo um pedido indireto ou evitando soar direta demais.

Por exemplo, ao pedir ajuda ou fazer uma pergunta, terminar com けど deixa espaço para o outro responder, sem pressão.$$,
    $$けど é a forma mais curta e casual da família けれども, けれど e けど. Em situações formais e na escrita, けれども ou が são mais adequados.

O uso de けど no final da frase para suavizar é muito comum ao falar com atendentes, professores ou desconhecidos, e não soa mal-educado.

Às vezes けど não indica contraste forte, mas apenas apresenta um contexto antes da informação principal.$$,
    $$Verbo / Adjetivo い (forma simples ou educada) + けど + Frase
Substantivo / Adjetivo な + だ + けど + Frase
Substantivo / Adjetivo な + です + けど + Frase
Frase + けど (final suavizado, sem completar)$$,
    $$けど$$,
    $$けど$$,
    ARRAY['けど']::text[],
    ARRAY['けど']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n5-grammar-25', $$この店は高いけど、おいしいです。$$, $$このみせはたかいけど、おいしいです。$$, $$Este restaurante é caro, mas é gostoso.$$),
    ('n5-grammar-25', $$行きたいけど、時間がない。$$, $$いきたいけど、じかんがない。$$, $$Quero ir, mas não tenho tempo.$$),
    ('n5-grammar-25', $$日本語は難しいけど、おもしろい。$$, $$にほんごはむずかしいけど、おもしろい。$$, $$Japonês é difícil, mas é interessante.$$),
    ('n5-grammar-25', $$雨だけど、出かけます。$$, $$あめだけど、でかけます。$$, $$Está chovendo, mas vou sair.$$),
    ('n5-grammar-25', $$すみません、ちょっと聞きたいことがあるんですけど…。$$, $$すみません、ちょっとききたいことがあるんですけど…。$$, $$Com licença, eu queria perguntar uma coisa...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$薬を飲んだ____、まだ頭が痛いです。$$, $$Tomei remédio, mas ainda estou com dor de cabeça.$$),
        (2, $$兄は背が高い____、私は低いです。$$, $$Meu irmão mais velho é alto, mas eu sou baixo.$$),
        (3, $$今日は休みだ____、仕事に行きます。$$, $$Hoje é folga, mas vou trabalhar.$$),
        (4, $$このアパートは安い____、駅から遠いです。$$, $$Este apartamento é barato, mas é longe da estação.$$),
        (5, $$あのう、駅に行きたいんです____…。$$, $$Hum, eu queria ir à estação...$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n5-grammar-25', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$けど$$),
        (2, $$けど$$),
        (3, $$けど$$),
        (4, $$けど$$),
        (5, $$けど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
