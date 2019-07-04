Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBTFR7DUAKGQEVOQQ5PQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id F37245FAC2
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jul 2019 17:18:36 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id l26sf4044069eda.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Jul 2019 08:18:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562253516; cv=pass;
        d=google.com; s=arc-20160816;
        b=w27eit3f2UO/hrb4p30chI3kV008gWhjwd6JaY12A8NJ+ZQgCgqIezHKXXcP8YRE6l
         CoEJPwYZbbkY4A7qK+p/luKY/SloFFIogXZhjpEP5a3X1C24r9tgpkus0G0F+WM9PE6e
         DU+h99ImVlDEXI2FeSFhsmhRbSof3+cHax3X77MkwY8zXz/V9f827ssJp9nSlwBOdK+J
         ouVZ4sbD33saTCggefcP4h22hv2LvTApWMR2iyCORqrfbq2qQOcj53fRn+OVA6OOPNTf
         OOWiiPjvoH5l4DBryQSIWQApKk0Y4DCNOg2W6NPCax0pQFrcCar+oU7ULmY4JBxdBUg0
         aVCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=b02Qoaq+NBfnj/Xkexpkb4f38G1veZlhBymZS1vRWrA=;
        b=RY4+eoEeeIQchknMIM4QtC/m9Hkocm3s/cJZ/DKU/Msn+zNfgVyDZTzB7nRNVg9Q+n
         qzIH2pPrwOPfuqRJZ1JcHwOyi4JOtzZyJWjjwuY72PQjNnJtbZ3fItV9g4sHFylwGV0x
         PmguwM8D3+ZZY0sXWWXc6ZHbmIRzOVnqRvTuh4i1Xk+2fwZlQXRmP96//mx7Z0Jsm59S
         CufWL9J37fQmy1190EE0oddts99v/SOc+DMF16R74I60FEtDLCPcOpVjx3iwUrpo6d6V
         WQ3qDgDq70HI6yDF/FYbXl1AxneIzw9IWDQp+YX3veIsKiXzSMGaF0mlRdSi2IDNMAir
         xO+Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=c3fMiteN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=b02Qoaq+NBfnj/Xkexpkb4f38G1veZlhBymZS1vRWrA=;
        b=RxGGERjFVgFShWG9Kn6gpfZLDkcdfgDpwotKyx4JTyg/Gh/XP2YHpU5IUzyIgY5bJB
         uV7dR9zIIL8vQLSFF5JpjSlkatJ0MAYGM19SnMyT2eyumKzzQnFxlqPfj1Ug1Xdo4Pag
         iY5IN2XkiXfO47PVV0SFiIAnRUZHL/ZpHu5U3Hr6RTJusRJSfAUAagWI1wdJWhI9jonq
         PMUrTDUvZJXj4iwFNzVQ7CYBy7bxU5C77TLap+ARwMnujUuxf9PyekJCKHIecZSQ8p8H
         QaQynQr//8xit2/Ij4eGnkEFOWMSDwGR+MQTnG4okzdI9lsPYYm44nUEoorPKwC9L5w8
         8Peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b02Qoaq+NBfnj/Xkexpkb4f38G1veZlhBymZS1vRWrA=;
        b=sGbPKAuDK8HZ5GemD6410MQSr1BxZBEFdvAnf1slfqwzLwVro5Z/4ADUCEiKPjWpqZ
         Qk5FWsk76DQNh6WDPycIVSyv+wCjhAY9tqOMuIPWmFDKg3ot4kNbPeDYq3GjiJD/nXzH
         XpNcQqc0eOPgWm/FFIZPNhFt+bKPo1J8Ui4Sw3Wtj1ob2NLUKk9ssLK9V5k70zeemJy5
         PHaDMImxAL3jQQBPVIw4l1iBzXSJJ1Q54DKfFHBS03iY5KJFovjeEOJ9Psb1pcFa1AXY
         a5n9uLZQAbarOabWuLJSViqS1ca/DtzXCnQMevpm5HuR0PwnwhOOGAWlXwXtJZ9Lse1b
         efAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW0DZvfcnDCxyBLAkpw9theYzLs62Ky0TH4RI6onSKChUQ1lccY
	EDaqRkS67EynNg6v8mIOAxw=
