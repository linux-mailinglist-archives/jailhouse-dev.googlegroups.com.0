Return-Path: <jailhouse-dev+bncBD37PS7EWQCRBBW26CZAMGQESEAKYGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb40.google.com (mail-yb1-xb40.google.com [IPv6:2607:f8b0:4864:20::b40])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EF38D7445
	for <lists+jailhouse-dev@lfdr.de>; Sun,  2 Jun 2024 10:27:52 +0200 (CEST)
Received: by mail-yb1-xb40.google.com with SMTP id 3f1490d57ef6-dfa744fe2f9sf3315537276.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 02 Jun 2024 01:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717316871; x=1717921671; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HAu63psuzwruiL0CL7yc/9Z/0i91oDfd5DqQVvxG4TU=;
        b=hyfZzNdGg+U+Hbz6L8hTuS4wOv92G5sq5eM7tSobrbxU3BvzawLGvtnGCYQ58u+/R1
         Z7miBY6fvRSQ5whTUBKnhypaVcLyZQajc+x18P/4vLbjomAz58xO6hCcvmBbc1r8d5E1
         h5vc41eHtzR4fvxWOqt3i5ir9Lg27V2oi6YlN2srkNBcJLJA9PmPOP6WZv0I6o1hufK3
         UGdlLZHK4DXdCvISarZkVtOB/7gzHqYo52CMRqAlVYAPHsHL70lfY2PB2DVYKcgoPP+a
         /39ZtUlqschRBy7oskT4tqP2qe51vtAUuxeZ0Z3V0pLFC2g5FN8HH4N8MOwmvz2La6Qx
         HjLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717316871; x=1717921671; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAu63psuzwruiL0CL7yc/9Z/0i91oDfd5DqQVvxG4TU=;
        b=PMxYQ24CLxX4ii4PMyuoQnzwiLQ9sek83rtzVsdeqdmtLJA4DZOfgVwOyMA9oY9EWx
         SiMYWfGyVrjN7axXNaK5K2Z8PCkYpnasq/EbdX0Nwbsi9M6kJdwtn84TOGRMbdXlGjt3
         FSPKhgBPN3YMT8Mx3lJtzFDaDgkh0dUNvTbQC5oteKS5qWHAFZfBIeXxqyHPlYAIfxNd
         /ISdeYavQX+4gU9jviJ+Jia19jytXHfTwiKqUFBwV9cDl0KKI5F6P2DZcLN0yqAr7LmS
         BkOpaw0CKrS7E7XA1E1kgMaai+XZ2UUJOKgSrrpsioWAIIrgrmgcci1mKroEBSdZDjaa
         rREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717316871; x=1717921671;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HAu63psuzwruiL0CL7yc/9Z/0i91oDfd5DqQVvxG4TU=;
        b=VtS/OWakNwgKJnzbplTaraUSqe6okJ0/URn1Hedu3DRvypa6RWwDmkKjT2lJW1rMm7
         HW4i8rRGLtmiT4o5Hz3AeiQlVEwS0lKP8WE7GdDm1P04B2djVPQEDRTJf1AOShJiCM9O
         cmq7fAprh3TOcpINrS8t8pQIbgCFAaMnkr6JnIZ+jRPR5oK1ojOeF9e/BvHx1daUy8DQ
         madnTZOWkPXFuTLgOHnfLWzxFgzqvPaUHBw8ZTMA/I3/9vJMLY9lNirvS4H6SPMH5hvO
         ZLOO7DRWkRSi7xg70BY/8CpLwHvh69J6PH1CqaDohsIsArovhMstan/0UwS/k+0qMIax
         sfrw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXW+goTNZiB9iPetbAkFd2TUqW6kFZG0ZQv3Y3EmWvNDKDMDbb/q5RQ4bJ3Tj4zwMFssDDvbvhWRgv6KKoYXE5Uq56UW4PcHT1DIxE=
X-Gm-Message-State: AOJu0YzzW/VPRNjyLcKv67j4/5/ClUPImHwCb+OD0mwEI2yaeIOABzY4
	wCCvszgL3BleK74ZGRUWJg/dJrEdKywpwkKPfX1urNoqH180Swzb
X-Google-Smtp-Source: AGHT+IHul5igS3ksqCmvj2tFtsre/fqaJy2t4qPfb/quuno92I9ZNmbG5rEal3+usAfdl9S7apx0CQ==
X-Received: by 2002:a25:ab61:0:b0:dee:6070:693f with SMTP id 3f1490d57ef6-dfa73c46781mr6185723276.37.1717316871114;
        Sun, 02 Jun 2024 01:27:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:d88a:0:b0:df7:8d99:b81f with SMTP id 3f1490d57ef6-dfa595dfa62ls293483276.0.-pod-prod-07-us;
 Sun, 02 Jun 2024 01:27:49 -0700 (PDT)
X-Received: by 2002:a05:690c:6609:b0:615:32e1:d82c with SMTP id 00721157ae682-62c7981dcc5mr22062357b3.6.1717316869256;
        Sun, 02 Jun 2024 01:27:49 -0700 (PDT)
Date: Sun, 2 Jun 2024 01:27:48 -0700 (PDT)
From: Asah Randy <asahrandy54@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f2ee268a-9788-4c77-a180-8384ff1a1b5cn@googlegroups.com>
In-Reply-To: <82a144e2-6359-4ef8-8919-a784e82897afn@googlegroups.com>
References: <ba978c38-a6be-4d27-ac21-31299ce61affn@googlegroups.com>
 <cb3b68b2-1d11-4956-842e-9d1ec707936an@googlegroups.com>
 <82a144e2-6359-4ef8-8919-a784e82897afn@googlegroups.com>
