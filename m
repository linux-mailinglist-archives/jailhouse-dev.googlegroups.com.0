Return-Path: <jailhouse-dev+bncBDP6NU6J6UIRB4PJRKZAMGQEVF3RTZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1140.google.com (mail-yw1-x1140.google.com [IPv6:2607:f8b0:4864:20::1140])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C28C4A96
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 May 2024 02:48:51 +0200 (CEST)
Received: by mail-yw1-x1140.google.com with SMTP id 00721157ae682-61be530d024sf90322077b3.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 13 May 2024 17:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1715647730; x=1716252530; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DfuYkDynFw5UEWUVzigMMc/Mx1i6sg5w2FlLG9a6ms=;
        b=Gr9c/QqRmB+QKZ5yzj4zXjBN2g4bggekKNN+IoQhGt9NQbhfEgLffEXWtNJLVunMXb
         aGnDWzHTaIGPMDKfgIpv/83m42GDgVZTVczBHTFUj4BEgKYvAQOeCpRoG6BZeahGGu3d
         TIPL+ddC/GMgFeF7nP21YVxPDLt4M3BRhd/1IW1U0+Z18G8r2sm11kEbsIlLQqAlfE60
         By1JYv0sFV9DcpnTpWd93LH/JnOsVUAtXpYAXtNMUta6DpgkXCf2wG9G8r12LY3LMtAt
         cmy7cOCF+NoKCR8Ul5aaEoCizqJS8pTQy3tkiGjnTx6riiSo3/MaFDkn94oszT7UhUjE
         mB1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715647730; x=1716252530; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DfuYkDynFw5UEWUVzigMMc/Mx1i6sg5w2FlLG9a6ms=;
        b=Y7T+o9fv+Tvo36fpCgshahK2jmnWDvYrqrY16CrwIVOkpPRmdB+7e2gnoQM6l5PkYK
         jmrToaL/hC1v8RHGFeyOBsUDtfhe3hQRe8JJVRCQHsmcnz5N4TAjMikt/jkf2F0Pb8d1
         C7Ab3GVdKUzO0o7SH/ldZ7/ZnJ6qftGYJTWv9ql23ChAkKdGbB2lPUsJplKwcnTtu7bB
         1DSVi9zj2yPzZSEJbYJ1vh+jIXmVjdWzMvhT3EHxiljPz6234T8o7DTRM3VvnDvXzk7K
         m1wTwEQnLgnSKUjK1u6DAM4FulimPQV9Z+NoyOG79nRClFI1+/4Kdm+oy3GZ9SarOVUs
         1zYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715647730; x=1716252530;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DfuYkDynFw5UEWUVzigMMc/Mx1i6sg5w2FlLG9a6ms=;
        b=Q/ZGwjH5WfDI2Jj0QVHgMuyEmwtF1aNex8iz3RAHlGtEKJg6g8SG4TJet9IsHo4n9t
         tdq4997Gj8Q5ROcuE74DSaw5PjLeBqy7ofHc0MG71O8V1Swfi+mfPXBvTlw+U8HEB+E+
         HvOl5abvRyaeXULhjoyC6xzuXJ2s3FZ7+OVsS6KDmbPn4cwCjO0V5gJTyJ3jhXMYeCNu
         MqETJ8drslRm5PvD3M8t4qMZ0ri5poRkz1B2mP53qubSxUS5vjKa+7dK2TKII9/c+HJV
         AfQORKcYTofsGiZnU/0ZwdLkNQBVC2guqmK6L2PN72HAURqrvWMow1fNhDH7qhDjo7OR
         Qkjg==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCV823jbww6+HHYqSKLaJPm2udaN8Vp95gIA5V61G5e/AfR/9Yk3DW0Nqv01rp3JXpOB0wC4KgAYzN7fgMUIAs2IXiXgC7W4/FvzBAc=
X-Gm-Message-State: AOJu0Yxd4Gqgm59mGHtGc/OsAXYc0mPDm3EsTAgo9k4YaA0tBlEadavY
	NAYM1b29TnZIYI2ciITZvV54y/+BVeWbkQo5Eh0YkRzRmQSohOxJ
X-Google-Smtp-Source: AGHT+IGdJLDlbrcZjBhbyZWxseziJ7PR8Hh3Gk5JZd4oO8TikOGpFY0uzLoU4XcUtYy487qipIegKQ==
X-Received: by 2002:a25:c583:0:b0:de7:61db:9fa0 with SMTP id 3f1490d57ef6-dee4f2e35b4mr11651247276.22.1715647729955;
        Mon, 13 May 2024 17:48:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e0c8:0:b0:dcd:202d:6be8 with SMTP id 3f1490d57ef6-debd08924ffls648805276.2.-pod-prod-08-us;
 Mon, 13 May 2024 17:48:48 -0700 (PDT)
X-Received: by 2002:a25:6988:0:b0:de5:1b63:9ee5 with SMTP id 3f1490d57ef6-dee4f30f5a0mr2668613276.7.1715647728170;
        Mon, 13 May 2024 17:48:48 -0700 (PDT)
Date: Mon, 13 May 2024 17:48:47 -0700 (PDT)
From: James Maria <mariaborn90@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <411c47a5-46dd-43e6-8890-d9f9ec3194c6n@googlegroups.com>
In-Reply-To: <0dac6431-9ee5-4e3e-947f-0b4e57b3fa3en@googlegroups.com>
References: <3b4005f3-1358-4a8d-a1de-33b9d33af2b9n@googlegroups.com>
 <b24f7f82-7667-4b17-8b90-2f0623d67456n@googlegroups.com>
 <e74f2255-4113-4917-8e75-6a65899cb81fn@googlegroups.com>
 <0dac6431-9ee5-4e3e-947f-0b4e57b3fa3en@googlegroups.com>
Subject: WHERE TO ORDER POLKADOT DMT LSD SHEETS, BLOTTER ONLINE IN UK
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_299660_626046436.1715647727404"
X-Original-Sender: mariaborn90@gmail.com
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

------=_Part_299660_626046436.1715647727404
Content-Type: multipart/alternative; 
	boundary="----=_Part_299661_1364879984.1715647727404"

------=_Part_299661_1364879984.1715647727404
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


The Golden Teacher mushroom is a popular strain of psilocybin mushrooms,=20
scientifically known as Psilocybe cubensis. This strain is well-known and=
=20
often sought after by cultivators and users in the psychedelic community=20
due to its relatively easy cultivation and moderate potency.

am a supplier of good top quality medicated cannabis , peyote, MDMA,=20
Ketamine carts,shrooms, LSD, pills, edibles, cookies, vapes ,Dmt, dabs,THC=
=20
gummies, codine, syrup,wax, crumble catrages,hash, chocolate bars, flowers=
=20
and many more.
tapin our telegram for quick response.

Some key characteristics of the Golden Teacher mushroom strain include:
Appearance: The Golden Teacher strain typically features large,=20
golden-capped mushrooms with a distinct appearance. When mature, the caps=
=20
can take on a golden or caramel color, while the stem is usually thick and=
=20
white.
Potency: Golden Teachers are considered moderately potent among psilocybin=
=20
mushrooms. Their effects can vary depending on factors such as growing=20
conditions, individual tolerance, and dosage. Users generally report a=20
balance between visual and introspective effects.
Effects: Like other psilocybin-containing mushrooms, consuming Golden=20
Teacher mushrooms can lead to altered states of consciousness characterized=
=20
by visual and auditory hallucinations, changes in perception of time and=20
space, introspection, and sometimes a sense of unity or connection with=20
one's surroundings.
Cultivation: Golden Teachers are favored by cultivators due to their=20
relatively straightforward cultivation process. They are known for being=20
resilient and adaptable, making them a suitable choice for beginners in=20
mushroom cultivation.

Buds, flowers, carts=20
https://t.me/psychedelicvendor17/297
https://t.me/psychedelicvendor17/296
https://t.me/psychedelicvendor17/295
https://t.me/psychedelicvendor17/261
https://t.me/psychedelicvendor17/133
https://t.me/psychedelicvendor17/95
https://t.me/psychedelicvendor17/69

Clone cards=20
https://t.me/psychedelicvendor17/291
https://t.me/psychedelicvendor17/267
https://t.me/psychedelicvendor17/263
https://t.me/psychedelicvendor17/166
https://t.me/psychedelicvendor17/164
https://t.me/psychedelicvendor17/88
https://t.me/psychedelicvendor17/11

Mushrooms, penis envy=20
https://t.me/psychedelicvendor17/235?single
https://t.me/psychedelicvendor17/169?single
https://t.me/psychedelicvendor17/235?single

Vapes DMT, catrages=20
https://t.me/psychedelicvendor17/4
https://t.me/psychedelicvendor17/6
https://t.me/psychedelicvendor17/26?single
https://t.me/psychedelicvendor17/30?single
https://t.me/psychedelicvendor17/440?single

MDMA molly=20
https://t.me/psychedelicvendor17/280
https://t.me/psychedelicvendor17/293
https://t.me/psychedelicvendor17/157?single
https://t.me/psychedelicvendor17/441

LSD sheets, blotter=20
https://t.me/psychedelicvendor17/218?single
https://t.me/psychedelicvendor17/203?single
https://t.me/psychedelicvendor17/116
https://t.me/psychedelicvendor17/185

DMT acid, vapes=20
https://t.me/psychedelicvendor17/26?single
https://t.me/psychedelicvendor17/44
https://t.me/psychedelicvendor17/45
https://t.me/psychedelicvendor17/193
https://t.me/psychedelicvendor17/228

Pills, Xanax edibles=20
https://t.me/psychedelicvendor17/152
https://t.me/psychedelicvendor17/570
https://t.me/psychedelicvendor17/554

Hash rosin=20
https://t.me/psychedelicvendor17/576?single
https://t.me/psychedelicvendor17/337

Gummies=20
https://t.me/dmtcartforsale/276[image: IMG_20240430_084822_435.jpg]
On Saturday, May 11, 2024 at 12:54:44=E2=80=AFPM UTC+1 Justin Baker wrote:

> https://t.me/dannyw23official
> =20
> https://t.me/dannyw23official
> =20
> Polkadot Magic  Belgian Milk Chocolate is not only delicious, but it=20
> equates to 4 grams of psilocybin-containing . Aside from the fantastic,=
=20
> mind-blowing effects, you get from eating the bars and polka dot company=
=20
> chocolate, they are also a great way to microdose magic . Microdosing mag=
ic=20
> in the form of consumption. Polkadot Magic Belgian Milk Chocolate is not=
=20
> only delicious, but it equates to 4 grams of psilocybin-containing . Asid=
e=20
> from the fantastic, mind-blowing effects, you get from eating the and pol=
ka=20
> dot company chocolate, they are also a great way to microdose magic =20
> Microdosing magic in the form of consuming  chocolate bars=20
> =20
> https://t.me/dannyw23official
> =20
> https://t.me/dannyw23official
> =20
> =20
> https://t.me/dannyw23official
> =20
> =20
> https://t.me/dannyw23official
>
> On Thursday, May 9, 2024 at 4:43:06=E2=80=AFPM UTC-7 Harry Conor wrote:
>
>>
>> Buy your psychedelic products fast and safe delivery=20
>> https://t.me/highlandview=20
>> https://t.me/highlandview=20
>>
>> > =E2=9C=94US-US Delivery=20
>> > =E2=9C=94Fast Shipping=20
>> > =E2=9C=94Secure Payment Options=20
>> > =E2=9C=94100% Satisfaction Guaranteed=20
>> > =E2=9C=943 Days Refund Policy=20
>> > =E2=9C=94100% Money-Back if any issue with the product=20
>> > =E2=9C=94Shipping Service: Express/Standard/Economy=20
>> > =E2=9C=94Estimated Delivery Time: Express & 3-5 Days=20
>> > =E2=9C=94Discounts: Get up to 20% off=20
>>
>> https://t.me/highlandview=20
>> https://t.me/highlandview=20
>> https://t.me/highlandview=20
>> https://t.me/highlandview
>> On Tuesday 7 May 2024 at 11:41:20 UTC-7 James Maria wrote:
>>
>>>
>>> The Golden Teacher mushroom is a popular strain of psilocybin mushrooms=
,=20
>>> scientifically known as Psilocybe cubensis. This strain is well-known a=
nd=20
>>> often sought after by cultivators and users in the psychedelic communit=
y=20
>>> due to its relatively easy cultivation and moderate potency.
>>>
>>> am a supplier of good top quality medicated cannabis , peyote, MDMA,=20
>>> Ketamine carts,shrooms, LSD, pills, edibles, cookies, vapes ,Dmt, dabs,=
THC=20
>>> gummies, codine, syrup,wax, crumble catrages,hash, chocolate bars, flow=
ers=20
>>> and many more.
>>> tapin our telegram for quick response.
>>>
>>> Some key characteristics of the Golden Teacher mushroom strain include:
>>> Appearance: The Golden Teacher strain typically features large,=20
>>> golden-capped mushrooms with a distinct appearance. When mature, the ca=
ps=20
>>> can take on a golden or caramel color, while the stem is usually thick =
and=20
>>> white.
>>> Potency: Golden Teachers are considered moderately potent among=20
>>> psilocybin mushrooms. Their effects can vary depending on factors such =
as=20
>>> growing conditions, individual tolerance, and dosage. Users generally=
=20
>>> report a balance between visual and introspective effects.
>>> Effects: Like other psilocybin-containing mushrooms, consuming Golden=
=20
>>> Teacher mushrooms can lead to altered states of consciousness character=
ized=20
>>> by visual and auditory hallucinations, changes in perception of time an=
d=20
>>> space, introspection, and sometimes a sense of unity or connection with=
=20
>>> one's surroundings.
>>> Cultivation: Golden Teachers are favored by cultivators due to their=20
>>> relatively straightforward cultivation process. They are known for bein=
g=20
>>> resilient and adaptable, making them a suitable choice for beginners in=
=20
>>> mushroom cultivation.
>>>
>>> Buds, flowers, carts=20
>>> https://t.me/psychedelicvendor17/297
>>> https://t.me/psychedelicvendor17/296
>>> https://t.me/psychedelicvendor17/295
>>> https://t.me/psychedelicvendor17/261
>>> https://t.me/psychedelicvendor17/133
>>> https://t.me/psychedelicvendor17/95
>>> https://t.me/psychedelicvendor17/69
>>>
>>> Clone cards=20
>>> https://t.me/psychedelicvendor17/291
>>> https://t.me/psychedelicvendor17/267
>>> https://t.me/psychedelicvendor17/263
>>> https://t.me/psychedelicvendor17/166
>>> https://t.me/psychedelicvendor17/164
>>> https://t.me/psychedelicvendor17/88
>>> https://t.me/psychedelicvendor17/11
>>>
>>> Mushrooms, penis envy=20
>>> https://t.me/psychedelicvendor17/235?single
>>> https://t.me/psychedelicvendor17/169?single
>>> https://t.me/psychedelicvendor17/235?single
>>>
>>> Vapes DMT, catrages=20
>>> https://t.me/psychedelicvendor17/4
>>> https://t.me/psychedelicvendor17/6
>>> https://t.me/psychedelicvendor17/26?single
>>> https://t.me/psychedelicvendor17/30?single
>>> https://t.me/psychedelicvendor17/440?single
>>>
>>> MDMA molly=20
>>> https://t.me/psychedelicvendor17/280
>>> https://t.me/psychedelicvendor17/293
>>> https://t.me/psychedelicvendor17/157?single
>>> https://t.me/psychedelicvendor17/441
>>>
>>> LSD sheets, blotter=20
>>> https://t.me/psychedelicvendor17/218?single
>>> https://t.me/psychedelicvendor17/203?single
>>> https://t.me/psychedelicvendor17/116
>>> https://t.me/psychedelicvendor17/185
>>>
>>> DMT acid, vapes=20
>>> https://t.me/psychedelicvendor17/26?single
>>> https://t.me/psychedelicvendor17/44
>>> https://t.me/psychedelicvendor17/45
>>> https://t.me/psychedelicvendor17/193
>>> https://t.me/psychedelicvendor17/228
>>>
>>> Pills, Xanax edibles=20
>>> https://t.me/psychedelicvendor17/152
>>> https://t.me/psychedelicvendor17/570
>>> https://t.me/psychedelicvendor17/554
>>>
>>> Hash rosin=20
>>> https://t.me/psychedelicvendor17/576?single
>>> https://t.me/psychedelicvendor17/337
>>>
>>> Gummies=20
>>> https://t.me/dmtcartforsale/276[image: IMG_20240418_004250_343.jpg]
>>> On Monday, April 22, 2024 at 6:51:02=E2=80=AFPM UTC+1 James Maria wrote=
:
>>>
>>>> The Golden Teacher mushroom is a popular strain of psilocybin=20
>>>> mushrooms, scientifically known as Psilocybe cubensis. This strain is=
=20
>>>> well-known and often sought after by cultivators and users in the=20
>>>> psychedelic community due to its relatively easy cultivation and moder=
ate=20
>>>> potency.
>>>>
>>>> am a supplier of good top quality medicated cannabis , peyote, MDMA,=
=20
>>>> Ketamine carts,shrooms, LSD, pills, edibles, cookies, vapes ,Dmt, dabs=
,THC=20
>>>> gummies, codine, syrup,wax, crumble catrages,hash, chocolate bars, flo=
wers=20
>>>> and many more.
>>>> tapin our telegram for quick response.
>>>>
>>>> Some key characteristics of the Golden Teacher mushroom strain include=
:
>>>> Appearance: The Golden Teacher strain typically features large,=20
>>>> golden-capped mushrooms with a distinct appearance. When mature, the c=
aps=20
>>>> can take on a golden or caramel color, while the stem is usually thick=
 and=20
>>>> white.
>>>> Potency: Golden Teachers are considered moderately potent among=20
>>>> psilocybin mushrooms. Their effects can vary depending on factors such=
 as=20
>>>> growing conditions, individual tolerance, and dosage. Users generally=
=20
>>>> report a balance between visual and introspective effects.
>>>> Effects: Like other psilocybin-containing mushrooms, consuming Golden=
=20
>>>> Teacher mushrooms can lead to altered states of consciousness characte=
rized=20
>>>> by visual and auditory hallucinations, changes in perception of time a=
nd=20
>>>> space, introspection, and sometimes a sense of unity or connection wit=
h=20
>>>> one's surroundings.
>>>> Cultivation: Golden Teachers are favored by cultivators due to their=
=20
>>>> relatively straightforward cultivation process. They are known for bei=
ng=20
>>>> resilient and adaptable, making them a suitable choice for beginners i=
n=20
>>>> mushroom cultivation.
>>>>
>>>> Buds=20
>>>> https://t.me/psychedelicvendor17/297
>>>> https://t.me/psychedelicvendor17/296
>>>> https://t.me/psychedelicvendor17/295
>>>> https://t.me/psychedelicvendor17/261
>>>> https://t.me/psychedelicvendor17/133
>>>> https://t.me/psychedelicvendor17/95
>>>> https://t.me/psychedelicvendor17/69
>>>>
>>>> Clone cards=20
>>>> https://t.me/psychedelicvendor17/291
>>>> https://t.me/psychedelicvendor17/267
>>>> https://t.me/psychedelicvendor17/263
>>>> https://t.me/psychedelicvendor17/166
>>>> https://t.me/psychedelicvendor17/164
>>>> https://t.me/psychedelicvendor17/88
>>>> https://t.me/psychedelicvendor17/11
>>>>
>>>> Mushrooms=20
>>>> https://t.me/psychedelicvendor17/235?single
>>>> https://t.me/psychedelicvendor17/169?single
>>>> https://t.me/psychedelicvendor17/235?single
>>>>
>>>> Vapes=20
>>>> https://t.me/psychedelicvendor17/4
>>>> https://t.me/psychedelicvendor17/6
>>>> https://t.me/psychedelicvendor17/26?single
>>>> https://t.me/psychedelicvendor17/30?single
>>>> https://t.me/psychedelicvendor17/440?single
>>>>
>>>> MDMA=20
>>>> https://t.me/psychedelicvendor17/280
>>>> https://t.me/psychedelicvendor17/293
>>>> https://t.me/psychedelicvendor17/157?single
>>>> https://t.me/psychedelicvendor17/441
>>>>
>>>> LSD=20
>>>> https://t.me/psychedelicvendor17/218?single
>>>> https://t.me/psychedelicvendor17/203?single
>>>> https://t.me/psychedelicvendor17/116
>>>> https://t.me/psychedelicvendor17/185
>>>>
>>>> DMT=20
>>>> https://t.me/psychedelicvendor17/26?single
>>>> https://t.me/psychedelicvendor17/44
>>>> https://t.me/psychedelicvendor17/45
>>>> https://t.me/psychedelicvendor17/193
>>>> https://t.me/psychedelicvendor17/228
>>>>
>>>> Pills=20
>>>> https://t.me/psychedelicvendor17/152
>>>> https://t.me/psychedelicvendor17/570
>>>> https://t.me/psychedelicvendor17/554
>>>>
>>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/411c47a5-46dd-43e6-8890-d9f9ec3194c6n%40googlegroups.com.

------=_Part_299661_1364879984.1715647727404
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />The Golden Teacher mushroom is a popular strain of psilocybin mushroo=
ms, scientifically known as Psilocybe cubensis. This strain is well-known a=
nd often sought after by cultivators and users in the psychedelic community=
 due to its relatively easy cultivation and moderate potency.<br /><br />am=
 a supplier of good top quality medicated cannabis , peyote, MDMA, Ketamine=
 carts,shrooms, LSD, pills, edibles, cookies, vapes ,Dmt, dabs,THC gummies,=
 codine, syrup,wax, crumble catrages,hash, chocolate bars, flowers and many=
 more.<br />tapin our telegram for quick response.<br /><br />Some key char=
acteristics of the Golden Teacher mushroom strain include:<br />Appearance:=
 The Golden Teacher strain typically features large, golden-capped mushroom=
s with a distinct appearance. When mature, the caps can take on a golden or=
 caramel color, while the stem is usually thick and white.<br />Potency: Go=
lden Teachers are considered moderately potent among psilocybin mushrooms. =
Their effects can vary depending on factors such as growing conditions, ind=
ividual tolerance, and dosage. Users generally report a balance between vis=
ual and introspective effects.<br />Effects: Like other psilocybin-containi=
ng mushrooms, consuming Golden Teacher mushrooms can lead to altered states=
 of consciousness characterized by visual and auditory hallucinations, chan=
ges in perception of time and space, introspection, and sometimes a sense o=
f unity or connection with one's surroundings.<br />Cultivation: Golden Tea=
chers are favored by cultivators due to their relatively straightforward cu=
ltivation process. They are known for being resilient and adaptable, making=
 them a suitable choice for beginners in mushroom cultivation.<br /><br />B=
uds, flowers, carts <br />https://t.me/psychedelicvendor17/297<br />https:/=
/t.me/psychedelicvendor17/296<br />https://t.me/psychedelicvendor17/295<br =
/>https://t.me/psychedelicvendor17/261<br />https://t.me/psychedelicvendor1=
7/133<br />https://t.me/psychedelicvendor17/95<br />https://t.me/psychedeli=
cvendor17/69<br /><br />Clone cards <br />https://t.me/psychedelicvendor17/=
291<br />https://t.me/psychedelicvendor17/267<br />https://t.me/psychedelic=
vendor17/263<br />https://t.me/psychedelicvendor17/166<br />https://t.me/ps=
ychedelicvendor17/164<br />https://t.me/psychedelicvendor17/88<br />https:/=
/t.me/psychedelicvendor17/11<br /><br />Mushrooms, penis envy <br />https:/=
/t.me/psychedelicvendor17/235?single<br />https://t.me/psychedelicvendor17/=
169?single<br />https://t.me/psychedelicvendor17/235?single<br /><br />Vape=
s DMT, catrages <br />https://t.me/psychedelicvendor17/4<br />https://t.me/=
psychedelicvendor17/6<br />https://t.me/psychedelicvendor17/26?single<br />=
https://t.me/psychedelicvendor17/30?single<br />https://t.me/psychedelicven=
dor17/440?single<br /><br />MDMA molly <br />https://t.me/psychedelicvendor=
17/280<br />https://t.me/psychedelicvendor17/293<br />https://t.me/psychede=
licvendor17/157?single<br />https://t.me/psychedelicvendor17/441<br /><br /=
>LSD sheets, blotter <br />https://t.me/psychedelicvendor17/218?single<br /=
>https://t.me/psychedelicvendor17/203?single<br />https://t.me/psychedelicv=
endor17/116<br />https://t.me/psychedelicvendor17/185<br /><br />DMT acid, =
vapes <br />https://t.me/psychedelicvendor17/26?single<br />https://t.me/ps=
ychedelicvendor17/44<br />https://t.me/psychedelicvendor17/45<br />https://=
t.me/psychedelicvendor17/193<br />https://t.me/psychedelicvendor17/228<br /=
><br />Pills, Xanax edibles <br />https://t.me/psychedelicvendor17/152<br /=
>https://t.me/psychedelicvendor17/570<br />https://t.me/psychedelicvendor17=
/554<br /><br />Hash rosin <br />https://t.me/psychedelicvendor17/576?singl=
e<br />https://t.me/psychedelicvendor17/337<br /><br />Gummies <br />https:=
//t.me/dmtcartforsale/276<img alt=3D"IMG_20240430_084822_435.jpg" width=3D"=
491px" height=3D"872px" src=3D"cid:23cfcd7b-e75f-4cce-9c0a-b1157146026e" />=
<br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On =
Saturday, May 11, 2024 at 12:54:44=E2=80=AFPM UTC+1 Justin Baker wrote:<br/=
></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bord=
er-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;"><a href=3D"https=
://t.me/dannyw23official" target=3D"_blank" rel=3D"nofollow" data-saferedir=
ecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw23o=
fficial&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw0qoP-=
1ta2ZIpb_zU_wGam4">https://t.me/dannyw23official</a><br>=C2=A0<br><a href=
=3D"https://t.me/dannyw23official" target=3D"_blank" rel=3D"nofollow" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/=
dannyw23official&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAO=
vVaw0qoP-1ta2ZIpb_zU_wGam4">https://t.me/dannyw23official</a><br>=C2=A0<br>=
Polkadot Magic=C2=A0 Belgian Milk Chocolate is not only delicious, but it e=
quates to 4 grams of psilocybin-containing . Aside from the fantastic, mind=
-blowing effects, you get from eating the bars and polka dot company chocol=
ate, they are also a great way to microdose magic . Microdosing magic in th=
e form of consumption. Polkadot Magic Belgian Milk Chocolate is not only de=
licious, but it equates to 4 grams of psilocybin-containing . Aside from th=
e fantastic, mind-blowing effects, you get from eating the and polka dot co=
mpany chocolate, they are also a great way to microdose magic=C2=A0 Microdo=
sing magic in the form of consuming=C2=A0 chocolate bars=C2=A0<br>=C2=A0<br=
><a href=3D"https://t.me/dannyw23official" target=3D"_blank" rel=3D"nofollo=
w" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps=
://t.me/dannyw23official&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;=
usg=3DAOvVaw0qoP-1ta2ZIpb_zU_wGam4">https://t.me/dannyw23official</a><br>=
=C2=A0<br><a href=3D"https://t.me/dannyw23official" target=3D"_blank" rel=
=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://t.me/dannyw23official&amp;source=3Dgmail&amp;ust=3D1715734067=
967000&amp;usg=3DAOvVaw0qoP-1ta2ZIpb_zU_wGam4">https://t.me/dannyw23officia=
l</a><br>=C2=A0<br>=C2=A0<br><a href=3D"https://t.me/dannyw23official" targ=
et=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.c=
om/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw23official&amp;source=3Dgmail&amp=
;ust=3D1715734067967000&amp;usg=3DAOvVaw0qoP-1ta2ZIpb_zU_wGam4">https://t.m=
e/dannyw23official</a><br>=C2=A0<br>=C2=A0<br><a href=3D"https://t.me/danny=
w23official" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"htt=
ps://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/dannyw23official&amp;s=
ource=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw0qoP-1ta2ZIpb_zU_w=
Gam4">https://t.me/dannyw23official</a><br><br><div class=3D"gmail_quote"><=
div dir=3D"auto" class=3D"gmail_attr">On Thursday, May 9, 2024 at 4:43:06=
=E2=80=AFPM UTC-7 Harry Conor wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>Buy your psychedelic products fast and safe delivery <br=
><a href=3D"https://t.me/highlandview" rel=3D"nofollow" target=3D"_blank" d=
ata-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t=
.me/highlandview&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAO=
vVaw2FpxXMtzzGrtahj3hr9oh8">https://t.me/highlandview</a> <br><a href=3D"ht=
tps://t.me/highlandview" rel=3D"nofollow" target=3D"_blank" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/highlandvi=
ew&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw2FpxXMtzzG=
rtahj3hr9oh8">https://t.me/highlandview</a> <br><br>&gt; =E2=9C=94US-US Del=
ivery <br>&gt; =E2=9C=94Fast Shipping <br>&gt; =E2=9C=94Secure Payment Opti=
ons <br>&gt; =E2=9C=94100% Satisfaction Guaranteed <br>&gt; =E2=9C=943 Days=
 Refund Policy <br>&gt; =E2=9C=94100% Money-Back if any issue with the prod=
uct <br>&gt; =E2=9C=94Shipping Service: Express/Standard/Economy <br>&gt; =
=E2=9C=94Estimated Delivery Time: Express &amp; 3-5 Days <br>&gt; =E2=9C=94=
Discounts: Get up to 20% off <br><br><a href=3D"https://t.me/highlandview" =
rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.goog=
le.com/url?hl=3Den&amp;q=3Dhttps://t.me/highlandview&amp;source=3Dgmail&amp=
;ust=3D1715734067967000&amp;usg=3DAOvVaw2FpxXMtzzGrtahj3hr9oh8">https://t.m=
e/highlandview</a> <br><a href=3D"https://t.me/highlandview" rel=3D"nofollo=
w" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://t.me/highlandview&amp;source=3Dgmail&amp;ust=3D171573=
4067967000&amp;usg=3DAOvVaw2FpxXMtzzGrtahj3hr9oh8">https://t.me/highlandvie=
w</a> <br><a href=3D"https://t.me/highlandview" rel=3D"nofollow" target=3D"=
_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3D=
https://t.me/highlandview&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp=
;usg=3DAOvVaw2FpxXMtzzGrtahj3hr9oh8">https://t.me/highlandview</a> <br><a h=
ref=3D"https://t.me/highlandview" rel=3D"nofollow" target=3D"_blank" data-s=
aferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/h=
ighlandview&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw2=
FpxXMtzzGrtahj3hr9oh8">https://t.me/highlandview</a><br><div class=3D"gmail=
_quote"><div dir=3D"auto" class=3D"gmail_attr">On Tuesday 7 May 2024 at 11:=
41:20 UTC-7 James Maria wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padding-l=
eft:1ex"><br>The Golden Teacher mushroom is a popular strain of psilocybin =
mushrooms, scientifically known as Psilocybe cubensis. This strain is well-=
known and often sought after by cultivators and users in the psychedelic co=
mmunity due to its relatively easy cultivation and moderate potency.<br><br=
>am a supplier of good top quality medicated cannabis , peyote, MDMA, Ketam=
ine carts,shrooms, LSD, pills, edibles, cookies, vapes ,Dmt, dabs,THC gummi=
es, codine, syrup,wax, crumble catrages,hash, chocolate bars, flowers and m=
any more.<br>tapin our telegram for quick response.<br><br>Some key charact=
eristics of the Golden Teacher mushroom strain include:<br>Appearance: The =
Golden Teacher strain typically features large, golden-capped mushrooms wit=
h a distinct appearance. When mature, the caps can take on a golden or cara=
mel color, while the stem is usually thick and white.<br>Potency: Golden Te=
achers are considered moderately potent among psilocybin mushrooms. Their e=
ffects can vary depending on factors such as growing conditions, individual=
 tolerance, and dosage. Users generally report a balance between visual and=
 introspective effects.<br>Effects: Like other psilocybin-containing mushro=
oms, consuming Golden Teacher mushrooms can lead to altered states of consc=
iousness characterized by visual and auditory hallucinations, changes in pe=
rception of time and space, introspection, and sometimes a sense of unity o=
r connection with one&#39;s surroundings.<br>Cultivation: Golden Teachers a=
re favored by cultivators due to their relatively straightforward cultivati=
on process. They are known for being resilient and adaptable, making them a=
 suitable choice for beginners in mushroom cultivation.<br><br>Buds, flower=
s, carts <br><a href=3D"https://t.me/psychedelicvendor17/297" rel=3D"nofoll=
ow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/297&amp;source=3Dgmail&amp;u=
st=3D1715734067967000&amp;usg=3DAOvVaw20IJ8Dw9-qSvWfRthHiKwU">https://t.me/=
psychedelicvendor17/297</a><br><a href=3D"https://t.me/psychedelicvendor17/=
296" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/296&amp;so=
urce=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw00cU6nUcB6GH6xtuzNV=
K-A">https://t.me/psychedelicvendor17/296</a><br><a href=3D"https://t.me/ps=
ychedelicvendor17/295" rel=3D"nofollow" target=3D"_blank" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicv=
endor17/295&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw2=
kCWHS4KjwLqkGM_ah1ZNn">https://t.me/psychedelicvendor17/295</a><br><a href=
=3D"https://t.me/psychedelicvendor17/261" rel=3D"nofollow" target=3D"_blank=
" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps:=
//t.me/psychedelicvendor17/261&amp;source=3Dgmail&amp;ust=3D171573406796700=
0&amp;usg=3DAOvVaw3c85P1RvdCzf11-Bd0mSyY">https://t.me/psychedelicvendor17/=
261</a><br><a href=3D"https://t.me/psychedelicvendor17/133" rel=3D"nofollow=
" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/133&amp;source=3Dgmail&amp;u=
st=3D1715734067967000&amp;usg=3DAOvVaw0lo1QolA5G1GvCLc-yVgHD">https://t.me/=
psychedelicvendor17/133</a><br><a href=3D"https://t.me/psychedelicvendor17/=
95" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/95&amp;sour=
ce=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw1bK89BZ2xeBzBlLmhblSD=
f">https://t.me/psychedelicvendor17/95</a><br><a href=3D"https://t.me/psych=
edelicvendor17/69" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvend=
or17/69&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw2TEnx=
PdKtY2pZIJ3TtxwGR">https://t.me/psychedelicvendor17/69</a><br><br>Clone car=
ds <br><a href=3D"https://t.me/psychedelicvendor17/291" rel=3D"nofollow" ta=
rget=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&=
amp;q=3Dhttps://t.me/psychedelicvendor17/291&amp;source=3Dgmail&amp;ust=3D1=
715734067967000&amp;usg=3DAOvVaw11bIk8TnD4mV3LcQn9Iuv6">https://t.me/psyche=
delicvendor17/291</a><br><a href=3D"https://t.me/psychedelicvendor17/267" r=
el=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.googl=
e.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/267&amp;source=
=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw3lwzyGbEclY859phw_Y4Ae"=
>https://t.me/psychedelicvendor17/267</a><br><a href=3D"https://t.me/psyche=
delicvendor17/263" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvend=
or17/263&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw1I4a=
4SAetS9lej1rWwif18">https://t.me/psychedelicvendor17/263</a><br><a href=3D"=
https://t.me/psychedelicvendor17/166" rel=3D"nofollow" target=3D"_blank" da=
ta-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.=
me/psychedelicvendor17/166&amp;source=3Dgmail&amp;ust=3D1715734067967000&am=
p;usg=3DAOvVaw2iKUH42hAxCo01a3Lishz6">https://t.me/psychedelicvendor17/166<=
/a><br><a href=3D"https://t.me/psychedelicvendor17/164" rel=3D"nofollow" ta=
rget=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&=
amp;q=3Dhttps://t.me/psychedelicvendor17/164&amp;source=3Dgmail&amp;ust=3D1=
715734067967000&amp;usg=3DAOvVaw2PV63YS0GexP8ENFkl1xOA">https://t.me/psyche=
delicvendor17/164</a><br><a href=3D"https://t.me/psychedelicvendor17/88" re=
l=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google=
.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/88&amp;source=3Dg=
mail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw2eWOqAqwO7dGF0P7LKjFfJ">htt=
ps://t.me/psychedelicvendor17/88</a><br><a href=3D"https://t.me/psychedelic=
vendor17/11" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"htt=
ps://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/11=
&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw2p7mFrewxRvM=
sAr-Fiq1RE">https://t.me/psychedelicvendor17/11</a><br><br>Mushrooms, penis=
 envy <br><a href=3D"https://t.me/psychedelicvendor17/235?single" rel=3D"no=
