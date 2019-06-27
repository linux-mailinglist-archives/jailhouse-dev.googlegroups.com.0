Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBSWY2HUAKGQEWTFUSKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id DA40C57CD9
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jun 2019 09:12:10 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id x2sf531456wru.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jun 2019 00:12:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561619530; cv=pass;
        d=google.com; s=arc-20160816;
        b=cnIiIC20N037sdaVxuC7eSrZrb/TXirEjyNIuX4ajMknxSTWIp2X4zL2CbuwVncGIB
         2IfUoyaL7wDHC8ZHc5j/Um8L6UxDpPVOru5mJ3e59Qq1jGq/cwsyHjjWOUMvPIa3y1Vw
         hXbeTuXCBP38KZkbfs/zHKHf57nVX802KUncX62tTApFvKwaifyUGslEXuJ6gpfVNZFd
         JqBZ5kwh2XZdfH5b6HhQBdX4QeEBLQRPGVSk8stjV5xllxAXV1J1mSJtyiO7cPL+HA3X
         lkLg5CegT4Itd542E7KE7dI1NH6V6a9/4op3hkEoHjPZA6Bvtm+t2UMlf00ZCGeXOZh7
         z2UA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=DdaQ9Ro7eprA3Wuc8zIeQF7BsplRDdjZL68QsAhzVKg=;
        b=GuvOTF5N7gntb7zoTrUlJxUQrqZestcu5r/3SJktP5MASqGiDWyQMkFL2RLe4yrqE5
         0ugli2p2P9SNtUqPtrOc35m32SLicXJUdlZ/k5yi3djqyGYOfa6mtY9qU8WkToS82Mec
         w3EIM+toEtqR3NaKfPndTiBb5jSlte/NnAr02ngaNKgwZP1ZNg65Da4ZHH0+tSMTCTJr
         BV1ndDgLbw/vlgmGTjvWHUCueX/D6Dd1WYstq6pNRSFI6Mh9Uz2Grm+Tq9qjgWaZtaVT
         lHnN7o12cqCTIbnjRTPF1SW/gFdmQPkrPFO35E7+pYKWbigvuX2yCEjWHq3M5QktQLqs
         BR+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DdaQ9Ro7eprA3Wuc8zIeQF7BsplRDdjZL68QsAhzVKg=;
        b=AhZgaYZqGD4FDEASo0X9cCSqfEWmWff/RuoBYyrTYqOZZUv4Cj+zLPhsDQDkQL9DkC
         +WvcoFjsTSRGdpIKQLAz48Vii+atsXZ0v++nZq6LilstvB8U0T/AE8PB63hl8nwUDShv
         3cHVD2JKyZ+4TkAm/Qj0I5aLHbVtO+oeVGR5BY5ntfgVcpAJTDso+ENHP6Ocf9EW42n/
         JwnMYRbhMNm/4FFH0X8/N+miONJdyDaKnsj6Capbkk8SR+jz+B5n1VSEieM24NWXo1fa
         OLGTG1TTpEmryqFr04yUe5ZsUQTJqj9PMPJZf8ubOsap0cHxrDiqKFBp8HSVEljXVuvu
         VrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DdaQ9Ro7eprA3Wuc8zIeQF7BsplRDdjZL68QsAhzVKg=;
        b=fj5n9rXwGrBXiQHjJNcUhjNJQcO2tu8535EBIdXfO7+Z+erMtVYYAaTW83yAhYaqm/
         NWKo1N0E5lfyNIAnx+hSDPNJ4VtSDJdnsiHijugJbvScQgaQT0G8rm6LJJ3+1VeLiDzv
         g9vhbGYqTPkJDl6XsxKqkbzfmsa1KFWoMuKPaqgvgJDqMD6zhcXtAOzzfgtT45E5XhS6
         CF8o+iRdkQSOsy893MR+JfuS0PZQA/ySsyKphugv7dbMDi+BFzp/UnvoBPnDj9y0lIpA
         JWKgKh0wbBJtAloqXGwdMlu6WTHLCX6jQla09tfHCYtCiIynf4RFDjyrmVHiQ0hSgBN/
         DVwA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXhd+fb3m5K5JXdL6wT3uRWa1PMFSw0ZFAIicH9OXn9SCT+nqsO
	SexK4AWJ52of8D8nN38AijY=
X-Google-Smtp-Source: APXvYqxjDrOaOJlaoLP8e9Lxby/N4A5un7F+8An656IW8B6JHsNp0KteP0qTdcG4gjkyAwdoNqeXKQ==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr2037091wmi.142.1561619530548;
        Thu, 27 Jun 2019 00:12:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cc10:: with SMTP id f16ls2194946wmh.2.gmail; Thu, 27 Jun
 2019 00:12:09 -0700 (PDT)
