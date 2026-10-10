-- n3-grammar-94 — 〜を込めて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-94',
    'grammar',
    'N3',
    $$〜を込めて$$,
    $$wo komete$$,
    $$Com (sentimento) / Cheio de / Colocando$$,
    $$を込めて é usado para dizer que alguém faz algo colocando um sentimento ou uma intenção naquela ação. Equivale a "com", "cheio de" ou "colocando".

込める significa "colocar dentro". Assim, a ideia é "colocar o coração, o amor ou a gratidão dentro daquilo que se faz".

Os substantivos mais comuns antes de を込めて são 心 (coração), 愛 / 愛情 (amor), 感謝 (gratidão), 願い (desejo, prece), 気持ち (sentimento) e 力 (força).

É muito usado ao falar de presentes, cartas, comida feita com carinho, músicas e orações.$$,
    $$心を込めて é uma expressão muito comum e significa "de todo coração", "com todo carinho".

Em cartões e mensagens, frases como 感謝を込めて ("com gratidão") aparecem no final, como assinatura.

力を込めて é usado de forma física, com o sentido de "com toda a força".$$,
    $$Substantivo (sentimento) + を込めて + Verbo
Substantivo + を込めた + Substantivo (algo feito com...)

Escrita: を込めて / をこめて$$,
    $$を込めて$$,
    $$を込めて|をこめて|を込め$$,
    ARRAY['を', '込めて']::text[],
    ARRAY['を込めて', 'をこめて', 'を込めた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-94', $$心を込めて手紙を書きました。$$, $$こころをこめててがみをかきました。$$, $$Escrevi a carta de todo coração.$$),
    ('n3-grammar-94', $$感謝を込めて、先生にプレゼントを贈った。$$, $$かんしゃをこめて、せんせいにプレゼントをおくった。$$, $$Dei um presente ao professor, cheio de gratidão.$$),
    ('n3-grammar-94', $$母はいつも愛情を込めて料理を作る。$$, $$はははいつもあいじょうをこめてりょうりをつくる。$$, $$Minha mãe sempre cozinha com muito carinho.$$),
    ('n3-grammar-94', $$合格の願いを込めて、お守りを買った。$$, $$ごうかくのねがいをこめて、おまもりをかった。$$, $$Comprei um amuleto, desejando passar na prova.$$),
    ('n3-grammar-94', $$力を込めて、重いドアを押した。$$, $$ちからをこめて、おもいドアをおした。$$, $$Empurrei a porta pesada com toda a força.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は気持ち____、歌を歌った。$$, $$Ela cantou a música com todo o sentimento.$$),
        (2, $$祖母は愛____、セーターを編んでくれた。$$, $$Minha avó tricotou um suéter para mim com todo o amor.$$),
        (3, $$お礼の気持ち____、花を贈ります。$$, $$Envio estas flores em agradecimento.$$),
        (4, $$平和への願い____、鐘を鳴らした。$$, $$Tocaram o sino com um desejo de paz.$$),
        (5, $$この旅館では、心____お客様をもてなす。$$, $$Nesta pousada, recebemos os hóspedes de todo coração.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-94', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を込めて$$),
        (1, $$をこめて$$),
        (2, $$を込めて$$),
        (2, $$をこめて$$),
        (3, $$を込めて$$),
        (3, $$をこめて$$),
        (4, $$を込めて$$),
        (4, $$をこめて$$),
        (5, $$を込めて$$),
        (5, $$をこめて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
