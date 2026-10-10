-- n4-grammar-17 — ございます
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-17',
    'grammar',
    'N4',
    $$ございます$$,
    $$gozaimasu$$,
    $$Há / Tem (muito formal)$$,
    $$ございます é a forma muito educada de あります. Ela significa "há" ou "tem", mas com um nível de respeito bem alto.

É usada principalmente por funcionários de lojas, hotéis, empresas e serviços, quando falam com clientes. Também aparece em discursos e em situações formais.

Ela pertence ao 丁寧語, a linguagem polida que deixa a frase elegante e gentil com quem ouve.

ございます também aparece em expressões fixas muito comuns, como ありがとうございます e おはようございます, além de 申し訳ございません, um pedido de desculpas bem formal.

No dia a dia, com amigos e colegas, o normal é usar あります.$$,
    $$Com です, a forma muito educada é でございます. Com あります, é ございます. Essa distinção ajuda a saber qual usar.

ございます só substitui ある para coisas. Para pessoas, a forma respeitosa de いる é いらっしゃる, e a humilde é おる.

Em lojas, frases como 〜もございます são usadas para oferecer outras opções ao cliente.$$,
    $$Substantivo + が + ございます (há / tem)
Substantivo + は + ございますか (pergunta)

Negativo: ございません
Passado: ございました

Expressões fixas: ありがとうございます / おはようございます / 申し訳ございません / おめでとうございます$$,
    $$ございます$$,
    $$ございます|ございません|ございました$$,
    ARRAY['ございます']::text[],
    ARRAY['ございます', 'ございません', 'ございました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-17', $$二階にレストランがございます。$$, $$にかいにレストランがございます。$$, $$Há um restaurante no segundo andar.$$),
    ('n4-grammar-17', $$何かご質問はございますか。$$, $$なにかごしつもんはございますか。$$, $$Há alguma pergunta?$$),
    ('n4-grammar-17', $$お待たせして、申し訳ございません。$$, $$おまたせして、もうしわけございません。$$, $$Pedimos desculpas pela espera.$$),
    ('n4-grammar-17', $$赤いセーターもございますよ。$$, $$あかいセーターもございますよ。$$, $$Também temos suéteres vermelhos.$$),
    ('n4-grammar-17', $$ご来店、ありがとうございます。$$, $$ごらいてん、ありがとうございます。$$, $$Obrigado por visitar nossa loja.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅の近くに駐車場が____。$$, $$Há um estacionamento perto da estação.$$),
        (2, $$何かご意見は____か。$$, $$Há alguma opinião?$$),
        (3, $$ご迷惑をおかけして、大変申し訳____。$$, $$Pedimos sinceras desculpas pelo transtorno.$$),
        (4, $$「Mサイズはありますか。」「はい、____。」$$, $$"Tem tamanho M?" "Sim, temos."$$),
        (5, $$恐れ入りますが、ただいま空いている席が____。$$, $$Lamentamos, mas no momento não há lugares disponíveis.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-17', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ございます$$),
        (2, $$ございます$$),
        (3, $$ございません$$),
        (4, $$ございます$$),
        (5, $$ございません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