follow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/ur=
l?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/235?single&amp;source=3D=
gmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw3sN1zh2LWPvGpJOKy8skY_">ht=
tps://t.me/psychedelicvendor17/235?single</a><br><a href=3D"https://t.me/ps=
ychedelicvendor17/169?single" rel=3D"nofollow" target=3D"_blank" data-safer=
edirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psych=
edelicvendor17/169?single&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp=
;usg=3DAOvVaw1SD6eyWETllcOnCtS1E50u">https://t.me/psychedelicvendor17/169?s=
ingle</a><br><a href=3D"https://t.me/psychedelicvendor17/235?single" rel=3D=
"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com=
/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/235?single&amp;source=
=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw3sN1zh2LWPvGpJOKy8skY_"=
>https://t.me/psychedelicvendor17/235?single</a><br><br>Vapes DMT, catrages=
 <br><a href=3D"https://t.me/psychedelicvendor17/4" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;=
q=3Dhttps://t.me/psychedelicvendor17/4&amp;source=3Dgmail&amp;ust=3D1715734=
067967000&amp;usg=3DAOvVaw1rxPaKVaVblthx1_loyRX1">https://t.me/psychedelicv=
endor17/4</a><br><a href=3D"https://t.me/psychedelicvendor17/6" rel=3D"nofo=
llow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/6&amp;source=3Dgmail&amp;u=
st=3D1715734067967000&amp;usg=3DAOvVaw1WXNSF5xKNyAH-nhT-ELDd">https://t.me/=
psychedelicvendor17/6</a><br><a href=3D"https://t.me/psychedelicvendor17/26=
?single" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https:/=
/www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/26?sin=
gle&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw1vHq6n7Sr=
gqoNfkV1LIHjt">https://t.me/psychedelicvendor17/26?single</a><br><a href=3D=
"https://t.me/psychedelicvendor17/30?single" rel=3D"nofollow" target=3D"_bl=
ank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhtt=
ps://t.me/psychedelicvendor17/30?single&amp;source=3Dgmail&amp;ust=3D171573=
4067967000&amp;usg=3DAOvVaw35hlRDgOk4pNlLb24ROBnv">https://t.me/psychedelic=
vendor17/30?single</a><br><a href=3D"https://t.me/psychedelicvendor17/440?s=
ingle" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/440?sing=
le&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw1UF2E8RkbH=
UQEAhRyL4pCo">https://t.me/psychedelicvendor17/440?single</a><br><br>MDMA m=
olly <br><a href=3D"https://t.me/psychedelicvendor17/280" rel=3D"nofollow" =
target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3De=
n&amp;q=3Dhttps://t.me/psychedelicvendor17/280&amp;source=3Dgmail&amp;ust=
=3D1715734067967000&amp;usg=3DAOvVaw2YHPHU2B2ojZI5Fec2E-lR">https://t.me/ps=
ychedelicvendor17/280</a><br><a href=3D"https://t.me/psychedelicvendor17/29=
3" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.g=
oogle.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/293&amp;sour=
ce=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw01uk3cDaEgbGBcZOKTfGW=
i">https://t.me/psychedelicvendor17/293</a><br><a href=3D"https://t.me/psyc=
hedelicvendor17/157?single" rel=3D"nofollow" target=3D"_blank" data-safered=
irecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psyched=
elicvendor17/157?single&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;u=
sg=3DAOvVaw0zQSZ2KVwqRgzwG6pmoBu5">https://t.me/psychedelicvendor17/157?sin=
gle</a><br><a href=3D"https://t.me/psychedelicvendor17/441" rel=3D"nofollow=
" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/441&amp;source=3Dgmail&amp;u=
st=3D1715734067967000&amp;usg=3DAOvVaw0UMbQJQQt_xAMNDsua86Zm">https://t.me/=
psychedelicvendor17/441</a><br><br>LSD sheets, blotter <br><a href=3D"https=
://t.me/psychedelicvendor17/218?single" rel=3D"nofollow" target=3D"_blank" =
data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://=
t.me/psychedelicvendor17/218?single&amp;source=3Dgmail&amp;ust=3D1715734067=
967000&amp;usg=3DAOvVaw37tiAVxlOCMIWon0nDyfAa">https://t.me/psychedelicvend=
or17/218?single</a><br><a href=3D"https://t.me/psychedelicvendor17/203?sing=
le" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/203?single&=
amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw2WkKxYGvIchqD=
ZNbHNAGXH">https://t.me/psychedelicvendor17/203?single</a><br><a href=3D"ht=
tps://t.me/psychedelicvendor17/116" rel=3D"nofollow" target=3D"_blank" data=
-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me=
/psychedelicvendor17/116&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;=
usg=3DAOvVaw0c2nErU8wiyH2Flb9aPq-b">https://t.me/psychedelicvendor17/116</a=
><br><a href=3D"https://t.me/psychedelicvendor17/185" rel=3D"nofollow" targ=
et=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://t.me/psychedelicvendor17/185&amp;source=3Dgmail&amp;ust=3D171=
5734067967000&amp;usg=3DAOvVaw2Bzc1cGBWjUWhpCwxzRqXs">https://t.me/psychede=
licvendor17/185</a><br><br>DMT acid, vapes <br><a href=3D"https://t.me/psyc=
hedelicvendor17/26?single" rel=3D"nofollow" target=3D"_blank" data-saferedi=
recturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychede=
licvendor17/26?single&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=
=3DAOvVaw1vHq6n7SrgqoNfkV1LIHjt">https://t.me/psychedelicvendor17/26?single=
</a><br><a href=3D"https://t.me/psychedelicvendor17/44" rel=3D"nofollow" ta=
rget=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&=
amp;q=3Dhttps://t.me/psychedelicvendor17/44&amp;source=3Dgmail&amp;ust=3D17=
15734067967000&amp;usg=3DAOvVaw1LeBXyzhghyAAX73qmG2n7">https://t.me/psyched=
elicvendor17/44</a><br><a href=3D"https://t.me/psychedelicvendor17/45" rel=
=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.=
com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/45&amp;source=3Dgm=
ail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw2aHnBa7jfU4X5Xg1-Lz553">http=
s://t.me/psychedelicvendor17/45</a><br><a href=3D"https://t.me/psychedelicv=
endor17/193" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"htt=
ps://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/19=
3&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=3DAOvVaw3MID6LBCovL=
Q2vg8eqcmOk">https://t.me/psychedelicvendor17/193</a><br><a href=3D"https:/=
/t.me/psychedelicvendor17/228" rel=3D"nofollow" target=3D"_blank" data-safe=
redirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psyc=
hedelicvendor17/228&amp;source=3Dgmail&amp;ust=3D1715734067967000&amp;usg=
=3DAOvVaw1lfSmaOxDDPXfnbjIyc8Yv">https://t.me/psychedelicvendor17/228</a><b=
r><br>Pills, Xanax edibles <br><a href=3D"https://t.me/psychedelicvendor17/=
152" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/152&amp;so=
urce=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw02mkwnrt-57l7-oquKJ=
gJ9">https://t.me/psychedelicvendor17/152</a><br><a href=3D"https://t.me/ps=
ychedelicvendor17/570" rel=3D"nofollow" target=3D"_blank" data-saferedirect=
url=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicv=
endor17/570&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw2=
yfjGh7MfH01KbNu7-OaKM">https://t.me/psychedelicvendor17/570</a><br><a href=
=3D"https://t.me/psychedelicvendor17/554" rel=3D"nofollow" target=3D"_blank=
" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps:=
//t.me/psychedelicvendor17/554&amp;source=3Dgmail&amp;ust=3D171573406796800=
0&amp;usg=3DAOvVaw25AZb3Hp-lyPdR2UjGg1bb">https://t.me/psychedelicvendor17/=
554</a><br><br>Hash rosin <br><a href=3D"https://t.me/psychedelicvendor17/5=
76?single" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https=
://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/576?=
single&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw1nVDID=
03ncdQc5-LzMgaKR">https://t.me/psychedelicvendor17/576?single</a><br><a hre=
f=3D"https://t.me/psychedelicvendor17/337" rel=3D"nofollow" target=3D"_blan=
k" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps=
://t.me/psychedelicvendor17/337&amp;source=3Dgmail&amp;ust=3D17157340679680=
00&amp;usg=3DAOvVaw08CgYLOr9d-W3Uf-fYKzkz">https://t.me/psychedelicvendor17=
/337</a><br><br>Gummies <br><a href=3D"https://t.me/dmtcartforsale/276" rel=
=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.=
com/url?hl=3Den&amp;q=3Dhttps://t.me/dmtcartforsale/276&amp;source=3Dgmail&=
amp;ust=3D1715734067968000&amp;usg=3DAOvVaw1HLSbolJkuTJI-J0EGLn74">https://=
t.me/dmtcartforsale/276</a><img alt=3D"IMG_20240418_004250_343.jpg" width=
=3D"462px" height=3D"872px" src=3D"https://groups.google.com/group/jailhous=
e-dev/attach/aaeaa88e680e0/IMG_20240418_004250_343.jpg?part=3D0.1&amp;view=
=3D1"><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr"=
>On Monday, April 22, 2024 at 6:51:02=E2=80=AFPM UTC+1 James Maria wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">The Golden Teacher mush=
room is a popular strain of psilocybin mushrooms, scientifically known as P=
silocybe cubensis. This strain is well-known and often sought after by cult=
ivators and users in the psychedelic community due to its relatively easy c=
ultivation and moderate potency.<br><br>am a supplier of good top quality m=
edicated cannabis , peyote, MDMA, Ketamine carts,shrooms, LSD, pills, edibl=
es, cookies, vapes ,Dmt, dabs,THC gummies, codine, syrup,wax, crumble catra=
ges,hash, chocolate bars, flowers and many more.<br>tapin our telegram for =
quick response.<br><br>Some key characteristics of the Golden Teacher mushr=
oom strain include:<br>Appearance: The Golden Teacher strain typically feat=
ures large, golden-capped mushrooms with a distinct appearance. When mature=
, the caps can take on a golden or caramel color, while the stem is usually=
 thick and white.<br>Potency: Golden Teachers are considered moderately pot=
ent among psilocybin mushrooms. Their effects can vary depending on factors=
 such as growing conditions, individual tolerance, and dosage. Users genera=
lly report a balance between visual and introspective effects.<br>Effects: =
Like other psilocybin-containing mushrooms, consuming Golden Teacher mushro=
oms can lead to altered states of consciousness characterized by visual and=
 auditory hallucinations, changes in perception of time and space, introspe=
ction, and sometimes a sense of unity or connection with one&#39;s surround=
ings.<br>Cultivation: Golden Teachers are favored by cultivators due to the=
ir relatively straightforward cultivation process. They are known for being=
 resilient and adaptable, making them a suitable choice for beginners in mu=
shroom cultivation.<br><br>Buds <br><a href=3D"https://t.me/psychedelicvend=
or17/297" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https:=
//www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/297&a=
mp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw0NdXsvm2Mx7Ndj=
LKSy32EW">https://t.me/psychedelicvendor17/297</a><br><a href=3D"https://t.=
me/psychedelicvendor17/296" rel=3D"nofollow" target=3D"_blank" data-safered=
irecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psyched=
elicvendor17/296&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAO=
vVaw21p1-gnVn5XdEK7GljMfmo">https://t.me/psychedelicvendor17/296</a><br><a =
href=3D"https://t.me/psychedelicvendor17/295" rel=3D"nofollow" target=3D"_b=
lank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dht=
tps://t.me/psychedelicvendor17/295&amp;source=3Dgmail&amp;ust=3D17157340679=
68000&amp;usg=3DAOvVaw1lRgGwZI4pXIG0N4nD1auR">https://t.me/psychedelicvendo=
r17/295</a><br><a href=3D"https://t.me/psychedelicvendor17/261" rel=3D"nofo=
llow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?=
hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/261&amp;source=3Dgmail&amp=
;ust=3D1715734067968000&amp;usg=3DAOvVaw2PSIYWRWywlUXJqfwM0P5C">https://t.m=
e/psychedelicvendor17/261</a><br><a href=3D"https://t.me/psychedelicvendor1=
7/133" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/133&amp;=
source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw3ZRsf6wj_O5c94tTI=
H72I4">https://t.me/psychedelicvendor17/133</a><br><a href=3D"https://t.me/=
psychedelicvendor17/95" rel=3D"nofollow" target=3D"_blank" data-saferedirec=
turl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelic=
vendor17/95&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw0=
W0jAFCoFyrEiQjwcd5ki3">https://t.me/psychedelicvendor17/95</a><br><a href=
=3D"https://t.me/psychedelicvendor17/69" rel=3D"nofollow" target=3D"_blank"=
 data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps:/=
/t.me/psychedelicvendor17/69&amp;source=3Dgmail&amp;ust=3D1715734067968000&=
amp;usg=3DAOvVaw3oZH6ZvXeEArILItenq7z6">https://t.me/psychedelicvendor17/69=
</a><br><br>Clone cards <br><a href=3D"https://t.me/psychedelicvendor17/291=
" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.go=
ogle.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/291&amp;sourc=
e=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw1vnwjiqs-7hEoSiqSDbefK=
">https://t.me/psychedelicvendor17/291</a><br><a href=3D"https://t.me/psych=
edelicvendor17/267" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvend=
or17/267&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw0oEm=
75iltlNfhBz70A7yie">https://t.me/psychedelicvendor17/267</a><br><a href=3D"=
https://t.me/psychedelicvendor17/263" rel=3D"nofollow" target=3D"_blank" da=
ta-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.=
me/psychedelicvendor17/263&amp;source=3Dgmail&amp;ust=3D1715734067968000&am=
p;usg=3DAOvVaw2VHt6ulHExGvTL3CubFu45">https://t.me/psychedelicvendor17/263<=
/a><br><a href=3D"https://t.me/psychedelicvendor17/166" rel=3D"nofollow" ta=
rget=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&=
amp;q=3Dhttps://t.me/psychedelicvendor17/166&amp;source=3Dgmail&amp;ust=3D1=
715734067968000&amp;usg=3DAOvVaw0Z-tVeFJm8WHisVRxa8v7b">https://t.me/psyche=
delicvendor17/166</a><br><a href=3D"https://t.me/psychedelicvendor17/164" r=
el=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.googl=
e.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/164&amp;source=
=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw2lQLic63q1aZ639EOFu5EK"=
>https://t.me/psychedelicvendor17/164</a><br><a href=3D"https://t.me/psyche=
delicvendor17/88" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvend=
or17/88&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw20FBn=
JJIjpQIgI_-xF09Tb">https://t.me/psychedelicvendor17/88</a><br><a href=3D"ht=
tps://t.me/psychedelicvendor17/11" rel=3D"nofollow" target=3D"_blank" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/=
psychedelicvendor17/11&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;us=
g=3DAOvVaw3jvsaKHun6qJ_fQPJGLDZ_">https://t.me/psychedelicvendor17/11</a><b=
r><br>Mushrooms <br><a href=3D"https://t.me/psychedelicvendor17/235?single"=
 rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.goo=
gle.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/235?single&amp=
;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw2NPJkq-OszUOn8xs=
PeU8we">https://t.me/psychedelicvendor17/235?single</a><br><a href=3D"https=
://t.me/psychedelicvendor17/169?single" rel=3D"nofollow" target=3D"_blank" =
data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://=
t.me/psychedelicvendor17/169?single&amp;source=3Dgmail&amp;ust=3D1715734067=
968000&amp;usg=3DAOvVaw20h9D06hFtxJ8TcWkXkgZn">https://t.me/psychedelicvend=
or17/169?single</a><br><a href=3D"https://t.me/psychedelicvendor17/235?sing=
le" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.=
google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/235?single&=
amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw2NPJkq-OszUOn=
8xsPeU8we">https://t.me/psychedelicvendor17/235?single</a><br><br>Vapes <br=
><a href=3D"https://t.me/psychedelicvendor17/4" rel=3D"nofollow" target=3D"=
_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3D=
https://t.me/psychedelicvendor17/4&amp;source=3Dgmail&amp;ust=3D17157340679=
68000&amp;usg=3DAOvVaw1RVnfz9F8xnCKbXUO0EBJL">https://t.me/psychedelicvendo=
r17/4</a><br><a href=3D"https://t.me/psychedelicvendor17/6" rel=3D"nofollow=
" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=
=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/6&amp;source=3Dgmail&amp;ust=
=3D1715734067968000&amp;usg=3DAOvVaw0PLzUoGl_dWGZa2yMHJ1uA">https://t.me/ps=
ychedelicvendor17/6</a><br><a href=3D"https://t.me/psychedelicvendor17/26?s=
ingle" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://w=
ww.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/26?singl=
e&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw2r84jsV753v=
cXAKLI-H1dO">https://t.me/psychedelicvendor17/26?single</a><br><a href=3D"h=
ttps://t.me/psychedelicvendor17/30?single" rel=3D"nofollow" target=3D"_blan=
k" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps=
://t.me/psychedelicvendor17/30?single&amp;source=3Dgmail&amp;ust=3D17157340=
67968000&amp;usg=3DAOvVaw3S_YYym4aKxZmebCDmiEG1">https://t.me/psychedelicve=
ndor17/30?single</a><br><a href=3D"https://t.me/psychedelicvendor17/440?sin=
gle" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/440?single=
&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw3TDtpxDd_lBW=
FvTB2gGtQg">https://t.me/psychedelicvendor17/440?single</a><br><br>MDMA <br=
><a href=3D"https://t.me/psychedelicvendor17/280" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;=
q=3Dhttps://t.me/psychedelicvendor17/280&amp;source=3Dgmail&amp;ust=3D17157=
34067968000&amp;usg=3DAOvVaw0b75LzVNI_C1pYi3n3HGZL">https://t.me/psychedeli=
cvendor17/280</a><br><a href=3D"https://t.me/psychedelicvendor17/293" rel=
=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.=
com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/293&amp;source=3Dg=
mail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw2_fhgQRoEb6O10fxwcQLE6">htt=
ps://t.me/psychedelicvendor17/293</a><br><a href=3D"https://t.me/psychedeli=
cvendor17/157?single" rel=3D"nofollow" target=3D"_blank" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicve=
ndor17/157?single&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DA=
OvVaw15L4XZHRdEl82GNylg4D7e">https://t.me/psychedelicvendor17/157?single</a=
><br><a href=3D"https://t.me/psychedelicvendor17/441" rel=3D"nofollow" targ=
et=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&am=
p;q=3Dhttps://t.me/psychedelicvendor17/441&amp;source=3Dgmail&amp;ust=3D171=
5734067968000&amp;usg=3DAOvVaw2wdLHU5GeRisLiquwXL_l6">https://t.me/psychede=
licvendor17/441</a><br><br>LSD <br><a href=3D"https://t.me/psychedelicvendo=
r17/218?single" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"=
https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17=
/218?single&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw3=
N0BGgr7Z8iqaU_pkF1ywQ">https://t.me/psychedelicvendor17/218?single</a><br><=
a href=3D"https://t.me/psychedelicvendor17/203?single" rel=3D"nofollow" tar=
get=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&a=
mp;q=3Dhttps://t.me/psychedelicvendor17/203?single&amp;source=3Dgmail&amp;u=
st=3D1715734067968000&amp;usg=3DAOvVaw3L-YTAVLcDGK3NTacLIaHb">https://t.me/=
psychedelicvendor17/203?single</a><br><a href=3D"https://t.me/psychedelicve=
ndor17/116" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"http=
s://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/116=
&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw1Uir-UoarfKw=
iKazHCEIXp">https://t.me/psychedelicvendor17/116</a><br><a href=3D"https://=
t.me/psychedelicvendor17/185" rel=3D"nofollow" target=3D"_blank" data-safer=
edirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psych=
edelicvendor17/185&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3D=
AOvVaw3d8CMeRsHk-5F6nncSLljO">https://t.me/psychedelicvendor17/185</a><br><=
br>DMT <br><a href=3D"https://t.me/psychedelicvendor17/26?single" rel=3D"no=
follow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/ur=
l?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/26?single&amp;source=3Dg=
mail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw2r84jsV753vcXAKLI-H1dO">htt=
ps://t.me/psychedelicvendor17/26?single</a><br><a href=3D"https://t.me/psyc=
hedelicvendor17/44" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=
=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvend=
or17/44&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw2quDU=
HOBf0tPvGsNvF_pBB">https://t.me/psychedelicvendor17/44</a><br><a href=3D"ht=
tps://t.me/psychedelicvendor17/45" rel=3D"nofollow" target=3D"_blank" data-=
saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/=
psychedelicvendor17/45&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;us=
g=3DAOvVaw0ELz7W0HSyr5C1snbPLLUM">https://t.me/psychedelicvendor17/45</a><b=
r><a href=3D"https://t.me/psychedelicvendor17/193" rel=3D"nofollow" target=
=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;=
q=3Dhttps://t.me/psychedelicvendor17/193&amp;source=3Dgmail&amp;ust=3D17157=
34067968000&amp;usg=3DAOvVaw2fgx498pBoK135Q_ok6lph">https://t.me/psychedeli=
cvendor17/193</a><br><a href=3D"https://t.me/psychedelicvendor17/228" rel=
=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.=
com/url?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/228&amp;source=3Dg=
mail&amp;ust=3D1715734067968000&amp;usg=3DAOvVaw1m2LKs2pTodv471h1zxjrF">htt=
ps://t.me/psychedelicvendor17/228</a><br><br>Pills <br><a href=3D"https://t=
.me/psychedelicvendor17/152" rel=3D"nofollow" target=3D"_blank" data-safere=
directurl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dhttps://t.me/psyche=
delicvendor17/152&amp;source=3Dgmail&amp;ust=3D1715734067968000&amp;usg=3DA=
OvVaw02mkwnrt-57l7-oquKJgJ9">https://t.me/psychedelicvendor17/152</a><br><a=
 href=3D"https://t.me/psychedelicvendor17/570" rel=3D"nofollow" target=3D"_=
blank" data-saferedirecturl=3D"https://www.google.com/url?hl=3Den&amp;q=3Dh=
ttps://t.me/psychedelicvendor17/570&amp;source=3Dgmail&amp;ust=3D1715734067=
968000&amp;usg=3DAOvVaw2yfjGh7MfH01KbNu7-OaKM">https://t.me/psychedelicvend=
or17/570</a><br><a href=3D"https://t.me/psychedelicvendor17/554" rel=3D"nof=
ollow" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url=
?hl=3Den&amp;q=3Dhttps://t.me/psychedelicvendor17/554&amp;source=3Dgmail&am=
p;ust=3D1715734067968000&amp;usg=3DAOvVaw25AZb3Hp-lyPdR2UjGg1bb">https://t.=
me/psychedelicvendor17/554</a><br></blockquote></div></blockquote></div></b=
lockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/411c47a5-46dd-43e6-8890-d9f9ec3194c6n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/411c47a5-46dd-43e6-8890-d9f9ec3194c6n%40googlegroups.co=
m</a>.<br />

------=_Part_299661_1364879984.1715647727404--

------=_Part_299660_626046436.1715647727404
Content-Type: image/jpeg; name=IMG_20240430_084822_435.jpg
Content-Transfer-Encoding: base64
Content-Disposition: inline; filename=IMG_20240430_084822_435.jpg
X-Attachment-Id: 23cfcd7b-e75f-4cce-9c0a-b1157146026e
Content-ID: <23cfcd7b-e75f-4cce-9c0a-b1157146026e>