X-Received: by 2002:a1c:e90f:: with SMTP id q15mr2081141wmc.89.1561619529932;
        Thu, 27 Jun 2019 00:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561619529; cv=none;
        d=google.com; s=arc-20160816;
        b=kOB6biggYTZenyXIDRZ8HtdCwcRjGCpGEQvU1I/Es1gIf82NAu21ahtUwlwsppEJ02
         Ca2f6if4zABdMVt1DGEuPreZ9mqH/uL2mfNOh7lUiWhq4jdio5cnjISQr1z/o+3rT21v
         WjoZnWyQZWwOUaYzwKstVKsJmWZgZ1DgitGTBWqNgxupEL5i70Z6LcydI+ul+l0UX+HQ
         aOdmwRWm5cUwXfI3gtaH2p4hFutaXWg62nXT2g3OpDOlrL4n5MeWLEb/S0NXwnVWsstl
         9a9sf/mCv89g4m5mMHAFOuCJIgXv9bK1oX7+l2lnLik1Jos0GlBlT8jGQT321lTck1aj
         2Ptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=UtsHPKPgxNx3iAHUiy2JaQy6cKB9ELJMhNsSPPdKIiw=;
        b=d3DqxFtX4ovq4lS1XQ+s5BgZSZ08Y8Bdodym8xDAml72b6XrOeefbRzgBiu4mQ7Kza
         SIiw3b+wqYs4khQSvjpzqvbU8cDPiHHkoghYQK3AweG/E+erDiIFjhHgQEpcCCS/E4hM
         Lp7HQUqnyHYbC91MzJcHKWHFtHME0TSZfEgGi5exTI+bYUBRd1JLAI3ndXJil+8qWhtF
         FMuxRfULG4THQiVfrvl60OB6y/E1GhqMGWby/Lz5WTy1OpH5/gSRTFb7/4+d7rw01dxV
         TP63qZNIVdL+xRV5KtmvjnJZ60k4Q0YOvrFdsrEg2WSKXZ8ef2Vyl7QMTWA9Rtk4AXpi
         Ywew==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v21si201268wmc.2.2019.06.27.00.12.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 00:12:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5R7C9X2029847
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2019 09:12:09 +0200
Received: from [167.87.43.242] ([167.87.43.242])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5R7C8Ak016836;
	Thu, 27 Jun 2019 09:12:09 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <828e6eff-d11c-7364-797f-623d4d41eb4f@siemens.com>
Date: Thu, 27 Jun 2019 09:12:08 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <e46d5280-8add-4900-e084-dbc839fb2b05@ti.com>
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

On 26.06.19 20:06, 'Vitaly Andrianov' via Jailhouse wrote:
> On 06/26/2019 07:38 AM, Vitaly Andrianov wrote:
>> On 06/25/2019 11:50 AM, Jan Kiszka wrote:
>>> On 24.06.19 23:44, 'Vitaly Andrianov' via Jailhouse wrote:
>=20
> [skip]
>=20
>>> Check - when in doubt via instrumenting the calls - if the regions at t=
he=20
>>> faulting addresses are actually mapped -> arch_map_memory_region.
>>>
>>
>> arch_map_memory_region 0x48020000/0x48020000/0x00001000=C2=A0 0x00000093
>> arch_map_memory_region 0x48424000/0x48424000/0x00001000=C2=A0 0x00000093
>> arch_map_memory_region 0x48826000/0x48826000/0x00001000=C2=A0 0x00000093
>> arch_map_memory_region 0x4a000000/0x4a000000/0x00e00000=C2=A0 0x00000093
>> arch_map_memory_region 0xee000000/0x00000000/0x00800000=C2=A0 0x00000047
>> arch_map_memory_region 0x00000000/0x80000000/0x00001000=C2=A0 0x00000023
>> Created cell "AM57XX-EVM-timer8-demo"
>> Page pool usage after cell creation: mem 62/4073, remap 6/131072
>>
>> Each region from the am57xx-evm-ti-app.c are mapped.
>=20
> Using the CCS debugger I started the inmate and paused it immediately on=
=20
> inmate_main() entrance and checked memory referenced by TTBR0 register.
>=20
> TTBR0 =3D 0x00017000

Is that TTBR0_EL1 or EL2?

>=20
> 0x0000017000=C2=A0=C2=A0=C2=A0 00019003 00000000 00000000 00000000 0001A0=
03 00000000 00000000=20
> 00000000
>=20
> Looks like only 2 last regions are mapped (application memory and communi=
cation=20
> regions)
> None of the peripherals regions are mapped, or may be I don't see them.

If we are talking about TTBR0_EL1: Since your old version, imates gained MM=
U=20
support. That means you now need to map additional memory (beyond the first=
 2M=20
or so) into the guest's page table.

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
jailhouse-dev/828e6eff-d11c-7364-797f-623d4d41eb4f%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
