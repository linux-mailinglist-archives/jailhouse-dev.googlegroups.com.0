Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUXH2PUAKGQE2KOMOHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC15879C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jun 2019 18:50:27 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id t4sf1370926wrs.10
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jun 2019 09:50:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561654226; cv=pass;
        d=google.com; s=arc-20160816;
        b=yLdQYX1SQQW7UsH+74pZVgE/3eH8kW4V/ti+3EQAPDHUiHj4vFKZTdyyVu+wx/0pCN
         COJukIs/+8ZWCPJCAEYmoxcxeujfka8uVZOdkfQJFD9wfKjTNb/nZ/00ly41QlAiKl44
         NDSP2dzXrR1QXOFdTy4Vme47mhRJJRmuDkA8VczfsQqc6OS9aNnR6Dqug3chd7yLk+K5
         i2Czisa/2A9iyr4we/8karOMakDQPc7WSb6aAAX48dQS4YbmkLbLDc40tjI0Li9xCt8T
         X19Po1AUgTmhAbGAsKM/irKhIDy56Ws5aiYHWfGqH2OQO9t+khenEZLb4e/UfD21Ij+f
         sH7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=XuK7FR4YUdH2de7UDdo6XeFrYXawRB5PeKHMPfT8A7w=;
        b=JEQ1iU9tjACUJ2D4rMuys+u0Won1VS1HEqivcT1yh2XJXxN3VGNDIEoN0csxPMJOCT
         cf0T769EmqcEydLbpaHQBn/LXLWyXo6KGXcH7zCikR3T76e9TsqksD1coNTRNlzFdzTe
         0azinDl7E8arEW6ATq19ZTH2JynqVw9RE1aMBiQTNeKieqj9jW29rWfW6Wm6Ln2Ip3TQ
         FKVINi2u0nfL2FbKyjz9swCBMl/0eqmGCFmyH+0W8+CZVi5ZNNOWEqH9eFvCI4KAM/wM
         Fm26n3CTRdkUSXB6avYoo8EsR4epfdsTWS3UqlXQ41leEZC6bja5SBe5URhlJjk9Xd0d
         H2Cw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XuK7FR4YUdH2de7UDdo6XeFrYXawRB5PeKHMPfT8A7w=;
        b=UWiCNbTgxml4p4yLYYnjl3AcUnJqcBGf2qObK6OPZDHF/5gLhcAKjTVnIkgFOjbnFp
         CWpLHCvE6lHiAx62MbABDlNbHABfWhqKZ190UICc1lXQNIr5bI69ctbRuJSk40kDzvDO
         NPAE4FmAf6SEYsvZVNXhqmmYCbFUQmvCvZqyEPup0oSWfcb4KI2WelzVyuepVoUtoX4j
         lcZhNzw/w1xgN2dKyqm5NiHgHikCWaNq/zDMZ3jCEPZGijslxozMlnWMc9APD8AJFlys
         Sg2MyozFm6bnv26pZvznq4W9AHgHJQUryISRqAFjzUAhlcKkSxhrMhoAzG1c4M/ljTlx
         AAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XuK7FR4YUdH2de7UDdo6XeFrYXawRB5PeKHMPfT8A7w=;
        b=GdfCGAo97djczBHk2VY8xRVWKBPTy0UXGNpg7vG7RJHTWHphU7vCgazI+rSaq7uipO
         xEQgJwj35StEcdfVhF2e4/wq+z/oXnG/5Tc3pUNfoq8EFcXddlQdbhlBX63vod/bB3oB
         nlb7gyPqNORPh2mWNKqJx2uOH9ObZ6tGUQmDhDDciDZaMc1MKVLrA4CSHD/h/he2Yx5m
         kUswr/Se81YKdI4ntX03mrJyTYArtVUu6DoFPEWO74eX7gNgiULszYKmEsx5X06GlwBa
         unE3CMTQhdnBxJgZDHIhcKSJYtXZalrga2KnwkHOneNNIfSbNDEInijpOFK/W91AJh5G
         0LSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXh9qGibxnrxOWEPM0wHofMX4PwndC/wdio6C4kC+ZUakxNvUsU
	pZYQkF8lsY3bcwmNEPouvUI=
X-Google-Smtp-Source: APXvYqyndFpDfjWqQLT5pU5UoBLc61gsygFiQvpIGm0d8vpksrgPFM4Fbd8644GqiKw79mfVEXG+AA==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr4118557wmh.76.1561654226688;
        Thu, 27 Jun 2019 09:50:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc10:: with SMTP id f16ls2716622wmh.2.gmail; Thu, 27 Jun
 2019 09:50:25 -0700 (PDT)
