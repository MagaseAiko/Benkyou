-- n3-grammar-11 — 〜べきだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-11',
    'grammar',
    'N3',
    $$〜べきだ$$,
    $$beki da$$,
    $$Deve / Deveria / É preciso$$,
    $$べきだ é usado para expressar um dever moral, uma obrigação de bom senso ou uma recomendação forte. Equivale a "deve", "deveria" ou "é preciso".

A ideia é de algo que é o certo a fazer, segundo a opinião de quem fala, as regras sociais ou a moral. Por exemplo, "promessas devem ser cumpridas" ou "se errou, deve pedir desculpas".

Ele vem depois do verbo na forma de dicionário. Com する, existem duas formas: するべき e すべき, sendo a segunda mais formal.

No passado, べきだった expressa arrependimento: "eu devia ter feito".

Como é uma opinião forte, べきだ pode soar impositivo se dito diretamente a alguém, principalmente a superiores. É comum suavizar com と思う.$$,
    $$べきだ é mais forte que ほうがいい. ほうがいい é um conselho prático; べきだ é um dever, quase moral.

べきだ não é usado para regras e leis oficiais. Para isso, usa-se なければならない.

Em textos argumentativos, べきだ aparece muito para defender opiniões.$$,
    $$Verbo na forma de dicionário + べきだ / べきです
する → するべき / すべき
Adjetivo い sem い + くあるべき
Substantivo / Adjetivo な + であるべき

Passado (arrependimento): べきだった
Antes de substantivo: べき + Substantivo$$,
    $$べきだ$$,
    $$べきだ|べきです|べき$$,
    ARRAY['べき', 'だ']::text[],
    ARRAY['べきだ', 'べきです', 'べきだった', 'すべき']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-11', $$約束は守るべきだ。$$, $$やくそくはまもるべきだ。$$, $$Promessas devem ser cumpridas.$$),
    ('n3-grammar-11', $$学生はもっと勉強するべきです。$$, $$がくせいはもっとべんきょうするべきです。$$, $$Os estudantes deveriam estudar mais.$$),
    ('n3-grammar-11', $$悪いと思ったら、すぐ謝るべきだ。$$, $$わるいとおもったら、すぐあやまるべきだ。$$, $$Se achar que errou, deve pedir desculpas logo.$$),
    ('n3-grammar-11', $$若いうちに、いろいろな経験をするべきだと思う。$$, $$わかいうちに、いろいろなけいけんをするべきだとおもう。$$, $$Acho que devemos ter várias experiências enquanto somos jovens.$$),
    ('n3-grammar-11', $$あの時、本当のことを言うべきだった。$$, $$あのとき、ほんとうのことをいうべきだった。$$, $$Naquela hora, eu devia ter dito a verdade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人の話はよく聞く____。$$, $$Devemos ouvir bem o que os outros dizem.$$),
        (2, $$困っている人がいたら、助ける____です。$$, $$Se houver alguém em dificuldade, devemos ajudar.$$),
        (3, $$自分の部屋は自分で掃除す____だ。$$, $$Cada um deve limpar o próprio quarto.$$),
        (4, $$こんなに悪くなる前に、もっと早く医者に行く____。$$, $$Eu devia ter ido ao médico antes de piorar tanto.$$),
        (5, $$子供の意見も大切にする____だと思う。$$, $$Acho que devemos valorizar também a opinião das crianças.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-11', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$べきだ$$),
        (1, $$べきです$$),
        (2, $$べき$$),
        (3, $$べき$$),
        (4, $$べきだった$$),
        (5, $$べき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
