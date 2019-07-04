Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGNU7DUAKGQERID234Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCC75FACA
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jul 2019 17:24:10 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id v7sf2560084wrt.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 04 Jul 2019 08:24:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562253850; cv=pass;
        d=google.com; s=arc-20160816;
        b=lZu6bNvYSg6BGaT9YsGYQvpBLbh82tvHpK1AfTwTTgEFCSWPWQ7DxhKrfsnrp+9Xnt
         +fNCpGKFCFjzWW6/GRGInOlg5BPipLYLoDf//LNQEqxNDQXu3c34mX8qAw52KN2pKkiW
         nV8j5ksBSn59Dw49T2no2qYwe8v9VP6MXKZ9LZyfUrtZij0tQPTMMY00uOfI+Hka2zDV
         U+EOz0ERwXgcPANOk2HfnjKJ9XjE5wS0X3mhUYq3huZtbNR0l89Rw5db+K+d1H525jx9
         8SyuBxhjnDD0PeNI4NDzpu5LR1xNMzvMtcZLViOV5XzsintgnprahgPjZsSmfteQspFQ
         N/8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=/8P75ytY9f0HNzVxHskEqtFRtWsotVb6RTXgxhXpBdQ=;
        b=MXUEdcowwHUaKZ+EkKbZhep8SOCsvkURqi1ePW7qV78dIEn1JIMexDBSUDUgekpe33
         T6rB5wn6Y6+q/E7pbmfBF+kdWwpQyyr7KZBeJKni+caUkesf6GOvubVKvUWiSz0aK0ds
         j4tYW0Cx5HuPM6ShLI5P5Flwz2KtEIYucRnvaqNcrz9g4Rd4aMc3zPyhQc5CQWI60v24
         9sBx37dCYe9px22o2xWKhMGHueq11tUzYv+5mF9+idEmrFeh5Rvry5TE4YTcjqwVpq0i
         sBomRAnChF5LarWi08vJ+H5WbxUgEfcsqYuYaQgSuI59h91up/0xtjTa8momdF4RuRVK
         Yk5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/8P75ytY9f0HNzVxHskEqtFRtWsotVb6RTXgxhXpBdQ=;
        b=KMEqP0yXfVuNLd0G0lHv2PUEqLbzjsqz4h4qdw201qbK1KLv1zn18dOpopMugYoyRl
         FMPwECIwFd4aRvQXfPvoLZxx8+LfQB56EqOGjPTXZEc0Ngt1GHNJf/SuRabHYrTB+iDS
         o81efdE1F07KTqtLQtgoAracmWqH9Qs/KcrsMxQrlUjkzd6HKDVemlxL9/rwqnVYtN2m
         6IcsiNkIFntclAazMM4AH6ksbnmYHmK1W1+UHTBQhROdcl+op50hgqECYF3pJENhkDbs
         t6IfWuu0nAUdX78WyTO/ZUkY2dvo94VFzSpJnnyGl4JFIT3vDKcGFvB1DYg9iEcO+WWi
         V2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/8P75ytY9f0HNzVxHskEqtFRtWsotVb6RTXgxhXpBdQ=;
        b=Bvp5mqDacwa/N3sfUhqO2M3dkgdMZ0ljEAEccuXmDQz8o82TlYjQpmxgw+2er6nLye
         PEkbcAiFDTyacDLJSJv1YvQn+B/Hz4A4NC4deagqj8IfNEJU3Si+YMtdI7ChgkIB8Jdq
         xNHvCzVTUG87F9JX3WolIHZ/cAuGN/KntWdJZw7V1Lzz70NC+wK8q+cljwrvOU4mvy5R
         vwivok2NAp4IOSy4vWdES6j5iYfZTHGuJIQfUhEzwUV4XamWQYYIPA9ZBMa6NpGcf0Cx
         nF+uwpAMMWSm2UAd3Elw7AKVwRRGMWe4XVwbvqze6wLTN/o7G/DIsT8ZHzOJQ1bxTtu8
         317g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX4EfOIkntYAe/sEAEfsNdcbMA8RJSYEh/w8pcDCcY1V+ARHTD1
	2wxxvV/vI9eHz6+pVLruwg8=