X-Google-Smtp-Source: APXvYqw0IN6S04cCEC3NA3MzYhNX7eSKBP3WVExrhkrv4rxbjWf4ubCMra2SlUNWP1zED/vy1ZSViQ==
X-Received: by 2002:a50:b48f:: with SMTP id w15mr50326532edd.260.1562253516660;
        Thu, 04 Jul 2019 08:18:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:908a:: with SMTP id c10ls1839945eda.14.gmail; Thu, 04
 Jul 2019 08:18:36 -0700 (PDT)
X-Received: by 2002:aa7:c509:: with SMTP id o9mr48487519edq.164.1562253516183;
        Thu, 04 Jul 2019 08:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562253516; cv=none;
        d=google.com; s=arc-20160816;
        b=HlY7TKjwGwVISWtN9rmQLcTWpyG5CObgHL42XKl7XeDxRRlKLuqAk8FIHCAfIveDE5
         cKvlAXyy17qoeQcOfa/DaKv0+5fd+lSZiEsTL7RC35ifcl8vDqHXO3CroK8BdzWvog3L
         /5/s2VOVsL3U1tnpg43whtyZGzTKAehWcUO7zZQ7HFuB27Wmdb9cVpZIvsrz0nymBi0b
         24ylay7eXhtn3zn/GwamrAm1HmSWO+E5sZYQ4kEPyeAF6A6ah5pSEsru2zPcMfb9Og40
         Ae08RKbUKTGsXVX7McU/9K21H47ECTK3AV7/O9LcGENNEhvDx54sOeZmSlegL4db5e5R
         X4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=vIhHxOMLSfpLxvvqs+xx+63kvWXzqK4jqLeqzGZhixY=;
        b=NcClCiVtM6RJuvXKGnEho8L+mbPTvPkZnNkfq/rsylhf0Qd5W00aRbnpQlp/sJODm6
         F2J5A/1aWfS2AZk55AD4oTUjpA35JQCA4gGnJoVHCokkBN90qGeRK4mwp9WNGeAfv5lk
         k0UVFc8XsQeka4RFfNaH1rdYb2atnVP3TagRdSQRTQSnj/kVFpM/y3RqtI6CEJbPd0rX
         Z/5orMG2WyPLG7RHoraykdlTgNWFM3Lw0UOLe3QXPUKIYVihGw0EotSJOJXhqDMkh0NZ
         VwmvHfyZq+fmilcMgHdcptnmcgAhmqH7XwTKLZUWBd50rn/m+d2J2ZTd58PmNb/TGdIU
         pebw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=c3fMiteN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id jz14si289738ejb.0.2019.07.04.08.18.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 08:18:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45fhSq4KfNzy8J;
	Thu,  4 Jul 2019 17:18:35 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 4 Jul 2019
 17:18:35 +0200
