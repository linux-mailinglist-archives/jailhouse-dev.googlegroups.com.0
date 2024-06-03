Return-Path: <jailhouse-dev+bncBDY4BJFJYAMBBJ6O62ZAMGQETLYA4AY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4998D80F4
	for <lists+jailhouse-dev@lfdr.de>; Mon,  3 Jun 2024 13:21:13 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-dfa8ab88a8csf2540442276.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2024 04:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717413672; x=1718018472; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt/CesQIb8f6krju2D2KoTd6soeMdAWMKUZ75nQhlrY=;
        b=Iwurlcs8844PUmz6deVxP4a2vGLg50PDwx4+41SzlZz50ET4ZM2yDZu0ODRX5SPwe4
         jWgfVHN+Im2Qa8gYbPv8+CPcOw7hSr3SARwiJ8iFHUVyv6vT4dsovTkuZjfsTFKyqIlI
         oRgdj4zV9uFcs1mmzdKAOnJcPqg3FUVI4EeiPmbsulHsXbmDuKoQ308FiWXtTYyL+z/4
         B9gF7PdjTDJfZ9eSaIKzIxtn2FUQsctEnya1HCOu+oERYPL9V20z97ehQwVDwwj52YzN
         ddPM+r/jA80ohodyiCMkMOl3BMkjJ1iDm1r4LVo3cvLpIgtgdIisZ6szvNzYUBJBwvhe
         intQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717413672; x=1718018472; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bt/CesQIb8f6krju2D2KoTd6soeMdAWMKUZ75nQhlrY=;
        b=WiIEDq0oQKRjU5oAYjS0Fv25r3zgZV1VqX2G4dSj9XsncEMP3o/z6JfkeM1aIejjbb
         6TbImL/Zktbr+rRJt3RqcwlWi6BTLxzEJCKCuIQvIJQkjlLD9oZYgyHssefcLYXJIwXN
         nJaa4+mxv2t1BTetoAVqmgNM6YEKsA4Tfq+zSFe+IGVouI6+fuq6GXmCw91orlPv3DWW
         Lr7O3dEgZg9l/L4W8lr9rJOsrRnu6y5kR3wJjjUdR3hH3jxsDpIkfnYFwaG6nb3b1oAl
         awfQ/9BRvJ3kBKQHTJ6N1DMplOvTUfL2j8NELgY2yBTyUT/9WdAoHj3ket/qYC7X7Enh
         vqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717413672; x=1718018472;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt/CesQIb8f6krju2D2KoTd6soeMdAWMKUZ75nQhlrY=;
        b=a6IkmK1gcFJkvBvKjwh8GL07SJWl3pKYYmTYovjBZqth0R5+BzEHxUAwj56N6To4lv
         +dQ1bhr/gr1K+3uk1sfLRVtF+v98sRESeDoy4lZ59VTAhvBpo6wQ3FQWEAf20HMWMvO7
         ClrkpphHUvrTHmLSb/jPdnFLHD1NfpKq3lvvfra2hwBwPo9SmDlIULBxaDDdjzBl/vxx
         DjwXhiP7/LpiaSxCaisUHhdbSOwH47ltO93u35wuNnxtxh5oMinJDsQE08dv1Q3I/jN4
         Ru1hP6bBkcirguAL1eA9eU1q9F/0yW3461a/eal9qIR6Q5usWN0mdO9gcVqY6eMXrtQU
         89Iw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCX2WkPiZB+I7t9hNDCTJEiHilSSrBrtRvL2kGJp6fFQnbEWUOXsv7392WR+FBU0d/TbhtPnQusmDMCwtXq/x8NqHGyaDEi2uVj5Thw=
X-Gm-Message-State: AOJu0YwCMX1zG0M0iaKfow4lweOHfOs0rlrTlcQ7b4OYdRJKiorMMJLm
	bJ6XDrKfAWqQjYUG+i+CAQ4/Pr3xi9pbIWRMYzLAIrWh7vqRsuby
X-Google-Smtp-Source: AGHT+IGlOC8ZCYQnZSyJ9iEbIdm6NTIJoMqLc6KOwTEDsIj62QTxncPWqdjcVkiXckFFRMMz6pd5Jg==
X-Received: by 2002:a25:d694:0:b0:df4:b3ca:d322 with SMTP id 3f1490d57ef6-dfa73c1f5a0mr7807480276.17.1717413672252;
        Mon, 03 Jun 2024 04:21:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:7452:0:b0:dfa:8028:8bc9 with SMTP id 3f1490d57ef6-dfa80288e05ls391086276.1.-pod-prod-06-us;
 Mon, 03 Jun 2024 04:21:09 -0700 (PDT)
X-Received: by 2002:a05:690c:11:b0:627:7f58:ebe with SMTP id 00721157ae682-62c794afd61mr27191207b3.0.1717413669115;
        Mon, 03 Jun 2024 04:21:09 -0700 (PDT)
Date: Mon, 3 Jun 2024 04:21:08 -0700 (PDT)
From: jakson Kelooscoponis <jaksonkelooscoponis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cc1769fe-33b1-433f-890a-fdefa2e7bd3dn@googlegroups.com>
Subject: +17754424473 Purchase K2 Sheets Online (Diablo!!)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_79260_2141545319.1717413668288"
X-Original-Sender: jaksonkelooscoponis@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_79260_2141545319.1717413668288
Content-Type: multipart/alternative; 
	boundary="----=_Part_79261_1564015750.1717413668288"

------=_Part_79261_1564015750.1717413668288
Content-Type: text/plain; charset="UTF-8"

Whatsapp +1(775)442-4473.Each k2 sheets is infused with 300ml of the k2 
liquid diablo incense k2 Liquid.
I have the k2 sheets/k2 paper available. I can ship all over unites states 
and out.
If you need very strong k2 sheets  contact me .
I ship k2 sheets directly to jails.
I can send It out legal mail or overnight if needed.
I can infuse k2 sheets ,k2 envelopes,K2 magazines, k2 books,.
The k2 sheets or paper can be sent directly from a bookstore or via amazon 
if needed.
Contact me to place your order 
Text/call or whatsapp :+1(775)442-4473.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cc1769fe-33b1-433f-890a-fdefa2e7bd3dn%40googlegroups.com.

------=_Part_79261_1564015750.1717413668288
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Whatsapp +1(775)442-4473.Each k2 sheets is infused with 300ml of the k2 liq=
uid diablo incense k2 Liquid.<div>I have the k2 sheets/k2 paper available. =
I can ship all over unites states and out.</div><div>If you need very stron=
g k2 sheets =C2=A0contact me .</div><div>I ship k2 sheets directly to jails=
.</div><div>I can send It out legal mail or overnight if needed.</div><div>=
I can infuse k2 sheets ,k2 envelopes,K2 magazines, k2 books,.</div><div>The=
 k2 sheets or paper can be sent directly from a bookstore or via amazon if =
needed.</div><div>Contact me to place your order=C2=A0</div><div>Text/call =
or whatsapp :+1(775)442-4473.</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cc1769fe-33b1-433f-890a-fdefa2e7bd3dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cc1769fe-33b1-433f-890a-fdefa2e7bd3dn%40googlegroups.co=
m</a>.<br />

------=_Part_79261_1564015750.1717413668288--

------=_Part_79260_2141545319.1717413668288--