/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcU
FhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgo
KCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCAUAAtADASIA
AhEBAxEB/8QAHAAAAQUBAQEAAAAAAAAAAAAAAgABAwQFBgcI/8QAQxAAAgICAQMDAwMCBAMGBQIH
AQIAAwQRIQUSMRNBUQYiYRQycQeBFSNSkTNCoRYkVGKCkjRDRFNysSXBNfBjouHx/8QAGwEBAQAD
AQEBAAAAAAAAAAAAAAECAwQFBgf/xAArEQEAAgICAgEFAAICAwEBAAAAAQIDEQQSITETBRQiQVEj
MhVhBhYzQlL/2gAMAwEAAhEDEQA/APlyKKKYsSiiihkaOI0QgGDHgR4BRRtxbgLccGDuIGUSKxHi
dv8AQH1fd0TKWu1ycdjzz4nDAwlOpJH1/wBI6rR1PES/HYEEczSB7hPmX6H+scrpGStdljNSSONz
6C6H1inqeOllTAgia5jQ1/eIxzzGmIaNDgzENFHigNFHigNGMIxuPeFNuc99U36r7FP8zoX+1SZx
XX8pbshkHPadbkn0yjyxtF7Dr3l5FIkGOvO/aXNTz8tvLbEB944MY7jTTtdD2PmMSvzBMYiDQtiL
uHzA1FGzSTvWLvX5keotRs0k9RY/qCQlYxWNmkvrsPeMchvmQlT7Ruxj4G42aTfqWHvH/WN8yD0m
PtF+ncnxGzSf9W0X6xpD+lb4i/St8TLsaE+SX3toIfYhjG17GSDGGveNstIu6RF23xLfor+Yv06+
wjZpVV2jl2PvLQoWN6Cxs0gVm15iJbfmWlpQDmOa69xs0pdsNRLQrr+DDCVCNmlVQZYrENRWPAhh
R7Rs0aND1qPqNsZgAMIeI5WOBxGzqaKPEI2gvaZGT/8AzZf4E2N6Er3isEuVG/mb8E+Un07H6StC
1a+eJ055nFfRrg2ne9TtN7E9Ojmn2UUUUykKKKITEPFFFMoBExDzFqKRikDhVO/acR9Y/V9PSKbd
Wrtl4AMyvr769p6Zj2Y+K6m88bB3qeF9S6jf1C825D9xMyVe+oOtX9WyXZ2/y98CZI+ICnmEWAmU
KlTgwmslY29sja3Z2YmVWfV1BNm/eVGs/MHvPzIq13xd8qeofmP6p+YRY74u+VDZ+TF6h+TAteoI
u/8AMqB/5j9/5lVzO4txRTFgeKKKGRai8RooU8eMIoQUaMYoUo8YwpQo4jRoEyH7hOw+kvq7K6He
NMz1+43OLB1JRZJMD6v+lfqHG63gpbTYCxHIm8OZ8qfSf1RldBz0tpcmvf3LPor6S+qMP6gwksqZ
Vu19yb5E1zA6TUfUUWphMBtCPqKPJoNqMRCigRlYtQzGlFLqdnpYjkfE4HKJssY+5M676juIxygO
jOZqrB2T5nPltqGysAx11UN+ZNG1qKcN53LdBGNoR4pgSbQj8RRQbNoRaEeKAuI0eKA2hG4jt4gB
TuEPtfeOHUe8EoT4EQqb4lUXrKI/rr8yP0GPtF6DfEgk9dfmL1l+ZH6J3wIvQb/TCpDaD4hC1oK0
OPaSihv9MptE9rAAxeofkSc4xPkQhiMfCmFVvUb8RB23Lf6J/wDQYX6Fv9BgUyx1I+9tzS/Qt8D/
AHjfoG+BCs/uPtDDGaC4HHtCGDoe0DPr3uTiWP06D4hClB7wivFuWhXXF6dcMVfe44k/ZX8xvtHi
VEfbFqS6i0IEFvCEzMz8jtpqXX3Mf+k2ewEaMrZWGjafQ+2bsM6lJaP0nYReo2dT0NR9gPyJ5p0a
z9PlJpeCZ6XiMHoXfxPTrLRaCjAx9RambWeKKIQFCHmIjQlDq/U8fpmG9+TYEUD3MQiz1DKqxMdr
LXVAB7nU8W+vP6haNmP061u//UvtOe+vvr7K6ta+NjP20A+3vPPnYse5jsn3Mz0y0lvyHvsey1iz
tySZGHgb4gMZRZ9TiC1nErd5jd8olZ4HfIy35glpFhKzCD3SItFuNCXvi75B3cxd8aExaN3/AJkJ
eItuNCYN+Y/dK4bUfuhkyIoopGBooopCCiiihSiiigKKKKA8KDClUooooCjb5jwTAlU/E2fp3ruT
0TOTIxrGGvK74MwQY4aTQ+rPoj6txfqDAQqwF4H3LudYDufHvQ+sZXSslbsSwqwO9b4n0T/T761o
6/h11XMFylGiPmYTA7qKMDuPNYUUUWoCjMe1SfiFqVOo2+lSR7mRYcx1nINtvaT7zPpXe+I2cxa9
ufeS457hv2nFmnbbU/ZF2SWNsTkbEfpxenJNiLcEovTi9OS7ERIhEfpCP6Qhbi3Af0K/xG9Cv8Ro
oBCqse8ILUPOpHImO2IgXAKdeRB7qfxKTHR1EOZVXu+n8Rd9MzzFzAv99fsIvVT8Sj90fmNC5+oQ
eFj/AKoa0BKiruF2cwsLf6jQ8CD+tYeNf7SDt4kRRt8CFXP1rn4kf6pvlZAK3+I4oc+0CUZTf6v+
kTZbAbLcSMY7/ET4zMutQLAt2AdmMbj8mClLrWBrxEKW+ICNrfMJbD7mI0N8Qlof4hBI24YO4lpY
e0MUsPaBEfMfXMk9Jtx/SaRiDcUL04/bASyPK4x3MkUQbk76mX5m3HPlJQ4rhcur+Z6Z0pg+Gjfi
eU1v/wDuSqPYz03ob7wlE9SjTZfjjzERqITY0yMCOQIt6E536v8AqPH6D0977XBYjhN+ZlCg+qvq
jB6JhvZkWgFfYHkz50+rvq3N69l2M1jpUf8AkB0JU+p/qDJ67nWXX2HsY77faYbHY4mcQoGOz55j
d2jG1zEZZBd8AtGJg8yBbjHxG3qCxl0yP7QY3dBP8wxOfMRaCYt6hTFuYgYMRiUFFuBFrcijj7gA
GKGUM6KKKYoaKKKAooooQooooCiiigPFFFAUUUUBRRRQFFFFMgSeZq9G6pf0zMS/HsKsDvgzJB1F
syD6j/pz9WJ9Q4Xpuw/UVgb/ADO2HmfJn0P9TXfT3V6r12aywDqPcT6h+n+s4nW8GvJxLAe4bKb5
Wa7VGso3EV1CXxHImtUXvMH6guKvoH2m8/HM5HrDerkNMLzqGdYc7fYSzS10jbYNZ+dxrcUux1wC
NS3jVCqpUUcAanBknbbAiDF2mS6i1NLJF2mMRJtRagQ6iAknYfaIIZEBqLtk3Go0CLtPxF2n4knc
PiP3CBH2GN6ck7xF6v4hYRnH35jjGX8wzdxANx3KohjLvxHGMvxAF5+YvXPzBpMMdNR/06yv67fM
cXsfeDSwMdBH9JB5kAcmSc6gSiur3j+nj+5lC21g2hGV2J5MDRC448GEDR87mcWOoItbcK0zdWBp
VkZtX8yr3HUiqJIbu+YF71Uj+qnxKBJ3C2YRe9RDH9Rfbcoje5OsCb1G9ovVb5gCKAXqtF6jGDqI
CREgJI5iiHiLUGiEgybxSV37ycCZ3Vge6v8AvNmOfKSzunZPrdR7x+0k6nqX0ud4+iZ5J0Bf+9L/
ADPWPpjitf7z0cdmm0Oj1oSG+5a0YsQAPeV+pZ1WHjtZdYqAf6jqeKf1B/qZY/fi9LYheR3Azq01
S7H6x/qFi9FqeqqxLryD9vxPCPqX6kzeu5Jsy7SyD9o+Jk5eXbmXNbexZz7mQ+0ug2z/AGiEbcQm
SmgmOYxhiGKIxQoHkZ8Q2PJgN4l2qPcYxzGMxDxjG3+It/iUNuKImKULcUaKAQkuNUbbVUe8iAmp
0en7/Ub+013tptpG3NRRRStZRRRQGiiigKKKKAooooQ0f+8UUoX94v7xRSBf3i8RRQHijRQHijRS
g08zoPpv6jzuh5i24l7KB5Ung/2nOiSKeYH1F9A/1BwvqNFovH6fNA4UnYf+DO78z4tws67EyEto
sKOh2CDqe7f03/qOMpKsPq7BbPCuT5mu1WUPUeoua8divnU4+5y1p35nSdWsNuOr1MCh9wZzzVFr
i3tODPfTdSso9QhJRUYQqnnzk8t8YpQRSb0zF6RmPdfilEeItyb0j8xCon3l7wfFKEGPuWhhWn2h
DBs9xHeF+KVLUWjL4wn+BHGE/wACO8J8Us/tjOo7TNP9AfmOMIa5IjvB8VmMq8xFTNkYVY8mP+lq
HHdHeD4bMNlb2EDsffidAMWj5EMYtHz/ANY+SGXxWc76T/6Y/ov8TpVxaPkQhi0bj5IT47OY9F/i
OKXHtOn/AEtH/wDRi/S0Dz/+sfJCxis55a21yJJo61qbROEvBMYW4K/J/tJ8kMvhlgnFYnccYzTd
/VYXspP9ov1eIPCf9JjOSF+CzEGMx9oX6P8AE2hm0AcVj/aP+uqP/wAv/pMPk/7PhsyBiH4hLhn2
E1f1df8Ao/6RfqV9lEvyQfDZmHpzn/lMdcBx5WXXz2XwqyBuoWc/aI+Zl9tYP6Qe4i/SD28wDn2b
/aIhnWHyBMPng+2sP9G/sBCGDYfYSH12Y7LH+0JXf/UY+dn9tKb9BYOTqF+jHu0j73/1GN3t/qMw
nOz+3SnHRTyYBSse4MBiT7mQuSDJ8x9usAVfiQ5FFNjoxbXbvxI+4xt/MvzzDL7aFbp/SsTDcsLG
JJ3OlxetYfTMVnvt7VUb3MTQInmH9Uep2DIXDRyKwNkA+Z6HBzWyX05+ThilU39SPry7rOW9GE5X
F+QfM89dmYksSTI1MInie/EPIk0eMI8oUQijiAJgmEYJhAkwWY+I7e8AwB35gmOYJMhs0Zoj4gmU
PuKKKJlTcxo8Umw0UUQlWB0qWYAe83cVPTQASj02n/nI8zSA0Zz3s6sdXGRRRTc5SjR4oDRR4oDR
RRQFFFFCFFFFAUUUUBRRRQFFFFAUUUUoUUUUBwSJdw8lkZdEgj3HtKMJDpuJjMLD2j6N+p7cvGro
tsYunBJ8Gd/jXCysMDPnH6e6g+H1GlwTreiJ7x0HJ9XHRhvTAETwvqkWrPh6nFiLR5bfe0fvb5kY
PEfc8Ttb+vQikfw9jsB5kBsb5kz8rKxEd7f1lFIF6jfJi9Vx4MCLUdrf06wkGRb/AKjLlN9hQfdM
+XqB9gjtb+nSFkX2eN/9I/r2fMj1FqO1v6dIPZc7Ly0qNY+/3H/eWLBxKx8x3t/VikG73+TF3v8A
MfiPqO9v62dIMXbX7jHWxt8sYLDjiIKY7STSF5Sfcw/7wFEPRmPaWHSP4Wz+YLEgeTCg2eI3J0hT
PkxQiOY2o7WZRUootRajcs5rCWjlpY95Bjj75Yk3LDqcRoo5HG5dykVVrfJkRhtyYJHxLuWaOKPq
NqEOJZrG13K0s1n7BLtNJNRjHjHiYyxRsZE8KxudCR7kggLeYhEYh5mYkc9qMTwANzwv63yBf16/
tbahtT23qloqwrWPACmfPfUrfWz733sFzPb+j03M2ef9QtrwgB1D3IxCE+gePIoUGFCFHjRbgM3m
C0KA0IFjIjDeDqAx8SIyVpGfMEhjGHqMZSAxo8GRRQT5jxjIEJJUve4A+ZGJo9NoLMXIOh4mNp1D
ZSF+hfTrAhGzR4jOSONSA7JnLLqiHLxRR51uIMUfUWoDRRRQFFFFAUUUUBRRRQFFFGhDxRRQGiii
gKKKKA8UQilCjjzGiB5gT1OVYEeRPbv6fZv6npFXcdsvBnhyk7np/wDSjNBW/HY8g7E8z6nj7Yt/
x38PJq2nqK2SUPKKsZKrHU+Xl7S0XEjMhDn5hdxPvMWUHjR9GLR+IiSYKT02EcSECPLs00EOxClV
Le1fEf19+xk2iS48Sv5hMxPvGjbLRhDEYJsyUVkiXag1EBDKHcA8HUm2UJa30eZOrblSErkHzIkw
tnUgufnQkbWMYHO+ZDqOLUJRuSiqXyaV9R/EnNP5kTLo8y7CU6O5Mrr7nmVzEDAs9668yKy3fAkW
4iIYm3uLmOo3xJlr4l2iDUbUs+msY18HULtBoajgkRveImNgxafiJrTIj5jGE0duTHVTGUSdFGog
0j7N+0XZLISEE5lYw5b6xyf0vRcl22B2ETwlm7nLAa2Z7F/VnMXH6WKB5eeNqdz6X6RXWLbyPqFt
30MSRRAEMGeu80UQii1AW4oooQMAw4BgA/mDCbzG1ABoBhvwIBgNBjmDuUPGIjxGAwjGOIxmMrCW
is22oijZY6nbY+AuLigN5A2Zj/SmELLTfYOF8fzNvq1/bWV52Zx5beXVjqxMlxZewTxuMada2YeJ
V3OWaHkkBtD2mrbfEOJiiinoPPKKKKA0UUUBRRRQFFFFAUUUUBRRRQGiiihDR4oxlDxRRRoOIoh4
igLUWogY+5Q6nU6r+n2b+k69Vs/a/BnKiXem2mjMptXgqwP/AFmnPTvSYbcM9bxL6KrO+ZJ/Eq9N
tGRiVWj/AJgDLep8VeNWmH01PMbMIY9oOjCHtMGULiJsDiSivjxGo5USczBJVmq+PMi7ZbMhuU+Z
lEog2Y4Mb3j6mO1EI48wRCHmWJVPQNsPiWtCQ44kxHMmwJ1K1q6fYloiR2LsRshWPtGhNBlUUccR
vePKyS1iTrwINSaXck1MGuZPuQ3DYMl1BtH2GDanrUcRN5jSsiJjRtxRtE9Q3zLAkNI+zzJhzKx0
bUaFGPgy7Tai3EbcdoOoiV2UbfMeNqXapKxsyyqyvV5EtDwJUkQ8Rx+IwB1ESAOZj52x3p5D/WPL
D59GP7qOZ50PadJ/UfK/U/UuRzsIdCcyDPs+DTphiHz/ACrbySl9oYMiB/MMeJ2OZIsMyNQdQ/aA
oo0eEA3iAeYbQDAE8GNExgF9SqZzuAYRO4BMIaKNuPuECTzFGPmLcMhe0OpDY4A95GTNPpNOz6jD
x4mrJOoZ443LpelWLj4yV+NCQZp9Wze5EjbMVj9vBnDPl3VjUHTVdZJ8ylY5ZjJbbARqRopPgSK5
CKKKei84ooooDR4o0BRRRQFFFFAUUUUBRRbigMYojFCFFFFAaPFFAUUUUB40eKUEsnrOiDIFk6eJ
JZRL3D6BzP1XQqgTspxOm8TzP+lOYdXYxbQ3sT0vW/M+N52PpmmH0vGv2xwePBEITkb1/HYaljY1
M+ttS0jbExSfKSRXeJIDI7vEMdK/vHje8eGQohFFDLS3jSf3lGpyp4lxHDCEGJHbDJ4kdh2JGKuf
PMbiOfMbUrMJPMfcYjmPIq3Q+10fMllFSQdj2lpLAw+DDXpJI7j9phM2pXsYtuCIQnyYtxwI/ZKy
NFGIi1BpLQ3JEsr5lND2ncsLdv2hNJ+NSvc3sI7W8fEhJ35lNAP8QYZEXafiWERRSQr+IPbqXQKr
yJbHiVF4hq5+YRaJ0JS6leKcG6w8BRuTdxI8zB+tcoY309lOxP7Zngr3yRDXl/Gsy8G6zkHI6jkW
c/c5Mpg8xnbucn3MfQ3ufcYo60iHzeSd2mRAyRTIoYmbWsK3EMHiQK0MNxCpDGPEHui7oQxMBjCe
Rk8wETIm/cYZb4kZ53Kp4B8xE6jbjYE/ujgxHxGHmRCbzGHmOfMYeYlYS1oXcKPJnRY6CupVA9pl
9JpLP6mtgTVf7Tqc2azqxV0kVgOZVucs55Mex+INaFxuc0OkABJAE06ae2on31KuPVu0bHEuX2do
C71EjgIoop6LzCiiigFGjxoUMUUUgUUUUBRRRGAI4ijxpUKPFFAUUUUgUUUUaDRxFEJQ8QjiOBAN
JLrciXiSLBp1P9Pcs4vX6u46rbgz22s9x/Bnz30a44+fS4OvuE+gelOLsSpwd7HmfMfWcfXJFnvf
TrxNdLASIrLCpHKTx9u/StDVysZ10YMxE/rHXtBNhY8yOOIXSQDZ3JAm4NQ2ZaVRqJsyRCviCQB7
S1qA6AiOyK0lU6G4BEJfEoL1DHJJEGMxkTRlHMlVRqDUNmXErGtzHsqt6W5E66Mu61I7VBBjZtWE
R/mIeYpshDjxHg6/McSAlXZHEnFXEehBrZksx2yQtWCNald17TLjHmQXjf8AaSssdq8YHUeLQm6A
ufmKLiP7SA613JgoHtHRQFEczFJN27kFq6MsyG7zMhX94/jxHiEpEDB0Jwn9W8v0ehJUu92tqd37
TyT+sGSz5uNQpOlBJE7fptO+eHPzbdccvNtaMIRdp3C7Z9lrT5mfPkoo+o0gSmGDBAjiAY8RxxGH
iKAZMhY8w2MiJG5NKRME8CLYgFhAXd+I24Pd+It79oDmLcEmBvcqDZuJJi1tdata+WMhE6T6T6cL
8g2uPtTxNeW3WG3HXctjB6V6OInjetmUMw9tpE6TPs/T4jEccaE5MlrGJJOzPPm82l21r4MNtLiq
EqBkVNX3AnxHvs19o8TKGSzUAqljKl7l7PMXrEp27kSkltAbMskQ5KKKKd7zSiijcwHjR40BRRRQ
FFFFAUUUUBagmFBaAhHjCPKhRRRQFFFFAUeIRQHEdfMYSRRAcSVBBA4kiwsSmr4IPxPcP6fZf6jo
dO/3LwZ4coM9K/pbnELdjhiTvep5X1fD2xdnofT76vp6qutR+JDW+xD3Pk9PcDcvHErESzYfsMrQ
EIYEEQhDKE1Mtr4EpVHRl6o7GpJUUR8R9cRj4khj+1Wz90EQn8xh4iZ0z0YxRyI2pNrpLQfulseJ
UqIBlpTuYsZgoNn7TuSakVv7TCaVfcxR9Rv4m3a6KOPMbRijYuVMOwQ5WpfR0ZZkljJjIbzwZI5l
a1tnUkQmkcfUWjHAme2wxHEdREeIwPxMtpK4n/DH8RtbgV2r2gGP3r8yNY5XsO2MKyz2BkR35lgg
0Qi1H7ZW2Dk/af4nhP8AUHM/VfUl4B2qALPcshxVRY7HQVSTPnLq9v6jquVaDsNYeZ7X0bHE2mzz
PqV9V0qxwIwBMMCfSvBkPbHKiFqICER9uoiIZEYjiRQbgsdGIwHPMIRMA+TFuKCDGBDPiBClxEYx
i3+IQJO/EYR9RAQsDRSzAD3nffTrLjYQRuGHvOP6VSLLlY+F5nR+roccanLmmZ8OvFppdaf1cXQP
vMiqoCruPmSC02cM24rnCV6E5Yq6N+ERsCyvY/c0F22YePUbX0PEz9IBfM0emYvfYLG/bIHxiGUL
yTNupBRjBfxMNjy+OI0cT0nnHjRGNKFGiikQooooUooooCiiigKC0KC0BCPGEeVCiiigKKKNuA4h
DxGBhCFOnmSgcSJRzJh4hDiGsAQ1gSidT9AZn6XrdYJID8Tlll/pN36fMqsHlWBmnlU+TFMN/Gt1
yRL3+pyD5lpbRqZuDYLMWpwd7UHcsaO58NaOtph9NXzG1h27v4kcQiExZaSKpIhdkmrX7RJOyYzK
wq61JabSp1DsrGuJBrRjarRvGvBkZyBvWjIow8xDHQ2fuMJRsSOWcdQRMf2zCEMYqRLoQa5glBzA
o8gyWu0iPYoBgAQuk/rwGs7vMCLUyNHAjhYSDcnVJjtjKDsgsupbKjXjmRWjiIlFYjUkSwiDFM9r
o72EmR72Y+o6jmNokRNwxXJKhxJNTHYqWJxIu2XWlOzhjM4lAeDEWMYxTLbHR97ktY3IR5lqkfbu
Xan7OIxQSXUb2k2m9Oe+scgYvQspidEoRPnsj7j+Tue0/wBVb/T6MKyeHbU8X959R9FprHM/14v1
K+7RAl4j7giPPbeWfzHEYCIzGQu4RmI1G3zBYyKFjIm53CcyInmA0R8R9xjAb+8aKKAxi1+Y8UBo
8cCOBzAu4V3oKfkyyM4+8zQdRyfzMLUiWyl5hq05o7xscfzLFlpt8eJiISDNrp9PeO4+JzXjq6KW
2EITNbCo9Ogs3kyBqg1iqvzzLt7iusJvxOe0t8IaD35PPgSfqF4/Ysoi3THt8mDssx3zMdq4eKKK
eo8wooopQooooDRRRSBRRtiLYgPFFuNsQHgtC3BMBCPGERlQtxbi9o0A4hqKIQDEca3HUceIQAgM
BCEUIQCENfEFRJANQCSSpwRIxJFkmNwyidS9o+icwZfQ6P8AUg7T+Z0QE8+/pll99VmPvkHep6Nr
ifF82nTNMPp+LbvjiQRt8xzB95yOhfqPAksgqPAk4M1ywkzHgys3mWW8GVm8yLUtxtRR9ysjDzLm
N4lP3lnHOjqEW40QikIV7jomRiHefuOpEplZbHFG/tFuF2mq5IllZWqbUsK0jGRyG7hZJ3DUr3Ns
8QiAtzG7oiItGFN7wk8wYS+Y2Llf7RCkKWcakndDCSb9spudt4k91ml0JWMyggoo0eZsiGpbq/4Y
lQSWu3t4PiBZJjbEjNo3ANoHMke2uYeWf1jyv+942MGP2/dqeazqf6kZ3636ktI8IAs5cT7fg0im
Gr5vl37ZZKPFGnc5hb4gs0UB2mMhi0YniCSYO5FMzbgnwYzeY0BjFEYoCiiigPFFFAfUcDmIeI4g
PFFFCwNRsidThr6WKNjRnL1/vX+Z0dtv+SoHxOXN4dGJJXaot7iYNtpsc/Ep9xJk1Ss7ADyZzS6o
gXgyxiVGy4KP7yW3EaqtSxGzL3RqNdzuPM1zLLTy7UeKKeq8o0UUUBRRRQHiPiNFAaNCilNm9o0K
KAw8RCPFAaPFFAYxo8eA4hgQQIcAh4hCCvtCgPHXzGhKOYEq+IftAAhwHENYENIV1H0HljF63WCf
38T2ao9yg/I3Pn7pt36fOpt8drCe99MuF+HTYv8AzKDPl/rGPV4s976dkia6TFDuOElgJxHKTxNv
RQgkHiTLcB5HMiYaJEaETNbseJGYMcQseBKvceIRqMlpTQ2ZPoSLtRKkGEDJ7K/eQkakQaWsPfiO
1ncZHFCwk3uOqbggyzSNrCo+yM1ctBdQWHEIqA6MPvIjEaJgnzG1H3kxt74gxD90iwNU3JPTh0Ls
bkoUQkqj1yE8GX3XUpWD7jGkD3GP3t8xooNGLE+YaLuR+8s0jiZ1QgnEFk14ljXMBxzMhUPmMYT+
TBMoXdIsh9UuT7AyQiZX1LkfpOjZVpOiEOv9psw075IhhlnrWZeHdct9fquTZve7DKIklr+pYzfJ
3IxPu8detYh8pkntaZPFGPiD3TNrOxkLGSNyJE3mFiD+0CF7QZFCIoooAxRRQGiiigPFFFAcQljC
PAeKKN8QQkXyDNipzYq8THUzf6RV6hQ64E583h04YGKGC7Imh0nH33WMOBwIWSB2gL5lytRRj62B
OKbOqEOU4a0ITzL5cUUA6mG1pa/v95NfktYBs61Izh5zFFFPUeSaKLUUBRRRQFGijyoUUaPBBRRR
QpRRRQFGMeNAQhCDqGAYXY9cCEPEYeOY8IS+TDgKOZIOTAdRzzJgokajmS+IDjxCUQRHEBwOYaxA
RCBIvtPbPoLK/VdFp2QSv2zxMHiejf0u6gVW3FI43sTyfq2Pvi3/AB6XAv1tp6eDxF5kdb78w9j5
nyD3IBYOYMN+YMMgR18xtGJQZRfT9okiypRZo6Y8S2CPIjQTj7ZTb90tPYAsrkbMhAIotRaPwYU6
+Zco/aJSEmqsKwLhHMY61GDg87gu415kYq7nbcQfeOdb4jhdwzNG94/aR7GNo7mQt0f8OSStS/ad
e0nLrrgzGYSYO/iUX/fJ7LT7SD9xlDQdSXsPxB0YAqJZqHEgEkRtSizxAfW4BeRO8yiTSNv3GB7x
yNmEFlQ04z+qGSKOhdu/usbWp2naZ5f/AFcyO67Go34G9T0PpmPvmhy82/XFLzlfMRjiMZ9m+ZCY
xjxjDEDHiRt5kjQD5hYDGMI6gyKCOI0cQGjbjxoAnzHXxBPmEviA4hDzBEIAwDEUYR9wFFHi7TBB
1nX9GrNeJ3n3Hicgo5nX49wTDRQOe2c2f1DpwmuuBsJPsYr8o2gAcCVTydxAczhddRjfdxD5MvUY
RNHe3vAxsY23duuNyTaIbHnMaPGnrzDyCiiikQ0UUUBRRRShRRRQFFFFAUUUUBRRRx5EB9Qhx5jg
QtAwovaICKKEOo5kiiAo5kiiA4hCICOBAKEsEQlgFFFHEKIeJ0/0Bl/puuVqTw/E5oeJc6Vb6HUK
Ld67WB3OblU74phu49tZIl74jfaCJIG4lPBt9XFqcc9y7k+zufDXjVph9VTzG03dJa17pXBlihpI
9LKX0x8QHr+JOGjbExYqfg8w1sI9zFb+6AOZlAkDcR+6CBHEMk9Q2ZYCjXgSKjUn3MUVrqiOR4kQ
GjLj/tMqEcwBJO/Ji5i3zFErA051LSJx4laobIl5fExWQlRqQWrLPEguI1MohFfwYtmMx5jS6Dkm
S1rxIdyzT+2TSJFXiJkBEIRQw/anYO1oBMlyf3DUimTOAkmNvmIxDzCpkXfMlVBGq/aIfvJtgGxf
t38Twr+pOX+o+pbUB4rAE90ybBXj2MSOFJ5M+cOvZLZnV8m5tbZz4/me79EpM3mzzfqV/wANKI94
McGKfUvBk0BjDkTHzCETxI28wgdwW8wyg0GEfEESAY0eNAUUUUBo4iigGPEJYK+IYEB9DUQ8xx4i
1AePGjwQfU2MBy1Q7jMebXRKTcVUeN8zmzenTgaC4xasNJ+m43q36I+1fM0chRXRoQunVitC3u08
+Zd0JsnSUkDgakXSq9bs15kHULe6xUEt03rTjAA/dNXmVh5DFFFPdeQYeIoooQ0UUUBRRRQFFFFA
UUUUB4ohFAUeNHgSL5kmuICeYcBhHEcLC7YCEkXxBAGoYgOI8UUB1kg8RhHAkUoYEHUIHcAx4hKd
HcER1I3JMbhlWfL2j6PzP1XR6CT9yrozc3OA/prmk12Y7a0p2J6Ei90+K5uPplmH0/GvFqQYeYdd
va/bC7JWv/y7lPsZyxDdMrrWnsJ+BHqu76lb5lUttCI1LaUD2EvUSXWbsA9ogfu1I7BvRkqDfMyi
FP3fdqIsR4g6/wA/X4hHgy9YYpMTI7mYH2kt9xrXYMo0kLe2veHlNukzHrBtcsv1UuvJEg9QmRqS
1S7+IB4tT43HVYWQCY3cd6k6KJDkgrkVAHgnkTXMMoSVv2kGSZF5WhmHmRkakd53Qw/ERVZ8p6rf
+5h2PJEi9YmoSGs/93QQLG/aomzrph6WASRGd9eZNWgKiRdQArqXtH3EzFdmDfdqSqxHvKrAjIXf
jUnjQbJuZEBU87lh7v8ALO+DqUMkluwfmHYeOZlEQhhazJtodJ702ZE3FBIlrFTVKy6hUOQewDUH
ZABEfOXZRR53GYa1uSYFuiwADukpdfmUNxE/BmE1NKP1flijoeU4bR7OJ8/Oe5iT5M9i/qRk+j0F
1J/eQJ42Z9T9Fx9Me3hfUZ3bRARRbjT23lSZjrciJht4MjMpB4DeYcBvMimPiCIR8QRIBjR40BRR
RQFHAiENRAJBxDA1GUcQoC1FH1FqAx8xR4hCwU6v6VQGlnIHBnKNOr+m7kp6Y3ceSTqc3I/1dHH/
ANl/PtBtCb4HmTtkCrHGtbmTYxdy0buJ8kzh15d6V3LuWMkqZifcwaKy5AHky9TjsvkaknUSyrDy
uL3ii9567xjGNCPiDCFFFFAUUUUBRRRQFFqP7Rx4gIeIh5ijjzKH1CAEYQh5kUSx4whQglhwFkg8
QG1CURoQgPHA5i1CAgOISwYawHPiJY58RlhTxCKISDpPonMfH6xWin7X4IntFJ2uxxPnvAvbHzab
FOirA/8AWfQHSw1nTqL2BCuAR/tPm/rGH8otV7PAyeJhbUcSrnoWC69jLW9QLORPEis/x6XaFYHY
5g1nRhtoCR7G5l5/jOJjSV+V4llVPpjUqAy1TYNAEyeSbFWh9VdybJq7htPMQ15hs2lmWpY9oZtY
ItJIh2r3IRCf9248upZbg1Y0gEXYS24UOvzJMSbhNWToRMndcrk+OIa6EfjzuapqdgWDUgu5qIEm
c/kSF/EREwveEa8IBBZSWGoR0JIgBmzykzErNG+0bHiDZSbLVZj9o8CGjcQgwmOpY7QZNJYAr5Eh
ViBzJ8i7nSnmVSd8ne4iJWLQdx3FfwY9g2IgRqP3Ay+TtAbFJo0o5lyn7a1H4kSEfIknco/5h/vL
qTtCO1O65T7CQ3j7jLDWKP8AmEquwJ8yan+HaAjYMLcDuUe8QcH3EsRMzom0POf6sZP341Ox47iJ
5yZ0/wDUPJa/6gcMd9igD8Tl9z7Lg064ofPcy+8klHgnxH3O5wSFveRGSNIzG1g24xjkQdQyI+II
hHxBkQMaPGgKLUUcCAlGzJ0XQgIskEAtQwII8QoCiMUUADGBjt5gjzAMjiavSHPpMu+AZkzU6MNs
R7kzRmjdXRg9tmtGb2MTVkMBrnc18akU4/3AFvMfp+L6+USw+1eZ5lr6ejSNtDpHT1WtXcc6ktmN
3XaHiauNjsUAUSdcYK22A3Oa2SZdEVfOkb3jxp9E+fM/tGEc+IMAoowjwhRRRQCAiiilCiiigPCU
RKIa+YCKmOvmHB95A+oQEYQ9bEBoawQscQDEeMPEeA8OMIUBAbh+DB0Y43AKKKKRSiiigIEhgR5E
72n+oHUv8GrwVrxk7PDrWO7/AHnBSag86M1ZKVt7htxXmvp1H/avq3/3x/7Yv+1nVv8A74/9swl5
EeaPt8f8bvnt/W2PqrqvP/eAP/TH/wC1fVv/ABP/APjMKKY/b0/i/cZP63f+1HVj/wDUn/aN/wBp
+rb/APiT/tMUeI8v2+P+J8+T+tr/ALUdW/8AFH/aP/2o6tr/AOKP+0xYpPt8f8Pnyf1rj6l6uP8A
6yz/AHj/APaXrH/jrf8AeZG4tx9vj/ixnyf1qn6k6x/462L/ALR9Y9863/pMuLiPgp/GXzX/AK1f
+0fVj/8AW2f9Iv8AtF1f/wAdZ/0mWCNRcSfb4/4fNf8ArV/7RdW/8bZ/0j/9ourf+Os/6TLGvmLi
Pt8f8Plv/Wn/AI/1Q+cy3/eP/jvUT/8AVWf7zL2Itx9vj/h8t/60/wDG+o/+Mt/3jf431L2zbR/6
pnAiFoR9vj/h8t/6vnrnVB4z7/8A3Rv8d6r/AOPv/wDdKOhFoR9vj/h8tv6vf471X/x9/wD7o3+O
9V/8ff8A+6UeIJj7fH/D5bf1f/xrqX/jr9//AJRf411P/wAdkf8AvmfFEcfH/GPy3/q+3Wep/wDj
sj/3SNus9T/8dkf++UzIz5mfwU/ifLf+rb9Z6n7Z1/8A7pXs631Mecy4/wAsZESNSvcRozKMFP4k
5b/1Xute5zZaxd25JMjj61HnVWIiNQ5bTMyFvAgmERBbzKx0FvEGE3iDCmIjHxESYxlZGjR40IAx
o7RoQhJBIwJKsAwNQ1EYCSKDAfUeLUUBRo8UAGHEj95IfEjgFOg+lqDbf3eynZmAFOtzqPo7xf8A
2mjP/q6MHt0OYwVP5mh0GodhY+TMPLu9S0AftE6Doh1WBPHu9THG5dTiUrVQWI59tyo7c8RrLrHA
DHgewgAzniPLsiIh84RGNuP8T6Z8yc+IMLjUYysTCPG3FICEUQigPFFFKHEcCMBDUQCAjgRDxHEg
Q3EPMcRAcwDEfRiEOA4i1GEKAoQgwlgFHjCERAS+YUYAwpFKPFxFKGii1FIC9oVZ5g+0JPMkrC2r
cQgdyJDxDE1y2QkEUQ8R4hmaPGjwHEeMI/tIFGiikBCPqMI8Bai1FFuRSii3FAKKNuIGAQGoUDcf
ZlQiYiYoxgNFFFAW4G+YRkZaA5aATESDAYzKIDOdSvYdkyRzIWPMziGMyjMR8RHzEZm0gMaERBgA
0aGYJlgDBMcxoUj4gwjBkAmDJUUu4VQSTNXC6bUE9XLfS+ye5gU8Lp9+WD6SE6GyZrYnQP8AK9TK
vrq/8reYrOpWVVtTiH0q/H2+TM9WZuSSZUatOL0yskXu7n27OBLWPZ0bHfuFFrn/AM3MyqqrHH2o
zfwJYTDyW8UP/tCLa5WEl7WV4hI9tt//AKklnVKW8YNQlMYGV/8AYeSVdMzLP20Of7QJP8Rp/wDA
0xf4jT/4GmP/AIL1D/wzxv8ABc//AMNZ/tAl/wAWo9PsPT6jv3gNn9O19/Tq1/vI36R1BRv9M/8A
tKt+Lk1j/PocD5IgS2N0iwHS2KT/AOaS9KCUtZ+ltLK3kETMatSOV1LvRVIuZR7iaM3mG/B7b1FX
qMpM63pWMErXQ2Zn9D6ebe3uA8+J6N0XpK1Vh7FG/gzwuVnjHL2sdWJVg3Wr3LW2orun3V1l3rIU
eTO0QKv2qABMT6vssXp+qhsmcvF5MZcsVlttOofJMeKNPrXzR4txo8oaOIo6iQOBHiEcSoaFG1C1
AaSLACyRRALUQGjH1HA5gICGFEUceZA4EUUUBLCjAajwHA4hqIlG4ajUBu2FqLUeAo+o0QhSj7j6
i1IEI8UUoQ8wveCPMKSWUJV8SVZCslXxNcwzgYOo/dBiHmYqOPGjwpbjxooDxRRQp448xtxEzE2K
KMDFuF2ePqDuODCbKKIxCFFFuNFKh9xbjRbgKImDuLcAWgmEYMqAMBzDYyFvOplAB5E3mEfMYzZD
VMm1EQNR40rFG3Bgx38xoAmNHMZv2wodRjFvQi3uFNFqKEg7mAHvCLWHYlR2q7s+ZeGPkXgHWgfd
pFSuLg1d+QfVt9gngSvl9SvyDoN21+yj2gaVidLqUC2+x7R57BxJE65VjjsxMWpax7sNkznh/MIQ
S2z1/N2e24KPhRoCRv1vPcaOQ2pkgSQAysV//Eco8m5z/eN/iGR/rP8AvKg8RQuln9fkb36jb/mI
dRyweLnH95Wi1Bper6vm1sGW5tj8yev6hz1bZsDD4YbmVqNCOg/7RtkJ6WZj1PUf9K6M1PpuzDys
pvRoFZXXn3nGDzJqLbaX7qWZG+RNWSNxpuxW6zt7r9O01nLUEDjU7ldAaE+aOndd6liXB0yHP4ad
b0/+o2fjt/3mlbl14B1PA5nAyZbbq9SnJq9q0N+ZQ6vk1Y9Y7wrE+xnmY/qYzf8A0vZ/6twf+2ON
mWlr7Oz/APIcTRx/puTFftLOeRSXhEUUU+qeGfUUXtFCFCHmMBCAgKOIogIBgQhGENRKHAjxRQEI
SxhHWAUfxFFqAQiiAikDxxGAhAQDVYQGjGU8R18wD1FoRwNx9QGAj6jx9cQGiiigKKPFqFNFHihY
kamSIZEkkSYyzhJ/McQYQmMshbhQIcxUooooD7i3GikDxRRQxPHijQFFFHhdFHGoMUKOKDuPuRSJ
g7ijGViUUaI8QuyJgMYiYJlAmRP7w2gN4mUQkyjiiimcNUyFoBMNpG3mVDai1FFAEwG/bDb3gt4h
UZGxEI4jakCgkwvaNrmUNuEvMbUJRzKCjr5jqIQEqHUSQDiCo1CkCiiigKKKKAooo4G4BVrsiXaK
9SGhNal2sACa5bIEqAfEZwPeOTzGPImCxKAjnQi18wyI2pdbZON1FHim1zkBxHAiEcQFHEQjrKGh
+8UKAtQwNQYcBo4j6hagDHXzH1EBAICFqIRSBRRR4TYlHElA4gLJB4gDrmEo1EBHEA1jxljwpR4w
hgQB1Fr8STUWoEcUKKFDHjgHUQEiwcCGOBB1DEjZB4UGFMFKFqDqFIox4ig7hQFFFFAWooooDxRR
SBRRRQFEIooDxRohAeMY+oQQn2hdA1Ac6lyvCvsOkrcn+JDmY1uO4FylSfmVNK0EmE3iRzKIYzJG
ATxCMjPmXTGZIiCwhE7jHxKxRNBjvBmSFGjxpNKUYjiEIpRAw5ja1JWHMjYGNAYotai1uA4hLEFh
qNy6lNnEJZItFhAPY3+0lrw8hj9tT/8AtmUVlj2hCIWpcTpeWdapf/2y3V0DPsG1pP8AeOsnaGPH
m6PpnqR/+SP95Zp+juo2AEisD+Y6kS5oRETr6/oXNLfdbWBJ7Poe2pNm0H+BHXzpduI0YScGdX/2
XA4Z2/sJfp+lMYIpZ2P8zKccp2hx1R5EtIdzsavpnDVgSjmXP8A6eF36R3/M19JXvDhtREfHM7gd
Hw//ALX/AFklfS8RW2KV/wBpfjZdohwIVmP7T/tD9F/9Df7T0KrAxfesD+0lNFNQ+1B/tJGLafI8
AjxoQEiGijx9Sho48wooCjiICEo5gEBqPFFAcQx4gwpA48RRDxCWAyx4+tRQGjxR9QmhrJFkQ8yU
eIDwgIwEMDiFOIow4hCUOBDAgr4hjxIp40RB3EeING1FqFFADUIDiPH1xIsRJootR9GSWYhwIS+Y
6oxHg/7SWvGuY/bWx/tMWWkcXvLY6bmnxj2H+00KfprqNqhvTRd+xYQsRLD8x/E6L/spmJ/xXRf4
5ljF+lGsbVuQF/hZJZacruJdztF+lMQXrW11h2dE+Jqp9H9PWsdzWMRIdJebxc/BnotHQcBbQBSP
7zex+kYSaC0J/tJtl8cvIErZjwpP8CTDDubxW3+09qrwaBwa1/2lXrVFS432qoJ9o2zrhmXklfTc
lzoV/wC8vN9N56hS6AA/B3O0w8JrrAEHjky01HbkBD+0GTbL4XD0fTVz/vbUvD6ZrVBuzZ9+J2zJ
jhNDt3qUMle3x4jbL4Y/bn6/prH7dljuWa+gYlVXc6bPtNhQFrG/MmsQnFU64Pg/MbZRhhm4vRcR
kLemAR4Goa9NxFpLdo9QHga8zQWi3HRXdSqt4lR2OyI22RhhJjVY4qP2qGnD/WVYGWrgaBGp2i1s
++1SZy31rWy1Vkr4mVfMtWXHEV241vOoBE7D6N6VjZlV1+UO4jQVSZ0f+A4DsNYyNz7zqpgmY3Dy
rZYifLyvtja/E9kfpeFSgX9HVrXxL3Tun9PenmipWH/lmU4pSMkPERiXt+2p/wDYyZOl5rjYx7D/
AOmewZlWP6vZTWvHwJo9MpqFAHYux8zCa6ZxLxOv6e6nadJhW/8Atko+lOrnn9G4H5nuhGvAhaBB
2JjEeWc+ngy/T2Wf3AA/G5cw/pDKyAx7lAXzud7mUoMtxWNju4lx8Z6McMoIVhzOqKRpomZh5/j/
AEa7uFa3X8CW1+iKCT3ZTLr4E77ArU1bYSLIRPu7YjHCdpcEv0fjFwGvsP8AaWa/ovp7MAWtP950
YrJJI9pLjk+qJfjhO0uaX6S6atnb6bE/kyQ/TODW3244OvkzeuOshj+Zcw8X9YHPeE7deY+OIItL
nq+i4ntQoP4E1X6BjYiqexCT50JbOKar9FgdH2lgrsckmc989azps14YzU1qftrUf2iVQDvQ/wBp
r101F/8AMXYlPLFQcisaE30tE+mmUBA+BLWM2kA4kaKi1+oT3f8AljG0qSy16SbtMNhsO7iT8y3j
WBSN+JQ7vUuBlnHHq3ekDozC8RpazO2oj1n3EG+6tUbbA8Su2HZWuy418TNyUYkgb3uadeWzcoFT
vs0g8mat+H6SKQfbxIMPFsrIdhqaF9nemjNkyiKt0XH7W8iV7e1v2xipY88xyva4CA6kghCFktPy
FB18y8cQPh+og+/4lJa7KySVI3HaGWgCtmLMBwJDcT4kxssQFV3o+YK1950SAfkyx5ljPh8+xRR9
TkbSEcRCPAeEIMIQD9o8QELUKYR9R9R9QB1DAi1EIDwlgxxAcxRRSBR1jR1gSqIYEjG5KkGhKIYE
t9LwXz8paEIUkeTNhPpq4n7n1/aNtlcU29Od1HVZ11f0qFG2s3+NTUwfpHFsq77O6Ts2fBLz8CEB
PRH+m+m1uFFTN+dzXweg9PWof5C/3k7Hwy8pFNh8Ix/tJVwMlxsUv/tPZqemYwH21IP7SXIopqx3
JVdAfEbWMTxlOl5Tf/KMvUfTuTZV6muPidrVherk9tagkniXLcVqQqc6jbbXBDg6vpy1mAcED5l+
v6WqC7e0gzuBVStY2OZUyUUVkqIX4nK0/TlXf929fO5pY/QsZVJ9Ndiay1FaUY+8lZStI7R+6RlG
KGbjYFPIWtBr8SX0EU8KBLJpso7TapAMuZleKccWY+y2ueYZfHCt05a7MpUvbtQws2pf1LDHb/LH
jmVYagnnZ4mMr0hP+lvNfeV3X/qix6+TLVdrtiFQeJXrcAn8SNkUMMcvZ3bA/mXrgBityN6kC9h5
YbWQ5BYv9g1X7CYyy6wS9oQP4Yf9ZZx7rhrSn/aVS3dUlWv2zdoKLUo9wJjKTVUtvurUE6Ezcj9R
lWb51NXMrFign5k9K1VUHgE6kZVhW6WooGiBv8yLMYG5m+zkyet09R2/5j4WZ+WlgfbIVB+ZWU1E
lW63Y7/EjWpsixKyNfkzSFW8QKo2+vEsdNxO5/UcaK8ahqt4Yt+M6uVCkge4iPrGoIV+1fxOrNNf
PcJXStBkMoH2mVjFnPu+ReFRySq/PtF6FQ88mavVcYI1ZQaDHREpXYvCupBQEd2pdOmiFre1O2sa
E5j6wrL4jN8Tts0Y1nYMaoqAPuP5nN/VWIv6ByNkfn2meP8A2Tkx/jlz30w3pLWu9c8zuMYbUMJ5
70q0Cwa9jqeh4L1mhFc/kz2qRqr5PJP5aWPRNgD2aCD33Do9DuCqft+YrbFYemh/y/iCTqn0lrA+
DNNo0zrKvkmkZZWvniGtjIAKuWPmVa6LFtLES300suSWZdiabRDpx7k4uyteOP4lfKyblHax0T8T
bsuDjXYolNcSt7e5zsfE1V1tvtHhiY9TWXhiv2/mbd1q2U9nYupJl+nXUAgAlO0kV7Xkze0KlhYH
sQaEhvHYdb3x5klLPZeqk62dbMsZVAru7Ce4j3l3pGeKG9H1B4ix9LYWPxN7Dww9GrB9vxHv6bSE
JUaMw+Tyy6+GNXbXW1hesP3f9JUJPce3YBPibV/T1andXDj/AKzMWhi/b2nYm79Na6q6qUkEHXvH
BEiyctzUtRHb2jRjYr+q6ox1v3nFk4sXnsz7aSMwUSJ8Hvx/XDj51G6gppcJscyKkK401pA/mdGH
FNYabW2o+vo9p9pOoeyvQ/bLDdNpILLcJc6YihewgE+J0+oaf2yFqZW32mWcJSmR6jDWh7zbuxEY
cDRlK3DuPC+Jz3u3UHZd3rxzIAErYM4HMnxcK1d94Go1+G5PH3D4mETuWczBXXqauJXJDL8Su9GR
WTtSBI2LDzsTLbGJSqQtnJlgjudewb/tIMSr1rAPYTosahK14A3MZllErOHQFxFbQ8ShmqC/iWz1
BKENTjwJh5Od3WnR4mvUy2b2kfH7wdASiaD3EHiX68tAg55lXItUFnBmzHuJYZPT5xAhRDzHM0Mj
CFqMBChTgbhaiAj6kUax9RlEMCUNFC1FqAtRaijgcSBoo+o2tQFHiigOBDVdwRJk5gJVMkVTCCyR
FhWr9Nfb1OrU9Hqp7lU63ueefTY//cq56hhGt6ASQCvzNV5exwscWpuUfognTjt343LNCVqhUnQ8
xrrFsCtw3aZHlsT2enr7h7TCLOiccQiUd3eeNKZPV6gG0BIkFaWKtlTDZYibWJqvHVNAamdZa7wo
G+4D4lC5si46buI3NrKr71DcahIaxUApHE2xXbRMQodLrNLkvw5HELOLFwFYcSVyC2xKWSG9QE+8
vVYkdS7VvU5OuNQaKfWYVtvUtWAHHQ44Yt/zcS90zHAQWEfcZIhJYttFysQEbsXgHUYi3sA7ToeP
xOpsUFCNblWmj7XVlGieJerXOSIc/abrgouP2KOJcopr/wANsbuGxwBuTf4fZZeVA+wynnUPi2el
vg8zGYZxbfpTqQtyBsSVt8AggSTDPoXKzLtQeRJc2/8AU3brTQHgCYSziEnT7hRwKjYTIXxLCzMt
RTZ3BR8ipgQh4k56jkv9rVsBMWUSlwcU37VyQB7fMt2dOZOaidj5Efo/33Dc3O3RmUV205LzWXKP
QUJJrbu35Et4SWXEr2kfzOi7FI5UH+0AIqAhVAm+vFm0bhrjNPbUsLKxr12ACV/EoubBxo7/ADOm
e37tEAytYtL2KAuiT7Ccdo1OndT+ufVnB2QZPXjvlWLzsDzNvquJVXil1X7gJW6QvbQ9hQkD8TDf
lstMa8NPExUqqUAc68ylZmLTkPUSBozToZmxqyv95kZ3TmuyLLBoEnc2fpx0ntfUhuz1YkK0ai09
wbzKn6KxVZjrSwsa7SAdu+ZG/wCKJ9L1lhyMmtCNgczIvYra6jety9bf6N/evxxKGwz9z87O5dt9
KahbqrKYhtcgAnQ3M/qtH63AvRR4UmauSf1GJUwIFajQUGBQqJh3kt9zKQBMqTqUzV3SYeVdOHp2
vvyrz0HDxrrKEatSQR7Tz+7VfVMlBwO7c9E6Lm31YNRTXbryZ7WO26Pj89et5S/pL6wC6sNzaw8F
HpUudtKDZ1tw3awmr02wWV+fE0ZVxztDkYArXag9syTkqhK1jidReyihtn2nM24F9jkpWdTmtMvT
x60tYtbX1FgpJ/EazGyD+1SJd6aGoqCNWQZeZu5Zpm+mcV3DmbcTLdSGUmQNXfjgC1dD5nT7+7Uj
vrS5CjjYmyuVqtTTl66GufSjmWLOzEZUfZc+TuaC1Ji9zeNe8zsZP1uTY7jgAmdNfyhz3/Fp4uVV
6QBYCSPdUwIDrOZsV1J7Qdbird1sBO/My+KPaVtMuk7ft48SCupC5YDmS1Nuoa+JXxj23MpJIMwL
Qo9WoK2dyjgyoqFNHwZuZ1ItQLvXMy78c33BaSe0e83VmGm21NKrMi3tG2Jlr/B3H/NNXp+GMZfu
O3PkmW2mVp/jVO3OP025QSPAj9Oc13hW3vc3vPErDEqrt9QDne5qtkn0yW/Ii7tRqvu8St1L1E01
Y+331OWy9l1fuEqZBKMfaTdJc3Y+28gwM5f83U0VvMW000y7tpTa4sQCBHupR6mLL7SxVSDokbhs
qg9vH8Tf2dMSxulkixuD5+Jt4zll2QRBVFX9oA/iTJoe8xmzLavdgtlXfaQNzI6j066jnW1+Z0aW
dh2IWay5GEwVfu14mysrE+XHVkj3g3WDtYSe6r0gRvkSlYhbxN1WVnhOh7R9RR5ythvaIR46iAUN
YENZAawoIMfcB4o2xHgKOo+Y4jiUL2gGSSMyBRRRQDUSetZEksosCRBJFGokHELUMm19J0Nf1VFU
c6noleBeE2UIE4f6HDL1B7EBJUe09DXOvsPgBRObLOpe9wY/xpul4XezJYvHwZfyek1enurYYc+Z
F0491vcSQR8TVa5Qm9717Ca4s6bQ5qwhHP8ArEudPrsyO74ELJ6fa9zOutNLnTq3x0KHXJnRjmN+
WjJXUbMnScm5O3uHb8SO3pT0jVr9p+J0mGNKp9zI78rHXIem9RsjXcRPZwVxW1EvIve0S5zqPSrc
Kim0sHWwb0PK/wAyh+nazyNTpClmICcIDMVhohjvt/iZuZujHC9urGPjXibeZw649TVlgyzb2z/u
rGkJ4k2P1NUr7LByPiXOn9OtyKCAv32EAFvaRZf03kUE/d3sPIA8TzfhtDom1UuFnpkZCVAcmamS
grxrLNcqJhdIxWxus0o/7uZ0PV1107JYD/lmMeHLmn8oiFTpwFmCt2vuYmZXWaDZl1EewOzNXoal
ulJv5kOYgfNRD7rMJTHbrdzrkLb2aJ+SBNvpeCAosYS0uNXUC2hwOSZL0+9cg2Cvwo5mqfDtm/as
zBFK19hqQZOOLaSKlAb2MnsZbFChSNe594P+YllaoAUPk/Evhwxe0SrdKxTUS7n7t6msqFgxHtMv
Ibtsq1x/m64mvUNGzR4l34dd67mJZy5u7xUUI51uaCqpQlh/Ez2pJyVIA4abIr7hr2no8DNWKzFm
+eHN5i0Mx6u7I7QOSOJe6fhBbgzr455kTLrqK/AWT9QtdcR/ROm15nn36bl0349umoLJqruZ0cAi
BXRWqBEH2fErdJse2klzvXkyxlD7ahQeHPmcltfpy1id9JEae3QrHEgyXKqVWtifwJaoBrU+o2zA
vzEoUt/+sbc9ImMumLc3fqoDt2dHcguKUKaKwCf9UWRf6tzMo1sx/R/yS5U9/wAzGLPVrUNmCR2P
a47WlfqGPVjqnpnZPmWsimz9MtjE69h8zOsDE/dv+8y22RBk2U0DoCDYx0QD7RwNRyncCANmXbKa
Rp5x1Qel1q3flhPReh2V29ArQa9QGcR9Y4xxuq41jKQWXU6H6Rv/AO7BCdne57PHtur4/wCoY+uW
XTvSKenEsPvY+fgS101QMIuTqBn2LZjVop2x1xJ7qjjdM7Rydcy3ctPDLsymbI+0nsU/M106ivpg
qvtA6b0+u2juccnncHJwz3dlI495zzEOrHbSKvJttyNs2kE0k0Umfm0CnHVKQe9iNy9UHStFYDYE
58sREOil53pFcADvepHU5bcmuQuDqRVVlfM01lulD1Glr6CiDkyLBwjj0EMeW8y+zdrhR+4wnP2e
J01tOtNNqRMqLYtev2iVsvEU0H00+72h+pZ+t7d/bLrHtUnU2ReWu1VPGVlpAcaOpCwCXj8mWxYG
J1KvUAQa2UeDMoak96n0zqQYA+znzuXKx31g/iCU7RxxMo9sLR4ZnVc1qrAi8ak9GWllYJbR1Mrq
9bC7Z8GUu4jQBM7K4415cN8sxLqPWrP/ADiOzBkIHJmZ0vp7W6tsJ7RzqbtdSsnA1OTJSJnw1X5X
WFLpTF77a/OpazUJpbUgxyMXqh7hoONCaNi/5Z4nNbHLmnPb5I/jP6Y61KUHJ3CzOW3I0rFdxYH+
0O/lZr6TE7d9I87Kj9szc3vryw42RuXKbf8AMKkSW7RTehM9OmC59MGRUBy57vEmocOnsdSpeGF2
+8gfiYyq94Eja9kOlj1HurGjuRXL925ha809LVjdQRhYzcncoksB4nUVqpU7AP8AMwM+7uvP2gAc
cTqxX7Q2TL5+jeTChATS2hA0YUUQgPCEbUeA4he0Q8RwOIQMkHiN2iPoQCEcCMIY/bChMCE0GQNH
AjCGvmAdYluvxIEGyJZrECZRuGBuMo4hjxDKHY/07CpkZW/+ZNTt2qFOKNgd7e84n6B13Mfnid5k
AZF9VdfgDmcub2+g4Uf40uLUa8IXHy3GpVqe5b+7nW5dyAa7KaEJ7T7TQbHrSpdeZoidO3xKu2T3
Ds8OBAwu/wBb72JkqUKb+88+2oeFjMch2IKj23M65GvJH4tqg6UTL6we7JQAeWA3NNFPaJAmEtmS
LbSQAd9vzOzHnmLQ8a1I3O1wYYWsfptJxzMzIxFtyAX5mrl5ddGM5DAHXEq41S3pVabNKeTPaxcr
vMdmmadI8FbemLihNaG/3SxiW99fdvYMzvqQengAryvdwZc6QA2FT/8AjzNWbNtqjetoLcOo9Zrt
UgN27lrqiKcG4Af8h3KWW5T6joVDpDXzL2aQcG4HjakThlcnuJZnQBvpy/G4GVR39RD18oo5k/RF
NeCoIIXctXIqsfRPB87mMtVrTE+GF16w144VDw3kzFxMm3GZjS2u4aP5nR9ZxDk4yhP3LMROnXBg
HU6mmz1uJNZx+SGbe7aBJYzXw6LbEHqkhvjcfGxa8eruA+4DyZbwb+9C4APOphDmz2if9YU8qsJd
QrePUBM2SoDNrwfEyc4Gy6pQNszTZI1oe4ETZviN0iVFUPqEyxc4HbyRz7TKzbnqzR2HW/aWbCXb
n2nP9x18Q+l4PH7UiZWy1ZzN94H2yQjuU+6mZjdq3rLZLAaUkCT59s82HU6TdK9On1U3+7eoPUQR
iqU4KmZvT3P677jwCZtXECh9/BmuL7eDevXNKhiWlvUVn32mV+rDuoBHiLpv3NdCzk78cKntNlJ2
5r6rl2ycSvvvVfOzNnqXUErrbHrrUHwZU6VilsxWchVXyTIuroq57KjBh8y6ehW248JMSw3ZFIb9
q+01c/p9eTiuw0GA2DMfHIU6p5b5lhkyrEKsxVfxKTbTEqqd7ewcnc6TAxMfGp7r6wW/MgowaKMi
ttsygbJPuZc7ibArDhvA+IljbL4086/qrUrZONci6XxMv6Sdhb54M6b+qGID08Xc91Z/tON+mMjs
dT7Getw7bjT5z6hH5beg4SNflVqWIE3s49uMazyx8Sl0B6xUWIG9eY2Zlr6+hzOm9Z/Tzolt4lHp
4yDfOpUeq4WMdHUenOUY3+YdOBwPmRjLyBjeq6gVH3nLbHMy30sFmCH7xuSpdXawBHaTM265n+4g
gHxGpLtfUw8DiYZMU68uilm3YE7QFGuOZSyXFKd0sd2hszLzVfPyDXUO1EHJmnFjmZbZttVTJssy
e9QeJqs3cgPzAoqxcfDYWEmzXt8xIwZF1N16ajwx2rugD93vuTcNWd/EhzW7E4B3JMbbUqTua6bY
zLOxkevIcNvtPiW7UDro+8fKdUsrHA2ZJ+Z1RDRMmpXtQD4Ea51XQY63HqfuJEg6qhVEb337TOK7
lhafCLLxEyVHsfmVqOlVrYO4liJexbO+ofI4kSMV6gGYnsM7seK1vDyuVfrC/bqrHJA8CD0l/WoL
H2bUmtT1Kyp8ESl0qp8bvVz5MxyYerz6f566lJ1DD9XIqsB8HmXGYBdSrn2lU2DyDBxLTbWGPmcF
vb0sXGjUbZWfY6ZP2kjZmpTpqUJ+JDlYots3vRk6AKuvYRMbdURpRvAqye5T59pNbtqTrzqVsg+p
kbHgS5SCyeJptGm2Gf0ffdapPIlzLVfQYnyJJTStRZhwT5h2IHQg+Jr1tWf0q0urrvgS3aCRsCZ+
OP0+S3bvt95prajAamFqTLKA4lZewqx0CJz/AFKjsy3UEEAzY6izIoCkjfxMlqLLbCd+fmduLH1q
k2fPceLUecbqKJfEWoQEyBRCKPqAX/LHWIeI4hDxRRQDEL2g6he0Ki+I+uIiPEeQBqSJB1DUQJ6h
zLdcq0+ZargSCPEIveFj26v6KYq76npvSqO0eq66OveecfQqD1u78z0a7P7aezg6+Jy5fb6Hif8A
zW6VFuWznkDgS7bUGHBmHh22qVtP/COwZbouNgtLtoL45nO7IWHq7LQQzDgnzHxMqw4xsJ3p+3mU
mYtR6vdtgda37QsBS47Af+YGa7WisblnFezqUCqFIf7yPEqdSvNVbE/8TfE06a1LV60X41OeynGT
1PLW1tFOQJhx+R8k+HHk48RKmtOVm7uYEoDqbXTkHooutj4mOc18bG9FRwT5m10B02FuBIA3PUxZ
ZcPKpERqFb6pB/RVKP2BzJ+it/3GvfxJetYTZlAVG+wHY+Y3TaGox1rca7fmdE5NuKf9YhVzkB6v
i2Dgn7SPxLuQgfH0/gg6mVbabOvIvsp0Jr2q7UqG1286mMWM9JjSDHYNidq/tDamb1bKfGtpCEhS
3M0cKlqcWxSN/eTuZvXamuFYQHf4km3hrxxF8vVcZwyq6+DKGPkPfk3VsNdniWcVT+mqVvI4lfJR
sXOW7X+Ww0xmFrbdNImu4FmBxjP2/Ej6OCuIQfPcZZ9VGX8RJZX/AMuuT7TGZa8dbzWa6NfZ+nau
8jYU61NPfcVYDQYAzIz7K7qRTWe5y3gTToOkrB8hQJz3vp6ePFaccRryq5eCLr/ULdvxHNenJP8A
vLmbYleOXYeJgW5luQT2DSe04bT52+j4WXpTUpthswliQo4GppKhYce8DDpDYaErz53EmUfWCAce
5mubSWzRM+STGRHP2drfPzLRDeme/wDYRM17bL83XdqoHRMrdVyba3WpX4E20tOnl5McWttapC4r
sWB03jQku1tYKhHPmCLlrwVawb2JVxrVTKVxsKwm+t9ObLx628yfqVvpkU1kgjyRM5cS937yeD8z
S6tRpRcvOz7R3Q5HTg9WwUA3qZdtsq16xqFrp9FOLj+pY68+8A5623enSO9vgTC/zHPYCx/E6THX
G6Vhd/7r9eT7TKJYZJ0JcftI7/8Ain/l+BIeoq2MFdOST5Mr9Fz/AFs623KcBW2V3L3XczHswglb
qXLcaln0073LC+uVXJ+lmZQGfsPcfzPKfpg91yKfE9M6o2+lXp52N6nlXR37MuwDj7iJ6n0+0enl
fVK68w9Qx8j0qVrT48yQU2HtdgQCfeUujnuFJPPE6fNsORXoLoAcT1Lxp4ldzKDqK13vh10n7yAG
MfquO6PRhVP3nyyiB06nuuLOCdeNTSxcXIXLNyqD+WnPNohvrWWVmLbV202KUCDxI6LWr4HOzLXW
Hdsom3lveRdOq/UXdg4mF/NW6ntpKO6sH3Imbj3WUZdnaPPE2Xo9HRLDQ4kVgX9O7gL2g737zlxu
j0zrsSx/vAktFLJSrNLmPnJ6JPYSBK36hcksBxOmK9ktIWrD8wwvan8Spe19QPpkMBJ8kn/DgV2b
T5ivG87arZNQyOpXA5aAHhTNKkF1H8TPx8NcnuLH7l8iWV6gtG07ORwJ2xxtw45yztbFQq2T5MDJ
p/VUkd3I8TNORkdQyhVUOCfI8Cat6J06lKS/da/BI8zKMPSdpN5lTpx2qBBjHHbI32eR7zR9Emnf
48zJx8005DV863zOmt514cl8UXnyuV5HpoK7P3CB+pQWCXGSu2yvWufJjZvT6xUXrP3icGW9rTqW
/Dxq19KGdYGQAeDD6aAKtEgfzKlJVrGFoOtcc+DILWKsdGYfD2bp/F0PpLrZ1MPqGQ62mtd6gU33
OwUMx/ibOLjYioHufdnv3GSccUSJ2odJrNhPqKdH5Et5Deg4VNcy3VZQzlaW3qZmY/dna9hxNFq7
b4gOXaQgVf3NxI7y9Na6cMT/ANJcsoQMljHZ9h8SLMVWxiVHO+Jr6r1VcdDaGLDiChVbAR4lnBBC
doGyYn6edkhgJYiF0WQguTuHIErUgNtVG2kuOt1dhVkbs8eIzVfpLRYGDKfibos1vmaEF5jgQp57
rCRFHMUyDiPGiHmAY8R4h4ihDwhBhQD1H9o24++IUBEWvxDikAajrsQooElR+6Wq5UTzLKGBNv8A
vF3QNxQR7d19Gfbi79+6dk2I4Tu45nIfRqH9GDr3ncoe6obPhdzlyeZfQcedUgVOQg6emMwJZW2Z
d9GrIyaKqT2I4+4mVcDHNr93AA+ZtY/T1K79xNEuit2Nm1fpslqg3cF9xLHTKjZkVFSeWA0JTyxr
KcDZ5nSfTNQONY7DRU8Tmz0m9JrDfGWKt4UKbu2k/cF9/ac2MEJ1ew2Wb7zzL/661Mkdo/BMrZrt
dlVkbAB1sTn4eCcXtoyZomR5/SajWW3z5ipsTGdWCkKAAZV6nkvUeytz+ZJazUYdVln3d89SlnDl
/JrV5uNcQEbtb2BlLqeaK7GrB0xlHGtqGcm9Ltd7g/UQCvXcp/d7zdNmiuCPcq2PS9Ob69zf83E2
8vOqqx1+4bHtMzMQ5nTqMheGTg/mZlFL3Xj1iVT3MRZttWLe2rj5mRlMy1ArX7n2lkr6g+071wYO
Rk+jhLRiLpW4J1M/p2cMOopaD3E75ETLCtKxJ+s2vjrR2Ht5lyply8VvV5QDZMyerXtmvWVU9q8w
cfIsoUryB8THbfFYlrYuCHqOmJXwJRy6zh3FQefYyxgdSHf2txIest61yMnPEwmZbKViJVbAK6aL
a2Pqty34hV5twP75F2n0yDv7YFB240N8zReHpVmNNii/9VUVttAUfMslMRaCqldykoLIVIHMhFFn
rdick8ic0nyaa9tgo6TscE8CUekIbmsZn1r3Miy7rWqWh1I7ZDhl67lIJA3zEVYzlj9r6mvu9JOS
zcmR5uOlueQ3AEs1FBl9x1peZYxzS3qW3Fe4ne/xM4q1WyxCulJekV2KAF8GR29Pdv8AhDx4jZPU
ayWFTDj3mjh59Axq+9x3a5mcQ0WzKKUWmj07xx7Sti5AwzdQ+tN7y51TqWMNBbB55mPl5WIw7w3c
5+JsrDVOdpVWYq41vANpbYOpcFSriq1taEtz8zlF6gldTLrbN7/EtY3VrCFVySgmcxpptkmzWuah
1CCpVPyBqTYODiWtu0618zDyOogX96Df4kNvVLip7AFEu0jftvdR6bj24eQEYAhSRr3nh6Vfpur3
1+R3bnol+fe4ILkD8Tgepf5fXW54Ybnbwrau4OZPaPLv/p8d+PW68gCdDU5sUV1n7zOc+kLg+EK/
ceDNupjVb3DzPcv5ePHiV/DtTGJVl22+Zr1ZqCnvYcCc05LMWG9ma3TqrLMbbDSj5nNkrry21siy
MV+o5TWVqQvsZZ6Z044mWGZt7GpZF9qKEVlCj8RV2P6oZm2JzWyRrTppjn2j61oKAo8+ZRSiy+gV
Ke0n5lvqOXTWS1jroDfMq4/U6cyspXYgCnWgRuY1vENvxyNsJkqatCAEHI+TKOHT22NvwJr1V6xb
dHZaPRgfZ9418zoxztL11DDtrdrmKg9okuNYEPa/g8TaCVoPSTXc3Ag2dLqbTWA934M7aS471cwz
HG6j7hX8fBEfrOETkI1A7g+gB+ZqZgR6XosRQa+UceRKFeRYhXv+4KdidlfTj/azh47dNQKEHrMO
ZUyce67I9ZmJcc6Jl2nJV7TZkNzriFewYepWdr+JrtEy2eNKbZ2S49JawCPMzzh5BtNnpnzuanq9
p3sbh2dR4AI4mVdw121DMryLqn0djXsZo42f3bFvgyvmXVXBdKA3zArNIT797/E12xdiMkQgtrL3
ua+VkNtbKORLtdoqR+0/uPiV2fvcBvEtcUwwtk2DCFiP3JLdtbWnZPMe22tAq0LpR5PzIxfr2mOT
D2ZY8mvY6ltp7iinx7CVLmdrNnzL9fUbKUIrA5+ZTN7MxJUbM1fa7bvniPSzisShDnf8y7XUGxwp
GyTMY2up+2EuXeDwTMZ4e/2v3MOjdcfGpB0vdKmPaluQAdBTMO62x+WJMg9V1PBImdeA125Ts7TS
lZJK61MO9EvYqGAH5Mx7b3caJP8AvIu9vkzZXgxHtqnlPn1YUFYU+fewYxe8UcCUPDAg6hCAhHHm
PqLUiDA3H7Yl8QoQOo+o8ULBCKKKFKKKKAaeRJ1kCe0nEA448wBJBDKvt6Z9H1AdJRtcmdNR22Y9
oY9vYux+Zg/Sf/8AIauOdzZxK3usFS+W4M57+3t4J/CB0XvUNI01cDJyLh2M4Rf9ULK6SuL0pnYg
XccxkVKuneo3udTnmNyz2v0Y+DUrGy1bG8jmX6bVp6ZZYvAJ8Tk1Q+VB18y9+ptfHWnZ7RzMem0t
LR6Uv6p3ZrNa55llSdilkGw+9/ImV05TXehJ1s+/vNei0WNbYSvcv26l6OXJfSvn43r5ZCj7QPP5
lg43q011XcBBx+ZMcirHoD2Muz55lO/qlDBSrgHczrVyzltA8jpXf2+jrY+YVmIr1+jlAELyp3LP
+KYiVBvVB4mPmdbx7MlWTfao0TNmmMZrTIKshceh6WG1VuJadq7Fxq1UKW8tMbP6hj2n/JUgn90r
3dSdlQINFPBl03xfbocxGpcdmiBKxZLR32KDMazq+Q6EM2+JTGZkEdqk6/EsRKd9OmbJoRAAgU75
PzIsyzDyMPuWwC5T4M5otc7jZbmPajoNsCBHVl87UpRS22YAfO5NTdWLGZ3B7eADMeuq6xdqD2/M
IYV57xyezz+Jj1ZRyF27LUu/P7vOpI+ZhLgVopcZAbZ44mf+htWvvJOtbMko6er1I9lmg3iYWjwv
3cwtnqiKBpT48yKrrLU3+qOSBoSf/BkD9pctsro/AMSdMoDK2tgFgQfxOW0aedy/rNcPtHd1n1rP
UZOdSs3UH517++pfXGx0ptsWsFu1dD25Mh6hQowlWqr7luKkgf8AlEtZn+PP4/8A5HXLl+OYU1zc
hvDNqR9+S+z9/aP+k6C6lKcfE7AFI0GP8x80on+IoAeHCjXxNkTH8elj5l8s+HMF2B5JgGxv9RjO
T3nfiDqV2VmZ9iBMfZgiPLvSnVS7gDyZb+2oBf8Am94OOnYpsI59okX1LdmY2tt0YqbHWmzs+DHt
ACywwCqNalfI2V0Jq7OjJERVn2tyZx31IDVn1OBy3E7Rqm+JyP1rU1YxXI4D6nbw8kfI8flV/F0P
0XaR9pM7qrG7qza3j2nnv0ge24j8T0HFvZqgmtj4n1E11Ts8SL/lpe6dgrkNzwF8zS6jelFQQAAe
JHgMMavevPtI85a8xlFgbj4Op4XJzTM+Ho4scSxcvqvpsQg7j8zI6n1nMqQgHt3NP6usw+m4lFSL
/nWHe/jUx85P8R6R6tWjanlfc/mefbJbb2MdK6c5m9RvyN+rYzH+ZUwsyzEy0uQ8rI7gVdgw0ZXJ
O5tx3ljkrEPX+i9VqyunK6EsRy3HiSZ3WmJK1ABZ5n9P9Ys6dYyAn0rOCN+J29FCXYnrm0f/AIz3
uFNZ8S8Tm2tX0mq6hZVYHA2Qdy1Z1+1l0taiZ4rXUY0rPUiKQ8r5LyNs1zd6mgTIsi97rO5gB/EL
019hB7BubN1/TGZtKE7bkx/UsA0rHXxJu1Yu1ZYvEfph5/qD7vfcYqT8yc9ojHUTk/6SVbtb4i7W
+DLOhFoR3/6Y6V+x/iL0234lnY1ESNTHtP8ACIQemT5j+nJC4Eb1B8Ga/wA2cWgwqB+Y/o8e0b1N
e0TWt7Ax1tK96l6QEIVLqQtY5+YJdh8zCcd5WMlYFkKoXjzM5zyZadmYSH0yZ0Yq2iPLRkvE+kBj
Sf0DF6Bm7TDtD568RbijGfGvpzxxGjiUEDHEEQhIDWHrcACSL4hDjxFFFCFFFFBBRRRCGRRx5j6i
A5gEJMJCJKIBiSINkSISegbcCSWVfb076aIx8KkO4CBdnc7HpXU8HvLDmw8cLxOL6eAMGrY/5Zr9
LvWh/C/jicmSfL0aWnWnU9Wzkvw2Ckj+Zj4d4bHs9QllT29pW63l2WYD9iL3647RqDQvZh1DY+5R
3GaodFLefLSwFXdVbswaznUsZ2Lfjv3UHuH48ysW7c/E17JNHpmf6tty2gnXCzOJb7V3DAyczIY9
rMylfGjKwvvXu1a/PnmdBm4CZDt2kCw86mFfi20/vQj8zKfTgyUnYay9jAFiSfky6+BfU/a+tle4
aPtKOOdXqSdczqMrMpBKBhsDsJ/9M7eJixXru8+XyH176jy+HlrTj13Espen5G2D2cDX/WOenEOy
l+7UuC5RQzF12QnG/gxXZlK2OVYHY1NuSmKk+JZ8LPy8sbyQqnpibbROx+Yv0SBFJHJEM5++7jk+
ZA+c2goTgDW5zzkxw9qlMkx5WFwqSx4IAcrAzceunELVgdwYcyuc6znQHncjuvvuTtPA3ua5z014
ba4b/tq21IDUqgb7gfEq5qG2rJTRDDXbv35lNrr313uePEElzyWJ/vNf3NWf29mtT2Ji1hiOKwD/
ADuEcrGrFw5PqPz/ABqYvOuSYBE125EfpY40z+20c+gY1tfndfaP5lTHzaVwqkcN6iAqNe8odo1D
VBNM52f2sx7aZ6sWVx6eyVUA71oiR3dQ9TIRlrZUXuOt+dyoFEICa5zNGT6fhyebQn/Xst6uijtA
A7dfECvNuXvA0QzFzse8j1qLt94+aWFfpnHrO4qe26+0nvsbZ1uRlXYt3Ox2dn8yTUE2Kvkx2276
Yqx4iEX6cHyTEMYfmSi9D7whenzLuW+KQrnH0YS0ccDctU9tzaBluxBj4zWdoJ3oTTbJMTptjj+N
yxbfUVtFSFiquCOO7gSxezZHk6HwJUfEZvDali+1i8VjwughxseIzCNWCihfOoX8zGbNGTJMg1OX
+uaC/TO/W+1gROr1Mf6no9bpVqjyBubuLaYyw5M8bqy/pCzdinflZ6l0d8YVj1OX4Anjv0q5BoKn
30Z6th1BBUfkgz7n3hfMzbrk8tnOIrUN4UzO6v1evo/T1ybkL9x0oHzJvqZ/T6Oz/wCnUyaKafqf
pKUPYVNZB2J81mrqz3sPmIcF1zrF3V8833AKPCqPYTU+mOoWJf2Bvu0ftPhh8Quv/S13T7VFANqE
bBAmGi3YmQrFGVlPgic1qO2t9N76p6XXUEzMTQx7Bs8+D7icq3mdtVjv1ykY4u/T2uNvW66BPyP5
nHZWPZRlWUsPuRu3+YoyvbcIiPceZ0v0nk32uaD3NUPH4lbpX0zn547hWa0+WE9A6D0Ovo2FtiGu
I2TqelxLTF408rmTEVlCtbKgLAgfmVyx2ZYzLmsfn2lYz6rHii0bfMZORNZ1BdxgkmHBIm34ohqn
kWDsxbMfXMfUz+OGPzzIdGEiMY/vOq+mOlU3Vfqbx3DegvtNOe1cUblnh75baiXKdrfBi7W+DPSq
uk4Gt+ipEgzOl4jVFqqlUrzsCcM8yruji3/cuKw+k5WRorXpD7k6kmd0fIxio13AjfE6+j1DVWvb
pV42PeWrQPUrOt+01TzP22xxvHt5x+jsJ12nZ9or8K7HUG6tl38iejfoqEyGyGUb8+JyP1TnLlZB
Sv8Aapm/j8r5Lac3Iw9K7c4RzGJ4judQdz0Jeb2kv7xmjRHxKvaQR4j5iEh2k2zFsxotSp2l85Qt
cQdQx4nxL7QwELWoo8BQxGAhAfEAlhRgI8BRRR9QHAj6jxQG1FqPFAUUUfUBKNmSiCBqPANZZw1D
XoPzK6iXemJ3ZtK/LCY2nUbZ09vSMRdY6AA+JYQEHYk9FOqlX4GpOKx8CeXfL5ehWPAMa+ytuDsf
Bh5eAuZUxxHNVuv+Hv7WhrWB7SVdp48zCMjJQq6rbj2Y1eXQVtr+0t8gTZ6dlYxy9paD3netSrdR
XlV9tvDezjyJjZGPd06/uViy/wDK495ujJDOLzDsqqyct7ieN6EHDuW+y/Gur7u08E+0o9K6nUcE
Ne47xxIrs6uqy23HbbMujM++2e9wuZvRlRPVS1Ap/wCVjqZ3oFSdA8eTNCmvKyMGq51ZwNmVKMiw
DISxeH1r8TVa8x6aMmOlp3MITXC7R8QwIxE09pYdY/UBCRFAIWotSblUZXQ3I2tAOtSdlJXUrWVd
rqTyGOj+Ibcc+fJw+zDLcSA/adQiePMO6MVZO51G7oPJiCEypqlPBw/3ak6SIVHe5Oi6Ex00ZrxP
oQjx9RFY6uYx4MUWo4EngBszCzLnFraPvOg7CRxKGV00XP3KSD/E20WJ0ylvfXmI3Wf6pfXo1p8G
F/g1s3eF7JPp/IP6ko53vxOj6qUOLWqkbPJEwMPpdlF4fniahqY/unLfHudt05Px0rBAI/bJ/S4J
7lAHyYwFXvan+8RjlzzKALsxyu/aPdlYtIJa5ePzKdvW+nIuxbtvgTP4pFrt1KfVKxZh2rrypldv
qLC9gxlTK+psbtZRQWB4PM24cc1vEsbxurmPphzXl+k3ityujPWMW/a178CeWuUX6hyjV+3vVgfk
EbnpGCS2NWfkCfdcKPkxafH86el9wv8A1BetvQr0Ulm1vRnJfSLZr9RFWE6q2uR8zp2AsQq3gjRm
RgdBsxOo/qsTK9I7nn8zgTM7rDu4XPjrqzrE6nfjt6fUKexvHdrgyU4/TspvWeqtm+RCCr1DFNPU
uy72DJwZkV/TuVjX7wMwir/Q53qeTkwWr7evjzReNw3r8TEyLK7LKQWr/aRxI/8ACenPkm/9NX6h
OySJXxcbOqB9azu//GaNXAHedGaa4bemVssR+0yVoo0igD4EhyzWKz6nAkotrHHeNyl1Flak8gz0
uHxrxaJmHmczkVms6li5npl/8oED8yrJLPJ3I59bjp1h8tedyeIiOfEYzOWJooohJMhDzO6+lj/+
0H8bM4WaeD1bIwsc11NpTOTl4/krp08W/wAc7dp0i4HHtB/cSY+C4sS9SeZxmP1m6lGCE7Mu9J6w
a7j63hp5V+NFf29SnJ7OnDLXiOCQCpMTOvpUsSOWExOt59P6Xuqt+4+wnOt1i0oF9XQExjBWf2yn
kTX9PRbrav2dw5GvM5H6n6SKAcikEqeSNzB/xGwsD6h3CyerXW1itrCRN2HHTFO9tOfJfNXXVQeD
HdxqRlj7Cd/3mGPcvOjiZd+hHUY6MiZ23+1v9oPdb7VtNVvqOCP23R9Pz28xCSOCPaQF7f8A7RgC
y7f/AAmmmfqmD/8Apur9Mz/xa1GMF0vCE6A43OL6l9T5eLmWVLWmlPkxH1XFb0sfS8v7eVajxRT5
19AcRwIlhQCWEBGUQoCi7fzEPMeA2tQh5jRxAKPGhAQG1FqF2xwsAQNwgsfUUBe8MCCIYhTiaPQl
7up44/8AMJnza+k0D9Zp37Ga8s6rLOkbs9TqX7R/EkAiQaEIDmeLb29GPEHAi0IWo2pNAd86jsAy
lWHcvxG1zH18TKNwsM+vpym47ftqJ4/Ah9SxK8PFZ67Ax3x+ZfQfIkXU6PWprWtdnfP4mytpZNHo
HX0HTf07Vksg8/mUnPc7N8mRYeIKU0B9x8yZq9GWfLCZMItbjqPaSpSz+Jj1TaEiISY0H/Uv+8hN
2LW5W29FI/MnVNwRgWJ3VkDzDszem1rtsok/CruR/wCJ9OGu1M1z+Kpl8cneFb0y53G9EgyejqC3
tqnpt4172EIP+ok9mRmNr0Ok0gf+awmPjZRl/wC1daCRJkxbD+1Cf7RzZ10n7MfFrX2A5jinrtut
311/hRGo/p3TJiXHxU0IYN58oQIC9M6sw/zM5h/BhV9FyHO8jLsP8NMZmIYzYQxh/wDcUfyZHace
k6tyEH8S0OiUjy7n+8lHScP/AO1z/M1zlhNs0ZGEfFpP8KY7ZGOP2LY3/pmvXg0INJWAP4k6UInh
R/tNM5ohnEObOdYDqrAuYfMl9fOSiy/9AFSsbIdvM6MKPYD/AGgZlYbBvU+CpEteRG9Muk6cC310
4YrViUj23/8A0JFZ9a5RXiqv/acfYqrk3DfhyP8ArAsYD3nsUrusNW4b2R9TdQsYslvaPgSq/wBR
dR97v+kxmsAjdxOtjgzL42UWho2dazbF7XuJHvGr6hdrmwzMbe9AHcNariNrVYR/+JmXxsZleuzL
HHLmVjaSeZNT07PsACYWSd//ANsywv071lhsdOv1+V1L8Wk7wpCw+0tYNRzMqqlednnma+L9A/UW
SoKYet/6jqaWH/TP6lUlgK6W+Q/MyrRhe248OfuQV9as0d/tB/kCej9OP/dKv/xEyunf0z6ul3fk
vXvfnc6l+h5PTqUW3RHjYnvcTl0xV1aXz3L4mTNb8YVh4hBtSevDsYgaHP5ly/pIr9NVvDsw548T
rt9Twx+3PT6NyZnxChXcyNtTLY6jYFAk9fSlXl2b/aWq+nYv/OWP9p52b6px4nzD0cP0jl/qWeOo
2SK7LssPJ/2mz+gwfgxDDwgftTf8zl/5bjxO4q6v+D5Nv9rOfLuOeYvUZhOi/R0kaVBIbsFONKqg
Tb/7BSPUJ/67afdnN2AkncFayfE6k0laz2Ip4+JPRg1WYZewAW//AKSx/wCQWn/WGuf/AB6ke5cm
KrP9DH+0GxGQDuUj+Z0/oCtCdk6mXcwyH+/7VXxNdvruX+LH0HF+5Z1VFliEquyIqaLbH7FTmbGI
Kaq37rNShWbGySaASAZj/wAzmln/AMLx6+En+E5Wt9o/3lYYFz5C1dyg75m9bbkvTpQAx9zM6qux
XZw2iv5mnJ9VzSzr9LwV/Qq+g2nzaoH8SxX0LtOzbuaGHlK9Q72AYeZcVgRvYnPb6hkt7llHAxR6
hj29ErdCC538zk+r9PbEyirNsHxqehW3V0r3O6gfzOM6/kJlZv8AkjfPmctuXefUt1eLT+M7ERUQ
7Gz+ZNj4rZLkLrc3cbparg7P7tSnj0NiWFyfPtMfuLzHttjDSP0AYBqX7wDIrbEoOvTG5YyM3v8A
tA5mTllyQbDwZpve0+5ZxSkeoW2yO6skIoH8QK7AdaMi7NpWKtkH90netq8RiV0AfM1d5/rbFYhP
3L4IEzb8lK2I1zLVKO1XeOV+Zg5hDZDkeI2rRTLV1M8x+sAE6ozHjYnbd3b7zjvrqlrFS0DkHRM7
OLbU6c+bzDzwR4oQnoPPMsMRgIa+IDiOIwMICAtRRRSglhqPxGWSSSB1CA1FFAUUILsRtQpGIeYt
EwlU7k3BqTiPJa8e5v21Of4EtUdMzLuK8awn+JjN6x+2UVlSAnQ/RNRs6wvb7DcWP9KdTtTYp1/M
3vp/6a610vMW+pFBPDDzsTTly1muttmOkxO3ZgQuB7iZv/ZnqVxLPlupPtJ6vo/J82ZTETy7ad0b
lb2v+of7wXtrRSWcACWcX6SqX/iW2H+8u1/S+Cp+5Wb+TMO8Qupc6er4A/8AqElnB6lhXOQtnqfh
Zvj6b6aP/pk/vNPGwMeqsIlKKo8ACZfLU1LlL8nbAYtFln9tajq/UihVMA7I4JM7VMatf2oBHdNA
ACT5IarZLQ8/GP8AUDtpcStd+8s/4H9QWHZyKE/AWdvWunElYbmfyNM3s4p/pLMvRRd1Rx8qiaH/
AOsnp+kKqyfUy8px/wDnqdaFj6l+Rqm13Ln6Uwt7ItP82GTJ9O4KHjHBP5nRFYxUREse9/2yWwaE
1qlBr8QDjV+yCadigyIoJt2w3ZQOOnsghqnaP26lz0xAYCa5ltjaGRsOdiG45iA4mqW2NhJMf2ij
zntLdWAxvePHmm0tsUMPMPQggQhOebOrHiLxGuHdj2D5UwzGcdyED3mNL6vDpnD+L546r3V9VykU
nXqH/wDWV/uI8maX1PV6H1Blqf8AVMzvn2OGN0iXz+XxaU2Ivdk1BjwWAO57TiYHT8jGoZMSnvVA
N9v4nilL6sU/B3PZfpm71unY9g/0iW09WzFHZpdN6JR+tXWPUD55US/mYdeNYvfXWR8ACXkrBVCj
H1CPEmqx+1i+To/G5YvDO1FjBCNQCEUa/Ehvdnu7dDtH4l7GsrIAXQHzKeVaq5vagBGvaS2eFphm
zYwXU1qF1Ly8iYFVpRV9IksRyuvEu05F4XlNn4nLfkadVcHjy09TM672/o9NrZ8SPJ6hkIu/SKiY
2RfdkuO8k/AnNk5fbxDqxceD4eK93K8AGFctn6tVKn7eNzW6ZWacf7vJgZiHfcq7/M1zyZhvjFH6
JioQbIlHKuUKdLz8wq6rLnIO1AG5A7gUvWVBb5mu+XbbXHpHidzA2uoKLxz7yWpl9UFzpB7R8el1
rVG4Unct+mir+0Gapytk1VPUBY9h4/Mmpx3yiR6mteYOO9VNtjWrtT4/EbFsT1WYMV2eBNtLRLTe
EtlbY91dCHuZ+NzRqwkRN2Es3/SRUBfWDnkgeZce0BZ3YZhwZt7VrsZHQgASlm111UBVp23zqXGv
Icb4B9oshu8lawDxuZZJhzRtzPoDJtCWA1LDuK4ANWOnex95bzm9GzdikDW5Sqyxc3+SgJHuZriV
tC2jtVjM+QCCRxMnGZ7rmI5Ucyzl2X5QNTAAL7CU6ktoYkKe33i9tQwXcPDOfa9hJrIP7RNIdPtC
aFxkX08WZLHKlVJ4/M2ToCc1rbYS5DrGFdWdm5nH5lPp2DZZkK7j7R8zqM6kW3qCfs9xHKJVjkAA
akjynYwtX0+z8amdmYLWglXAgqygtYXHjgbmTk25ZsLBvt3xEzoje1yzp4posdiWI8amOtVt7ojA
6JnTdPJ/R+re6/3j47pksexBsHzqY7ZKmLgrRtWG9eJHmr9jKNa/M3npGuRzKWTiI55E1TW29tkW
hy9ltiY5qrOl+Jmrhs5O9/zOg6hieidqNrMO2+63a17Cj8ToiJYzaET041X/ABG2fjc5n6wZL8Ng
qABeZv1YNuQXI8r537TJ6jimyqxCO4gTqweJask7h4+I8YRxPTeeMCPFFAXvHje8eUL3hARgIYEB
xCBjRCCGp0TpF/V7Xro0Co3zOkp+gMxgO5huXf6SVhs65iPCz1cLr2E8flc22O/WHbiwxNdy8wxf
6ckjdtrfxLtP9PsRSBYzHn5nooWIL/E5p517NsYKuPxfofptZG6lP8iaafTPTa9ax0BH4m8FjlNx
9zaf2yjHEMuvpWKvilOPxLVeFUpHZUo/tLiVyZVA5mFs0z+2yuOP4CqgKv7QIfpcyTfEdfzNM3lt
jFBhXx5hrXDUSRRMJvLZGKAKgjlRJNCCRzMdyvxwZVEJhrxEImiLE0jQ0bcPtBkdXmS7mXZpnFsw
QA8RFeY6nmOTMu8sJxGCxahAxN4myLtU4oBoQTDgmba2arY4QuNSMyRxuRkHc29mvptGeJGZOVkb
LMLXiGUY0JERHEIiIrsTDvEtnRBuMx0YTDW9kCAefE1X3DdSuz90IHciI0Iy2gHU0WiZ9O3HSPES
s7jiBWe7Ul7ZwZL9Z09DHi/YfMNVj6kirNHfztttT8ZeBfXlZr+qcoa4PMwJ1/8AVOn0vqlmHhln
Iz7vh27Yay+Q5P8A9JOnkT176Cbv6LWf9J1PIV8z1f8Apo3qdLsX4MnInUbbuJHl6diqmSqvW3Z2
ADXzBt+4FrH3o61MZWevhCRNPAFqlWK9xbjmckZdw6b18rV70LjCvFG7CNkj2mfht25SvZz7czcx
um3h3sftBYeAJEvTT2MjqfU3wwmnJm6tmPUC6dqzNtPBE2DWgX9o3KeDhrir5258mWbGPbxqcNuT
Fp1DqiNqechNelGyfEbFw66ayXG2PPMLJuQdp3sjmRPlhlIHB/MxnJWPcttYk1blmYKPtB1uRWZo
qcqRvUiodyxVCBzyYVuPW2z/AMx95hfNX9N9IT12C5CyjUrNiIWJA3CxXNaFFGyeJZwqbEB9Q7mM
X2znwkFAZV3xoQLMYldBpdUcSO+6uobsIAmdYi0sZvpkZGFZWARptyu60IN/8/wJsrdXkDVbbExr
baK8qxSCdGdmPFLRfLWPa8citcX/AC/368SSm0vjqbBp5lv/APdX9kmXL0ASp4mfaaTpptEX8wu2
Fdq3ZyPcyF3tqPfUveT7QOoZ9bUIqAhpmjqFyNpda/Mz7zLktEQfqVObmtvsKge0p0YdtFqqQQzH
U1E689fD1of7Qj1KvJcMFIYTbES5rT/FzF6PUEJfZY+TD/w2ivj7iJl5HUMsH/LICCVLOtZRfsBB
I9yJ3xw/kp7ebm5nxzp0XYtSKlYAA8CQWsRse8xruq3UGsHTs3n8TU6bmJf+9lDH2nnzwL0nzPhz
x9XxTPWZZuRk25DilKyh/wBUo5F9qsyXEkrOttxqrQdaB+RMXL6Mg2UsLE/Ms06Rp30yxbyy+mVC
+5i4J1yBL+fWleMxYACNRh24p70Gx7yDKyWyXFJHvOK3aZ8OiLfxldz2aV9infzqdJ02qutB2fHv
M63GTs7W4BgNnWVL21gfaPPzMqUvM+Xm1z3+eaz6b2RaEG/MyMrN7bPaZV/XrWQr2D+ZnHMtucBi
Cf4m3pp6Ey6M2rk0tsDWpzbFaLGsPgbltTctZC8bkGXjWPisTrmbYiITe2TZlMLWFbEBviROGKHs
HcdSqVf1wvvvUs55bGCKh0xGzN1NbSXiGhG1Hjz0XGQ8R4ooD+IQjQhCnA5hgRgIQlQ+hEvmPGWS
fSx7emf0hTbZTfjU9SUf7Tzn+j9Q/R5T+5InpSrxPlObf/NL08P+oe2OFhgRanL3/jdEG1AMlA4j
FJtpaVmCr8SU6kaLoSQLxNsyzqcSQCRhCDJlHE1TLdBAxw2oxEWpOzOIk4bn3hA7gaPtAsf0/Myr
+Xpsisa3KwBE3Er4+SltvYp+74kllh5OtqDrcs0sdISIdGSd3jchqPcu5JqaJy6nTL4dj38RwfmC
qyRKy4OvaT5WucWjgjXER8QVU7ki/uEzxZYm0Q05MXjavZaKz9/EQsQ1NYD9i+TA6tUyWrZ3L2b1
oeZVqqfKZgrAVj7mX/VPoacHdYnbyLZvOohP6tbAEMNGPwTxM/Lq/U31VOfSqB0PkSxhbAdSSwVi
Ax9x8zl5WGcLdx9XWNQCu5Jo8wCQDPOnJ5dXSEbLqMi9zhfk6kp5EGri9D774mWK0zeIY2pGlDJq
r9VwhPcDzBqTuWRZthXLtA/1SbDcdn3HRJnbz8c1rFqufiXibTEieo9p1yZF6QNy937dczQCj3g+
mu9ieXXkxWJiXuY8W9IMesr77ltUgqvMnRTPIy5dy9HHXUA7NRisn7YuyaYv5Mnp4p/WGkp1vHs/
1rqcQV4npX9bKFVsK4fu2B/aecsOJ+gfTbdsFXxnLrrLKJODPV/6O20mvIqt+dzygjmemf0aqbJ6
lbQg1td7m3lR+Jxp8vZ6MXpxAO13E1daZGqyCqju4mHkUWUZDVsTsS3SLKVDNvn5+J5kTp3Xl1eJ
al6bQ7+ZNbUCpMqdONaUKUGt+dy21u17V5YzTmjcMa20ouCDHooF3eXGwDoCWDj3sdlR/aT49V9Q
ICgbO54fx2pM2dMZo054Y7HNdAh7Qdk+wEOnHXLyGrwV7wDyW4E1ctMnvFdSD7z9z68SS2iujGan
BbtvH7zryZz2t2ruWqOTM26xLOxqqact8Kystf5LAcCQZlPZd6a+TNu7Np7q8W2zty7F13Ae8zm6
bdSqPbZ6j+/EuKu/UurHmtE+VJqlx6C7jn/9JWxrrEQWMSUJk3V71Nvo1najhvyY2QKFwaKww9Q+
RPSpEzDqjLH7XFya9D7hMvquZUeHUOsjsxrFP8ypk45709YH0ydEzfxt/JqWOW0dJmE/Q2c5TOo1
QARKefW1mfcEOieYsJzXnmvF7jSDsw+rVHu70Gi3E92sRFoh4179vMpMW02dINAG2rPmToCuOrWq
Ap4lXoLKbbcZjp25h/UmWtVlVFP3DXJExy4Jm3hni5HjyMY9eQ2quX+Jbu6XVTjM4G3AlT6V77bb
LHGlHEtday7UzHoFqV1LX3nY8/ib+NxdzqXLy+RqPDnLFZsrtKEAnQmxdgjBwkZyPUb2mQt62uLO
8/ad+JPVmG+4/qG3rxuevf6VNo3DyI5vWfKbNNn6IFR9pMzqa+69Vby06S0CzpJI14nL4jPVYXtO
yX+2Z8bjTNZiP0+a+s8+Md6/9tnI6KKKTcrNYfzMWlmTJFiN4OtTq7chm6cT7ETkQBZYH5XR+JwU
/wAkzEuH6xW2G2PJi9S7DEVhSr95Ox4kGdlLQ+mOzIqLLnwgKWAI+Zg2X2ZF7B+de886cMzaX1mP
mdOPW+vMuhXqNRrK79pgJ32Z5etSVB+IFlVhX/Llnp2StVvoMQbD8Sxx4bcHMyz5tCnn5N12X6YQ
oFPn5iLoiFGGyZq9RxSqmwAbmGAUclj9x+ZlGKI9Nu5m/Yv0qONBdSG7p9lDCysj+CZOS3eCGI1I
8q6+26qqvn3PE12o7cdtwtV7NY7hpveUOpZXo0MB5PAkuVlik+kBuwcGZ+Xj2ZeiT2/iatS3Mqqz
V/qEAncXUhbkbt0APYCNl45xWAJ3uVzcwGgePibKeEeMxQtR9cT03GS+IQgxx5gSCEIwjiAQjgRv
aEPEoeMseMvvJPpY9vX/AOkqlOlWt/qaehVsdThf6VD/APZj/M74L8T4vnTrPL1sMfiFidbjKTuG
y8SNQdzRSzbMp0Ajn4irEIpszfS3lhMqmZkjGI2O7crL1VmH2Vr/ALwetuteWlTAnuTe5X6dg22s
xo7de+59HTi4ukWs4/ntE6haXqzrYBZWNfgzXqsWxAyHYPMwszGOPbYh0XVQdj8y90NmakqT4nD9
Q41cdO1HXxcs2tqWnF2wiNDZ4EVdiH/mBnifl7iHqxMGCSv1CmwVd50EHG98zQUA6lPqiWuQB/wR
OvgzM38pmmOvhBhMbs5XcaKoF8fEMt3PYvIr9TkwsD/MzNBe0BdRrLD2tWBpAxM75mNyuLHN4SYY
/wAvz7mWwNCQ4C/5QP5hZNxVu2sAmeFfHa9pmPTvrjiI0OGWatlNNhLkcqBIalc4/c2y0nRGw7Uc
MHYrvgeJv4tY92c+eka8K1H2u7Ozd5Pj2l2rTsI1WPVf32Et62+FHuY+JVYjAWL2nfvLlitckWq5
o80mJUurVMr92yQG8GSdOcWF9Iq6+BJepIxscld1g+YWJ6T2k1L2L2ga/PzPe5vK6Ya9ZeJgpE5L
RKrmVerlCm1ggA7gZDTzkOq/tUaB+Zc6mpaxV4Da/cfiVsdey8psH8iZcifk43YxW65Zg19gqXkb
J4AlbMa2u0VKoNh1oA78zV6tjph4OPkPo3WsCg+AJR6djC2x7zYWsJ/2nPxOLS1O12WXka9KT5F2
MTXlqFcS0xBwxcp53wZm9QIbOY5J2BxL/R7Gs6aKyAw3xubc/GphmLQ14eROTcMy+v8A52fdjckS
z0vEGSCGfsIPBMHOUpldhHOtyz0u4BXXXvM+bk1h8tPFx983sWPsoC29ycLDCj2hBZ8Xlt5l9fhj
rEQFV5koEYLzDAnFefLri0G7Y4HtCH5jiZUcuXI83/rRid/SMW0LvtfzPJNbQfM92/qrSLPpOxtf
sO54Yg2gM+7+jW3hfL8v/eZVyOZ6R/RPJGP9UIGOlZTPO30J239JLkq+r8P1DpSdGejnjdJlz4p1
L3iytMnqbP2jsHP8yLqxByEUcAkS9tDn2mo7TfEzL0syephU+4Kf9p5NNy6r317bGRrGxuPGpR6X
menlE2ftMtdXfuT0VHPAkuF06taldh90tqTLXOWIbNWQjKGBlX9VkG8jj0/mRX0uyqtIOydSTJpb
Fxe0WdxYcicWTDvwxtm8eFrKuya6KrcSr1ufuX8SWw4v7zxew2RITlX4/Tamx6Gts1yo+JVTNx7q
xZano3MOQ3EzzfT/APBusPHw8yMeaZvKLPysPFuR7ADa57VJHgybpePkV3ZIzH7vU0U58CZnUrcc
1ix2Rgp49+Za6TfblXLcTurXE8vBxb1nzGn0NOVW8RMSyerYQx8k2E/aTMU0/wCJ1PdWXX0H8D31
N76m7n6jSp36PPdIcDKpCW42MulB+465M9TFTpHl1ZcviFOnqX6jOprKlF4BJlvrzLZjqtYGwfIm
T1a5UuVKl+/fkTX6QiPjWV5ALNrgzrxYYtPZzW5E+nN0WnFvZU5ZvaafXGauvHKfGzMqxDjdQ9Zi
CQTpZsZ57uj1Wty/bozs+KZtEuecm4ZXRSa+qepZxtdQer2ls4dyKtdY/wB5TqySmbVY40gbZP8A
HxFn5Azc6xk2au7gz2aYd+dOSckxLoOmZaY3TXZByzkgzMtymu6otlil+NalzMFS4lCY+yijk/J+
ZUof0rC4HM4o5FsOSfDdOOMlWSchjdk1UoNd2uBzCpLkhSp7v4mlVZTj5T5LgDu5M57qfX7K88Lj
KDa3jjxPqvpvJty4mK18Q+e5+DpMeXb012/4MfIYDREwU0rstw4EudCyr7se1cx92Nzx8ynn96ZB
AX7D5M5+NWceW2OXk/VeHOelLV/TdxD+pwSqnjxMTLr7L2rB1qavRbFakrUDweZT64gW0drdrOfJ
nkWiMWeYd1+HGbjVrPuE+KXtxnqrOj2nmZGvQ2hJZ/fXMvdOyP0dLq2rHbxM5fUpNl1vudgTG8RF
3Xi48fHET+mgz+nikke0oYhrXIGQ6j1N6/tLujfgFvczLrQ+oC3AE57UiJdtY/F0GTmrZj/ahYmY
BDveS3CzTS4V09wXu17CZGVe9lhIXsHxMIqzistmlaDjHYUsB5mKGsptL1gGXulKLUNb8kmS5mKt
SHtBJ/EwvVvx21Dnskt6jXNotvcgs6jYRwqiaWT0+xqy5PaPgzLape3nyTqaJq6IszM3Ia2zbSt3
y9m4T1/framZr8RpdvKIoop6DkP7R1jDxCAgFHEaHAb2hwRClCHmGogCSoORIsPY/wClvHSCPzO+
Qzh/6cp2dKU+xE7Wtp8Tz53nl62L/WEw5Mk9PiBWedycNOWFmUapD7TCBhAbm7F7hhadQwevaGco
I57BLX08vcln8wOror5rhtBhWNSfoIFFDd5G/M+u5NJjj1082l4m0oesKP19vPJQAw+hJpbZV6jY
HybrRvnianRaitL2nwVmHKrFsdau3BbU7RZrNYQFY9oPiVv0Zt8sVHncm/d2n5mtbjbw+5fMw+Om
GYpMe2fyWlm4D2UXLW5JQ8DcvZwYgdo495XsP+ZQutEH/eS5t1qlUQbDTh+OKZvDsi+6B6bxmWEf
6ZGdWWekeCfeWcBQuZb+AI4RHUKB/mljozVb/eXfxssVr5LBqZsbtB1skblsitWFFaghR+4+ZXGs
fGWgn/MJ8/3kuGNM6k7YHkzy+XmnDhmI/bs7d/K9QOyvtVAxPE0HoamsWVVq768Spj7BGpp4tdtr
ALszycX1CYrFYjcuLkW6+VbHwrRY1xYVufbUgyaz65Y7+CPzOitxe2o/dp9cCYwpvHc14OwZqy58
8Ru8ajbgtyYiPbGzjYS1WtK2iYsWtalAXkmW+pXJWhU62RIMNe6sMOZ9Lyu321by8jj8qnzzWPar
1Z1WsE67vAlTp6kZiq/kjZlrq9Y7Bc5GqiDr5jYtq5fUbrOAe0dq/gz1pjfFq1VzRGaQ2W0nK9XN
s3TQCETzsyLo1rXC93/cW3/EzuraXLdFP2jmXegfstnVnxdMNbQ1483e8wHC6LV1S/OOTkCr0ULD
8mQ9G0mLoHemIlXqFdtnU2x6nKl25PtzLXQEKrYjHZV9bmH1LcYazC8G8fLaEOcW/U7ZD2txvUPB
pAuft95b6zliqtsb01JbX3EeJD0bRLbmj6lGuNEur6fafnna2QVHMdGG5NaAVkSLPifM+X1VbC3D
BgheI29Ga5r5Zdh6jb5jkxjNuOjly2Y311Wt/wBL5aEb+2fPdPgj2B1Poz6hQ2dDy1A39h//AEM+
cKlK3XA+zn/9Z9l9FndJh4XJj8tntXzNr6Kt9DruG+yp7/ImQ/iWei2el1TGcezievljdZhz08S+
kK8grjEqfuYeZb6HW7WO58eNzLwP8+iob/conSYlBxcZV2CfJInnYa+W7NPg2Svdf42RLqXFE0w2
NSkLv87x54lsaYaPgzpirzr2lNiZGqlJ8yVnSwgt7fMhrRVUKp2IGUQlRPvOTJj87It4N1nqf6LE
LqCzEaVROdoy8Syl8jIZvXPPbviXuu3CmqlyAeOAZj4SU51+7rRXrwup6+PHFsG3zvJw5Jz+PCxj
YlvUe+3IravEB+3R8zb6dVbV/wAIKtCjtVd8zTepVwlQAa0Jn47OlxVeVngcilrT4fUcHF0pHaWb
9UM/qU9g+4yHoldVNz12Hdto2PxLH1O4FaWDYI4lHoX25mPdkH950o+Z04cP+Py6rZZ9KXW8f9Lk
L3DbsSdxfTz2Pk5PcxII4mv9Zoi+k7jcxeg91nUURPtD7Gp00xxEMJmZZt/c+V3udhX3NhHOb0S0
KpDI5UD/AKzP6ti2YmXdWR9oPBmn9POrU21AcEFv+mp0Ur5hhO3L5HbYFRE7e0aP5MZj6NTVjWzr
Z+JNmlKrSq+d8ya7FFfTBkMPvsPG57WDLFZjbmtPlJ0y/wBXENRO2XnUa2zsRmYcASn0xQli3l+0
A6K+5nRfUFmKOldiKvc4HiaObgpmzRePUtlckxGnB9UynvPbokEcaHiB0voTYeC+VZb6uS7cFxNP
0kBUhR5mh1yr0zjhf2kT1I58cSlcWGPE+3LlpOSdyj+n7LRaUt8kbg5d7W3OD4B1AwbBVeN+TxLu
dStVav27JnHnz2tk7bafhrMeVjoNy0FhzsjxA69kVOVZebP/ANJVwm7bgfEzMlu3KbvfbE7nDm82
7M4rrw0MFnY91mu32gZT92QdnageJDjsXsUA/bAz2/76Eq8a5mMyyiP01em5iadW4RRxMvKzDkZD
CpQF3oEQkcVKQOSfMzlfWQdTXLZETDocBSK9EgnzMnKtLZDca5lzBaxQW3yRqVsmrtLOR5mE6hnE
LHS37b9k6E17CGG5zlT6YEniXLupJ6YqqXzwT8SW1MM4gHUrN1kK3H8znnZjboHjc0+qGtcc+nZ9
3uJk1sF33HZnPMN8NYWI9QV+ePec11CtVyG7PG5ff1W/ZsQVwg+zYfukZ7eJaj7iiA5nY5iENfEG
EsoNRuFBXiPsSIfUKBuHAcSRfIgAcyZByv8AMlvUso9va/oUBejVfkCdVWZzP0evb0in/wDEToq/
M+K5cbyzL06W/GF2sjQkqyqDxJEJmiIS1ltYRMgQ/MlHM6MFO14hy5svWkyyOqvXZnugbVvZsCVK
bbENdVrEE8CS9S9E5ztX/wDEdmtTY6HVTZ0+lsupLLAPf2M/QM8V4/Hra8Pjfpv1C3I5M44UcXCe
+5wf2KeSZu01qmPag4CoZL9i7FahQfYRBd4+SfhDPnb8r7nkVrWPD7LHuseWFUjEjQ4Bm3cjtgN2
e2t8+0ycZyzJWNEb2DNjJFi4Z7POtGdHOxzHKpDZiv8AhLMcgW0A/wCqW8x+2xEA8nzIAKjZUH/e
GEn6joXAADunPmxz87opk1UWNWFzLQp2CBDqo4NikdwJAEj6cHXMcWfu0JLUpqL2HkdxGpz1prJZ
0Rl1WEmPWGrsa3mwHj8R1ranMYWa243J8cBsR31+47lG+9rcpHbgcanm83F82O3X9N1eV18S2MVf
vB9hN7GVcOh8ruNmhvtExK3SnG7357o63dthNd5Kt/y+08THxPgx/M5ORyO09XT4z1ZfZfZ9vuF3
KvUu9g7lO1CdCZ+MgFnqPaR289o95Pf1G3JxyGp9Nd8c+Z6+bjxm4kTPiXg25O7zVi34wuvu9VdL
26X8mR4GM1FWmIOz7TUSlrVZiQFUbJMpLdTWuu8aB8z6O30zJm4MRTzPh8/j5Xxcvyzuv0q+OX/+
39xHzA6dR+oVMwHtHYE7f4kmfmUPl+m7D9OF/wAwxuk+nZibxLA+PW+iTOzNwr8fhVnI64z/AC8i
Yq5/rFapl2hTvnmXegH/ACHPv4kH1BjnHtssY79bRWRYOaMBQtikhuZc+KcvHrFXVit1yKnVLGq6
nYynVgPB+Je+n3LC0nz3bMys2/8AWZdtwXt3rQmt9P0tXXY77BY+85/qdJjBEOrh/wD0mTfUDB76
wvkR+lEJcyk+RuH1+lhUlygnnRlHF+0Mzt2nt4jLx/ueJqvt24r/AB5dt1mHsY6iZfS2e3vLnZE0
58Vm43w26PoMeXtGxRtDcEmLu3Ofo2fIIwC0fcAnmdFMbTfJCDqYJ6Xkj5XU+c82v0up5VY9nM+k
MsbxbAPcT546+np/UWcv/m3PpPo3jcPK5E7UX8QsF/TyUb4YGMwg1jVgP5nuW8xLkrPl9F/Tr9+H
jWexUczor8oLXot4+Jz305dSv0nhlSDZ26MSDIyGPZsj5nnRGpbbeYXky7bLx6Q3rnUt29RsJUKv
Yd6Mp9Pqsx7u+zgak2HXXkZNhc6Xkjc6scOXJDRuyTQgK2iwn4h1W2MF9Yj7+RMwVs9jrWN9ph49
rC3dn/yxoTDLj3DVXxJutE2ortrspI2Jn2WV5ebU2PUtWiAdS31nf6Jn9iQZik8J6eww+PedvFtM
Y+jm5NY7RLtO57smuj1D2655lr1RjWkduxOfxXtT0X5B7dTXsYsisfM8zkUmLOvHfxDN+oHL4llr
rpe4aExcAv8A4hj2s4CIR5M3uqUtmYTVJ5HM5S4W+oqcgVnmXDEx7bpnc+G59TXPf5B7VbyZkdKv
NfUKezg90j6hmvf21lvtHkQul1H9VW7cKvJM6mcW/S19SXk9RcN788QegWhLbVO/vQ6lHq2WuVnu
44A4k3Rm3lBh4HEzx+0tLHyCTcxY7OzNKj/N6K4Y77W4i6ngMuc4rH2kd38R+lobaLscfzOm1txp
p6svlfEuZL+tioW8iLKwLUbtr+/548SSrEv9EV9hO+JlF/EQaUBrUWbfbkugbWk4Ee/HsxrPTsBB
/Ms4+H36NjdgPj8zK14lNKtB7bVLr4l/qd69lYB2DIjilspq1/YvvLNnT0t7R3618TXky7lOrN2d
cHUgdA7HfLfM2x0gFQFtO5Nd0ynHxWfzYByZflqnRi4yFGUHzuPnUiq8v8jzKTZjLd9vzOkqrS+h
C42CJz2yRM+GcU050EsN8xkxu6zuPE3cr9NSvayAfmUMq6qpFK6O/EwnJpeqTBrdrDx9iyTqCIE5
gfqWpxu5ByRuUGy3t/4g1NU5Ns4rpWtcAkAxkXtQs3xIMtQX7lf+0mdvUw+1fMvbbOIZFocu2tnm
Hi41ljgsCOfeWMVfvKt5Ejycu2hyANfBmEs/DXK1Y1I7yo0PeZd2ULru2gb/AI9pR9W7Ms0SWM1F
qXCx9kDuIiCIeDRRRTtc4oQgwhAKKIRGEISRIAhoNQJAOZPQN2oPyJCJPigm5APkTDJOqyyrHl7h
9PfZ02kD/SJt0nZ5mL0AdvTKAf8ATNettT43PXeSZd0W1Gl1NSQSsjSVWmEVYWsnUyxUeZVUyxSd
sBOnjV/yQ5cvmswwuoVonULL1/4h4M3OlHeEhEys+hWzLDvky/0s9mGqn5M+0+uTFuHSHgfSuF8X
JtkaYJMiz6rr+mZVeOwRivJPxGrt0ZLb3W4GXXU+rHrPb/M+a+l/jyqTP9fTXtuPDm8HqK41lNTr
3EEgtOmycv8A7qe1SSdanIYF1FNK4mXUz5rnQbU3UuswT2XoG40B51PtvqXBrkyxmr+mnFaYjUrN
dQa2p2/edHXxLOeKg/e+y54VZHi0E6vZvubnXxLdtAc955YCfM3vWc8uqJ/FX6errmWGw7PaDJqe
LTY43UrHuHzIcVic1+8EDQHMkeq71uwAigtzNFbR2vLbWfS9hOtmJYax9rE9olDKZbPTCL2so0dy
z0//ALse0na9xlvqeILlWzGKfnnU8vjWr+cWY5oncaRvcrdHDtrfcBILEFVSWK2286+JLjVrXjNj
2aI7t73JKcStbT32brPtN2O+D4+t4ceatregV5ljI3c6V6G9keYGJ1C3It9NyNKfAGpZK45bTKCg
hG6pRqutRrwZtvyMM4+kQ8eOHkjJ2lLkZNj4llKhlQDTN8TIzP8AOx6MPDqQ2AbL78zRGcUrsRUB
VxptyvjWJj79FAu573C+s4cGOKzHpxZfpl75O8OWuxcixrcehGaxyA5PhZvdNxV6ZgjGQ+/c35Mt
WXDuLDQJ8yq9mySfM5fqn1m3Nr0rGqu3i8GMM9p9l1PHTOw2Rjqxf2H4mDV0rLYqL076k8aM2zbq
RtafZtTRh+qWx0isw6ZwRM7Y+L0lw1hvbsAbYHzNbvAbgACRPZs8kmRdxnHy+XfkeJ9OzDSKNCxk
uxrKrBsMOPxKb9PoZV77mBC64EQY6i3uacXLzYa9Yl1RWJnZY1CY4IQ73JifiRqYW55uaJyWm1nd
jnrGjje44g7jEmaYxtnc5Oh5g75jnxB1zNta6a722Oz/AIT/AP4mfPv1Ynb9UZP/AJjufQBHcpHy
J4Z9eVCn6sGhoET1/pk6tpx5WARGX9wkjDkyMD7p78uZ7P8ASFrv9P4/3bAGtTsOmMqYu245nF/0
8uS36ZVP+cORqdQdqgXxOK8anbfWNtCyzab/ADGOOtlXcrEOZS9Q9uvaD+rsq5U/7xGTSWwTb01s
Omyjem1uQZTCqwc8k7Mr43V2J1ao/mBa4yH7gdyzlhp+2s0WAzMZqx4YeZSq6NaG/eNe0mxb/wBP
WF1uDl9SK1nt4M2YuTGNqy8S12tjU+nSofkj3llLUK8Gc5j9Uc4+nY90u9Jc2UsWPvML37TsjizS
PK7bYvduuxVP8zPzqFaiwgAueSR7yE1L+rYN+3cHqeUcV1rVd93vFY2yiqr03Bottb1U2fz7RZBr
rtNScL4j4mUFfZ+0mQ9XBRUsqHdY7aA+TNkRJHs1WBRVb6tzDnwD7zQGXgVIWIXY8AHUgycO+zpy
+uoS2sbA+JzJVvUIPnczisw2RG2zlZz5lvp4yEA8bPMt49IxKu0/8RvMDBFOFjlm5sI3/Eyv1zW9
QDMx7CZnEsbeGvZ3pW3YhJ/iR4WYKy43/mfEtpa2WTj4fNngv7J/M0ul9Goxduyi288tY43Nmmvb
JPTnz2rusqbvHufeWz0ay5l7iEAPtOhWk/iSrUBJohg5nRA3Tv0+Ke197LH3lZeh5agaKnX5nVdu
hxGB5mFqwz05SzpvUKtdlauPwZn9QbM9M0/pbe5hrxO93BIHuNydIHldPQ27++7YO961NjHX0q1Q
e07v00PlR/tKeX06i4g9gU/KzGaQbef9fxr6nrZlJRueJjmjvvQsdKPAnp+f0sZNPYvkeNzjur9D
yqLEIT7fkTGasqqroGp17ATO9NVuCv4M0mqtWvXYd/xKNuHk3nlCP7TT0nbZ4hk21u1jaGxvjUfG
sZHCMJu09Ov7QqUFm/iWsD6UvuyRbmD0k/0g73N1KSwmVfF6ZRVhvl5W/v5AEx+qdPbIr9WgH09+
SJ6XZ0qi3GNDLuvWgJTyegr+i9Ct+wb2JsnGw7vMcKizFcsV3v8AEPMqycnR7TrxO3H01kHQdl18
yevoNVQ/zG2fxMfjZReXydHEaOJuaxLH94IhCEFFFHXzAS+RJh4gCGIDiW+njeVV/wDkJVl7pY3m
1D/zCas3+ks6e3tnSB24FA/8s0FbUodPbWFV/Esq2zPlb13aXTM6hbV5Ij8+ZVWGDo+ZIq1TPhfR
5PVZphM9LB8yQWj5m7FHW22u0b8JbenWi62/1gVJ2q/Mko2qAePxI0tOv3STvE9Dk82+esVt+mvH
iis7hKplil+1gZTDiSCwTjr+M7h0wsZGJhZGRXe66tQ7BHEtW/pLiGZCXH5lAWAiOLNGdl/qGe1e
s2WKwvi3Q0OB8QheyjSmUTZqOLRPNtNu29t8TC4biW2Tz/EM5RI1uZ/qfmOHE1T3/qxaIWxed+R/
tD9Ztfu4lEON+ZItg+Zq6T+ktkhaFpBj+sfmU2s5jerM64mi1l31j8xesdeZSNkXqzZGJptK56nv
Aa7Q4lb1YLWbmyuNrlK9rHxI+8nyZA7we8zfFGHlYZ+JGXkXfBLSxRsiEhce8XcOJWLxwxMs1bqx
K13fEJXlUEwwxmuce26srGxC3xIAeZIDxNVsbfFpH3RAwN8Rbk+I7SPf5i3xI4Ux+KRIpGp4p/VB
Cn1LS+uPE9nHE8h/qwpXqlFnGi07uFXpdrv6lyxkB4uUH3k/sJBbxcs9/wDTkexf0eKP07IDKG7H
9/bidr1Gn/m8Tgf6K2AHOq3+4A6npHUF8Tmy18OjHO2Ip3CNe/MkesKSRLGFQb7AgG/mc2nR20ov
QNcDUVNbVLwZr9Sw0w6C5fx8zJS0MODJakwypaJ9orsopsE+JUe42e/E0x0q3LXaDg+8ycvBvwbw
Lv2fO5Yxfs7xPhMpIWb/AEnf6LYPvMRex0Hb51N/pVBbBUqQOeRuZVjzpjmpNo8K99ne7Vr+8cwG
Q5rqbNKUGufeadXTwl/qE7MkysMXv3AldD2nVSunBas1c31SlKVHawLfiSdFqvzb1e1CMekgrv8A
5mm3X0qgHdq97H5mlWiogVV0o8CbIjTFhZdGbk9XVQCMYr9x17yi/Sa68rJa1D2j9mvmdeq6HAjG
sHkgTK0Mq2042nEALG1XcGKvpleWzVU4z1fNjcanXt6KeQokNt1ZP714/MV8Jbyq9L6dTgUiqgHn
lmJ2WPzNVF1KteXioNtdWP8A1Rn6z02v9+ZSv/qmcy1xWWkBxHmM/wBTdIrB/wC/Ukj2DSpd9a9G
qOjkb/gSbbIq6WRnzOTu+v8Ao6KexrGPwFlFv6j4I3241zTGZOsu7HIj64nnF39S0H/DwWP8tKF3
9S8wk+njVBfbZk2vR6pvmOOZ5Bb/AFH6mR/l11L/ADzM/I+v+t2P9l6oPgLGzq9vOxBsrSwadQRP
B7PrLrVvnKYfxKV31F1Wzfdl2nfw0kr1099fExv+atB/Mq2foqt80rr5IngbdSz7fN9x/uZBZkZX
JsstP5JMwher3i3qnTqyd5NKkf8AmEq2/UfSqx9+bV/Y7nhFmQ7fudv95Az79yZn3Scb3O76y6LS
D/3xGPwAZVu/qB0VNasZv4E8U3oQSREWY/E9jyP6j9LXfpJY/wD0mPkf1Dodz2476/meZd35iLS9
mcUcDHiimTQce8QiEcQChLBhKIBDzJAJGPMkEKceZodIH/7hV/8AkJQXzNToQB6lTv5mrP8A6Syr
7ewYh7caoDx2y3W25SxiP09eviWqzPmbR5brLamEDIlOoW4iGEjG4QJBgiFNlWKYNxH9SQ+0aZ7Z
xG1kW/mGtspw18Qzisri28whbzKWzHUncxbYqv8AqbiFhlUEwieJJhOspzYYvUMr7iBk0vRZFpji
4yuvMfcRU+La0LRrzH9TiVhH3Moro+3lY743fIO6OG4mXVPtk/qfiD6kh7opnWp9vA2eN3wPJi1+
Jl0lfhhJsGM3iACN6iHLgamcVlYxVOFkioNQTwWB9pMn7ZOstkUgIWOFkgG4SrJpdQBUMMKZKqwl
WTS6hBqLUtCsGSDHB8zOMW/0k6hTAjkcS6KQIjUPiX4U7QoNwJ5R/VqvYofXizW565dUZ5j/AFXq
30wt7q4MY69bpbUw4LW1B/Eq3/8AFUy1TzQD+JBcPuE9mvpxWem/0ZuC9UvQnlk4nq3UP2ieDf0/
zXxOsVlCQWUieydPybcvGZrDs7mjL6bMXsN7a4JhYOauLb3nkQMsAKSfImTkMTW5+BOevt0zDR+p
+qpn4fpVnTE88zLxL+0AN48TB/UOHJJ4lkZY7PzNt671phD0Xp2fSMVF7lXQnFdcvuyes2guTSPA
9pj0ZlzZIUMQu/ab+Hjd7BrNzKfRSvlPg1FEXu8yzZlNSAK7NQLCFU6+JyebkOch9MwG/ma6R+Tt
71iNS6+vr1mGD36sHxuVr/rlk4rxB/JM4573PBYmaON0QXLisbDq4FiPidEeHFlitp3DTf67zSfs
x6V/6yrkfW3VLGHY1afgCVn6LVW9C/fuzvBP8SROnYiKoCd5HBO5ntp+OEN/1f1luBl9o+AJSs+o
+rOfuz7/AP3TWr6TiGxmKbJdeN+BJP0VAfRrXX3a4+I2dIc9Z1jqFv78u8/+oyu+blPsG+0/PJnS
rVVTivkhFDvjllBHuCZKmPUaLm7Rtwp8RtlFIce7XEDZsO/GzHXEvtA1Ux/mdB1mtVycBl0Ap1qT
gdzj7T2pbosPfcnYmsOYtxLqai9lZCjzFXh33Uh1QhT7mb2ZU1mJlBUs+/Wu4fmBhqrULWTpkHOz
qOya0xR03INpr1yACZLT0u2wHRA0dTeN1VJLs6j7defMjqy8dPNqAk78xK6YuLgevbYjN2lDomSp
0atwGW3YPxJlyMf9Rkq1gC2DW47dQw8dWrpfa734k7Qkov8ACKdaJJgt0/EqdUYEkyY9XxySQG/E
gbqlBbZRiR4k3CJv8Mxl8JuUsXDRuqGsqOwc6Mns6whX/LqcnxyJCOpufuqxvv8AnUk3g6SvuiU3
XKiAALvxM7rKEYNL65be4Yu6hc32Y7dxHJ7Y19PVL6fROOxHx2TCctf6sVlzTmATNkfT/UXPGO4P
5ElX6W6mw/4QH8mYznpH7Z/HLA2YwnSr9HdRbyEH95Mn0Xlk/fYiiYfdY/6nxS5Mxp2Y+irD+7IU
f2kyfRlQ/fexP8STy6QyjFLwuKKKeg4DiOsYR1gHCgjmHAQkgkYkg8Qol8zV+n1LdTpA87mWB4nS
/QlQt65WrcjRM0cmdY5lsxxudPTcZCKV49pOgIlyuhVXxKuTciWLWhHeZ4NMc5JdM49DVvmTVkEz
n8nqPbYU3yJDXlubAwZtjnzOr7K8RuWHV1gWSConwJW6HlHLDBh9y+81yPmc845iWcY4/al6LfEd
aT7y2BsbEcAa5mPWYbK4ohWFHyYa0Ae8l4jGZ46Tf02dYgBqX4i9NR4Ek9oxGxM/gssTAQI7DiLR
Gv5ha2I+CTcIdR5J2xdkvwSu4R7iB5khSMK/uBl+FNknvCbxHCEFj8xFfaZfFB3RnyYlH2iShB5M
PS7B+Jn1qdpQJyWB9opP2rHVVAmUdYY7lD4P9hJT2sUKn/m0YWkiAUeJl2qnlVA1Z/cwm2rFlG9S
yvHt/wBIa7Pt/wBI7xCKxU7uJHnWpLVsqNjUmNZ14h11H4mq94lYnRq1kvZJa6+JKK/mYL2QBTDV
D8SdUhqgliCZDVUfJEk1qTIvEIV8zqiGmZ2rANvxD1scjmWRUdQe3nWplEMVO6sFTPM/6rYbHo9z
jxrc9WtT7TOF/qRR6nQcga3pDNWSPzhnHp4jhsGxF558QbdbkOAdUefcwrmOxqelX05J9tv6Ws7O
s4g9i2p7v0JQuKf5nz59PWEdVxD7iwT6H6Z9uDWdEFhvmc+Vvxwg6j4MzjR6lLj5E0ssd6n3kNS/
bOePbo1uHEWoa7WRgQQfeWMTC9c7Zwq/mdJndOqyfuYaYe4lEdHr7uXbXwJ0dvDDWixMHDqYMD3N
87mso7v2/tmeMRKgPTXxJqmtUgDeprtZti2lm2v7G/icVl/8d/5nalj2nu+JlWfT5yHNot7Q3OtT
CMsU9paNuYI3OjxOo49OJQrN9yLr+JYr+mEA+65v7CWE+msYD7nZhMvuatfRm29VxiUYnfpsWA/t
KdfUcepHfRJYEa+J0I+ncAeUYn+ZMvQunqvFI/vMJ5kQyjHtyY60q32uB+4LofGpHZ1oktpd/cWB
I+Z2idIwB/8AIUyZOnYiftoT/aa551Y/TKMO3A2dTybQiV0/Yo4ULGOX1K0cUsv4CET0Vaa0O1RR
/Ahdo/0r/tNU/Uf5DP4oeZ2UdWynUmhz2+OJOOn9ZcD/AC37Qd6PzPRTpRxoQfUHseZPvbfqEnDE
OCPSOtXj7mZfxuEv0n1M+b1G/wAzuS3byfEoW9aoru9Ngd71uT7rJbzDVNYj25cfRmUzD1cpR/AJ
ltPoisj7stj/AAs65HV1DA8Ebhd6j/mH+81W5OVujHWI3LlE+icQH777GHxxJq/ozpqKAxdz8kzo
3uqUfc6j+8p1dSptyDUjbceYj57RthNscTpnp9I9LXk1k/yZZp+nel1jjFQ/k8y1mZi0Us7HkDic
9j9Xuray21v8gDc6MHHzZ6d4lrvmpjtqYdBX0jBrH2Y1Y/tEcTEqP201/wDtnPL9T1XMVrDnXvDX
q/cP2sZrvx81fcsq5qWtFYb4FQ/bUg/gRf5fkqo/Mwl6tzrsO5k9a6lfkY9i17QL5I9ps43ByZ/2
z5Uxx9b/AG7FlHkeJF2ThegfUGRTdVRkEvUeNkzvQQRuc3M4l+PbUymO8XjaMrIL7FrHPmT3N2oT
MPJtNrnmckQ2xC5+oHsIQcNM2uti3niW0q+dzLS6fM0QiiE+seIIRRCPANfEIQQdCEIDw4EMQo15
nYf04rDdaLEeBOQSdv8A0zrZ+qOVG9Cc3Kn/ABt2H/Z6X1G00YljDyBxOMzMjvC2Bj3b0eZ031R3
JiE863qcNaxLH+Zo4FImNt3IyahObttyefmav0/i2Z2X2KT2+858eZ3H0tWcfAD1tp7Pc+07s06q
045mzrMDErxKfTReJcFYOjoamTg5FhvNdzhvcS8tjUFjY/fWeQPiebj678um1Z14XFqrYa7QJk5F
gTLsqB4WWH6pQFJqDFvYGY7gvkPa37nO5M0UmPC44tE+Wkh7oeuJFg8jXvDzbBQB42fac9N09N8x
Mi1HAiwLEyAQDph7S6KRqSc1o9pNdKX9o+jLwrA9hEVHwJj80oo6MWjLul+BFpfxJ8sin2n4j9j/
ABLZ0BzG7wPePklFb07IQpOpMbVGuRox2cA6icsiIVGP6JPtJA43JO4THvMiuKhvmGK1kTX/AOay
/Ajq+wmj9zTLciX01+IQRfgQCXCkn29pFXcXZQPeXZtaHaBH7gB7SJ0OjzIaXLUsfJG5WK2HXQh9
wC7lBX/y6j8nUnt/+HJB95YFyuzx+ZOp3KVZ2a/4ltZdiQQ18yNTzDHmWJTSzX4kgPMro2pKrzri
0S1rCmIqJGr8wi+5ZtEQkBsXYnKfW+P39Hv+3Y7TOsJ3Mj6mqD9Lt9+Jom35Qz/T5axTrvXXhiIV
pkliCnOy08dthkNx2DPUpP4uW0eWn9NMP8Zw9+PUE+i14x6x/wCWfNHRH9PqOOwOiLAf+s+lUbux
qmHgqP8A9Jz5ZbsfpGw3xAK9sPuG+TBcgiaHTCKwnt4kdYLDmT/aQdkSGq1Q+tiSZUYriFSg/mS+
qkhtu0CRJJqA3DSGXMT/AOHSY73sWOzxNTAfuoH4nPm9MoWJg5/XmXKbGxKu8qdF/iaOTkstpUeN
eZzvQ9fqsogDvJP/AOs6Pp+Gt43ZqzTqPDcwsohmN7748SS3qFe9BpjMG9awN7jcSqO2v5Imzl8e
sX8N/DrF8NrT7hrJ1OsnQYSFuv41V/pWhwfnXBmCdqTr2mZ1bLa+wqQAFI0R5m3j8HHefLyrcq8e
Idlb1/HX9qsYNPX6bLAnY4JnLj7q0PyAZLQmnQ/DCevP0rjRTbkrzMvyRE+m/d1VjYQq6EpX9UtS
3jxIbByTIclNvx8T52cFKWmH0H1KdY6WxujxL2yccN8iYfVqBVmrv3O5qdDYriAdp4Mg6zS1liOq
k6nPWaxbUOOIm9Y2qDLuS3iw9szPqDN7LVK2t3ke0t3VXMR21t/tMzqXS8vv7lrZ9j4nbxrYt/m9
Ll9fijp7XMa+y6qm2xyQRrUt9JIXq5b/AFLK+DgZJw6kZCNS/jdLvryqrTsBfM7Z5GGtLVh8/wDD
km/YfX7GZSF8CZe0t6bZWdBiDOlysUXVEFZz7dOuLsoRgu5o4XKx48c0mW/Jhta3Zh9MrRMNgo+7
vMvYu+/R8TawuhVKhFu9nngydei1A/aWmrkcuk+Fw4Zrki0sVuG3IFtVa8mt136nAPxN+3pQH7eY
ydKrP71k4nNphiXf9Qj7nrr9OINLVpX9h7g++BPRsW02Y9ZYabtG5THTcdWH2f7y6oWtQO5ePzOf
ncmvJ9Q1YaTSPKPMV2pITzMHuZXPcOR5m9bkVKpLWIP7ylZkYg5e2rn/AMwnnxSXR3iFSu/XtLdV
rWf8upBZn9OqPL17/wDyle36g6bSN+vWB/Mz+G38T5IfOe4SwNwlM+meMOIRo4gFDED3hiAQhRhH
gGk9E/pHWG6jkMRyFnnqDxPTf6PVbyMp/bQE5OZ/82/D7dz9VYDZPS2sq4ZPuK/InmV3DGe0Ovep
RhtWGjOK6/8ASLjuuwD3DyUPmcvB5EUjVmzNSbOKBncdDtV+mVKnkDmc+v051M61itNPpC39Lu/T
5qGruG17p15s1bxqJYYqdZbSBg3cToyZvWsGu5iDGQhjLlJCgCcHmJdtZZ7K1RHcIX6nsIJG5Lnn
vtXXsJRzLEop7nOiJlSs2nRe8Ujciu6qy9TBqGl7eR7QMnPNr9zEkznkva+97T7nj+JYBJ/M7ZwV
rHlqw8yLzqHQdEzmbqSJ7GdexI8TmfpbpbJYMq8a4+0Tp2nlcnUW8N3batTc9vqb4KtriR02s9jq
3/KYWEp78jf+uBWory7t+OJpgEH1cytwANyK12Bq2dAuYdi9+UTr7CuozUOWTnaqdiZRpA2uxW7R
OgOIdRL4pPv2x76SdmsDnyI6pYuP2KB3EagVan3j0qTyWlvHbvtt7vKnUGnGAxxXYOQdwqKDW7En
e4STZgKvV2HRLalrWhzIXTusUt4ElZpBRYf95s/IhIe26o/6RJ2rBfu1zH7F9xMtpJ3s2p/IkCVt
T6TAe3MnAAh7Gte0u0IXBhrRkOMpFNgI5JMlCjewIQIl2qqEY0UgDlW5lllLV6EWwPEJWGvPMsTt
JklUhR8yzSTrRkHePmEtyL5YCPKRaFwQgTKTZdSjmxf95DZ1THTzeg/kx5XcNPuIMMPqYjdbxEH3
X1/zuV7vqfp1eu7Jr/3mX5Qx26ZLJIHB95xdv1r02vY9ZT/eZ+T/AFBwa20jd38TLd03D0fvEr9T
rF+FYnyJ5pd/Uihf2o5mdkf1KsbarU3bM647zKTaHnf1KnofUudV8t3TLtOhNT6iyh1Lrdmai9iu
NdsysnQWenj8VaLSPp7f96r1/qB/6z6aw2B6Pit/qQT5gwW7clT+Z9N9AK3fTOAx5PpgTnz+Ibsc
onQk+dQ0xe5dmxv7SV6/uOhHVXA95x2v4dEAGGm+XcyM9Pq7iQzb/mWgeOYQYD3nPN7MtKf+Hp/q
aP8A4emuWb/eXAw+RF3r8iT5LLpQPSa97FjfxLVFApTtB3Da1VPLgD8mQPmY4831j/1CY27WhY8I
c2re2E5vIx768o2Yp02/idLb1HDUffen+8pN1PptR36yf7zqwZb4o8Q131KKvGudQzAdxHMkr6dc
xQngDzIj9T9NBOrd6kVv1j06vgd7fwJlly5cs70yx3jHWawmt6cRvu/6Sg/QEubZ7vO4N31lhnkU
WmUrPrcIf8vFOvyZnS2ePTnmmN0VPRK0RQDwJOvSqB5nGXfXmRz2UAD+Zm5H1v1Fu7s7V3Nk25c/
tjFcVfOnpJ6bTqCOnUqeRueUP9Z9W3xcAf4lPI+rOr2DTZbf2mqeJmt5mWy3IraNS9sorSle1dAf
Ed7KByzoB/Ingdn1D1M+cy3/AHlK3quZZvuybT/6pjH0639T7isRp9CPnYNaktfUP7iVLeudKrb7
8qj/AN0+fGy7iTu1/wDeQWWs52zEn8mZx9P/AO0+534fQdv1P0Wpd/q6j+AZSt+uOjr/APUAj8Tw
Q2Ee8BrSR5mcfT4/qfc6e62/X/R1B07H+BM+3+ovTgT2KT/aeKkn5gEk+ZlHApDG3JmXsVn9SsVN
9lX+8o3/ANTm/wDlUqP7GeVRiZsjhU/bD55ej3f1Ky2b7VUD+JnZH9Qupu322a/tOHJPzAJO5nHF
xwTnl2dv111Sxf8AiczNv+qep2nbZDj+DOf7+Ixbcv29P4x+a0tazr+fYCHybCP5lWzquUzbN9n/
ALpQLQSZnGGkfpJyWlatzr2JJtcn+ZD+osJ2XY/yZDuLcvSrHtKIQ0MAQkmxrSQhBhCA4hodwBCr
8wJo6xo6wJFHM9X/AKOqBVkt7kzyhfM9e/o+v/cbm1z3aM4+Z/8ANuw+3pIGxuOBqMraEMETwvMO
zwYDRnO/V/Smy8f16tl6+SB5/tOjBBEZgCNHwZtxZJrO2Mw8xo6tdikJaO8D5HM0avqSjX3I4M3u
rfTONn7atvTf8CYJ+icgP/8AEIF/M9KmWkx5hrmZj0iyOv1NaGrQka1ozLybrs+7fa/afAAnZdP+
k8LGZHuc2sPY+Jt14eHX+xEH9hEciKf6w1ZKzkjUuD6V0TJyT9qFR5PdxOow/puhFBuYs/4PE2w9
KjXqKPxBfKx083J/vNOblXv+mWDBXH5SVoERVXwBoQtyhZ1jAqH+ZlUj/wBQlW36m6RUPuy6/wCx
nFNL28urtDZXSk6HnzH7V3uc3d9Y9GRTrKU/2lK76+6VWB2sz/wJlGK/8O0Ov7V+I2gJw9v9RMD/
AOXVYTKl39SqlOq8R2/kzOMGSf0neHocaea3f1Lu0RVh1k+25Ts/qR1RhpKcdP8A07myOLkn9J8l
Xq8ceDoTx1/r3rT+LK1/hBK1v1j12w//ABpA/CgTL7PJKfLV7UTx+YO9+4/3nh931H1e0Dvzrj78
HX/6Sm2dmWEtZlXEn3LmZRwLyx+eHvFmRVWCLLUUj5YCU7OtdOQHvy6hr/zTxE2XOdtdY38sYhWD
5M2xwZ/bD54ey3fU/R6t9+Yg18Sjf9bdJQbS1n+AFnlyU1nyu/5lqqqseFAmUcKIX5XeP9fYQ32U
2t/AkLfXqf8Ay8K1pydaoDwolqtgo4AmyvDhj8rff67tYar6c4P5Mgt+r+rXDdGDWg/8x3MzvHxE
bSBxMvtaQk5Vl/qHr9m+001CVzndbuH35RX+DEr9x5k6S/DVO8yovj9RuO7c1tfgyKzplp5fKsJ/
DGapMhtaX4KneWU/Th/z32t/6jIHwKgfLf7zSd+fMq2PyZlXDWP0nySoWYdSjgEyvZSqjiXr244l
G9yRxNnSIYzaZQsoAkDkSRmMrsCTLFYTcyCxgJn5D7Y6l9qHccCRN0+1zxMtIp41oS5WbkCe0dI/
qB07B6Jj477Nla61PIh0q08E6ktXSCTp2JE13xdoZ1yaen3/ANUMfuIqp4/MpWf1PsOwtA1OJo6G
hPKsZp0fTd7qBXQx+OJq+2j9tnzNmz+pWWx+ynj+JC31/wBSsP2V6/tI8X6Wze4A4x0fHE3MT6Hy
rNd1YTf/AEmccOJ/TXPLiv7Y3/a/rFnhwu4Z+ouqlfuvYH8Tp0+gLV5e0ADzNDH+iKGqHdkBv7TZ
X6fv9NNvqFY/bz89U6jcxFmRYQfYGWsRfU7S1rMT7Ez0PC+h8FCz2Wb7fAAnmv1GR0/669Kra0Md
BZlbhfHG9FebGSdQ2KsUdvJJ/kyQYia5Xct0oSAO0gnxJXqatu1xozX0hv7yzxjUqDpBILq0UcKJ
euOvEzsljLFYhjNpUrdb44lK5uDzLNpO5St95nDHavY0rueDJ38yCzwYFd/MgsP5kzyB4RAxgseI
TDncBjAAyNjowj5gN4MhIG94BhGCYQLGDCaDClGMeCYAnxI2PMkY8SIwH3FFGlAmNHMEwpE6EAne
o5PmCWEgJYawQNQllYHHmEYI8wzCkI6xR1hEgMJYAhLAl8Gek/05+qendG6VfTmd4uZ9ggcETzYc
wlmrJjjJGpZ1tp7Bkf1JxELGqtiPaUz/AFN34x/+s8tBhqZz/Z1lt+SXpdn9S7T+zHAlM/1G6ho/
5af7TgQeY5MyjiY4/R8su4t/qL1Jv2oglK3646vcebgB8CcnxHHmZxxqR+mPyS6Q/V/VT/8APb/e
Q2fUnUrd7yHH8GYYhCZ/FX+MO8tN+sZ1n78m0/8AqMh/XZLHm+z/ANxlQDcICPir/E7ymNzk8ux/
vG9TfkmRgQu2XpH8TtI+/wDEXdB1HEyisL2kYMkA4kQhqdy6he0i1FFrcQEqbOI+4tRAQbGIcBTD
iESLJF/MiEkXcokU8yzQ0qak1TaI5kNL9Z5lhJQrsG+Wkn6lQeGjYunYjjnzKJyuP3SI5nafMjKI
aynthi0DyZjDMdv28wxbc/7UY/xJrbL02PXVRzKt+WgJleuvMuIVKLCf4lpfpzqmSAf01gHyRHpj
uFCzIXkgyq9+zOoxPoHrGSV/y1UH5M6LF/pVf6YfKvRfkCYfJvxDL1G5eZtZ3DQkJQk6A3ue39P/
AKUYQqD32s+/YTZw/oDo+K4P6Xv1/qnNflRWdSyrXb57TAts0VQt+AJeo+n8u0cY9n/tn0bX9O9P
pA9LFqXXI+0S5Xg1KCvpJojXiSnNrNohlfHqNw+c6fpTNZdio/34mx036FyslT3Mqn4npfX8f9Nk
AKAFI4lbBcqGPj8z6CnDi1Itt4WT6jq81cTX9CCptXXA69gJt9N+jencesP+s6HFrGRlFWOxvzNS
zp9ZHxMpx48f42I5Vrxtj0fTnSaB9lAY/J5l9MLEQcVoPjiQZgFCHtcjXiZ9Vzux73YidmLiVnzM
ODL9QvE6hfvNQsCVa2PiWKnW1D2nlfMysZSLgR/zHUvIgqy7ERthh5nRHHpDlnmXladQadE+RKFV
2Pi0hWcE70RLj0MmGx7t9onL9pdzs87m7Dgrdx8jl3q61Staqw5DTwP+poNP1tjtyAbPae09JtKE
JcftBE8k/rRWifUGHkVrwXHI955f1GvWNQ9X6RlnJfcusxqmWpLfYj3g32r6TIR4O1PvI8PID4dT
+xUStkvvfxPEfUyq22eZn5D7Ms3HW5nXtKkoLTydSpaeZNY8rOQRLpigtbRlZ23JLzzID5kAvKz/
AIk7GQsOZRE0ieT2IQvdrg+8gbwYEbeDIyeJI0jMgBvMEwj5gt+IDEbgkQgYJ8QgTBhGCYUvMjYa
hHgQDzKGJ1BLRNBJgN5jE8QSfMbcBm94J8RyeI2xqBOORDWRr4kiwhxHiEUBQlMER1hEgMIQF9oY
gGp4kgMiEkWAUMGADCBgFuLcaKAW44PMGOPMCQQhIg3MkUyKkEKCIXtKHEcQRDAMiRBGJTC7G+DB
Fb/B/wBolloW4anUSY9rD7VlivAtcfcAJNwaQhoW5aHTWHlpMvT+OST/AGjvBpQ2I438TSTppY/a
hMuUdDyrGAShzv8AE2RS0xuIa/krHjbDCne4QnYr9I5wQF6CoPzLuF9CWZOy9yofiZVwXtG4hjOf
HX3Lg1MPu+J6pg/03xhzkZJPxoTXxvoHpNRDMhsI+ZnHHvP6Yzysf9eLDuY/aCZOmPkMR21WH+FM
9yp+mek4oJXEr/8AVL+JhYaoFSlAT4Gpl9tZr+7p+nhlHQupZXFePYP5GppYv0N1fIHKhAPYme14
1S+p2doGvbUazHKZf2/tPiT4D7n+PL8P+nOdYgaywKPeamJ/TrGD/wDerm1PS3x8hKgyj/L/ABGq
rV12eZzZbRinX9ZRlm/pyeJ9C9FqAHabJsY/Qul4SsVw0bQ42N6nVY+NSmF3FRsj3mVSjs7Mw+32
kx5cUT+UsL3yTHhn9LSlLnWvGrBJ/wBA2JJmsVu12BR8al+hBj5Bt7fP4kox0y7O9vE2fJjpbtPp
yTbJMdYP09u/HUyHNtfuNag8zRx6ErHantAy1RNOQNgzhw5aTn8Oy83jF5lb6YwbHVCeRLLoDM6o
ntNlXGvYS3iW2XAl0IHzqaOZii9tuni5ZisRImSD2cGHdaa1J7O6c91XqN5BRQa1PnU5+FwZy5Pf
hs5HK+KviNs76hdMrqCJWe7XB1LuP0+oUaZRyPMpdPqL5SsV4+TOgCAjQ8T6Dm5pxdKUn08rh8eL
za94c/j4RxbWsDcewiv6iSpCrzNm/prXD/Ls7fxKw6SKEZrR3/E315NJ129teTj2iJ05rNptfGOR
3qU+N8iN03VuK1RXbseD8Qr0s7iGUqpPxOj6V02qi1LFH/Lv+89XJy6Y6R5eVXi2yX3pRTo4XFRm
J2fJlSvGWvPFZb7deZ2VoXsOxxOezExrcsBQ6+xbU5q8mbfv225eL1/Sl1S1q9VVEkNxMUUsLeFO
50GT0tO9TTaSfk+0kd6cf93a7jjc3V5Fscahx240XndlLB6bdbp2+xPzPM/66YSY9GLbX9zqf3Ce
oW5VrA9pKj8Tzz+ri+v0DufkqZx8mbXruXrfT61x31EMjoV/q9HxmHuok9z/AGGYX0fbvoNG22Rx
NO637SOJ5mtPoI8q+RYeeZQtbiT3uOZRtfcu0lHY3ErO3Ee1pXcwmw2nfMrsZIx3IbToQGZpGzaj
FpEzcwiY5LrQ9XlHOyCPEq7jkwCYUDHzAY8QmMjYyATzG9ovaN3QFrUAxyYOxCEYB3HLCASIDN4g
Ex2Igt5lDFpGxjtBMimPEHcTQJQ8E8QoBMItqeZIsiTzJF8wgxFGjQo4ljbjrCJVhCAvtDEBxCEE
RxAk+I4g/EKAUeNHgKPGj7gOPMMHUjhA/MCZWncfSf0P/jdHq3ZgxwBs7HtOKwgpyqg/7e4bnuXS
Pp2qzFqYZjrS6g6XYmdcc39NeTLXH7eZZXRqMTNuqSz1lRtBvmHX07f7KiZ6jT9NYC5nZYDaN+/v
Nr/CunYx0uLWv9pnGC+9NH32P28go6RbZwuOxJ/E0sf6QzrdaxiB/E9m6Vi4vZpa1GvxL9zpQh0o
HxxOWaXnJ0bbcukU7w8ew/oHPuPb2ovvzNnF/pnaSPWvGvgT0rotnq3N3qOeJuGsewE18inxe2rF
y/l9PNcX+m+AmvWLv/ebWP8ARfSqQCMZD/I3Ou9MRhUSZyUybtDPJlnXhwPX+g0YNa20UoE3ogLM
etQrK68anoH1P6dfTWV9dzeBOa6J0kZSu9gOhwJ9vxL46cbeSHxvNyZsnImuOUGfntclNbV9v9/M
sp0u0orq3kbgdT6dZTkIqLtfabS3LSiq/BAlyWiI/wASYZyesksj0cqn/wCYOPxIbuoX0N2swP8A
aXsm71S3pDZHPEyagt+aoyB9o8iZ443G5Z2tMzqJWr8otUjM4YN7CT1N211XE6XYg1dNF2RYEBFa
jYiyseymlVZtoPH4nPkvT07MUXhqM3Zld1Y2pG5BkJkX2q4GkU8CFQGXDB3sge81MHGtfFVn0G9p
4nMzWrG6Pc42OLx5SL1NFxvTNen1rmUKXK8wctGFx7hoiKuSkVtXtYt2rbULgvdq+zfHxLdO2ACD
crU0kp364l/pty1WE63xPL5uPFNe/wDHVx+++qs4cXKttZ7D7ya0ein+WP8AaW8zLrYDaj/aUhkB
2CjU01tN4i1fTOcfWZrPseP3aLtwTK2SxsfRlgqTaF3GsxybJtw5K45ntLVkxXt4gdKKLKQnv5mn
c3a5UcKPiUMWl/VTzpTvmaFi7bfvPN+o5ZtMRSXpcHH1j8oRb7vIlDqOOlrp9o0PMvWEKPzKNlo7
zszHh3yxE6b81Mf/AOoVLa1rr0gAjILa6yx8eYeW49PY9pGhstqGv2/zPZxRfpF7vOydZnVFd+r2
UPoqCJqYuYL0DMuhMvL6WLKyyfuA3IVNgoCJ58Gd2WKZKxNHLji8WmL+m1kYuPlKQyKRv2ESoKgF
HgeJB0oGuixd7OxJmJJnk8vkzFutZd/H49fcwlU93ErZmOjjkCE19ePzawX+Yz3LaCVII/Exx5sk
RtMmGlvDAznsRxTWNb95WbDsR1NrcEzUz6y5UrrYlLKzUNRSwacT6XjZbZqRr28HPhrjtO0l9Faq
vYd7E4r+pXTWyfpu5k8pzqdX09xaGBbnfAmd9ZY73dCyEr5PaeP7THJW1fxs6MHXcTDxL6Lu302x
Cf8Ah2ETVvtnN/SLml8+k+RZubF1hJnHb29WCtfYPMpWvzHtY/Mq2mYkmdvMru24TNxIHaVDs2pB
Y247tInaUMxkTGEzSNmgNuAxjEwTEhEwCeYiZGTIHbzAJjEwSfmQOTBJi3+YBP5lCJgbhE8SMmEO
TALREwTAcniAxjkwCZA0UAjcbxKomPEGOdRoFpfMkHmRg6MMEbhiKNH9ooBCOIwjiASyRZGISmBJ
CgCHAJYQMAQh4gGIUAQhAeKKKA4iiEcQJqf+Ip+DPefofJOT0KlWPKjQngYB9jPZv6SXi3p/pk8q
dTu4kxXcy836hWbV8PRa8FUyK7fYeZazK671CqOZYr7WrCsDz7wxQKyGA5mnLyY77j25a8S/Tyrd
Pw3ofbHzLWfjBqe4nkSav1LG3qBm36rNfvOWMl8mWLLfHXDi1IcQipVKDkTWx82pvtdgGmLUCtAt
B8nWpu4uPX6SN2DZG9y869Kxu6cOlrRqqfuUck6HzKmZ1fFxlZQ3db8al41I6drDiZvVOn02IW7A
H+Zp4dsE32282uetdVcx1G+zqGUob50o+J03TcRcfFVAAOJnYvSuxu99HXIl/wDUOrga4nqcnmUy
0+PH+njcXjZMN++X3KLqVFpINaBtTFyMbIuyQLKyu+CZ0lmfVUQH3uOmRTkbKaJ94xZ7Up5dV8FM
lvDkMsf4fkBabNkjmDiYD5b+sG03d7zqsjpuLk7Z0HdrW5HiYAxk7V5G9j8TLL9TjHj/AOzj/TrW
uu42MtWOEGiSOTrzMvquB3JpbFVfOjNhGIXxK2XjJkfvHj8zzK/UqWncvZngTEeGEcbK/Sv6emRf
eX8PqmQaFS2pe5RrYMhas4oZe5jVrwTKKX2uxZVAUe06Mt4zYp6MMdbYralcymawmx/MPF7fLjiP
gL+tcIfG+ZoZWMlSqEGtTzq5bYcfXJDuri+a0dTC0GsV1DzJTjWY47nlep/SdW+Jfuzq7kAKkETi
yW+emqR+Lux4oxW/KfLOySbNACFjUFW23El70LbEIOPaa8fJtjr8VaahlPFpa3ebbWqiqP3EbMmU
q771K1FZyGCqwH5MPKavp9W8m+tSTobOtmeZavIm+4nw7OmOPENGvtI4iv4Qmc9Z1yjpiG3Jsd0f
kdo4USenrFeZ0/8AUuPRrsYivvOiw+Zv+O0V3KRTz4FdcWY88Spd9w2DzHO/O4Db15mPE581n8oM
3Em8eFW0WFSBNfp1SjETx3a2ZnN4j13vSSVPHxPZtzYzRFKuGvCtimbyuZ9nYhVPJ4nH5/Wsnp4N
dSK7F/t37b//AITcXKbIYseBuc79WX4+PQxCs2QPuBUeBOqk2r+LRaI9um6Xbai333DdLa3aOBv3
l85NGti1PkczlsHq+VkdEx8J6uxHTvQ+7fzKWTgZQGyj6/vOvF9Px5vys05OTkxRqIWOt9RDHKsT
VltbjsPsBD6dns11PZyXXZWYzY9tbAW1t2nzxOm6ZgU4oS4N3EjQ37Tqvx8eOuqtFMl7z+S0tjuN
eme6c71mqyjI1YNFuROsx7F77A2gq65nI/UGWuR1NtMCi8Azq+n18zqHPzqxMQt9Jr7aLLj4UcTJ
zsiy2u4dx+4Eam0lobCWnH0xI51MhsZixHuPIM6ev+02ho3NesVeFqhxPqXMqHAJ3qaFr+ZX+qdU
fWtuuA24FlmxqeJkjUvYrbcbK2zcgduIxbUid+JgyA7SB2hO35ld35kBFpCzRFtiRO3MAmaRs0Yt
AJ4gPuDv5i2PmAxEB2bUjJjs0jJhJIsILHcYwSYD71BJ4iJgwpiYDeY7H2gmAoBhEwTAExjE0Q8R
pCHiC3mFuC3mFI+Y0UUCzFG2I8MUgOxHEjki+IBR1jRxAMcQl5MAQl8wD94YgAQ1gPFFFAMGEJGJ
IIBRCDHHmAUceY0UCZDPTv6Q5YXJtpJ+48gTy9DOz/prkej10Deu4a4m/BPnUtHIrur6MxnFlajQ
DCW2Zd6JnO497IqspIJEtUtbbaGbc15OJ1nvtojNOorENdcoUbXXnxM69XaxnIJ3NFFVuzuHiW1V
DrxOH/kMPHtMftst9Ny8mNz6Y9Bc0tV2Hk7E6rGTVFYI0e0bkWLQgIfQJEt64nn87n15FYisOvh/
Tp487mRKgAlDKO7ipPAkl1/aD8CUbLTkE+kPuHnUx4WObHMrESlfSoSJRoyEfexzIb804x9O4HZ4
G5P0jD9a52caB50Z7OLjRhpMzLybTOW8ViFLLx2tsLA/2hYFi4zN6miDOguwxWjMSBoe8wBUz2lu
3X4nXXPF6dJY/ZzS3ZJg3W2Zx8ms+JsMJjrnmjIVGX7R5IE1jarjaEEHkETyfqOPJOusPU4M443u
fJ+JDfclfaGYAt4HzHtbVbEnQ15+J5z1zqQp6lUbMmy5Nnkca58Ti4/FvbfaHZlzVr6l2fUiBg2u
SNAb4mZ07qOIMetLbFD2KdKBsxsW5L+isiFv2nydmYn031qrAIsbHFjqHRe4ftM9PBS2OOsuLL+X
5Q3sWxqr/wDLYgnkTRa+1htmJmXdTetmPbcyF7U7/s8ASZ7yuhOvJWLxHjZgmaRtaNjHxGUt7waW
7138yQ9wDdmg3adfzqeRy+d9taMeOr1MPBjPX5LWQNlKmQKe8eqfC+8u0OT58znen9ZGThsLMVKM
tm7HscaLEHjXxNvGt7aU/UOosPBPsYy8rtERMeZXBxJpudrGZlWY+M70KWs/5QPczL/xR1rW3rVN
TGs7UuPeXrwxrYqdEDcxMjp3+L9OofqNjLVZYdAcHQnHaPPh61K16amPLby8fH6tg0ZVTADfhfBE
wMqu7qNv6e5mTGxzpmUftH8fM6fptOHjY60YIArX2B3Mvq3UHpyVowq6zaG722PJ/MkRb9sIrEJu
mZaXZL4tQf0aUHYzeWmiyj5mBRe1XU60veo35CdxWrwAPEvdSz1wMU2vyfCj5Mxjj97aiCb9Y2t2
lVB5Ep3WqtbFiJyJz7s66vMIs7VYhR4B1IWyL8jqeQMgstIrNgO9DfHE78fFilolyZc3aNOuxx21
hudHmYHVUrybs+9chQtSKO1x+8nyB/Ev/T/Va+pUGngWINHRmDnY99fqAqQHOtztpl3knbivhiIj
SGjNceiUftFR1oeB+J1GB1q6/IWl1UAruclhYwroXHrPcxs7ix8mdFT098TMW4uCFXt4noR69tNo
/razMitU1ZrniOgX0qyD9oO5lX0DKvWxmIC+BK+TmWC9cdXC1Hhj8Tqpim0RDitaIny1urXlcS00
bLNxxORsrsXbWA7/ADOnD14qIO8N+d+Zm9azKGrdO379edz0uFuvjTg5mpje2Zi51tAPpNoyO3Nu
Zy3d9x8yqlgDbgu+234E9O/Hi1XmVzTvW3lP12Gr+pFt3yWkLHjgzR/qVV25CWHY2d7mLU/dUp/E
+S5VeuSYfR8e26QNzIHaPY0r2NxOZ0EzSB2jkyJiIDkyJonMAmRDkxiRqCfEEwpEwS0YmBuA7H8w
SYxgwHJgExzBhCiiigA3mC3iE3mC0AI0eNAUUUUBQWhQWEAYo+jFowqXccGRgwtwxGDC38SMGODA
lB+YYMg3DVvmBMDCB1ItjfmEDAnEcGRhoQaFHuEDIu4Qg3MIlEIGRgwu7UAuIv4gd0QaBMDxCH5k
e4QaBIJ0/wDT+1U+oaO7wTqcqGml0K019Ux2U6IYTOs6XW/b6lwqKmqU73LyBVHE5jpt9gwaSG8q
DNHGtsZuTuaL8XNk/LuzjNjrOurZDn2kldh3Kdb7IlhDPmfqPFtXJ4e7xM0Wo18C/wC7tJ4l+1wK
yRMOlyvMsDIJXR8TVimKeJMmPfmEeTfoMTzMS/qFePj2jpq/9+bz3NwTNl19RWGuSJyVfTMejJuy
rMlvWPPpj5nocOvXdpnx/Hn58Vb+yx8rNXDd+rKv6ktqpF/5fzL3Tur2Y5F2Xa5C8gf/AMIPSVHU
8q0WqQE0BsTL+q8LNozqKMNe4WnS8cfmevivF56y83JijH5h1OJ9S1fUKsKEdFqfTA8Sxfb6abB1
OV+nc5KM44Q7SCeSPdpp9XtYZAUE9onTTDFskRtz5bWrTaSle83WMeQCZn19RyK0/wAtiF34l576
sXp1j2WKGZDoQOk9Qwz0mq3KrSkHgGz/AJp2/JETMTG3HGC1o3EqN/Usq5exrCAfict1GrZHf4rs
Pbv+09G/SYORWLVVWU8hlPE4r6krpGTYtJOl8SZL1v6hlTFes+Zaf0o/rC9DskgamR1PDcY+WT/l
2eppe34l76LsIzhX7FeZV6xYX6reiHak8D5nHf29CnrTZ+l2Y9PRLW7ig0Nncn6gbCxGOFa3egpO
v7zE+l7rPUya7dKQftH4mn13q1L9PSiuopbTstaPLTlva+O0Wo6J/KnVp4Qas+laR6ijba5EpdRz
cqjPZKtmrs/6zO+n+pK2MbQd93uTLOabcbPwsl3U1ZXcNAftA+Zx5eHa2T5bedurByopSMe/I+lW
YObkq2Yvcaidr42TNO/AxsTp1F91rMzttU3sgTOwsbFyM/JYOnbWvdoHyZG9/wDkhLGZ9cLv2mq+
G023p048m58S6HHuryamNZ2Na5nP9UzjfSMOp1rar7Ro/wD6y30Ci3GFhe02K/3D8ShlYONjXZlh
UvfZZ3LzwBoTCKTE+XdF239M4jYOKwuvW5nPcO071KfW6asXIszGZi7r2hRA6C1wLl6mRNfax94H
1NQ99NdgtK+md6+Z0Vhrm7L6Dc9mf+osx3Feyis3vLP1Ull+VjISFx1Us5+I1WW2I+JT3AW21cK/
JUH3hfVV21x1qU2d47Tqb8FJmzRltHVR6Dm15fUvTqYGmgFVXXGz7yf6lp7TQKVBN326EqdKNWPd
WK6+xnbTamj9RFkqDKdEcA/E7YrG3FbbL+nEXp+Q6VqO+xtMd7P8To+tBf8AD7O0c6nLYrim5CfY
7nS5N+sUmzkMsxnHudwk28OP6bUcRsq624ljzUB//GdfXeLcKq125YDzODutvGZ2dn+Tzttzfx8g
XYlYU/ao1xPSwcWM0xEuDNyOkTMOjqpayg2DhRMfLWv0X97dxY2deFFCvpCZcycWtKS/k6np1r8N
+rzrTOWOzDStv9TaH5lLLYs7bO5rG6taa69gux/2l7J6PRdRtPsfW9zspmrimOzhyY5vE6cf3aMQ
aFfU1VrI40QdSfp9FduQos4X3M9PJkiKdnk1pPfTif6iYjW4K2KpOvxOJxbN0LPaP6hphDoD10KA
5E8Qxtirt+DPh+VbvkmX1/FjVIhPY0rueDDsMiY8GczpREwCeY7SMniFO5gEwWO4DHQgEWP4kbMY
xaMW4MBExQdxtwHjGNuLcBGDHjQFBhQYQxjERzGgAYMNoOoDRR9RagNGO9wtRagNFESBFuF0QIMe
RCEPMMRxxGi3zAk1EOIwiEAwY+4Ij6/IgF3Qw0j1HgSAwgeYAMIGBKDH7uJGrQiYCDb8RweYAigT
90fukO9xwdQqwG/Mt4FnblVHevuEzg0mpfTAg+8lvMLHt9QdBAv6RisOfsAmzTSKkJM5L+neZ+p6
LjgnehqdpeypWWPgTmrmvExR1xgpaJtAcZgbDzJ7buz3mf09++xz7SfIUtaAPGpn0pbPMX9QsTau
H8PbRxrhZWAPPvJwe2Z+IhR9ltD4l1m34nDm4eOcvek+HViy3+PVkyW86AnH5WDm5XWb66OztHJJ
bU6cP2Hz5nKfUmRfj9QYYwJZl517zrxceI8xDjzZJhq/TOco6i2G2jYo3sSf69Jq6bVcmwxftJHn
Uw/pPIXHzO7LrCXWcbm19Z5Kr0bubntcGZYscxeNNWS0TXy57ogxum3LY9TNkX6Kk+2/edJ9S/p8
Dp36q0nuI4O5x2Jaeq51GRbl9qjQXj2E6r66qXL6Vi1bJBGmm7LFq5ImGiKd405Oi79dez2OOzt2
mz5lbOW62koQy1jxvwJaw8eoZOLRWoVV0OT5M3PqQMmL6LVhdcg/M9Cte0NF8fTwzeh9Y9D9Ng1o
QrfYT52fmB12pq8pu73MyMa5cKtLj91os2B8Td+oLxetNjaDldmYTWY/TGI37R/S96Y3Vk9Tw4Ki
T/UuOi51NtR5IIYD5mXT6ZbEsV/vS3ZHxLHXmdMylgTpjNN43G2+n4+FqjFycOpb8mk1paD2NvyJ
nrb6dzBk72Y/Z8fncfqfVsnN9PGybOa1+1R7CRo7VVq71l1X3nDFptaNuvTQrZUTQUL+AIdt5tRE
dthfA+JFbpqksTww3IFbXmfU0xY7Y4l41r2rlanSq6lyC7758yUdUx0cmugNptbaU6CyoHB4MrWd
lrdwfYB9hxuePmilpmKvawUmlYtMtvpvUsvK6ua2pqTEI2rA8y3kemvWLGvIOP2a1rcyumX1V26Y
sG1pQB5lLr2VlJb30L3DXicteJGV22yfHrbW6TmMbrlss7agQK0J/nxLvWxaelu9FZscHhZy3S+o
duRU2YqqQRyPzOrzc+mvHesHbN41Mv8Aj71nwW5NY9uKvuI01h/7yNaJPIHxNvqdv6foy5TbLVdr
E+4Ewc2gNmm87J1qaWbe2T9OFOzhj2tv4E68WGPTgy5prO5V+nZGO9SWMWa0v3A68ToevVY2X0kt
kEhODx5BnBg2q6LV+0ToeoXNfhFQ329ktOJ+TC/MjWmIWsuyQ9J3VsDc7nOsr/wmlvOq/iee49ll
FSoq7JPidpjq+V02ugjRH2y1x9LNdsnerjsu8+oFXw3vNPA1Xh9oIJ7tyt1DD/S5NlTclTwZJ0vk
Wdx1qd3GtFMjg5FZmnho4rf5y8zoL1qbE29gHG/Mw+mVLkXkBuB5g9brWhq1rfasOdGd8/5M0Vhw
/J8eOZlU9PuyO7f2g8ToMTqNdaBLm2Pmc6lgACjky3VgveATsD5m7Pixz4v+nLiy391VerN+qzXe
pSVPwJf6UrY+ODZUOfB1LNVC41XaOfyYTt3IF+JrvmiadYa4xz27Swfq/ETM6Xkuv7wvAngwBrex
G4KsRPozMxRfgXov7yvHM8Htwq36xkY+Q4rbvP3e0+e5cal7/Dnxpls51InM28roLpziX13D43zM
bIx7qWK2IykficjsQMZGTxCbzIm8wBYyMnYjtA9jKoWPMHcTeY0iH3+YtxooUooohsnQEAgIiJpd
N6Tl57haaWIPvqdLj/0+z7VHc2j7jXiY7Xq4XcfzPQR/TTN9m3JB/TLOI4bRk7EVl5zqNrc9GP8A
S7qX/wB1f9pmZv8AT/q+KCfSDge4kizKauJMU3LfpvqVb9rYzgyB+h5ynRx33/EvZNMqKaH+FZg/
+ms/9shGBkltGmz/ANsvZYhVC7nU/Sn0rZ1ZvVt7lpH+5mn9IfRlua635i9tI0QD7z1fBwKMGn08
dO1ZjayxVyeP9AdLFRXsZmPuYB/p7gp5Wwid1iuAxBmkuiJrmzPq+R4ooxnQ5h7iHJjCOvmAcceY
0cQDEeDHBhRg/MXvzB3H3uAcOQgmGD/MIMQhAEIQCi1Gi1KotRcwYhAkjodGRwhxIPb/AOkWez4g
qPsZ6Z1DJC1FPczxD+k+b6V4DnSb5/3nrucXfJV15rbxNvw1/wBpb8WXcTWGngjsUMPeXGPgypj8
VKPfUuHRQDc83JO7Wl6eOuqxA63lhG45lReDJ05mnHjiY22W/wC4StptTA+q7kxLqcjQ2qzbYFed
znfqwo4oWxQy+CD7zvw4r+49PN5F6xDEwyufmHL9c1qngAfEXU+p39ZN2OoZaaho8efzJLaTnZS1
dJoSngAoDx+TNejpOTQhWx0HdruAHmd+OsR415edbzG4VujdMTKsw6aq/TVBuxif3fxN36j+zA7m
321mZ3T8p8bL+4Aqo1oCWut5S5XSblUEEjwZ0Tg3OpZ4uRNfTmcq+nFpxstbNv3fcmv2iafWc5sp
Ku4aHYDOeroZ8WzIfRprcKQT7y7dketSGOv264no4eNXrMQ4eRnta+5ZLD9Re9QB0Bvc2PqEE42O
afIUAzLx71ruPjv9h8zbyEXI6Utvhvec2prM103TqaxMMjGtrD9u/wDM/maf1ASMGrLYbVCBxMFq
kF/qD9/tOjvdX+nl9XlSNmcV6b2sXYR/z8r9Qf8AiFAoH4lxckiv07CAo+ZmLX331W1sewfEsZ2M
MpAGYro72Jji4sWiZZfcdZ8ul6aKsmlEHkDj+JL1LCrGKwU9rHgGc7Xfl0ZWIuIg7Nac79po9Vy7
bcZq6m1YfBPtGGmSNxtsvek/pSsvfFRawGck64lvrJvowq6setfU/cNjyZnU32YeMHy32VP3NNjq
t/rLUybI7BqbcOOJ3tryZZiIiGd0/Mtx6EbPKLd5OjoTV6+609H/AFGie7wBOaQU9RvZcuo7qbjn
4m/10+r9OqKD9yEEf2nVgwdrViP6xtyfH5OSxeoNj5gfJx/UA8KeNTrsjI9VfUH2qw3/AAJweLdY
Operkt6ie4Amw3WXKOiqGpbgA+dT6fJwqzEdYcXJ5EWiJrK/lXO9i1UEFiQSd+00LSW6dZQnBMzu
mjHID0Vle46O50q9KZqe9fPxPn8mKuO8s8uW01iIlx6KMLDNlxLuT4Hknc1Ut9TBOwQQPEny8K1C
wao9vkcSkyNWoQg8j4nDOTrPhurXvG5Z1TtUGewgAcgzuvpn/M6clu993I3Oaxejtn8NsJsb/M6+
kUYVC0qQoUaAnNPa1m2LViHOdfQ15dj2AdrHgzJrSx1ZqRtQOSD4nT9VUZeM9egdjjc5zA6bZ+pN
bWFUJ5/M6KY59ue3IrvSPHteuthWxBPxIO613AJY/wA8zQzcX9HbpSSp95MtYrxReBs7nuca8VpH
9eHy4m19x6S9J6ebWDv7e008rNpw0C8b+BOePVra+EXtEHAxrc7IHk87JjPxpmfkyT4aaciP9Ke2
zj3WZzs3b21CTqmhqRdTyEwceuirQb31L2AFupRvOxPNzzOPzEeHbhmLzpSrZTc1Te4Op4N9d412
D1y1nUothJXifSdeDT6gsK7YeJ5L/XzDAOBfrWmK71PO5N4v6e1xY6vKqsu6vlbGE2cbrtLVBMyg
We29TnyoKjt8wWUqOZxuvbfbDw+pN/3NhVZ/pY8TPzuh5uOCTV3r8odzNW5627kYgj4lmrrObW21
vbXxCqVtbVnTqVP5GpC2p0lXXsW5AudiJYf9QHMdcXpGe/bSxx3I434gcswjanQZf01lVqzUulqj
x2mY9uJdS3bZWymTZpAvxJa6Xdu1FLMfAE0ug9Gu6pnpRSp2fJ1PdPpP6M6f0qtHupSy/X7iJja2
mcVeUfTn0B1PqvY7oK6z8nmeidE/pXi44WzLcu4517T03ESqpdIir8aEtLqabZGyKuf6d9L4WCv+
XUn8gTQ/SVVA6Qf7TTJGuJXvG0Mx+TbPqpqE8ACESo9hKhYhjyY/duY9pXrCcupOtCIojrpgNStz
EbHUccyxZNIcro+Jfy1a7+dTMv8ApnHbZRgD/E1Tmuv7lh15SWeeDL8idXLt9N2Bj2opH4Ep2dHN
W/Ux9D57Z3SWqeAYTKti6YAj4Mdzq5PAqSurtGhr2lor9sv5PS17/Uo+3/ywkoGh3KJJts0xyva2
xLePfsaMutiUt5WB+krTkRtk+SYxj7jTscQootxQHBPzHBO4MceYB8/McRooBxRooBgmOCYG48Kl
BhKZGviSKYQUeKKVSiEGPAOIniDFBp2H9PMjs6h2FuPie/8ASH/UYKs42VOp82fSTtX1Wrt8k6n0
L0Kw4+Fp2IVhvmdM1nLj619sMdvjydpb9XB4jJko9xQMCZkZfVESkrSSXPG/iVMHdyO/cQV53Ntf
p8Rj/L9tt+fu/wCLqxaisFZh3H2lhLa0/ewH8zkUus9UOSSRDys1rrFJ4UeZMf0uv7Y3+o3/AG61
7UuQrU4Lfic59VD7UKkMUPOvaTdPyazmg0H7daP4lTrP2VWo52zHYPzO/FxYp4hxZeXNvbDLriIL
KbrHtf8AcNaC/idbRnN+jx9qe9xrnzOMroyaqhlM9YpDeD+4/wBpq43UXtuqvd+9VM1Ri/JrtyOl
XQrWuNk+rb+4+0iz7VyW4HGjv8yTLYZFCXJyJBeyLTpOXI/6zsw4YtaLW9tfza9POMjJf1baG7wm
yTqbPTq+7pqLWS2hyZyuZ1fqGH1DIx7adVvsN3DzzOh+mOp0Y2JabLvVYnitR+3+89vNinDTt4nf
8a7W7SGztW9S5044EvdMuy26PcLz9isSP7//APJlZgXLv79FV3sS9XkmnGakftbzPLx4u0zMscub
pXauK1tZbFYhgeR7TWcvk9KasA6XjQmWFLH7OJ0X06ivj3K3keZ5mTxaYh0479oiXMZDX00oMUAk
HR/E1Dt6fH3alOxTjNeN922JH+/ibfRqfUxxZcnaT43Jiv03uEzR2jwzcUWY1Vt3ceB4Ms1lrqfU
B3+PeX83E3UVTWn8yTp/TmotVy/2a12e059zWZb7WrasRX2wyBklqrV2vuDJ1fKutox6TuoNrtmr
Z0Vr87vRyiNw2h7TRwujLh3rYjliPmKzry1zeZjTl8qv0896VGmHkzbxMRsro1tQB7wCBL2TgqrC
xaQ9rNydTUw6RSvC63OqnL+OezT5mXmXSujZhvDWY7D+RxNV/pO61y/Cb5InoGj7CDZsDgTdk+t5
5mIr4hh9tSfOvLz+9BRclCjt9D7QB7n5nb9LYv0+lm8kTOr6Qr5L3XgszHf4m1RWK6gqjQHgTj+o
86M1IrX2cbDetpm3pFl6Wlm0NgTHvyaxQS1Q7vwJq9Qrsso7ajokzJuxjWAbSNDzNOCY67s3ZLWi
dQsdJcWU7C9vPiQW0A5bF+7Xz7S/hdhqBrACwOoAGogfumyt/LTO9bYvVbXxygr2QZnplMLAzDW5
q3J64UOORK+bhf5QKD7p3470iNS48lbzO4S5FH6zF+37m9odeOiVClm5+Ja6Jg26L2bCnwJds6Qz
5QuDcAeJrvyK1n8ZdNOPN6+XIZfS7Baezn4E0Om+tRWKVq0x99To26azWKx9pZrwPuB1M7/UJvXr
LXX6dqdw5S/pGVkXeoxG/wAzY6Rhvj1BLDsj4mxbUiL+ZFjppiTOXNyJvXTowcT47blOlfE85/rp
085P0sliaBrsB5npficV/Vq/Gb6OzqXtrNhTapsEkzzrPTpGnzW2DlKu1RmX5A3Ktjsp7X2D8ETR
6Z9Q34i9o0ya1phLi9QwOq2+nmVrUT4deJrbZYSWIP3ruRkB2+J0V30/UyE4+VWx9tnUxcrpebjH
7qWK/wCpeQZiyiFS2spogg7gqGB2CQYzd6n7gR/IkqHeoWIWcXNyaGBrtcH+Z2n09i5fV+L6Vddc
Myyt9EfT7Z1633Vf5SnY7h5nsPSunrWF7a1X+BMJsyiqt9I9Ap6encEUM3J0J0ltD6PbwJPi1dg8
S2APiabW22xHhiplXUHtZCRL+P1BGX7/ALTLVtSuDtRM6/FAY6H+0xnyyaaXKw2DsRrSChmGDbS3
271JD1FgNMo1MIhRWfuP8xlMh/UqeY36lRM0WCdQSZA2SsiOUNyaTaxYFPnmU8hf9PEezKGpWe/u
34kmFN3tWdhjsSwvVmRPuA3+ZQsfZle0dwmUQbap66n/ADEagHreOfJmBZjb8GAMMn3l0nZ0R6zj
Ab7v+sr39do7CByZjfo/kwkw13zJqU7Q+cYtxop2uQUUYR4DxRbigECY4MERx5gHFFFCnWGsAQ1g
GviGvnmAsIQH2Y/cYG4+5Qe4oEUCTcUaMDA1egX+j1Ohv/MJ7weorZgVpX599GfPWG/ZkVt8MJ7N
0ti+JSfkbno8HUz5cXL3WPDqsHBfJrDBtbmtVgnFoYd2y0g6XaMfBXuHLeJe2bK15OzOvLkn1Jix
x12oVOtfcH4MfHxxkK7b1ozRHT1t5bQlnHwkoUhTvfzOeMsRvU+2Vscz5lkYtf6YXgn7n0Fk3WaG
uwx2g96jmUPqBzVkBU495rdAyWzKGNoHcvB/M9LzTH3eXN+95q4oG612qWix1H7j8To+j4NeRjCu
qv0+3yd+ZoP0la7LXRyqv5A95NgWUY1Rqr0CPM5cczlndUy36TFbL2JjLRjioHYlbKxNWI6ngHkf
MoV9S9bOapD9g95H1LKyFYCptLOmnHvFtzLRblViNQz+u9Ppz8gNkUABRrjjc4+vD/QXNVUvlj/f
mdw1p9PvuPd8kzKybKrb0YKNL7z1MFpis1lyX5flFdj2LVTbdWEHaFXUGvGN4JHgTYv/AO84muCQ
OJT6J6nq2IV4mvdaUn+rkyWyW8egU1Y1JHrEn5Ah3dRqorNeEpXu/cR5Mg61jPXfwNbkPTagchfW
H2TCMGKK/J+2EZ8m+i/0zDa9v1N37RyAfea+Owv2K9BF4lPPzkpxhXjgnY1wPErdHyLKCQyk93uR
PKyY7Xiby9HFlmJistnKrcUMVB2Ja6bU92OptUqd+8nxwLEXuG9iXqkHtPMnL41L1MePf5QKtVA4
ENV35ENVAhjXtNFrfx1xSAqg+IXaI4imPaV6wcAQwoEEGF7Sdk6wWh7QSv4hRSMtR/AFNiV8nBW9
TseZbgPclf73Uf3jcx6Y/HE/pUoxBRWEUHQkdnTxa/eWIkmT1bCoQtZkVjXnmZOR9Y9KoH/GL/wJ
lGSScFZaH+HBfeSJhIG+4bnL5f19iqp9Gix/jfEysj6/ynBGPjonwSeZnOW0p8NYel11gLpRqGSE
/cQB+TPHMn6w6tb4v7fkATMu6x1C/mzJsO/hpj2lsjHEPbcjqGHT/wAXIqX/ANQmVmfVnS8UHWQr
key8zx5rrHO3dmP5MjLE+8veV6Q9Fy/rrGLH0qnf43xMjK+u8w7XHpStfnyZxpMTE6jvLGaw2sz6
o6rkgh8llHwvE5rrl1mRh2+pY7kj3O5Y3K2X91LD21JMrEPMN6JH5i7udwspezJtUezGRamLPSdL
7V8WMP7zYwvqLKopFbadR4BmCAY4mOldP/jGDmaXNxU38qNam99P/TWH1K/18Yn0R5U+0576b+mM
rq1qsa2WkEbJ43PZvpfo9XTMNaEHPlj8mYWlarvROl1Y1NVdYAQcTqaKVRQAJnY1XZ2/ia1fiapl
uiEyASQCAniGJrlTgRjWDETqEGkEF2OpHgTOvwhzqbPmRWINSq5m7HZdkeJVOxOitxwQZnXYoDcQ
ksshjIyrCaLVAcSI1/iEZ7K0AgjzL7pIWQHe4VSYkGLyJPZXr2kBBlQ4UR9QBuInUqCAjgcwO6SU
gloTT5fiiinW5iEKDCgKIRRCAQiHmIRxCijiNEIBCGsjki8QCiijQCi940eVDmP7QfePDI+44MGK
RE1Z0y/zPbfpJP1vTsZlGwABPEK/Invn9GWXI6QxIBKHU6MF+k7acte0adTfQ6UL9pCrL3TQ9iLt
eBNRq1YaIBHxJKqVrXSDQm/Jm7QlKdUTMK+SdCP3DXcTx8yZ6UsGnGxHOOjIEI+34nLEedttrTMa
cn1eizM6g3pAlBxuavQcN8Ot+/8A5prJion7RCKa8Tuycy1qfH+nm14URebxKC9tUsdb0PE5exTa
LH7ShJ9p1jpxr2lW7FV0I7Zs4nIjHGpcfL49reYYnSsJUPrd+2I5EuZiBgNiFiYb0u5ZiR7CFmVW
Mn+UNtO6c8TO3nRit60yMoq+O9Q/dM5en2hC3M6D9A9qh3HY4/5RLCYRcgMdS/fRQ+yvdy+DbYLv
T51vxOi/SvViE116Y8zSwum0VP3hQX+TL3YJx5/qMX8Q9Ti/TppG7OZuxbMrHV3Q9487kg6Qq1qw
U7950fpr8RMoA54nNPMvPh0/YV3ti0dPRR99QP8AMnONSicVruWsm+qtfusUfyZnW9SxK+bMioD/
APKa5zWt+26OPWP00sOsFfEuBdDic1Z9U9MxiV9bu1/pEzsj6/xk4px3f8k6nLedy6qRqNO5EIDQ
3PNbvr3LsJ9DHRB/5uZmX/VvWLft9ftB/wBImDOHrZtrB5YD+TIsjOxKF3ZkVr/6p43b1TqNwJbJ
tPzoyE4uZd2s3qP3DY2SeImfC7h6zk/UnTaFJOSCfgTMv+uMKtT2BnP8Tz/pXSr+oBmrIVVPbsn3
lzF+ncu63GSzSi21qi3nRE0X5GPHG7SWiK+XRZP9QPuHoYpP5Mo5f1z1C5dUKlQ+dbkmP9LYn6dB
dc/rurMoHvqRP03Aqq9GxXFjV9yt8n4nnz9YwdtRLojFr2zcn6o6vcNNlOoPH28TKbMzL7CHutdj
7Fp3Boxu9sQ0VapqWxW7eT43/wDrMSzHqr+p7DXWVqLggjxozsxcuuX/AFYTHnUMmnBz8hu0VWMT
8w7ejZFdDWXNWir+eZ0+UWbOryK3YV7KEBuNgTN/4/T8ir7C3ee3Zm+Lba9uU3+YoiCrFWGmHmLU
2QuiMW+IgN+AYQosb9qMf7TLwakPdGlirp2VY2hWf7y5V0LKc86UfzJuFisskmLc31+nn199mv4l
qnolFei22k7Qy+JyZHMc4t1iHsrYidsmDjJ4qXf5lgVqV0EH9hMZuvx6fPHWsdsfq19bjR3vUo63
PX+rf0/fqnV7Mj1O2ttePMvYX9O8LBsR7UNhHz7x2Orx/p3S8vPftxqWYfIE9D+lvoT07Bbnqjjj
S6no3Tul4eEqpRQtaj4E1PQrGuxZhN16qfTOl4+NQK60VR+BLYxWrcFFJWXcOrTfcP4l4kIPE19t
sorpQrU9o3xLlTSu7FrCFUwlx7j8iYzLNfU6HkRy4A8yoKLteTJEx3P7pESF9x1bfEdKNedyZKQP
aNAF3uOeZOK/xGNcKquu5Uvq34E0ikhdN+0gx7adSu9eps2VEe0rW0g+RqDTFtGjIGE1r8Ye0pXU
6khFRxtZEVBlh11IiJWMq7qACZEeZZK7BEhddHUsANTR6dSG58SjWvc4E3sVBXWOIHyBFFFOxynh
QY+4DxCKIQCEUQihTg6hCAIcAxHjAx9iA8Yx42oQQ8woI8wpVKKKLcB4oopA6n7p7b/QHLDLm4zE
bH3D/pPERwZ6b/QvNNP1O1BP22If/wCEsTo0+hu2OOBD1xBZlX9zARuQtwx4kRtqHmxR/eQ2dRxK
l/zMisf3mXYiq35gk/8ASZ3+NYIBZblYDyQZzfWPqE22GvGbj53NN83WG2mCbS6nLzsfHXdtgEyz
9S4A3/mTzT6g6jk2OEBcyt0fEuut7riwUfM57cqYjcS314cTOpeqVdfwbDoOd/xL+LnYlz9qXL3f
BM8+pxlqBdTvQmNd1QWuxqVkcHXcDJg5eS0+2Gbh4qx6ev25WNXstdUNefuEo39f6ZVwchf7TzGm
vJyQzqWYDk8yZOmX2617+J6kWtaHm/4qz5dxZ9ZYNRIQM4+RM7K+uvv1i43HyxnN43SvUasO+g29
ke2paXpVAD6s7yvt8zGI37bYvXXhayPrTqL6FS11n8TMyuvdTyN9+S4H4mnj4WHRYR6Bs3obY+JB
tK22lS+mX7dEciWanfbHZ8zIUO9lrr8kxJgZVlgrIYsw7hs+02/VasKqgdhJBGofqL6SFSA6nzMS
JiWLidLsyL2q7grr53La9ArRz694Ov8ATzJKLVXrNncQAQeZafKpFpVrAu/eS0MmdnYFWMlLUksG
OjsTSGLjiqt1xxtdHuPvK+Tk4Pp9llrPo7HaJFZ1pWo9Kqpj7bmqWTTw6aTdcrABbAeJodPWt8Su
tz2XUkgfkTkxmZLaNaNsfiPvqVzqRtfjXEwtPjRFJ22+jhnpzcGghb2s7lG/M6LEFfSqTj5GQj3j
KDHZ/aNcmcRT0/O9UWBux9/u3zLQ6LkWuXvv7j78medyeHGaOu3o0iJr5h2VWZ06u5GfMqX9PbYQ
W47lPsJh5/W+m20qwVnurDooI4595nU9DrD7sOx/MuJ0nFUAFNn5nHi+hYaW7bbZzxPjShb14NUv
o459c1ekzn3EC7qvUcoIq0KoA0CBqbYoqrX7a14/ESsg8FZ6uPj0xxqrkmnnbmGw+qWqE7mC93d/
eHR0TMZvvtKg+dGdOG3/ABH3oTbtjGFgL9PJ/wA9rb/iWquiYieV7j8kzUJ3G3LFmXxwqJ07GT9t
Yk61pWNKoH9pJAJl7HUiR4EfepGd7jTHa6SM0iLb8QgpbgAmXsPp/cO6w6+BMZkVqMZ7COOJp04W
hvtliqkKRqXUr2JjsVaqgntzHsqaz51LPpcyVa5doyjg7OxvcBqLam8EiboqiNOxMVZFF2/bmWk0
/mSWYYJ2o0ZD6VlZ451G0XaaUA2AJOqiVKLj26Mt1up8GRUgURdscQhGwwWEFEcRRtT6AgkCEfMa
EAywAskMbUCNq9yB6d+ZbgOOIVnW4/HiUrcYHfE2WG5C1YO4Rz1+Nr2lGysidNfSCPEz7cXgypph
ldSJ02ZoWUEMdCQmlieBImgYVQ7ueZfe0IupFiV6B35keXsH+ZSIfJe4txtxTscwoowMeGIhHEYR
xAeL3iihTx1jCOsAooohAkXxHiHiKAo8aKA8UaKA8fx4iigEPE6P6BzWwvqbFsRu0k9u5zUvdFt9
HqmM+9acQPdsj6q6iLGCWaAOhzKl3XuoXfuybOfzM3IGnLexHdKb3hfPiTbKPMtZ+oZT/uvsP94N
Zsvflmb+TMc54B4G5qdCzFvyCnbNGbL1ruHTixblJ1vJswcNK6+C/kiUegWWvmobCxU+SZ0/UcWm
+sC8AjUWFi49aaqUce84L55vXTvpiiErUY9jf8Nd/wASLJRaR9i6EDPt/TKWB0Jk/wCLsW7e3unP
ETLd1iGxTcFxbTZxsEATmK8f0xr5O5dJuubdj8fEc+mOGYD+89Hj2iri5NJu0Ppi4pk2VkDTL7zX
DJV6fYwAVt+ZzFTAWbpsAbXtL9GDlX/d6mxPQjNqNPGvwpm+2hZqm4L6oX7ywPtoyDJzscF/TsUO
fdYadFsb/i28Ql6DQjAsSY+SGdePpQ/xX7R7trkxN1AupCUAb54+Zsr07GBH+WJYrxqk8IJJyt0Y
IhzJvzWQqlZIP4gLh5rAb2J1pCL7Af2kfcvyJhOWWUYoc8nRr7dM76MtD6fUj77DNpLqwG+9dr5H
xKt3VKBjPbXuwIdHUwtlZ/HCvj9ExUXTAsZar6bjVsCtYlPI6wtOCuR6Z+48LIendSzs25W9HsoP
uZj32yikNv0K1/agH9omKJruKj+TqBkXeljvZ/pG5yeImR122y97WrpB0AJjvbLrp111tVNPqu6h
PncqVdXw7GCpeuz+Zh9ex/0f0/6Pezjv8mZJuqvwaKKqx6p/5gOZdrt2VnUVTKSlVLhv+Ye0qdS6
u1GStGOhstPJUewmbl33YWZiUISpdACYJwrqMm657R3P5MiL1GdmWVXGz7NKSBMjDe7JS2xrypQ+
N+ZZwTkWZDAMXq0ZW6FgHJvv9RmWsP8A7yRDNv8A05fbdiP629qxAJ9xNbcgoqrorC1jSiFvZ8zI
mUpOo24BMRbcJI9wT5gM/wARqw1j6QEmRjsepNViWPo60s0MXA7ED28t8TQpqB4PiSbG2fiY61ts
jcvKu/4k5qUftEkSs/Ex2kIVQbGpbqX7YhUAPEJQYUQXcMLEviEPEBgIQWIQ1G4A9kY1jXiS+IoF
KzH1siQbKmaRWR2VB/ImJCCu87AMsq2xxKVtBXkHYjVsynmVWkI8rVX8cyZX3Ig4oo0BHUaIxQGM
FoRgb3KAIgNJdbgMOYVBYCZC1exyJZYQCNyozrMfZkQwx3b4mn2xu3UIoNQFU7ExuocECdHkAFT+
BMG+v13K/wCkxJt8g7i3FFOxykCd+YakwISkagSA/MfcCOIQUeKKAotxRQDWEJGIY/mBJuLcGIQD
ijAx4DiKNFAeKNuKAW4dJ1YpHkEGRwkOiIHr1l/dgYdvgPSv/wCkzW7rG0CTHxclbfp3pi724BBl
zCpBYEzTe2nbhxRPlSbFsA5E2/pfGKXGxvMlsorKAjW5e6eyUVcaE4st5mNO2uOInwh+pc9qFQJ/
zTJ6V1W5XPcx1L3WKTnuvZ/yzOfFGIAzcEzHHWOrLcw21y6Molcons1vUqriVLZ3177fYGUcZ0Lj
kTSF6hd/Ex66bazuPKcV7E5vqdVi5T8nR8TSt6ylLaX7vxM6/qH6u3fZozZSkx5a7zE+EGNXcLFK
Eidp0rMapURuSeJg44+0EiaeIv3IR5Es3mbaa7UjTqL8hKKGttYKqjZlDF61i5F3pq537cTM64xy
eoY2IW0raJHyJs1YOPjoAlaggcGb6uO0eVXqfV/01xppTvtHkSHC6zbZkLXk1+mG8GUMB0r+ocj9
TxsfbuLrbjJ6ljLjMD2n7tTNimz8zJzs98TGftVfLD3ka3ZHTMlKshyyP4JO5FV6vSes2ZFiF6rR
rgeJJb39YzksWsrVUed+8KyMi20ZdwDP2M3OjN+m6kdGP6cfsGyPfcWH03/9yvNlf+WR5MJOjenb
aEs1Ww8STAyMvIbJ6QWbQKt7S/0TMpqx6/UvO/HbuWE6RUmO1LsWUncPF6Rh0MG7P95Yqm2pk1HJ
wbEQ8uuhMDpd79Jx7Me6p+7u2CBsGdD69VYADgCUcvqeBSd331gj2JEul2zc/wDUdWw2rSshSeN8
cyLH6Ea6aWHFq+Ysv606Njt2i8Ej/TMfK/qJ0+v/AIKu5/iOpt1OVhfqLsexzzUJLkYi5LKbHYa+
J51kf1JsI/ycYA/mZWZ9edUuGqu2oH4jqx7Q9jprqpXS6HHzInyMTH3/AJlafPM8Mv8Aqfq14Pdl
OAfYGZ9udkXA+rdY5PyZlWid3umT9T9KxgQ+ZV3DyAdzKu+vOmo/bX32H/yjzPHKarL7AiAsx8Ce
ifR/06tKC7MUF+NbktXRF9uuw+r5ecgevH9ND47jLLnJYbLkH8SRAqoAPAhg7ExXshwa7bMgd9jE
D2nWdJRVPA0Zl9Ixu5i2vzNfG/y7dTGVanbxzHr/AHaHmOG7kAEOlPumItV0AgEmWOwa8CNUNAQ4
VGyj4gleZKYJG4AQ1ja5iEEDAhjxAWEJFORFFFIhRRRQAasNK9lB9pcETcyjMYFeIVVpHEu21KQe
JUavRhU4t4hhgfeVRHDagWgdxGRLZxDDgwHjcRxzG1AaBDgRKBYSMw23uRE8y7DwbDpTET8SnlZG
ia/eNhmuUuU9zxIqsIix3PgyvXTY2Sr93G5uqo7QJNo+ICgc/Ejsr7YyWak6stg5nY5FUiIS29AY
fboSB6ysoYcwh5ggfEcA7hBx4wjwpRRRQHEUUQgF4MKDvmFuA4MUaOIBiIxRiYAxRRQgohvcGPuF
h6B9MVtk9BWzz6DaP8GbX6g01j51M7+ljLdh9RxW917gPzNa3EDEjepqmu/buw20qrlXWsNNNii3
/KXuPMz0xFpBO4D3BeBOe9Is7aWmPbUozUqu55ErdXsW8jsP9pmm7fmOLNmYRTXhlNolPi1FXBMv
rojRmclujJhefmTozifAL8Stm3CoxkRgdQvU7jLVFTWH4/My0wtMR5HQNkADc6LpmKQoLjiUcOrF
xdW5N6D8Eye/6n6Righsqvj2Blrj87ct8q31Hpq5DV2oSt1Z4MrHF6hc/wDmWAKPcTHy/wCoHS6+
amL/AMTDyv6mDn0KB/edEVc82d5kdLqvrUOT3L/zDzGw8HHwydHZ+WM8qyv6hdRtJ9MKgmTk/VfV
MgENkMAfYTLox7Q9yuyMdV/zHTX5MzcjrnTsQfdkVKD8GeG39VzLie++w7/8xlF7WJ2zE/yZejGb
vbcn646Tjf8Azu8/+U7mTmf1GxVB9GtmnkjHZ3H3HRj8j0DK/qPktsUUKg+TzMbL+tur5A16qoP/
ACicqYtzKIY95a2R17qN53ZlWb/B1KFuTbad2WMx/JMhB4jGXqd5kXdHVtmRQ6/MJ2mUscaiPiOo
3CbI+OJLh41mRYErBJMs4HTcjMuVKk4P/MfE9D6D9PLjIAEDWfP5kmWSn9PdAoxAl1o7rTzz7TrK
bCR2Vp4ljD6YxXTjkTXwemCt99uxNVpZ1hmUY19hHBG5q4fS7T/xGE38TFRV32jZlhKR3nQ1Ne2S
HptaUVhD+4ya+jscOPeB29tw/mWbm71A1MdsoWMVe5JdqUCUsJuNS8niRUyQ9QUhShwBqIiFGgRN
5jQmHMbUoJY8S+I8wUooo+oCi0Y4EeUDGjnzGkCPMBlBEOKFVLE7ZE4l5xuVnWUQBjJFfiMy8SMc
QLKvC75VDQu+CVjvgkyHvhA7hBE7kbj3kyKT7QckhVI95J8Kqm1QdHzKN2O7ZQcDamV7rGXMTnjc
36FBUSbRl2/Y/jmWqLw66942fUeTqZqW+k2zKPjIjUQYr4ii1O1xLVF4BAaW2VbtEeJlaMnptKa2
dCUXP02zwDCbC7RsyyOp0+mqVoAdaJkb3tYRowK/6f8AMgsXtOpeaqw87lW2tx5G4FePuLtPuIoD
x4wG48KUUUUAtxd0aKAcXPzEPEY+IBCKBsxbMukPvmFvmAY++dSEPQP6RXD/ABu2ht9tqanZdXx3
xb2Gvt3xPKfo7rA6L1ynLffpjhtfE6v6g+vv1N3/AHOhe0Hy/vMZh0UvEOnw+nXZnuFX5Jl4/TuO
o2+R/wBRPLrPrTqhUiuwVg/6ZnX9f6jdvvyrNf8A5TX0bZzvVMnpfTqNmzORR+WEws7M6Tjb7c0O
R/p5nnF+Xdc27LWb+TISxl6MPndjl/UWMrAY/cw+ZTs+on/5FIP5nNhtRb95eiTyLfp0B+pssH7C
o/tILfqLqT7ByWC/C8TH3FuXpDCct1u7qGTd/wAS6w/y0rtYxPLE/wAmBuLcz6wxm0i7jG3G3FuN
Js+44PMHcW4QZEbt4jAiImZIZhBEIwfEiGPkxCL33HlSCgxRSLBSSsb4949NT3WKlaksToAT076U
/pvlZRW7MBrQjxMJtpsiri+kfT/UuqNrDxncfOuJudM+j8ts1aMus1tvR3Peuh9Bo6RgJVQoBUaJ
15mfm092YGI5+ZqnIy6ubxfo5MPA78cfeB7jmaHSsJrdDRB+Z1dChqwp5GtSqiCnLKgaB5mE22yi
EeP07sH3EGWlq7PaXaa+4bjtVMdstDx6yawdfbHXQtPxJauKAoh14/vuN7RRsU+uDJLF+zcttQB7
SvkghNSMjYvDzUqMwarSj/ibOK/eoIiFXkhQUPELzKCiMUUoAiD2w40xUgI5iEfW4DgahAcQYQgL
UfUUUigbiBDf/wDjAgMTEDBMA8RIlMBgDADR+6WALKAJA6yx5EBlgVtQZKy8wApJ1AEblqiotyRx
JsbF422v7yawBF41CB7Qq/xMfqdjeqqrzLF979xXfmPj0A/e/JklVD9Lsh2A2OZaxruxtHmWbUHY
dTMO0ffwZiNK8d6zGzaO1tiaaZClefMp5rCzfaZdo+Ku2N2kS0yfiCa53ONX5jSx6cZk58Sorglf
EnqyGU+YxT8Qe2Bo1Z4PDCWq7a7PBExANGOLGQggwNp8YWH7fMr24TLzIcbOetvu5E2sa1L1B+YW
GE9TKeYGp0r4tTqdKNzPyenheVkGVFJrqHr50NSGUKKLcUB4o0UB4oMeUP7xyOYIhyBhuPsxRQH3
H3xAJ+I4PEB4oooDiPGEW4Q+48HcUGxRRvaIGVls8eDxuLiEPxHgRDzzCQOKDoRaEKcxjzGjiAwB
HmPHMSgsQByTCaCYVFb2WKiKWY+B8zpej/SuTnFGYFVM9N+kvojExsiu+2gMy+N+8wtZnEMz+nX0
O6OmZnqVbyoInsuJSqAdo/iRY9K1oqqAAPAE0sSoeZotLZCLJsCUn5mW2MXrL6O/M0+pV/5Z1FjI
WxtfM1z7Zs3GB4HvA6jWwapx7HmaeFg+jaXtPcPiLrHbZUoRdc6lAYh7kGvMsMkiwqzWoDal0j7f
EiqtZ+7xxLyeOJX1oyVDKiXXEhtqVh4k43qLt4gYOXQyOSPElwb+0hSSJqX1KyEETBsU12/wYZOm
RvGpKsy8G/uQAkzSQybEsUUUoE+Y0MgQdTFTrHjLHlCi3FGPkQDjxhEZADeYMc+Y0AdSNvMlMjMq
oTuNv8x2kRMgmDHULe5XBMt0Vkg7gR63xqWsWrQOxEvbWfEVl4Cnt8xoPkWemNCZTXu7kc63Jmd7
m0QYS0BBs+ZRGqbYMZYUcQI4hDsJnZCgMZo+0oZ3GyBIqozaB1IMYvbaVPiNS/fYVIlylArbA5kH
x1oRmWTdsYrO5woO2CwljtgMsCuRAI4kzCAVhERgESUiCRuVUfPzLOLktS3niVysWiPEDosXqCsA
C0uK62DyDOTBI5B5lrHzHr8mTRtv24i2A/mZuR02xNlV2JZw88NruIm7jOllY2ARCuLsodDypkfg
zun6fj3g7Gj+JlZvRewMyAldSjmopNfQ9LEMpEhMBoo2xFsQHijbEW4D7i3FFAeOPMaOPMAooooC
iiihDxRooC3HgCFKp48aOPMBwNRoUUBooooUMcQ6amtsCIpYk+06/of0k9zK+TsDzoSbWIcti4d2
VaqUqTudz9OfSBVlsvPc3nQnV9J6BVRpaqhr5AnXdL6StK7Knf5k7Moqh+n+jKKq+6sDtHE6vHxh
Sg41FgUemoPj8S/29wmi07ZRCKsbPEly8urAxBZYdb4Ah6Wmsu50B5M5rNcdVzVfZFFX7QfczXtl
DVHU6cng7H8y9RYqVjRBmE9ClSV8wcK2xbCnOpGTobMhQOZH2+sAxHA8SnUhs5O9CaFfCASodBoi
WANiVweZOpgCy8xwNGHrftH7YXQkkq+IC+JIPEIBxyZm5+MHUsByJpn3kbpsGGUMHEsKWEE6E3Me
zajmYubUa7iR4Mt9PuAABMxG3sa4j7GpEh2ohSqOKL2igKKKKAoxMeCfJgP3GIsSIMRkC3G3FBPm
A5gN5hE8SM+JRGw43IwpJ0JaSvu4PiTrUi8zFVejHIILS3sIOILXIg1uVb3ZxtJQOZa3/J5lWo39
27P2y1jVs5JcSS1BoAeZQsZhsb8ya8ApsSgxZWGvYy2lgdPMkiAxCFb54lW+70xs7gTs3aNnxKtj
C0kDkQu71av5h41QUcyikuKqsWUQge06MvvrtMz7T90g+Qe0x+yTdn4i7J3OHaBkkRWW2UQPT3IK
bLIyk0DRv2i/T/iBndkXp/gzS/TgQGrAHiUZ/pQTVLTDRgn+IFRl1xAIkzjkyIwEjFZpYGWUYDfE
yzxEr8wbd3hZg+3ZE0a71bjgzhsPMOwGOpr4uYQeWgbWbhpkLwo3Ofz+juhJC6/M3cbNUjZJl8NX
fWN6Ihk86uxXrYgiQlNTvcvpdVwPaNGYGZ0WyokoCRCSwNRCXMjDsq/cvEqMNHmAootxQDHiPGBG
o8BRRRQFBJhRjqEASY4aNxsx4CjxoXtKpxFEIoDqY8YCWsPDtzLOylST/EKrjnx5mh03pGVnsBVW
e0+86/oP0iukfK5b4nb9P6SlbKtSDga4ExmWUQ5n6d+lasRBYw9S4eSRO26T03RG1AX4mj07pWht
hozoMHERdbXRmE2ZdUWB05Kah9o3LqUqPaWwgFYAgqm5rmzLQKwQdCXUASvufwJCFFalm4AnOda6
rZmd1GGxFa8MwmBCXq/UXznamo9uMP3MPcyLDr3pV8CR43a2AK1XTjzuW8FO1uZGULtVJME0dthI
l6heJI1QP8wqPFGkEte0iRe0akvtKgRJ0kA8yxXAlAj6EQ8R4UoQMbUeAojFFCqWdSLKzociZNTe
nZzN9vcTGzaOxyQOJhI1sO/1F1vkS0DMPp9va5BmvU/cJVhP7CKL2EaRRAxbgxSoLcYncaLcgRgm
O0EwGLR9iRMdmOqksIB+ZNVVsbJiSsDzDssWpIlTPpFld7Q32o3Mivu9U6XYEjxMVa8g2EsSfkwI
8rFutIYWEAfEsUMF0refmX9BlMz769NsQLyftkVvmQ0Wnw0lY7ECuwHvA7+3xHvYKCfiULr/ALvs
5MC41m/MjtT1AINPcygtLIA1ECOte1QIfiJiBAJ/Moa4/bKj+ZZt/ErWb3CPlLs/EbshgyRU3O3T
h2hFIPJjikblpU4hiuFVhUAPERQD2lvsgPWTCqjoCOBKtiHXiafpH4gmonyIGK9R3InTU2nx9+0r
2Y41yIGHZ5kRUzVtxxs8Ss9WvAgUWEDWpasrIEhZTBoKMQdy7Tew8mUgIYOoG3Tl6HHmX8bPZCJz
SufMnrvYe8K7TFzxYPul+t67V8ziKcjjhpfxc5kABbiB02R0qjJQ71zOY6r9OWqS1A4HtNjF6uFI
BbY/ialWfVZxxzIaeXPW1TlHBDD2jDiei9V6RjZil1UCzXBE4zqfTLMN9EE7lGdHjHanRGo41qEK
NuOTB/vAW4+4Go+jAKKMDJKqntbtrRmP4EATHB4mt0/6d6jnH/Lx2VR/zNxN3E+hMu0r6jqg94HH
Q1rZjpQSfwJ6R036ATvBvfazpcP6RwcZlZU2w8GNrEPMej/TmTk2r6q9ie+xPRujdAx8KpRXWC5H
J1Oiq6RSPC6P8y1j9PSs+Sf5MwtLKIU8PprMQQO1ROjwOm+moJA3J8KpNADU06wBqa5mWcQbHxQq
jYHiT1LpvEkH7YkHOzMWRaJMkUKoJYgCR33V0IXsYATCycq7OfVR7KB/uZiD6vnWZAajEOweCwmV
03H9G9kfknk7mtjUAA6Er52MarVvB0B5jSDar0XI1w3IMnxfJkqKMrHBXz7SCnddvYw5HmFbGKft
lkAyth/tlwDiBE4gg8Sft4kfpmQRd2jzJKrfugWqQJEp5lWGop2BCkFT/aBJxIyFFFFKhRRRQodc
ytmU96y1GYbExkc6SareZrYdoIHPtKnUaee4StjXFbADIro0bY4hyniW9yjmW9wHii3FuAoMcwdw
HJ4gbhqpMNa9ckwqEVkncsKgVYz2BfJkVGSLXdNHjiENblpX7iAD6/aSftMhbpytZ3Ps/wAyRF9E
gL4EKnXEVOQxMFvtPEsq21le0cyB1t0NSGwncQ3uC0ojLaMZ72A0JBlW9myo2RGw93qWcESArLPW
Uhf4ipxFrG97J8y3XSiftGjHs4EuklCFA8R9xRpQNhgKYVhgiQJ+ZWs8ydjILPMo+WUEsKBqV1ky
tO1w60mWIQVhgwowNwgsZWhbhTFYLLvxJ0Xuky0AwM1kO4LYrP4E2lx09xJ0qrUeBCac5/h7H/l3
I7OlEnZSdT2oAeJWsbW9QOVu6YB5Uyhk4gXgeZ1GUxKnQ5mNl72eIZOfsQqSNSP3l7IQnfErMmva
BHHU6j9sbRgSLZqWEulI/iGjSC+lvO9mX8a9h4YzHR5cotUeTA6HH6jYugx2PiUuoWPkOx7dg/iQ
V3ovJI1NPCzcTWnIJl0OXvxm8lT/ALSo9bKeZ6YKenZVegVB1KWb9M0sO6pt8cageeMDB1Ohy+hZ
KWlRWxHyJd6X9J2WHvyTpT4EDklBJAAJM08Do+VmEdlbDfuRO/wPp/ExwNVhmHuRN3HxlQDtUD+B
IOH6b9FuxBySdb51Oz6d0fEwkUU1Aa99TRrr4lhKwdQhUroDXEtVqTGrr/Es11mJZDqXxJ0XmDWh
+JOi6kBAahqdGDsRxMfaxK3Vd2S7j5QPDzLWOG54k6stumqdSgO5Sz+pV46EV6ew8ATLN7+kVDEc
Sni1lGJtbuYnyZhMMoXUN2SQ17b/AB8S/VXpdKJWxiJpVCYzGlR1grYAfeT3UrdUyMPIjBO60N7A
Swo1IjI6W7Uu1DeVPEsZtR7luX+8i6qoouS5VPJ0TL9PbfQB7MIU+A32zRTxMdA2PdomatDdyiFT
ARaiEeDSG5djiUvBmlqVba9EmAqXAPMvVkEcTLGwZcos41Iyhc3FuCDxH3Bs8aKKUKMY8aY/sQ30
iwEEeZg5FZqsOvYzoz4mdn0BkLa2ZJEeDd9y6mwjbWcvW7VW68Tcw7e+sH394Vc3FItkwllBsYaJ
sQVHzJiQqSKYAASvl2mtSR7CV7st+/7BLoqFqKW5JEozabzfsniXcSseoWGo9mOFUkAAyGiwo8iN
NwAso3D7zLhcMvBlW4fcTIBqsO9GG53IRxzI7MjtGgNmZRAkfgblN7nNhUDiOtj2t4PbJkXR3EiH
0mY7IktSdvElJEAmSDaQtI2biCTBMqbOYBJjkwSfaQCTuNHgmALnW5Xd+eZLbvRlJ2O5R8xq0lVp
VBkqmdjkWVbiGp3IEaSodyidJIPMCsyRfMCenxLIlRG0JJ3wLHdH75W7zHDcwqxuIID7SIPzF+oV
PMAnp7uABGPRltPc+gTAPUKVPJEL/Gq18HcBP9OV/wAyrf8ATyAcCWf8fQRDryE8wrns7ovY32oT
/aZmR0x02dGdmeq1P5AMrX5FVnIAhHFvhuPYys1TK2p2dqVWAjtGjM+7Dr7jpRIOaJZTF3NrkzWy
sNfIWZttRQ61xLAjNrb0SZYxUtvuVKgSTBxcR8m0JUvcxnd9A6KmBWHde65hz+JRD0TpFyotlz6/
E6WoBECjnUBf41Jq04kDdveeRJq6wBoCFUmvMnReYWA11S5VV+I1SiXK1GoQKVCWK6hHReZYQCAy
Vyyi8QVA1JUmCnA4j7iiiQtxx5jRxGwW4QgiOIBxACNHETCpEYjxL2Lk8gNM7xHVtGYzG126NCPa
SjmYuPldmgfE1KbkcDtP9pq6s9jyKRfSUP8AaUem3FHNT+UOppryJm59LVXrfWODw0aFnNQsFtUe
PMnwLgy695Wxb/VUqZDUWxsoq3gyLDdEeQU2dwk++JGRjBddjmHGaUULvtPEKlvELIXY4lcN2yI0
kb4MlUmVMZu5fzLKGVUoiiEUKUaPGmP7CgOoYGEYxgYGfV2MSJL0y5jtZoZNC2DREbEw0qB1/wBZ
FhYq2TzJhwJGGVPPiRX3fY3pmUTm4a+0jcrLfa9wrKHR95QxVdMgvYeGPib2Oq6DahVOyjsfZl7E
fuXXxFegZSfeVabPTeFXLORzM+1dMdS67gjiVbde8IWPYVbR8Sa11I/MpuQPEq3W2FwE4HvJAnst
O9RVr3HZ94ypvW5YUaEpo6KFifQhewgueRDEBOpH3cw2kcIKKKPAA+YJ8wnPMhZ9RpRk6Egdo7Od
SPe4DOxI4MiCbPIk6Vsx8cSRtIvMEvksHckUyDvj+pO1yLSsNeZIlv5lH1PzCWz8wNRLOBzJFt+J
mrZ+ZMtkovi2ELPzKIt/tHN2vcRoXWuC+TAfOrQfmZtl5PvKlr7JkF+/qjk/aeJTsznYH7jKrDmA
wjQM3sfJjeq3zIjGJkUZtb5jixvmQFo3fqUXFvbXmGMpwNAygbY3qbgaS5je5kqZgP7jMnvMOtty
DVexW+JGuE2U611jkwcPGtyLAta7M7npHS68OsE6aw+TKK3Qui19Pq2w3YfJmwteh4kwUb8SRQPi
NistR34luqk6k9ajQlmtQJBXTGY/EkGMw+JZUcyUCBXqpI8+ZYRSJIqSTt4kUq9CSqOZCF0YanRh
FpfENZEpkggGI8EH2jiNBGFFFMZhTx/eMI8kSCERgiPMg+4h5jRx5gEG0ZYpvatgVPMqnzGB1Jrb
OJdDi5yuAH4aWrFF9LLxoicyreJex8t6xwdiYTVdhwmajKatt6BmjmJ6la2L5EzM/J2i2qoDA8zQ
6ZkrdSAfcTDSxKXDv3wfM0Ufcwre7HuM0sO/1FUnzIyaI5jN4iWOfECBhsmVLk03EvkDUq3DzACh
u1hzL9Z37zKfgy5i2Bhr4kZLwMW4AOxHJ1Ak3G3Iu+LvEB2PMYGNuNMQbcjcrZGWtDBWB2Yz5HOh
K+ZT6mmaVR5ZtuqHonkyfAxGTH1YdsYsPXYq/E061AWYjJvTsaXcO4sgG4GfWCCQPEp41hSzXtKr
abkSpYmjJRdtJVyLu0QJPU7RqVsjI7TwNyvZczDgxUhn4MSJa3Np8aEnWoDnUVVXaBJj4lhEeo8R
8x40G3B3EYEaDtBjkxSsDNBJEJ/aRHiRTOR8yJiI7nciJ2eJdh2MFfMcDiAzhQYE5s7UmZl5LE6B
gPll3I9oK1dzbkHy0G3HLceZB3RFp2uVJECRI+6LugWls0JIt3Ep90QfUC56xMY2/mVe+Iv8Sicv
AbmQ95i75BITGgd5i75QnkbRFtmA3vIBJ5gsdRcRm8Qoe6Lug6MXvx5gS74m30LpFuY/c/21/Mn+
nuiNeBfkjSjwD7zssalalC1qAANcSBdM6fRiL/lqN/MvngwKlIk3YZQynmSrIwOYaiBZrPiTqT7S
unEsJIqUGS1tsyMDiEinfEC2hkkqjYk6vsQiQDcXbqJTuHviA6iECRGU/EI8yAg0NZCBDQ6gTCIx
gYtncinEKCPMKYypRRRRAUQPMUUzQ8UbcW4DyRGkcUip309ZU+8jxLHxHAPK7g90kD7HMwllEtq8
jJxfUHkCVcO4pZoHUhw8n0m7TykG11W9mXxvia5jaxLpqH2o0dyYGZGBkhgBuaisNCTWmYm8SC1e
JMTI2O4FKwHcehtNDu8yAHR4hlDUV+BEWMrVWdwkpMgc73H3ocyCy0J5PErZ17nHPo8sY2uly28I
hPnjcrYOW+W7L2lQJWxVsandx+6aHT0VCQBzIJqsYdwJ5O4eVX9nEnA8Q3UFDCMvHfsfmatNoYTK
vrKvxLGLZrQJk0q5cAwImZYvY8s3XhQSSAJQtv8AU2V8QicZI7dbG5QybLnt9yJFTS4yixJKmaVV
e+T7S6XYKKiV+4GXaawpGhzHQahgiNLtJ4gnzBLxu7iVCJ5jd0EncbcIRPEjJMk9oB5gNuNvmL3g
kgQaEzyGxuIzvIydmAxJMdIgsB2CjfxIDyLBUvMybbTax1Dybzd3efiBiVd2y3H8yTIiWtt70Zcp
4A3CZdQfERI+SNmLZgbj7nc4xx4AcjxEXJ8wot/mLn5ke+Y4PECXZi7jIu7mLuMCbuEbuEhLRd0K
m7uIi0g7jF3Sg+6MW5Mj3FGkOIzRR0RnbSjZhSA4m/8ATnRjl2+peNVLzo+8vdA+nu4i7LXjXCzr
sXFWpQtY0BMZkBTQqIFRe1RLePTsmT1UH8S5RSF3sSCGrHPHEtLjr8SZBDB/EogGOv4jnGGuBzJx
5hgQKIoYGGqMONS72xBRCoVXiSIupL2D4Eft/EIjI8RwDDIjiEB3FYS2bOo5Xcbs1IqdDJFMrA6h
o4lFiCPMcciOPMgJd6hKdwtcQCYBwhItw1O5FgcUUUoUaNEfEB+4fMbuG+IMQ8wJNxbgx5j5DFog
8Exak0J6rNGSs3cJT7tSRX/MdViVzFsNbjnU38e4Mo59pzKsJfxsns1szC0NkS6Du2IBMq1ZKsvm
F6gY8GYT4ZQK47kAUnxJXkCXju1uY7ZQnrPaeYN2UqOEB2xlF7rGygB+yWhSttiMRyJdqJ62tYA+
JaOP2rxJKq9DmTEcSDPcdvElw7FV/uPmBkKd7lVdhoG8rA+IXdocyhXeQBzHuygELeSIE95UzNys
paNEnzBTN9du0AiDfi+uRv2gO5N9YI8GHTQQutSeinsQCTa1AgSvRHEsINCR+/mGDx5lhEm424O4
x5gPuMWO4oPvAPui3I4twJGOhI2fXiM78SpdawbQhVnvkNj86lbdjHgyUg65hDFtw0/MjPHiRPf2
+dQxWL7ewADzKVrs6Eb8wGu9RpZqoPbzDJTxqmNhJB1LnboyXtC+JG/mY6APIWMmaQ2TKIR8h7i3
GinY5D7jjxBhDgQHEROo24jzCn3ETAjGAW424PdFuAYMW4O425lAffzHB+IwGzNbpXRb821dAqnn
eoVSxMa3IsCoCSTrgTuug/Ta0ILbz3Ofb4mn0fotOCilQC/uTNqpJhMitRToaA0B7S5VSBzJFQD4
kyjiQJFAHiSiCsIQCXzDUwFHMkAhdn94Q8wfeGBzKgwNw1EQ8QhAcRaiEcQF2xwBHj6hCHiMQI8U
AGXiQniWtQHQGFClu5PWdymVIPEmqciFXd8QIlbYi3IG3zJFaRx98yCbcR8QAwj9wlDxHxB7oJMB
yYu6DFAPvi74EUAtgxdwgRSBydx1bUGKUShvzDS7t95XiEx0u2hXkn5lynK7FJY8TGVpaRg1ZU+D
MZqziWvVmLYhK88cESpjo5sZnPvIsBBWCoPE0daWa5q2bOutyepwGEpluYQb3mMwu2zU25NuZ+Na
O0bln1lHvIJCoPnRlDICqxIHiSNk/fqZvUVvufVTAL77hUt2V6de/EiwbHuDB9+fEkqr+xQ4BPvL
dKKPbUgarGUN3KNS0qBY6ARMdTKEIsdxtmAWjEwDjgyLcQMosA7igKeIj+ZAooBPMQlBnxIy3zEz
cSFtsPMgVtnsPMjVe47MAoxfZ8SzwogMEAEr5Nwr14gZWV2/asot32eQTAlOUX2FMhdHsO4dVADb
IH+0sBZIA4uPyO6aGwo1KyN2mEbJUExkZgs8jL/EIMkASJzuMWJjb5lNvkOKKMZ1uUW4twRGLSqP
cW4HdF3fExB7iPiBuN3QBO4o5MQG5Q3MOtGsYKo2THVC7BVBJPtOw+m/p7bLfd/YSbVB9P8A081j
C3JXQ9gfedthYq0qqooUD2EmoxxWoCjWpYRNQDUe0nUakQOjJVgGJIJGJIPEkgoYgQlgSJDgJDgE
sMeYKiGPMCRYUEQtyhRxGjrAOI+Io/tCEIohFAfcUaPAisWR8jxLJgFBqDZksI4PiTBwZUIIMNGO
4WJWY8AGHIpGMTHaCfBgINCDSI+eIQkEkUYR5Q0eKKAJMbuija5gEDETGigPuLugkyPu58wJ9w1f
Q8yv38Rd5jS7X6Lu3jcvU379+JiBiJLVcVPmYTVnFm+CDzBsOhKCX8DZkr2F6yB5muas4lZqv9tx
VXvZkMm+BM7FV0tct7+Jr4IXZPvMNKnWonzJBXqTqvG42pNLtEBDQ6MYjmMPMCyrRmkSvox+7csB
HzFGY7i9jKGi3FAbgmQSBte8Rf8AMg74LMYNpi+jG9T8ys9h3HrDE+8G1guTDXxI1X5issVFJ3Cb
PZYFlK/I2e1SdyK/J77NIY1VTtZs+IXZlpex9seJZSsKNakqJoR2ECu24IYyRxIfBlRJuMYAPMff
MgTGRniSNI2lQiYMUaEfIu4twYxM6nMOM3mLeo25Qotxid+I2/mRRRt8xjuOPEoRMkprZ2AUEk+w
lrpeBdnXBa0Yrvk64E9C6P0LHxEQsvc4HO/mJVn/AE90JaQLMisM35E6qisJwBofiGF0PEJRzMRI
sOCIUoUkQyOEp5ECYSRWGpEsKBMIQgIeIYgOJIkjHmSIIEqw1giEsAo4MaKEGDCBkYhiFHuIGDHH
mEFHjQoDxRo8BRRRQIHU90YcGT6gFYABtGTK+5C41BB5kZbWyd+IJkatxC3uNAT5McNG1EY0C7ou
/mAI8glDR98SLcRaUHuNuB3ai3uAXfF3bgxjARO4JjMYJPMAtmLZjAxbgHuOGPEi7o4aBcrs+TLK
XfmZqtDDzGYZxLZrsBA5limwowKmYlVxBl7GyQHHd8zXaGcS6HHv710fIkwPBmdTcra7ZcrbYmKi
PkxRjHkAkkRd0ZvMaRUu4tyLujbhRk8wXI1BLSNiTKBJ5hAkwPJktQ1yZEMtbeSJKCFgXXqnH4lS
3JHtIifIyVRfzKoc38SFgbDuWcersOxAjGL92+ZdrXtUajqfmSbGpQJPEAtox2PmAYCbmQWA+0l3
Gs12mBXJMYMYxgk8wiXexGY8QNxiZUPFFFCvkONFFOuHMZjFETGlDiIxbi8zFRCbHQ+jXdQvU9pW
oeSRJ/p/obZVqvepCCegYlCUIErXSj2lXSLp+DThVBKlAPuZooBAAhr5glJ7R4248iDWFIgOYYhR
Rx5jRwOYEqmH5gqslVIDIpkyiOiyUKIDIsmCgCCvEOQKOPMaOPMAoowPMRlQQ/EKAPEfulBBo/d8
QNxSCUHmHIQZKp2IBRCNFAKIwd/mL+8KLiLiDuPuVNI7ZFJbIEmlCDDVoOooE24vaRAmED8wohE3
HiOIm8yANxAxj5iMB+6LcDcfcA9xieIHdBLQEzAwQY0RgFsRu6DFALui7oG4twD7ou6BuLcCZXky
WlSDKghd0mmUS38HKB1NylgVBE4um3sO5r4XUWXQJ4mFoZ7dFsbhe0qY9pt53xLXtNTIJ8wGPxCJ
EjbxIG7uYg0AtqOOfEKdvxEoJ8wtcRE6hD9oHMjuuWsaJEivySnAkFiG0AmQPfZ6h2shFTsfHEmx
q9N2mXFrAECBECgCEOITDUGAavzzD7hIY4OoEpIgbjBo2+ZQj5kbGGZG0QBIkRG4bRhKkoj5ijt5
jSIUUUUD5F3ETGje87WgovMUdQWOhICVSzBQCdzp+h9A9TttuBC/B95c+nehBUW3JXkjYE6uupUA
CjgeICxaUqQKg0BLQA1IgNSUQpxCEYRDzCJNwgYMIDmAQkiLsxlTcsImpFMiSZKhvcdFkkB1UfEI
LGEIeYDgahCNEIQcfcHcRMAtxweZHCHmRUkUGKVBa/MQ2PeDFAPcfuEj3FuFSgyZDxKymSK2oRPG
bxI++OG3AIeYUEHmFuVTai3GjyGyJ/EE6+I8YyhjBMcwSJAxMcNEfEjJ5gTqRCYiQBo4YSA4x8R4
x8QIyTuNswT5MUBzzFG3FuFPuNuCTG3AKNuNBIgJjF3GMTB95QXdF3Ro0gLujhvzAigS92pYpvKk
cyp3DUXdIsWdBh9Qeo8czax+oraujw04lLSp4MuY2We7ncwtDOsuw7wYzEmZ/T8pbF7S3I+ZeJ4m
qYZEqbbnxJtKsgNoUShk9Q7XIEi7aj3qg5lJsr1be0e0gpvN6nu4+JNj4+re7cAHqey3WjqXlr7a
gPiHpR/MW5BWYdrAyzW+xqQ3LBrOoFlxxuQyTu2sjYiA0YmCeT5ilD90QJja/MXiNBMeYBMInZgG
IWDHzBMTeYLH2hCPEAx40MZMfEHZhHxBlHyRGjwqamtcKgJJ+J2OeDVo1jhUG2Pidj9OdF9FVtyF
BbyNyToHQ1pUW5Cgv7Tpa6wANDiYqkQcDUmWCgkqShoYjxQp44iHiGg5gJQSZOiHUSrLCjiQNWpk
uoyjmHIEm/eSQV8wh5lQQhaMZfMOFKKKKUKKKKRCEfcaNIC7o/dBigHuLcGKAe4geYEQlEm+Y/dz
A3FuBNHBkO4gYE4aEG5kAMdT90Ksbi3GEUIcsPjmNuMTBMqnJ3G3AJ5j7/MgTeIENvECA0W/zEYE
CdW4jnxK4YiGG4kCiiigMYJ88Q5GfMBRRRbgPBJj7gN5iQxjbjnxGlXZbMWzFFAEtzF3GA3mKRiP
Zi3A3G7vwYVJuEj6Mh7j8RBuZF21MbIO+Gmgua4AHcTOeVyp2NyVL235Mk1ZxZ0uPc9xPMkOIXO2
Ex8HM9GwMeROlovSxBo+ZqmulidoaKQo0PaW04PmBog8Qxvcw0yhJuIGBzEDKuxvzInXXMkEZ+RI
m0IPPmEDsSFvMJTAP+8aKKEKLcaKU2RMGOYDe/MMokmgN5j8f3kbGAiY0YmIGEOYO47eIBBkHyji
4z5FgWvkzt+g9GTFrD2Ddn5gdF6QMUAuo7vmdAi6UCdjng6rzxJl8QFUyUDiY6ZHrhCCviEBKg1M
MDcBRzLFYlCFepKq6EcQh4kBDxJUkK+ZKkIliBiigFCUwI4gShoYkKyYQHiiigKKKKALeYliaJZA
UUUUBRRRShRDzFEPMB4xOo8FoUgdwgZHEDqBJ3cw0PMh94awLQMfe5ADDBkQ5gk8xHkxjKpCKNFA
eKKKAjAIhxjAjYQO/XmSmQWD7jIJlfYhbldTqGrbMCaA3mEDxBPmALGATE0EmFFuItuREncfcqCJ
jEwd6ggyA4o2xESNeZVgBPMYkxj5jQgtmPuAYo0D3GggxbgH7Rd0DcbcgsC3WtTRw+oNWV2fExu6
P3zGY2sS7rCz0uAB/cZeVgRsTgqMpk0VJBE2um9Ubu1YdgzVNWyJdCTEpkKXLYNr7yQHUjLYy4iL
jUjimKBPME8QjAaVRbjb/Mi3FsyIl7ou6R7MWzAIvBJjRSrsoxG4txE8QbRxRQW8SA43Ej3r3i7v
zCPJFki7ggcyVRxOpohKkKMviEPMqkoBkqLEiyVQNSBlWSgag+8NeTKCEKNHBgGviGsBfENYJSLC
gKYcIUeNHgEsPcBYUCQR4C+IcBRRRQGijxQFFFFAUUUUgUUUUoUFvMKNxAGIeY51EBAfjceDH3AI
GOGkez8Rv7SCbu/MRaQbjgiVUvdF3GCDuKQH3GPswRFKJNxjB3G3AcyN4e4LGBEYPvCPmAf3GQTK
3zD3xK58RgfzAlaRnxDgHxAAGKMPEeEKKKKFM3iBC3BgPsRifiNuDuFIsY3dGbiB3cyiUkxtmCW+
I3cfiESbjbMDZi3APcW4IiJkEiuRJa79MCOJV3EDJrauhwepMgAJ4m/i5IuA0edThK3I8GanT85q
iNMdfEwmrKJdipEbfMo4mYtiLzyZdDbE1TGmceTGCYRgmFRnzG3HPmDIh9xtxGMTKETFuNv5gk6h
R7jE8QO4RAyB4j4iiMCIxRGKVH//2Q==
------=_Part_299660_626046436.1715647727404--
