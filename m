Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBXPHTXUAKGQEOSEYHAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E1B4802E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 13:05:01 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id v15sf1483184wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 04:05:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560769501; cv=pass;
        d=google.com; s=arc-20160816;
        b=ykU2j0x5CAHSxyOfLpxfnYyE97aEN2xsmzapnewUsT93T8RyvgA5hWzkTS2ZW1Ebqw
         Kh6Zq6gFk2o7rK3iwsHWYJbRCQ/J7ZF/X4fVUbhzbD1C6kmmlGvmyq3zODSm4BpmGq8z
         Es9L1x+lo/iNnTfiCdWnkFz5styj3Rk38/Qc57/bHYqvcfNLH03H2NCxedgE2+IRuyHC
         otUQjeCx6pwz6vEbkhX5vP2LlSFDoRnhdLMBzl6fhszEpV4PFUf2FyUuenoeWoUXEvBb
         X4AKshoe0ViNP49qey5NZL/pEcpHWlzOvfjsVV8pLbD4K9Jao1+iDyHgBP4lyKgqE0Ua
         uuPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=Qt+s7WG+RYobEu0UycFWRPVa0BcPxNwpEFvs1Y4je8A=;
        b=dJkwhg9VrtB3G2tWGDcc0RxWu2KdTHMke/S790I3WesiXhumLZmZsWiybZe3GA82J3
         qcWAsGCdGpSt+21EMeu5LPmctZ1cYie/jsUOObuuOc0Asx7+MsJUaiYD1Bk3QgMV07F/
         Euoh0Hqoq52GLQ2z8uZT/6jZYzT67E1cjtFp6tVrAQ6FCZGR1oPnAqnG6sk2NjXiEB28
         WRwJ19zmt5zY60WqHMVD4XlNHxYJ6rB+YEdbJ+kMsIZNIUw8wDlF5/WBw7CRNVb43Qqz
         ZaDuaJrlOm5/HWdCTibDaNMSFBE6sB9dz+IDYh/ZECcvdxwLgjF1PwdQbHvp0cqZiIRZ
         rn9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=nwsews3i;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Qt+s7WG+RYobEu0UycFWRPVa0BcPxNwpEFvs1Y4je8A=;
        b=JObjgrKk0U5gxhaeGcCqAgL02H7L+23u/BWMxByBhf5X30ZEYwitmDJzo7eswmhCD1
         /yQ8rULAlsaq1Dz6jGTp7groMbbsQiwaT2G55zMXtwHlTLC5X9+CUlSDJbqXbLtiVyRV
         ulSlF0U2RI3ImW9ag19+uWBqyC9QMsPA3UI0zAFST9gDD5TU+AvHKA+FZjoLfnX7gWL3
         N1A9UMqqVd4KHgTetbwKzC4vkxJKsiphT9cpVjpw2+kojDj81I/cXxxipaTF03d1QsvU
         5h1FbVEOEQXq8apBHYFyIntAzNKI5yumHfedQctk33djjZen1ZFagxI8ROJosSBcX+dj
         K2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Qt+s7WG+RYobEu0UycFWRPVa0BcPxNwpEFvs1Y4je8A=;
        b=F0zYgWza7JxxjcRHBTuMvAHwsmHIyXvu81ONd//KJwuQXOnb7IHKL3ei+dkmZgyBdL
         Q4PGpqqjEX0VsHHw9HcI7sHCUR0jJQhv5NFe4LFxkwHvU1VroDVGRaUN/C5KGd6M0QyY
         TNlf4LoYpK4DjnViORp+gQJct6ILKyFb1PNvcMwl0/Uak+Fnlj2FQ9j3e4izFs34LUVH
         5w/SsPo1t6mNM+AH6126ltLYuMTPoyLj0BVT8YPMXhxwxDokZCj7HRvpJ0GnnmAODLJ5
         kPuXaeWsKyvsPe7lZDuSX88Ih69elXbBkhhJSP2k4USR62D6hJq6EbcL7q/Skd7UqPvF
         msvQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUCzqn6vrvfnCC8KmL0IAnJDJUtbokJjD3SpUDAHPGSYMaMRFuU
	/R3je3w7iCNVxaBtdvWZy/4=
X-Google-Smtp-Source: APXvYqxcDqmhOUkKBq3C3xamafrx58q1CA9iyw1P9b47AVGDmP/66i2R6U2nKt6e+oy4PXwtujRd4A==
X-Received: by 2002:a5d:4e4d:: with SMTP id r13mr14601245wrt.295.1560769501544;
        Mon, 17 Jun 2019 04:05:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:2295:: with SMTP id 21ls105445wmf.2.gmail; Mon, 17
 Jun 2019 04:05:01 -0700 (PDT)
