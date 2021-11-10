Return-Path: <jailhouse-dev+bncBC653PXTYYERBV7VV6GAMGQE5NY4YBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB6744C59C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 18:01:13 +0100 (CET)
Received: by mail-qt1-x83c.google.com with SMTP id 100-20020aed30ed000000b002a6b3dc6465sf2412603qtf.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 09:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=htXOSUa4uRXssrzjj7AtvZhriq0av9peeB0xhEP1ZoA=;
        b=BOhI5/JcZ4M6cXloQ4fZ4hhEVHgpXJQ3azvlI12ubDeq4EtOKnBUlJEcdTIr0OOgbt
         foeHJTDiaIcdHI3xrWTDFj1HZq84V59FnWGLA8cZRf/PfnQpIsuzOB6sHTZDKilXOHF0
         7KbHe/Z613VDW6ANHsE0+TzwU1Zf79NYNtDXSG7OMjxv13Qh+gQAwZ9mYpGH2vIiuVnn
         MrUNuuvl1f3H4iF3ImGtuf6xUDkoNf+SVvV22GG7ty95WulWm4hdbNUKM8V27uSN6S2b
         K0axyLEtMGmIvoM3kxkrwvxGhnMA9xsoF+EJ2EmVQOf8kKu27KeDoMzZORxoAwbcP+Dv
         sBmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=htXOSUa4uRXssrzjj7AtvZhriq0av9peeB0xhEP1ZoA=;
        b=kYJuIMOjHHeKX1l+Upi0+hdWl9B/+Jv1mVZ65h8W5zEl6YlQppB7zjr6HSiePtbLLV
         FmHM+FeNBW9VhX/jnmsCDmSn/EndPR8dRsCM6/6eGYKWwM5PtfVWMuP3YxBIeazCc0+2
         M7NzQ78HDq2PuZYXS5Vi2XcdsisHSFDwnhhiFQtvx/SslkBooMNyQ4eJEu8QodlyPX5J
         FqQADt9IiBjrf9xqIwzGDHC+4lraql6U4CXdEHWP818Ou20YJZKy7U8gDKWKv/PQZudF
         XG+yzYFYMxZ8jftuV5QZoEa9jA6TX+TjaVRt6m+/HeA01JcKUrv/Ak7HIvftlAzG7Bay
         eHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=htXOSUa4uRXssrzjj7AtvZhriq0av9peeB0xhEP1ZoA=;
        b=7lWTZT7SNCoBlBlsKOVv/Dv+d9Y4Vnb4CgtUrb2JtgrefDRvUkfjXl1vTLTzzEacmH
         BE0yk81R0nrNQ+baMSfJurzzyRpEvmKprGD+WamKheFsEozwl9VusP8ez2naKo2dCSiS
         Kb3JfyC7FtJtk7noAHSlorSXIlz+5X2u/CfZytsDNyemoieAtI+qy4PYl7B+vVzGWAvh
         NKmez3whtVygnPyeQ8kTeoqg02A1iD40F5MI/1cOVf6aReZukCQ6ifwBkLs6EfewtcJB
         Ioi0v1018tNDPW0yTPlsxtT/YILfI3Pl8V2SOUmZ4XAAQd5Bgn7zpqXxxeh3SzKsjtDW
         5fNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530S6IxHJt3FtoClYnyeBYTQHgCshSfu6b2IhpCnRhxXZk9Oo74v
	jOO5U1Mz1IeBcRw9oC8M2Zc=
X-Google-Smtp-Source: ABdhPJxH8Q1ur6iNuFv0jCs7+pSO3oHLM9etBE8t2khIN5kLg6bVDYGSOuNSYFU7TMjQY2NE90ywZA==
X-Received: by 2002:a05:622a:11c4:: with SMTP id n4mr542177qtk.56.1636563671945;
        Wed, 10 Nov 2021 09:01:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4a04:: with SMTP id x4ls286940qtq.1.gmail; Wed, 10 Nov
 2021 09:01:11 -0800 (PST)
X-Received: by 2002:ac8:5c0e:: with SMTP id i14mr511271qti.260.1636563670973;
        Wed, 10 Nov 2021 09:01:10 -0800 (PST)
Date: Wed, 10 Nov 2021 09:01:10 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
In-Reply-To: <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
Subject: Re: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7484_2000058115.1636563670451"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_7484_2000058115.1636563670451
Content-Type: multipart/alternative; 
	boundary="----=_Part_7485_1695792300.1636563670451"

------=_Part_7485_1695792300.1636563670451
Content-Type: text/plain; charset="UTF-8"

So, I had a 5.3 kernel without PCI in the device tree, I upgraded to 5.4 
and the PCI devices are listed. However, Jailhouse is adding on the 
terminal two PCI devices, but there is no effect and the virtual PCIs are 
not listed. 

My question is, what does Jailhouse requires to be able to add virtual PCI 
devices?

Thanks in advance, 
Best regards,
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/238dd0b3-af24-4b8a-905e-579fdebe8b0an%40googlegroups.com.

------=_Part_7485_1695792300.1636563670451
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So, I had a 5.3 kernel without PCI in the device tree, I upgraded to 5.4 an=
d the PCI devices are listed. However, Jailhouse is adding on the terminal =
two PCI devices, but there is no effect and the virtual PCIs are not listed=
.&nbsp;<br><br>My question is, what does Jailhouse requires to be able to a=
dd virtual PCI devices?<div><br></div><div>Thanks in advance,&nbsp;<br>Best=
 regards,</div><div>Moustafa Noufale</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/238dd0b3-af24-4b8a-905e-579fdebe8b0an%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/238dd0b3-af24-4b8a-905e-579fdebe8b0an%40googlegroups.co=
m</a>.<br />

------=_Part_7485_1695792300.1636563670451--

------=_Part_7484_2000058115.1636563670451--
