Return-Path: <jailhouse-dev+bncBCKO35F6UENRBKFC37ZAKGQE7WXMKTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA69171DEC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Feb 2020 15:24:42 +0100 (CET)
Received: by mail-ot1-x338.google.com with SMTP id d16sf1692736otf.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Feb 2020 06:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WJarDC43ijU1hpA2xz9cA6Rxm0BGiPXmVTzv9MseAJ0=;
        b=bxynduJCyKPkyCTNvUpfgNkbch/J564dXEqrUIjB1OywAGY1Pbn/lkHlrh7cXwSfKT
         gMIEm0fronkhj9owyUPK3+IBvHyoEQhxDXRMSi0EdQtIi/9KQmOPZiAV6CPOIPUNRvuE
         gsNuMPueqQNPV0Tqggj1AlzG3Fmgc8T6Qwr3sMzFCxsaNakSL5nMWr4PowYJ12zm9xnY
         Kj9DmdPgaYqY4feoOWVGUepgq7mGEk3DyvJtat2zBHKZJYRR9q8xpad9aT6FIm4IkBC1
         dXPCsOoMHN4pOt7zDwq3OjcJw0U3t9NeMnkdmEmGs92Qsd1XJ1JxFieTn1qLysojdAZE
         No/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WJarDC43ijU1hpA2xz9cA6Rxm0BGiPXmVTzv9MseAJ0=;
        b=p1K88mpuRff0dK1Tp2RSAGRbTZA5rE8mSfp7BH3AIvhNmwgbEWWCtXTnS0PoRALtVy
         yru6Dao/QrBcKiZiZwEFpA5pGzH3A2CQfneI64r1QQ6U1ba7pEbdXNyJDaNGtLg5uxcx
         j4Za4s8lp5rQJGVWTGm2kbQGvSQ7HkravCENJyux00IUzxP/vVo0676SiZj7xGXWnrjt
         a6Lt/9EYvTHdhzE9xC+eu00zDkejIsniApL+pRw/kWbPPOEoj4LIlDkIYq+WTcu+yJ6h
         SCeqEK6gJrma5jXB3RIlFt6ONGv8AWSOpdamkVKKEDb30hF+lgDVpVAIkCyg1J3mg0Hv
         Ob1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WJarDC43ijU1hpA2xz9cA6Rxm0BGiPXmVTzv9MseAJ0=;
        b=eTeWdBiV0Fm/nTH08nD4SuL18RkfiqRmgruDwNjWwsVJWmFGWrLOEATvlj+c7UuvVE
         0y9cjgcIQ3SYxucNmZybk/l60BlgMlFXFneYCS57drAIhu20vuUMzqel51RcbDfIdgf5
         EYp5fEbHX7vRNGvKsLCmeIIzddfp44+4/w1Pz4LVnB0My9M6XTYkD5xVl/qoiBUvy0m/
         uVSqwnbjPM19FP8bgCzTTi0D18TiAH9ZK2mQAb41A4qLRX2gMThwCBR1U+pHISU3vbNM
         fPNRv2rnHTXwkFi97aJCjQSAIhsIeSHGx34Jmze/5P7vz4AmykF0Kst9IYGsXtiKUZu8
         EViQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWba/16jXHeqhLIIlEA3VKVVTgr3//+eu2+BS7/esR7gw6oRdSk
	RA0yUlpCnMPqJ10RPlMuIdk=
X-Google-Smtp-Source: APXvYqwLLTTr06hSgpmfhGFhpRYpm2JyTftVHyjrHZh8pShGnKD4Gb0a/y1wd7PSqzcH3xOVbgMotw==
X-Received: by 2002:a05:6808:a83:: with SMTP id q3mr3670113oij.0.1582813480609;
        Thu, 27 Feb 2020 06:24:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:aa8e:: with SMTP id t136ls326894oie.0.gmail; Thu, 27 Feb
 2020 06:24:40 -0800 (PST)
X-Received: by 2002:aca:e146:: with SMTP id y67mr3336614oig.93.1582813479744;
        Thu, 27 Feb 2020 06:24:39 -0800 (PST)
Date: Thu, 27 Feb 2020 06:24:38 -0800 (PST)
From: raymanfx@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <c0402eef-a0c8-40a7-b021-ba0f9f8422df@googlegroups.com>
In-Reply-To: <f2ea45c4-1c22-77cc-a6dc-831aa1e27a3c@oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
 <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
 <12bf6841-413e-58e3-e7ba-0c7a1557bb48@siemens.com>
 <08841e36-df70-50e8-8094-426d72fead52@oth-regensburg.de>
 <36fc6114-d1b6-da9f-f2b6-b76c1f33b7ed@siemens.com>
 <6de58d25-f1d9-b0ea-b0d8-631250e5ddeb@oth-regensburg.de>
 <baa5bc4f-74c4-c60e-0283-a8dcef07b8bf@siemens.com>
 <f2ea45c4-1c22-77cc-a6dc-831aa1e27a3c@oth-regensburg.de>
Subject: Re: AMD: non-root linux inmates
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2546_953648651.1582813479043"
X-Original-Sender: raymanfx@gmail.com
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

------=_Part_2546_953648651.1582813479043
Content-Type: multipart/alternative; 
	boundary="----=_Part_2547_1021130818.1582813479043"

------=_Part_2547_1021130818.1582813479043
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'd just like to add that I am experiencing the exact same issue as 
described by Ralf on an AMD EPYC 7351P.
The stacktrace is the same as well:

FATAL: Setting invalid LVT delivery mode (reg 35, value 00000700

However, on my side I cannot get past this by just handing over the xAPIC 
enabled; I get the same trace..
I added the printk's from Ralf's diff and get the same output:
...
Before disabling: 10000 
After disabling: 0 
After reenabling: 0 
...

I presume that by "hand over the xAPIC enabled" you mean disabling the 
write to APIC_REG_SVR? That's what I did but it did not do the trick 
unfortunately.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c0402eef-a0c8-40a7-b021-ba0f9f8422df%40googlegroups.com.

------=_Part_2547_1021130818.1582813479043
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I&#39;d just like to=
 add that I am experiencing the exact same issue as described by Ralf on an=
 AMD EPYC 7351P.</div><div>The stacktrace is the same as well:</div><div><b=
r></div><div> FATAL: Setting invalid LVT delivery mode (reg 35, value
00000700</div><div><br></div><div>However, on my side I cannot get past thi=
s by just handing over the xAPIC enabled; I get the same trace..</div><div>=
I added the printk&#39;s from Ralf&#39;s diff and get the same output:</div=
><div>...</div><div>Before disabling: 10000
<br>After disabling: 0
<br>After reenabling: 0 <br></div><div>...</div><div><br></div><div>I presu=
me that by &quot;hand over the xAPIC enabled&quot; you mean disabling the w=
rite to APIC_REG_SVR? That&#39;s what I did but it did not do the trick unf=
ortunately.<br>
</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/c0402eef-a0c8-40a7-b021-ba0f9f8422df%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/c0402eef-a0c8-40a7-b021-ba0f9f8422df%40googlegroups.com<=
/a>.<br />

------=_Part_2547_1021130818.1582813479043--

------=_Part_2546_953648651.1582813479043--
