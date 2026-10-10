-- n4-grammar-90 — 〜て・〜で（接続）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-90',
    'grammar',
    'N4',
    $$〜て・〜で（接続）$$,
    $$te / de (setsuzoku)$$,
    $$E / E depois / Por isso$$,
    $$A forma て (ou で) é usada para ligar frases e ideias. Ela é uma das ferramentas mais importantes do japonês, e o sentido depende do contexto.

Os usos principais são:
• Sequência de ações: uma ação depois da outra, na ordem em que acontecem.
• Lista de características: ligar adjetivos ou descrições, como "amplo e claro".
• Causa ou motivo: a primeira parte explica o resultado da segunda, como "peguei um resfriado e faltei".
• Modo: como uma ação é feita, como ir a pé ou ir de óculos.

Com verbos, usa-se a forma て. Com adjetivos い, troca-se い por くて. Com adjetivos な e substantivos, usa-se で.

O tempo e a formalidade da frase ficam apenas no último verbo.$$,
    $$Quando a forma て indica causa, a segunda parte normalmente não pode ser um pedido ou uma vontade. Nesses casos, usa-se から ou ので.

Ao ligar adjetivos, as qualidades devem ter o mesmo tom: duas positivas ou duas negativas. Para contraste, usa-se けど ou が.

O で de substantivos aqui é a forma て de です, e não a partícula で de lugar.$$,
    $$Verbo na forma て + Frase
Adjetivo い sem い + くて + Frase
Adjetivo な / Substantivo + で + Frase$$,
    $$て$$,
    $$て|で$$,
    ARRAY['て', 'で']::text[],
    ARRAY['て', 'で', 'くて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-90', $$朝起きて、顔を洗って、ご飯を食べます。$$, $$あさおきて、かおをあらって、ごはんをたべます。$$, $$De manhã, acordo, lavo o rosto e tomo café.$$),
    ('n4-grammar-90', $$この部屋は広くて、明るいです。$$, $$このへやはひろくて、あかるいです。$$, $$Este quarto é amplo e claro.$$),
    ('n4-grammar-90', $$彼は親切で、優しい人です。$$, $$かれはしんせつで、やさしいひとです。$$, $$Ele é atencioso e gentil.$$),
    ('n4-grammar-90', $$風邪をひいて、学校を休みました。$$, $$かぜをひいて、がっこうをやすみました。$$, $$Peguei um resfriado e faltei à escola.$$),
    ('n4-grammar-90', $$雨で、試合が中止になった。$$, $$あめで、しあいがちゅうしになった。$$, $$Por causa da chuva, a partida foi cancelada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$デパートへ行っ____、服を買いました。$$, $$Fui à loja de departamentos e comprei roupas.$$),
        (2, $$このかばんは安く____、便利です。$$, $$Esta bolsa é barata e prática.$$),
        (3, $$姉はきれい____、頭がいい。$$, $$Minha irmã mais velha é bonita e inteligente.$$),
        (4, $$宿題が多く____、遊ぶ時間がない。$$, $$Tenho muita lição e não sobra tempo para brincar.$$),
        (5, $$その本を読ん____、感想を書きました。$$, $$Li esse livro e escrevi minha opinião.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-90', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$て$$),
        (2, $$て$$),
        (3, $$で$$),
        (4, $$て$$),
        (5, $$で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