Subject: Re: AMD: non-root linux inmates
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
Date: Thu, 4 Jul 2019 17:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=c3fMiteN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 7/4/19 4:39 PM, Jan Kiszka wrote:
> On 04.07.19 15:43, Ralf Ramsauer wrote:
>> Hi,
>>
>> we have some trouble starting non-root Linux on an AMD box. I already
>> tried to narrow things down, but it raised several questions.
>>
>>
>> The main problem is, that non-root Linux tries to write to LVT0, and
>> jailhouse crashes with:
>>
>> =C2=A0=C2=A0 FATAL: Setting invalid LVT delivery mode (reg 35, value 000=
00700)
>>
>>
>> Turns out, in comparison to Intel x86, we don't trap on APIC reads, we
>> only intercept APIC write on AMD (cf. svm.c:338). I thought this would
>> be the issue of this bug, as that's an obvious difference between Intel
>> and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX works
>> slightly different in these regards (side note: [1]).
>>
>> xAPIC reads on AMD systems don't trap the hypervisor, so I intercepted
>> reads (by removing the present bit of the XAPIC_PAGE of the guest), and
>> forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF).
>>
>> I can confirm that we now trap reads as well as writes. But the non-root
>> Linux still crashes with the same error.
>>
>> Digging a bit deeper, I found out that xAPIC reads are directly
>> forwarded to the hardware, if they were intercepted. So this explains
>> why the bug still remains. This raised another question regarding xAPIC
>> handling on Intel:
>>
>> =C2=A0=C2=A0 On AMD, we don't intercept xAPIC reads. On Intel, we do, as=
 we
>> =C2=A0=C2=A0 follow the strategy mentioned in [1]=E2=80=A6 But why?
>=20
> It accelerates write dispatching at least. I never did the comparison if>=
 using a different access scheme would be beneficial because xAPIC is
> practically dead on Intel.

Hmm... The change and benchmark should be pretty easy. Once a bunch of
other issues is solved, I'll maybe have a look at this.

>=20
>>
>> =C2=A0=C2=A0 Wouldn't it be more performant to just trap on xAPIC writes=
 on
>> =C2=A0=C2=A0 Intel? This could be done by switching from APIC_ACCESS int=
erception
>> =C2=A0=C2=A0 to simple write-only trap & emulate (page faults).
>>
>> However, back to the initial issue. Looks like the difference between
>> Intel and AMD boot is as follows.
>>
>> AMD:
>> [=C2=A0=C2=A0=C2=A0 0.325578] Switched APIC routing to physical flat.
>> [=C2=A0=C2=A0=C2=A0 0.366464] enabled ExtINT on CPU#0
>>
>> Intel:
>> [=C2=A0=C2=A0=C2=A0 0.099486] Switched APIC routing to physical flat.
>> [=C2=A0=C2=A0=C2=A0 0.113000] masked ExtINT on CPU#0
>>
>>
>> This is why the above-mentioned Jailhouse crash occurs. I tried to find
>> out why Linux takes this decision on AMD. Our victim is in apic.c:1587.
>>
>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD it
>> is 0. This is why we take a different path.
>>
>> Now the question is simple -- why? :-)
>>
>> Are we just lacking ExtINT delivery mode in Jailhouse, or is anything
>> else odd?
>=20
> Yes, the ExtINT makes no sense for secondary cells, and it should also
> not be needed for primary ones. Let's dig deeper:
>=20
> value =3D apic_read(APIC_LVT0) & APIC_LVT_MASKED;
> if (!cpu && (pic_mode || !value || skip_ioapic_setup)) {
> =C2=A0=C2=A0=C2=A0=C2=A0value =3D APIC_DM_EXTINT;
> =C2=A0=C2=A0=C2=A0=C2=A0apic_printk(APIC_VERBOSE, "enabled ExtINT on CPU#=
%d\n", cpu);
>=20
> What are the values here, and which are different?

As already mentioned above, only value differs:

>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD
>> it is 0. This is why we take a different path.

cpu, pic_mode and skip_ioapic_setup is 0 on both machines.

Thanks
  Ralf

>=20
> Jan
>=20
>>
>> =C2=A0=C2=A0 Ralf
>>
>>
>> [1] Regarding Intel VMX, why do we actually need the apic_access_page /
>> SECONDARY_EXEC_VIRTUALIZE_APIC_ACCESSES dance? On VMX, we do trap on
>> xAPIC reads AND writes. So why do we need virtualisation? Why don't we
>> simply trap on MMIO and handle these situations under
>> EXIT_REASON_EPT_VIOLATION?
>>
>> Is it just to save the dispatching or is there another reason?
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c28ae172-5eb8-e9d7-b322-36d7016047dc%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