X-Received: by 2002:a1c:5f09:: with SMTP id t9mr4128213wmb.112.1561654225818;
        Thu, 27 Jun 2019 09:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561654225; cv=none;
        d=google.com; s=arc-20160816;
        b=GZzW1G+msfjHEHRnViPOhUYXNHJJJ7TE9LAW8walCVNjfoF1lMX9pdlmGuveBvTbes
         UnrUgpQnnu5HbvdlKO6IsNE8rtJb8pzoLjlmI0nZi28uDCPaIt37bnY2Gtz6X/tmQXNs
         OB9XTJyQ8OHESqaR0AqjinW71pUY5KpmEY4VpnZSkl8nCD9iuvYxI5iCJRjPsNSJ7te9
         KljLd06g3LSmF1jvUpbjFd4k+U0aM70N+S9EQ/oHFcoBoPoU1EwgLvxPC9+3YJ2F8dbz
         vZWtAIYMvBJ155JVurbNf7O8j45f2fwhhQm//WQz7SRVxQvNLHzmXqMoVihxZQPKZ9/r
         tSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=obWXf+1OfnVrQZIoY2H/utwGqH/laTxg10igkIWi9zo=;
        b=magh2JDr/ErHftT7RqhH6Z26YJthfcyC1Dqgezt2J5Cb2hmuFY+cd3bLGkBrgm8n7j
         bAXo133nQlVL/Ao3pRrjin6vzxis1KqxZ2dFTUnrnXPnr73xn+H0abjEWqwfbXs3a4BQ
         MzHigUR6CLEYS32Yg2QHjRn+/iyVKA1pDOxlSCOUDgyrxv6IJ+S/vi27VKx4Va72Jwy6
         UnTscIlPd8CKCNMWbt7TfaLd01TG6TlEi9siyG51G5y+k2Rz454IQjxweaXbPdmMIvYR
         lWfArHp497qjJV6ooF0RnuaYkP4dJeJh4cbZA9n19Zecmy3fDIoGApk/Hfolau7qkFQ5
         +3Eg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id c12si103950wrq.0.2019.06.27.09.50.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 09:50:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5RGoPJC005843
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2019 18:50:25 +0200
Received: from [139.22.36.136] ([139.22.36.136])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5RGoOng018087;
	Thu, 27 Jun 2019 18:50:24 +0200
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Vitaly Andrianov <vitalya@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
 <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
 <8558b60f-cfcd-ddc1-62b6-b3ab9cd762ee@siemens.com>
 <c724fb1e-4c24-8562-cc3b-bd35d45d098e@ti.com>
 <cb3304a1-b322-7f87-a67f-3c6f11fe3d7c@siemens.com>
 <b96fd4e8-686d-2df9-d4f3-32a2bc472630@ti.com>
 <dae8aa98-f7cd-d25f-b8d7-cb0006d08ff0@siemens.com>
 <f2210cae-3d9d-31e3-d587-6502c5863671@ti.com>
 <e46d5280-8add-4900-e084-dbc839fb2b05@ti.com>
 <828e6eff-d11c-7364-797f-623d4d41eb4f@siemens.com>
 <cceb2f75-8899-4544-7e4b-e21c8774ef4d@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7c482200-ebb3-f373-1186-f36928dea965@siemens.com>
Date: Thu, 27 Jun 2019 18:50:24 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <cceb2f75-8899-4544-7e4b-e21c8774ef4d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 27.06.19 13:11, Vitaly Andrianov wrote:
> On 06/27/2019 03:12 AM, Jan Kiszka wrote:
>> On 26.06.19 20:06, 'Vitaly Andrianov' via Jailhouse wrote:
>>> On 06/26/2019 07:38 AM, Vitaly Andrianov wrote:
>>>> On 06/25/2019 11:50 AM, Jan Kiszka wrote:
>>>>> On 24.06.19 23:44, 'Vitaly Andrianov' via Jailhouse wrote:
>>>
>>> [skip]
>>>
>>>>> Check - when in doubt via instrumenting the calls - if the regions at=
 the=20
>>>>> faulting addresses are actually mapped -> arch_map_memory_region.
>>>>>
>>>>
>>>> arch_map_memory_region 0x48020000/0x48020000/0x00001000=C2=A0 0x000000=
93
>>>> arch_map_memory_region 0x48424000/0x48424000/0x00001000=C2=A0 0x000000=
93
>>>> arch_map_memory_region 0x48826000/0x48826000/0x00001000=C2=A0 0x000000=
93
>>>> arch_map_memory_region 0x4a000000/0x4a000000/0x00e00000=C2=A0 0x000000=
93
>>>> arch_map_memory_region 0xee000000/0x00000000/0x00800000=C2=A0 0x000000=
47
>>>> arch_map_memory_region 0x00000000/0x80000000/0x00001000=C2=A0 0x000000=
23
>>>> Created cell "AM57XX-EVM-timer8-demo"
>>>> Page pool usage after cell creation: mem 62/4073, remap 6/131072
>>>>
>>>> Each region from the am57xx-evm-ti-app.c are mapped.
>>>
>>> Using the CCS debugger I started the inmate and paused it immediately o=
n=20
>>> inmate_main() entrance and checked memory referenced by TTBR0 register.
>>>
>>> TTBR0 =3D 0x00017000
>>
>> Is that TTBR0_EL1 or EL2?
> I think that is EL1 as the CPU in the SVC mode.
>=20
>>
>>>
>>> 0x0000017000=C2=A0=C2=A0=C2=A0 00019003 00000000 00000000 00000000 0001=
A003 00000000=20
>>> 00000000 00000000
>>>
>>> Looks like only 2 last regions are mapped (application memory and=20
>>> communication regions)
>>> None of the peripherals regions are mapped, or may be I don't see them.
>>
>> If we are talking about TTBR0_EL1: Since your old version, imates gained=
 MMU=20
>> support. That means you now need to map additional memory (beyond the fi=
rst 2M=20
>> or so) into the guest's page table.
>=20
> I'm not sure where I need to map this additional 2MB to. The DDR for the =
inmate=20
> is mapped to VA 0x0/ PA 0xee000000 size 8MB. Where do I need to add this =
2MB?
>=20

The first 64k of RAM is already mapped, so is the UART with a clock if thos=
e are=20
listed as console resource and the GIC. But anything else needs explicit=20
map_range() calls in your inmate.

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
jailhouse-dev/7c482200-ebb3-f373-1186-f36928dea965%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
