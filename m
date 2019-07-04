Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBFWQ7HUAKGQEQ6PXAYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4D5FDF9
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jul 2019 22:56:55 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id u13sf1386002wmm.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Jul 2019 13:56:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562273815; cv=pass;
        d=google.com; s=arc-20160816;
        b=K6yPaC3h34vZQr9ibpi68BRyrbgBc279AWJoCO5khkpE3cMqWz3r2Ffh0nr9XUB8dN
         lf1BWSRp/IF4aIo676h7n4tHwDQJbXJX1BS73jyrTMALNYGhXQB2LFhgiwiLa/kVkGbv
         PO8PCUzzoEl8K+IWG441QsjXuAeZmykmF+uCm2fozuQ18f5gfSGeAzctgjmJgGFF9QhS
         MnhfER1uO2GO6GqmzXPdVrWBbvSqKhbeptLqi+7k5mSopRFCn2/lR96NW38aHsdHWuJF
         MjEoDbUV8ZUFgFALQyxqnFODHu5GhvR1oBBm2Gq9g3vJWidTTo8mWJVUYTR25GocD3y1
         85zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:autocrypt:openpgp:from:references:cc:to:sender
         :dkim-signature;
        bh=/drspv5Rj09c/OAFqexwBet+ZrTcqwOOIej2jOAk6lg=;
        b=uShv5kFrKnlwzOpOEFmIzRV+esNK8E99H7L7USmdUAEttL0hyKtwZpl/v3RtVnOXrC
         drFcLvnu+GXrRr+ZAgu+y7cZkYNPtad9nWd3pn/82OWv+lzreXNKKRQ8e7XeVGt7lZ8+
         CbdoLR70LifQrRYav2xIYkKZ220CuxEbfFkczxYMEr6CeNMd+RdTtZivCEbV0dqFOt76
         /vc4XE6H+0G6JczrbXWah76b8AEmY4d151+P2AJQK0R3R9aQWurTzwJe6ZnrAxtYTn3s
         6vZvWrujSWaJbz19laQw5qNl6jVPecYjUtQnumyRfPoJt7Kn4DOGhcEmwTx5MjLRd8Yn
         cGvw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Dk1Ih8Mg;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:references:from:openpgp:autocrypt:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/drspv5Rj09c/OAFqexwBet+ZrTcqwOOIej2jOAk6lg=;
        b=NBaiPLci3vT9ovPow0JArIOwI2K/SqRFryrxBU5EFiVsvavebQojI7WZwt3ifyBjq/
         M1pFcuBFxGRg13Sm8Q9vUGXMoc29kayrw3uRCV+XgFpZ/iO2NYhWuooPUJn/0saviVgD
         5ljbBipN0Gnk+01aPlTkTBSDanWxbT5r0shhi0Xp64UwIe28eKFuiE/2mLmgfIsTB3Bb
         5+Q4hm+pVwR0gMnpGjcJa7bQ3XeBJikmN6MzbIb2IKs0L5oQvzEIw6jzxndppoUe3WIb
         XmvjLLX1EQkWRppaju11oXEjPu67pIErrmisbQx8fQ1VsFlHWxsdpCJduWy3c7VHzo0W
         /LSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:references:from:openpgp:autocrypt
         :subject:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/drspv5Rj09c/OAFqexwBet+ZrTcqwOOIej2jOAk6lg=;
        b=emjJUeKofWsesTfzddTnbC5YekRLeYZ70QfmwSjXNQm94kCJRT2BnDvIXxJi6/5nsZ
         w1Fm6zTdtLpd+WdRrlRLizO71tP2y0qXvVYPW+dc3edUs7G2lsRkAdkq2An7uJI8tbmw
         GLy6dPCJ4pKBtWWCAh4UMJ4//8PMhyNGQXAHhGZUw856jNeB/T2waRMNnLhfUJhjsPkW
         i4mr0oD2Z0haVmC6MsZwOZFPO2A+nF0ItI5Yeo85t3sP2nOvAEJ9b/f3wRnaPGkCkPwc
         Xrh9/KsWoPMI5qcYrzb/1plhO8IJ8SmSWbftDqVdHChL6be+jD2vwAGqieaFvojjD3iR
         WjKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVSZ9RjlS6BG5JB1xraty8AXPUEUZT7stzc3hKyw22k8hr8pIi2
	/nsTVPeeFghG47wVjFlHVrw=