X-Google-Smtp-Source: APXvYqygOknlO+bpAz5yDg04j1xVlILFvPxmqN0/Icpr5/A8ck0L1DmOBpi1PrunOBLH/o2VkPk4Dw==
X-Received: by 2002:a05:600c:34d:: with SMTP id u13mr111654wmd.48.1562253849953;
        Thu, 04 Jul 2019 08:24:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a557:: with SMTP id o84ls1827963wme.3.gmail; Thu, 04 Jul
 2019 08:24:09 -0700 (PDT)
X-Received: by 2002:a7b:c8d4:: with SMTP id f20mr107233wml.90.1562253849377;
        Thu, 04 Jul 2019 08:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562253849; cv=none;
        d=google.com; s=arc-20160816;
        b=zcL82PmaDzwubpGcWE7fngU7E5WEGWubWVvbPMd8iqgWVn2bPyzInejwCl3UG9sAqi
         qNoajj50upjXL/Q+fKUchXm3l/z1E6rXO+bS/XxOhcmRWoTqf6TQS8JgC92f9MU6Pb+K
         YF+uPHRWu3VWv46vX+INcerVVqVMPySctu8NZDZxaVSXfdgAjSg9QnRaLsH0orbwjaY5
         Hkbph9o5oMsEv6jDVZv9n0JXRsLFeToP5yNQdOzlS9C2Xipfzo1fsmqxvnjJaZL2zEQo
         XG1TKg/bVbUbIY14a0/3P0IrH1ENa4Kqt1QOglE+uv3r7tjMRL2k/jbv395/LQfh8xH6
         T92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ty6FQQd/xWlPoEH31wLsj+7pi/koJ8mnVJo7DA6GuD4=;
        b=W6r7YvOFsRqPD212yrMFJEpMpCk6UkPfOhF9ETG9xJkwf1rRF8iPbAlpIH1JE6zUhi
         iA1VGJ5KIhSqReky3ZCLVCZCKNTVwMRWiMmF/9og+z/eYtnJA4rOLId5v48CEuBH8YwU
         Ut5C5Xj1lzKXeF7/r2+g3JKhrHCwN14DcryuPsltSXWUZ1FLe/7vlxVLiytVp+ac6NTK
         VctJoStohUWMRLTDc62qUrNkXUh9U1+6S30NeKwYVGE5LyWbIJ8ZCwKyl2wIj5oCUxbj
         /zB9OF2GBeYgTx69OBgUYNRkr4V8kmQd29UkwaVwqzYpEBBt0DGIUgVXmLv4yqZibinP
         +soA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id p23si300984wma.1.2019.07.04.08.24.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 08:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x64FO9g2032502
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Jul 2019 17:24:09 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x64FO8Fk005801;
	Thu, 4 Jul 2019 17:24:08 +0200
Subject: Re: AMD: non-root linux inmates
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <c2839a0f-c1b5-9139-43d5-01139341981a@oth-regensburg.de>
 <814c68a3-d59b-75b6-ce96-411cb8e5f4a6@siemens.com>
 <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <445be499-99bc-a739-f6f7-49dc9d8f9b6a@siemens.com>