X-Received: by 2002:a1c:4041:: with SMTP id n62mr18920136wma.100.1560769501125;
        Mon, 17 Jun 2019 04:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560769501; cv=none;
        d=google.com; s=arc-20160816;
        b=AlH0VJStsJhOV2WwG0ZKJqppACZbu4X6PQK26DoC30xApvRyh5Bcqpz/D9ZUilyCHR
         jTAGLcM4Sq3iQj9fU3NdvI7HyyGsiYimSFXrvXE1Cj/Om5ZUU53nJDHIjP+JjVl9qIfT
         7r6zlGLI+QCoHz6rrREnSLIOW3PQs0HqVSPg4qfMXP0kjmusnlTF6YidI0B6Cl68NTgZ
         FjcrNO3lUXFZo0i2qI/rRREM/qTBdBNAbQay+eUKaKr2dyTfnWVS7snh7Ko40n1SfLIS
         PMVic5rncxQF3CXpThsLmmCfl30sp9JypjEqYR42miR+XMiF1A5CZ8Xue0RBIRgg6kqR
         m/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=TUFjNzbmWHtH9zBeY4x0iP3jbN9/7FYh3OUP3HxaOaE=;
        b=ZcqXMZ/MWLUqPfPf4H4gEtlekXQT82yV1s14lTenI3wcyH3IBYg37uzflUbHmaLros
         S+pfmE2DMVFdCN90cI+xXiwDR5eqmnCGL8f56LE3gIECTpXu51Nb767M1aBWYdQgxpW0
         kZuXBcinL7ogoROwEPlR/sB9H1IG4d73CD4a3bfAp6aSNZlmhvWuJ1Nrqr0Ia93of84d
         +AcaPFfzQtIkMUCv3DqcRiEyWleXgCtAog1C2YGWR9Rhaj/Pug6ZLFnw8A120s4AMJ7r
         eoNuZf+rG5nGaYvxKmhzZZsHwz7bNgQnQcPFlIPhY4WvJzFJm4yVnyQXy1u1RSGE7OT+
         f9Fw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=nwsews3i;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id j18si464039wrc.1.2019.06.17.04.05.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 04:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45S7f45Dt1zyF1;
	Mon, 17 Jun 2019 13:05:00 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 17 Jun
 2019 13:05:00 +0200
Subject: Re: [PATCH] x86: amd: fix comment in MSR bitmap
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>,
	Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
References: <20190510131037.18590-1-ralf.ramsauer@oth-regensburg.de>
 <536d98a0-cb55-1726-3ff3-d7de6d5cea46@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <a619821a-ff26-d13e-ab57-2511b839ab00@oth-regensburg.de>
Date: Mon, 17 Jun 2019 13:05:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <536d98a0-cb55-1726-3ff3-d7de6d5cea46@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=nwsews3i;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 5/12/19 9:44 AM, Jan Kiszka wrote:
> On 10.05.19 15:10, Ralf Ramsauer wrote:
>> Writes to MSR 0x803 are intercepted, and not reads (as the comment
>> stated).
>>
>> The correctness of the rest of the list was checked with a short helper
>> tool.
>>
>> There's also a read-intercepted area that can be zipped.
>>
>> No functional change.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>> =C2=A0 hypervisor/arch/x86/svm.c | 9 ++-------
>> =C2=A0 1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
>> index 9c3e971b..60d236be 100644
>> --- a/hypervisor/arch/x86/svm.c
>> +++ b/hypervisor/arch/x86/svm.c
>> @@ -64,16 +64,11 @@ static u8 __attribute__((aligned(PAGE_SIZE)))
>> msrpm[][0x2000/4] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x2fc/4 .=
..=C2=A0 0x2ff/4 ] =3D 0x80, /* 0x2ff (w) */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x300/4 .=
..=C2=A0 0x7ff/4 ] =3D 0,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* x2APIC MSRs - =
emulated if not present */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x800/4 ...=C2=A0 0x=
803/4 ] =3D 0x90, /* 0x802 (r), 0x803 (r) */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x800/4 ...=C2=A0 0x=
803/4 ] =3D 0x90, /* 0x802 (r), 0x803 (w) */
>=20
> Then we rather have a bug here: 0x802 and 0x803 are both read-only
> registers. We
> actually want to intercept 0x803 reads, in order to map them on xAPIC
> reads. And
> writes just simple be allowed as they will cause #GP then.

Doesn't make any difference. All things still behave as before.

In addition to s/0x90/0x50/, I instrumented all x2apic msr read/write
handlers. Turns out that we never hit the erroneous 0x803 case: Linux
won't use MSR access, as it (of course) doesn't see an x2apic. AMDs
don't have x2apics. So the bug never appeared in the root-cell.

Only non-root inmates use the emulated x2apic interface. But demo
inmates never issue 0x803.

Nevertheless, the bitmap should of course be fixed.

  Ralf

>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x804/4 .=
..=C2=A0 0x807/4 ] =3D 0,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x808/4 .=
..=C2=A0 0x80b/4 ] =3D 0x93, /* 0x808 (rw), 0x80a (r),
>> 0x80b (w) */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x80c/4 .=
..=C2=A0 0x80f/4 ] =3D 0xc8, /* 0x80d (w), 0x80f (rw) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x810/4 ...=C2=A0 0x=
813/4 ] =3D 0x55, /* 0x810 - 0x813 (r) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x814/4 ...=C2=A0 0x=
817/4 ] =3D 0x55, /* 0x814 - 0x817 (r) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x818/4 ...=C2=A0 0x=
81b/4 ] =3D 0x55, /* 0x818 - 0x81b (r) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x81c/4 ...=C2=A0 0x=
81f/4 ] =3D 0x55, /* 0x81c - 0x81f (r) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x820/4 ...=C2=A0 0x=
823/4 ] =3D 0x55, /* 0x820 - 0x823 (r) */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x824/4 ...=C2=A0 0x=
827/4 ] =3D 0x55, /* 0x823 - 0x827 (r) */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x810/4 ...=C2=A0 0x=
827/4 ] =3D 0x55, /* 0x810 - 0x827 (r) */
>=20
> That looks good.
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x828/4 .=
..=C2=A0 0x82b/4 ] =3D 0x03, /* 0x828 (rw) */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x82c/4 .=
..=C2=A0 0x82f/4 ] =3D 0xc0, /* 0x82f (rw) */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0 0x830/4 .=
..=C2=A0 0x833/4 ] =3D 0xf3, /* 0x830 (rw), 0x832 (rw),
>> 0x833 (rw) */
>>
>=20
> Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a619821a-ff26-d13e-ab57-2511b839ab00%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