X-Google-Smtp-Source: APXvYqzFBfPtiZQBFNgRXq5hrTKh3dzUYpGM9VIi+Uo2taguT6b/Q7TJN3IcAtBUW5yZy1oySwyITg==
X-Received: by 2002:adf:ee08:: with SMTP id y8mr277778wrn.328.1562273814888;
        Thu, 04 Jul 2019 13:56:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4f88:: with SMTP id d8ls1553730wru.9.gmail; Thu, 04 Jul
 2019 13:56:54 -0700 (PDT)
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr316556wre.340.1562273814391;
        Thu, 04 Jul 2019 13:56:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562273814; cv=none;
        d=google.com; s=arc-20160816;
        b=QbvhKjDiS+UdhMZgZ/ZRIrsJKmQ9fxVPQZL9/RDQpj5tBVGoVQMg+q4TA8/7zV7tnP
         mpVtd/xA+r3T3WHwnUNU/zdES2MaPSpcRyiULPV5kJx7kk9pmMe1IDM9sTpwyK69nDQN
         B+q23p6mixLu/avOqNG1UNEueEVdF9Ca+t0BuAznZcaDDACK9Fh1PFwLyLThfkRkyXUY
         WP1X6AJtrQm9pOsk6iKUBEp4r7DUBVpRT/dA7HUIy1PaeP5xkPBk8n/KkGWri52KskvA
         qLQ4Jted4ObphogHWOwwE2AlnDD+H4y7Jez1O6pbtK/UPiyoV73ZWb63uP+Kg2AVtPII
         MzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:subject:autocrypt:openpgp:from
         :references:cc:to:dkim-signature;
        bh=mFt76MZffGdoldEJM6pYS7QUap0Sxazy7apadgVZB/U=;
        b=0gnpu5KL5V+iRw8h0f/5hdJKxQrh7GqXCP+oxrJbHpVUVNF7N9tEKauaSjyuoGtW/2
         DI5/73c/IHUwl4dpqHhveAvyyebokCtEHHFWVJkTWgN1MxP8QpupmAUpv/5ieCegvMB6
         dqUtiUM19pMi8xqDM4ErlXpqKQBGl544gYAhqK+eYhOBigHbvYfYjIMMbqR7VTwnxbcJ
         bOLS1ll48ekAG2pP6ITH+Q/eLz0THPzwrdQ9qSDh2pzhlgmEAWPiJG7GOQ5O8JuxRYep
         nrwshtC4t1Zkg8Ox8rvciB2FLzPVDFXvwNo77E+B7UTFGUugzMpmR8hUNv28sGWY/PIh
         YY5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Dk1Ih8Mg;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id p15si330346wmb.0.2019.07.04.13.56.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 13:56:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45fqz9632ZzyDl;
	Thu,  4 Jul 2019 22:56:53 +0200 (CEST)
Received: from [172.23.3.82] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 4 Jul 2019
 22:56:53 +0200
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
 <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Subject: Re: AMD: non-root linux inmates