Subject: Re: BUY ONE UP MUSHROOM CHOCOLATE BARS ONLINE IN USA
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_348699_1874734749.1717316868423"
X-Original-Sender: asahrandy54@gmail.com
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

------=_Part_348699_1874734749.1717316868423
Content-Type: multipart/alternative; 
	boundary="----=_Part_348700_1486362252.1717316868423"

------=_Part_348700_1486362252.1717316868423
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://t.me/prime_house00

Great Taste =E2=80=93 A chocolate bar that makes you trip your face off. Ho=
w could=20
that not be the dream?

Clean High =E2=80=93 We formulated this chocolate bar to produce a clean hi=
gh that=20
won=E2=80=99t leave you crashing after the initial peak. shroom chocolate

True Psychedelic Experience -Just cause it doesn=E2=80=99t taste like mushr=
ooms=20
doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any=
 drop in the quality of=20
your trip, in fact, you may even decide to switch to edibles!

Sneaky =E2=80=93 Sure, Magic Mushrooms are not legal in USA but that doesn=
=E2=80=99t=20
necessarily mean you want to be seen stuffing your face with them. For=20
those who want to keep it classy and discrete, nibbling on some chocolate=
=20
is the way to go. shroom chocolate bar

Versatile Dosage =E2=80=93 The combined 3.5g of mushrooms in this chocolate=
 can be=20
broken up for versatile dosage. Each square of this chocolate bar contains=
=20
approximately .6g of Magic Mushrooms, while each bar contains 3.5g. Whether=
=20
it=E2=80=99s a micro-dose or a full-on journey, this chocolate bar has got =
you=20
covered. shroom chocolate bar

https://t.me/prime_house00

On Sunday, June 2, 2024 at 2:25:35=E2=80=AFAM UTC-6 Asah Randy wrote:

https://t.me/prime_house00

Buy Good Trip Mushroom Chocolate Bars Online

Have you ever wished mushrooms tasted better? We=E2=80=99re here to grant t=
hat wish=20
by bringing you our Good Trip Mushroom Chocolate Bar. This bar is tasty,=20
irresistible also, contains a total of 3.5g of Magic Mushrooms ( 6 grams=20
per chocolate square). And can be broken off into squares for flexible=20
shroom dosage.


https://t.me/prime_house00

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f2ee268a-9788-4c77-a180-8384ff1a1b5cn%40googlegroups.com.

------=_Part_348700_1486362252.1717316868423
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>https://t.me/prime_house00</div><div><br /></div><div>Great Taste =E2=
=80=93 A chocolate bar that makes you trip your face off. How could that no=
t be the dream?<br /><br />Clean
 High =E2=80=93 We formulated this chocolate bar to produce a clean high th=
at=20
won=E2=80=99t leave you crashing after the initial peak. shroom chocolate<b=
r /><br />True
 Psychedelic Experience -Just cause it doesn=E2=80=99t taste like mushrooms=
=20
doesn=E2=80=99t mean it=E2=80=99s not mushrooms. You won=E2=80=99t find any=
 drop in the quality=20
of your trip, in fact, you may even decide to switch to edibles!<br /><br /=
>Sneaky
 =E2=80=93 Sure, Magic Mushrooms are not legal in USA but that doesn=E2=80=
=99t=20
necessarily mean you want to be seen stuffing your face with them. For=20
those who want to keep it classy and discrete, nibbling on some=20
chocolate is the way to go. shroom chocolate bar<br /><br />Versatile Dosag=
e
 =E2=80=93 The combined 3.5g of mushrooms in this chocolate can be broken u=
p for
 versatile dosage. Each square of this chocolate bar contains=20
approximately .6g of Magic Mushrooms, while each bar contains 3.5g.=20
Whether it=E2=80=99s a micro-dose or a full-on journey, this chocolate bar =
has=20
got you covered. shroom chocolate bar<br /><br /></div><div>https://t.me/pr=
ime_house00</div><br /><div><div dir=3D"auto">On Sunday, June 2, 2024 at 2:=
25:35=E2=80=AFAM UTC-6 Asah Randy wrote:<br /></div><blockquote style=3D"ma=
rgin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding=
-left: 1ex;"><div><a href=3D"https://t.me/prime_house00" target=3D"_blank" =
rel=3D"nofollow">https://t.me/prime_house00</a></div><div><br /></div><div>=
Buy Good Trip Mushroom Chocolate Bars Online<br /><br />Have you ever wishe=
d
 mushrooms tasted better? We=E2=80=99re here to grant that wish by bringing=
 you=20
our Good Trip Mushroom Chocolate Bar. This bar is tasty, irresistible=20
also, contains a total of 3.5g of Magic Mushrooms ( 6 grams per=20
chocolate square). And can be broken off into squares for flexible=20
shroom dosage.</div><div><br /></div><div><br /></div><a href=3D"https://t.=
me/prime_house00" target=3D"_blank" rel=3D"nofollow">https://t.me/prime_hou=
se00</a><br /></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f2ee268a-9788-4c77-a180-8384ff1a1b5cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f2ee268a-9788-4c77-a180-8384ff1a1b5cn%40googlegroups.co=
m</a>.<br />

------=_Part_348700_1486362252.1717316868423--

------=_Part_348699_1874734749.1717316868423--