Date: Thu, 4 Jul 2019 17:24:07 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c28ae172-5eb8-e9d7-b322-36d7016047dc@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 04.07.19 17:18, Ralf Ramsauer wrote:
>=20
>=20
> On 7/4/19 4:39 PM, Jan Kiszka wrote:
>> On 04.07.19 15:43, Ralf Ramsauer wrote:
>>> Hi,
>>>
>>> we have some trouble starting non-root Linux on an AMD box. I already
>>> tried to narrow things down, but it raised several questions.
>>>
>>>
>>> The main problem is, that non-root Linux tries to write to LVT0, and
>>> jailhouse crashes with:
>>>
>>>  =C2=A0=C2=A0 FATAL: Setting invalid LVT delivery mode (reg 35, value 0=
0000700)
>>>
>>>
>>> Turns out, in comparison to Intel x86, we don't trap on APIC reads, we
>>> only intercept APIC write on AMD (cf. svm.c:338). I thought this would
>>> be the issue of this bug, as that's an obvious difference between Intel
>>> and AMD: on VMX, we do trap xAPIC reads and writes. However, VMX works
>>> slightly different in these regards (side note: [1]).
>>>
>>> xAPIC reads on AMD systems don't trap the hypervisor, so I intercepted
>>> reads (by removing the present bit of the XAPIC_PAGE of the guest), and
>>> forwarded the traps to the apic dispatcher (adjusted VMEXIT_NPF).
>>>
>>> I can confirm that we now trap reads as well as writes. But the non-roo=
t
>>> Linux still crashes with the same error.
>>>
>>> Digging a bit deeper, I found out that xAPIC reads are directly
>>> forwarded to the hardware, if they were intercepted. So this explains
>>> why the bug still remains. This raised another question regarding xAPIC
>>> handling on Intel:
>>>
>>>  =C2=A0=C2=A0 On AMD, we don't intercept xAPIC reads. On Intel, we do, =
as we
>>>  =C2=A0=C2=A0 follow the strategy mentioned in [1]=E2=80=A6 But why?
>>
>> It accelerates write dispatching at least. I never did the comparison if=
> using a different access scheme would be beneficial because xAPIC is
>> practically dead on Intel.
>=20
> Hmm... The change and benchmark should be pretty easy. Once a bunch of
> other issues is solved, I'll maybe have a look at this.
>=20

As I said: you will optimize a legacy code path, not practically relevant. =
If=20
that will simplify the code, though, I might still be interested :).

>>
>>>
>>>  =C2=A0=C2=A0 Wouldn't it be more performant to just trap on xAPIC writ=
es on
>>>  =C2=A0=C2=A0 Intel? This could be done by switching from APIC_ACCESS i=
nterception
>>>  =C2=A0=C2=A0 to simple write-only trap & emulate (page faults).
>>>
>>> However, back to the initial issue. Looks like the difference between
>>> Intel and AMD boot is as follows.
>>>
>>> AMD:
>>> [=C2=A0=C2=A0=C2=A0 0.325578] Switched APIC routing to physical flat.
>>> [=C2=A0=C2=A0=C2=A0 0.366464] enabled ExtINT on CPU#0
>>>
>>> Intel:
>>> [=C2=A0=C2=A0=C2=A0 0.099486] Switched APIC routing to physical flat.
>>> [=C2=A0=C2=A0=C2=A0 0.113000] masked ExtINT on CPU#0
>>>
>>>
>>> This is why the above-mentioned Jailhouse crash occurs. I tried to find
>>> out why Linux takes this decision on AMD. Our victim is in apic.c:1587.
>>>
>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD it
>>> is 0. This is why we take a different path.
>>>
>>> Now the question is simple -- why? :-)
>>>
>>> Are we just lacking ExtINT delivery mode in Jailhouse, or is anything
>>> else odd?
>>
>> Yes, the ExtINT makes no sense for secondary cells, and it should also
>> not be needed for primary ones. Let's dig deeper:
>>
>> value =3D apic_read(APIC_LVT0) & APIC_LVT_MASKED;
>> if (!cpu && (pic_mode || !value || skip_ioapic_setup)) {
>>  =C2=A0=C2=A0=C2=A0=C2=A0value =3D APIC_DM_EXTINT;
>>  =C2=A0=C2=A0=C2=A0=C2=A0apic_printk(APIC_VERBOSE, "enabled ExtINT on CP=
U#%d\n", cpu);
>>
>> What are the values here, and which are different?
>=20
> As already mentioned above, only value differs:
>=20
>>> On Intel, apic_read(LVT0) & APIC_LVT_MASKED results in 65536, on AMD
>>> it is 0. This is why we take a different path.
>=20
> cpu, pic_mode and skip_ioapic_setup is 0 on both machines.

Ah, ok. Then you need to find the evil guy unmasking LVT0 before that. Can'=
t be=20
Jailhouse: we hand it over masked.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/445be499-99bc-a739-f6f7-49dc9d8f9b6a%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