Message-ID: <03de53c2-f063-2288-3ae0-c813b53642ac@oth-regensburg.de>
Date: Thu, 4 Jul 2019 22:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Dk1Ih8Mg;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 7/4/19 5:24 PM, Jan Kiszka wrote:
> On 04.07.19 17:18, Ralf Ramsauer wrote:
>>
>>
>> On 7/4/19 4:39 PM, Jan Kiszka wrote:
>>> On 04.07.19 15:43, Ralf Ramsauer wrote:
>>>> Hi,
>>>>
>>>> we have some trouble starting non-root Linux on an AMD box. I already
>>>> tried to narrow things down, but it raised several questions.
>>>>
>>>>
>>>> The main problem is, that non-root Linux tries to write to LVT0, and
>>>> jailhouse crashes with:
>>>>
>>>> =C2=A0=C2=A0=C2=A0 FATAL: Setting invalid LVT delivery mode (reg 35, v=
alue 00000700)
>>>>
>>>>
>>>> Turns out, in comparison to Intel x86, we don't trap on APIC reads, we
>>>> only intercept APIC write on AMD (cf. svm.c:338). I thought this would
>>>> be the issue of this bug, as that's an obvious difference between Inte=
l
>>>> and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX works
>>>> slightly different in these regards (side note: [1]).
>>>>
>>>> xAPIC reads on AMD systems don't trap the hypervisor, so I intercepted
>>>> reads (by removing the present bit of the XAPIC_PAGE of the guest), an=
d
>>>> forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF).
>>>>
>>>> I can confirm that we now trap reads as well as writes. But the
>>>> non-root
>>>> Linux still crashes with the same error.
>>>>
>>>> Digging a bit deeper, I found out that xAPIC reads are directly
>>>> forwarded to the hardware, if they were intercepted. So this explains
>>>> why the bug still remains. This raised another question regarding xAPI=
C
>>>> handling on Intel:
>>>>
>>>> =C2=A0=C2=A0=C2=A0 On AMD, we don't intercept xAPIC reads. On Intel, w=
e do, as we
>>>> =C2=A0=C2=A0=C2=A0 follow the strategy mentioned in [1]=E2=80=A6 But w=
hy?
>>>
>>> It accelerates write dispatching at least. I never did the comparison
>>> if> using a different access scheme would be beneficial because xAPIC i=
s
>>> practically dead on Intel.
>>
>> Hmm... The change and benchmark should be pretty easy. Once a bunch of
>> other issues is solved, I'll maybe have a look at this.
>>
>=20
> As I said: you will optimize a legacy code path, not practically
> relevant. If that will simplify the code, though, I might still be
> interested :).
>=20
>>>
>>>>
>>>> =C2=A0=C2=A0=C2=A0 Wouldn't it be more performant to just trap on xAPI=
C writes on
>>>> =C2=A0=C2=A0=C2=A0 Intel? This could be done by switching from APIC_AC=
CESS
>>>> interception
>>>> =C2=A0=C2=A0=C2=A0 to simple write-only trap & emulate (page faults).
>>>>
>>>> However, back to the initial issue. Looks like the difference between
>>>> Intel and AMD boot is as follows.
>>>>
>>>> AMD:
>>>> [=C2=A0=C2=A0=C2=A0 0.325578] Switched APIC routing to physical flat.
>>>> [=C2=A0=C2=A0=C2=A0 0.366464] enabled ExtINT on CPU#0
>>>>
>>>> Intel:
>>>> [=C2=A0=C2=A0=C2=A0 0.099486] Switched APIC routing to physical flat.
>>>> [=C2=A0=C2=A0=C2=A0 0.113000] masked ExtINT on CPU#0
>>>>
>>>>
>>>> This is why the above-mentioned Jailhouse crash occurs. I tried to fin=
d
>>>> out why Linux takes this decision on AMD. Our victim is in apic.c:1587=
.
>>>>
>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD i=
t
>>>> is 0. This is why we take a different path.
>>>>
>>>> Now the question is simple -- why? :-)
>>>>
>>>> Are we just lacking ExtINT delivery mode in Jailhouse, or is anything
>>>> else odd?
>>>
>>> Yes, the ExtINT makes no sense for secondary cells, and it should also
>>> not be needed for primary ones. Let's dig deeper:
>>>
>>> value =3D apic_read(APIC_LVT0) & APIC_LVT_MASKED;
>>> if (!cpu && (pic_mode || !value || skip_ioapic_setup)) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0value =3D APIC_DM_EXTINT;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0apic_printk(APIC_VERBOSE, "enabled ExtINT=
 on CPU#%d\n", cpu);
>>>
>>> What are the values here, and which are different?
>>
>> As already mentioned above, only value differs:
>>
>>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD
>>>> it is 0. This is why we take a different path.
>>
>> cpu, pic_mode and skip_ioapic_setup is 0 on both machines.
>=20
> Ah, ok. Then you need to find the evil guy unmasking LVT0 before that.
> Can't be Jailhouse: we hand it over masked.

Yes, I checked this. Actually we do. But...

When the cell is created after jailhouse is enabled, apic_clear() will
be called when the SIPI is received. There, I added some
instrumentation. At that moment, LVT0 holds (and keeps) 0x10000.

In addition to that, I instrumented the linux-loader. There, I read back
LVT0. Very early, before we hand over to Linux. No one else touches LVT0
in the meanwhile. I would see any other guest access as interceptions
are instrumented (both, read and write).

So in the linux-loader, the read back causes a vmexit, and I read back
0x0.  That's really strange, there is - afaict - no other access in the
meanwhile.

I don't know what's going on there. I don't see any other modifications
of LVT registers in code paths other than apic_clear().

  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/03de53c2-f063-2288-3ae0-c813b53642ac%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
