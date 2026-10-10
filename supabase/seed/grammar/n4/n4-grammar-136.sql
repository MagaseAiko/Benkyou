-- n4-grammar-136 — 〜てくださる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-136',
    'grammar',
    'N4',
    $$〜てくださる$$,
    $$te kudasaru$$,
    $$Fazer (algo) por mim (respeitoso)$$,
    $$てくださる é a forma respeitosa de てくれる. Ela é usada quando alguém que merece respeito, como um professor ou um superior, faz algo em benefício de quem fala.

くださる é a forma respeitosa de くれる (dar para mim). Assim, てくださる significa "alguém respeitado fez o favor de... por mim".

Quem faz a ação é o sujeito, marcado com が. Quem fala é o beneficiário.

Na forma ます, ela é irregular: em vez de くださります, diz-se くださいます. No passado, くださいました.

A forma てくださって、ありがとうございます é uma maneira muito educada de agradecer.$$,
    $$A forma てください, usada para pedidos, vem justamente de くださる no imperativo.

Comparando: 先生が教えてくださった (foco em quem fez) e 先生に教えていただいた (foco em quem recebeu) têm praticamente o mesmo sentido.

Com colegas e amigos, a forma comum てくれる é suficiente.$$,
    $$Pessoa respeitada + が + Verbo na forma て + くださる

Educado: てくださいます (forma irregular)
Passado: てくださった / てくださいました
Agradecimento: 〜てくださって、ありがとうございます$$,
    $$てくださる$$,
    $$てくださる|てくださった|てくださいました|てくださって|でくださる|でくださった|でくださいました|でくださって$$,
    ARRAY['て', 'くださる']::text[],
    ARRAY['てくださる', 'てくださいました', 'てくださった', 'てくださって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-136', $$雨の日に、先生が駅まで送ってくださいました。$$, $$あめのひに、せんせいがえきまでおくってくださいました。$$, $$Num dia de chuva, o professor me levou até a estação.$$),
    ('n4-grammar-136', $$社長がお土産を買ってくださった。$$, $$しゃちょうがおみやげをかってくださった。$$, $$O presidente comprou uma lembrancinha para nós.$$),
    ('n4-grammar-136', $$知らない方が道を教えてくださいました。$$, $$しらないかたがみちをおしえてくださいました。$$, $$Uma pessoa desconhecida me ensinou o caminho.$$),
    ('n4-grammar-136', $$いつも親切にしてくださって、ありがとうございます。$$, $$いつもしんせつにしてくださって、ありがとうございます。$$, $$Obrigado por ser sempre tão gentil comigo.$$),
    ('n4-grammar-136', $$部長が私の意見を聞いてくださった。$$, $$ぶちょうがわたしのいけんをきいてくださった。$$, $$O gerente ouviu a minha opinião.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生が私の作文を直し____。$$, $$O professor corrigiu a minha redação.$$),
        (2, $$先輩が昼ご飯をごちそうし____。$$, $$O veterano me pagou o almoço.$$),
        (3, $$お忙しいのに、手伝っ____ありがとうございます。$$, $$Obrigado por me ajudar, mesmo estando ocupado.$$),
        (4, $$部長が新しい仕事を任せ____。$$, $$O gerente me confiou um novo trabalho.$$),
        (5, $$社長が私の話を最後まで聞い____。$$, $$O presidente ouviu o que eu tinha a dizer até o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-136', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てくださいました$$),
        (1, $$てくださった$$),
        (2, $$てくださいました$$),
        (2, $$てくださった$$),
        (3, $$てくださって$$),
        (4, $$てくださいました$$),
        (4, $$てくださった$$),
        (5, $$てくださいました$$),
        (5, $$てくださった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
