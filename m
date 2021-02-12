Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKNSTGAQMGQEYJ2INNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id B41DF319CA5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Feb 2021 11:32:09 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id m9sf5346587ljp.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Feb 2021 02:32:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1613125929; cv=pass;
        d=google.com; s=arc-20160816;
        b=NzULvMS4l+wQjKM12xuIq0IPZWxDk9G2f+wntPiEto0aiaW+WBxzD9GzDNdpgBO4if
         WKFmBOsShAda6gJ7n2eJ/pxwE238f7C+4D9UEiFuzYlpaRpaExu8J68Z2YJQr2o/HTJ6
         iyjpCo88VVOY5/2aYfAzwHpQAb+1Q4UuuxcHpPBJ665oE1Gn+Pz0asL3uxVGrffndYGG
         Bvq6l/vwZwfjUW9hNbkirTlaUlqmDcRq2E5tKZTi5dlzdZm0dsxEaReRXyJgbNQysAEu
         k8Mgu10nH31kpAvM8pZgshEdxodDz4qu6rf+NqmlsQJYF87ZXlly3IIew4b15bRTImFF
         gSwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=5jpeZsU3Rv5HaHfATfNKe3totze1NmfO6yQixEjIbSo=;
        b=cA4HhiFBdANgFFINY4S+KETEMqs8wYJCZOihUaMLKsbGVypMhvjTr/drAumVzKcLWD
         qFJ9lTFmlejFeEXO/pi+ocCq7j1rcNnVqwT2MQk/XjKlYaaoJMNp7rsX7u4+3SpBTeiJ
         XtnE7ODAJw2cBXbpLv4RGIAJQRf+NBOnRMAGyb/mV5D/mXQmmEjDR2CchtMJXl4/4IK3
         jT2Eox+yM/yDRBtkk0jkrN+RzEp6OHKPFUKH3ErX4XaD8msXcY6z8b6tF4ZRH90w7g29
         JvfAWWLvDo0k2jg2uhXPuiHFFT+eFhuuEUkLVj7bEga9+nsOSg/KvhqMPuv+tWihvjnU
         l3fQ==
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
        bh=5jpeZsU3Rv5HaHfATfNKe3totze1NmfO6yQixEjIbSo=;
        b=FB6pE1qHcQOWHeL8y1BxSNFeJ1UCLzFnKp1GHtUXJrCAdyGZ5Wmn0p4f4eiyC7yneo
         23ee/GE+TMfPc1bTyDEFYNW4YuVC8+k9OaDkEb1SX/j3sTG+pZUWU2LVXRwzbMepfndI
         9I8+QeTjliqv0KZqhnp2pYa+fxQUk9vz4iKVrn98PxYP6R1L5tCwTE32KrpnbRda1tS6
         sdBHBnabfZwzY9f19LI751SDsEt6jF5FRK1gmtc1waZf0C8dehdfT9zSrSRR4Thex7RV
         J5+OTEDEOeh9psGFM+fGMJRQMdHweYbJkuYrJ38wsICEQ9iMdPhkIQx9cbEZU7nomgRa
         oYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5jpeZsU3Rv5HaHfATfNKe3totze1NmfO6yQixEjIbSo=;
        b=axXb6aeatTp6divOWylzF9vAjLi+0PRELeA49XnDr7xz14/7JaZZJ3YLOqadeLeZ1d
         axBjWKcxwWJsIHgndsbeo38QjrVYzpvd0MlY8Y7iWXI6FF64NTkzDOeT7WB2ut9pA0kn
         TH7tOg5aPhoNpumxeRu0meGOEhXEllLjLAWDPmUMj9LOw8W+bEt05i9evrxy0heV3OFp
         wfxrYP6+8yj02sGMeSgPta1c7ODhlk6KsIyKYqXY1gL7snH/zs3G+nzToOgiTHcbmI9S
         DoDEGTEWopDPtXP08Cdlx8i1Mz3kY7SOQb/AfbLoxsCYRPsop+eEfp/PP6BIkuylAlO4
         1teQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OwTgdlXTNA/zjlX8877VOammRKjzhwdNxN2/eUAjNyRewgWSO
	irNCOWdcWuW3oE+Yd23og/E=
X-Google-Smtp-Source: ABdhPJw4v0er3OwJMM1LSYzStGRbg78hL2FAnGYjCg6wdBgoRv53DaTW5smlofT2W9X4HrvthuMX0A==
X-Received: by 2002:ac2:4349:: with SMTP id o9mr1342837lfl.415.1613125929301;
        Fri, 12 Feb 2021 02:32:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:518c:: with SMTP id u12ls172150lfi.2.gmail; Fri, 12 Feb
 2021 02:32:08 -0800 (PST)
X-Received: by 2002:a19:88d7:: with SMTP id k206mr1246626lfd.476.1613125928189;
        Fri, 12 Feb 2021 02:32:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613125928; cv=none;
        d=google.com; s=arc-20160816;
        b=VnIjcRnwh1HzmFgmwR/IGwukBs5BYdqwD1omPl8ImYgXY8WkwldqZiEQ2HEOaTejwZ
         LK+gA1gp/yYFX9WYGzNMoa7UOhidd9ExffAlBSWoGQzKTrxm+5p4tNe6ziqNccyQMtT5
         7DtOLX6kpDlJq/u87VwouvLJGVw0IDO3Q72AOpxeHFHoBkXNZww5WgAMzR15uNtvTdOA
         gDShNhd8vH90p9x0gzFtGGIh+dx5E3F6A4IC+25x9QjRflNd+6aeGI6k5QyQyB8+9L2b
         Mp8ieQ47y9LN6boVGcZxfFULP9kN5OLPMWWXN1ypkgUCqBjS732F6tfUCWHWB1WJ+pr5
         dmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ibZmOapW0b7KE9OHrECKZKVh72IEd8WTCqeX/aK0T2s=;
        b=N1CtvZf/pAtNmzHGgMgjEz1wF8UYCe+7jwla4rbJfhohc1YK2QVj6gSJ1cpnj8VjsC
         OYE9klK1ocm6mOIpc8mbYm+KEhD0lkWestFMCVV2HXamEYLYPuyc6fFWZTTrCRc08OTS
         7vjCXq/dZaE/r8JUkMKcXi/T2RtnCxUy1Ys1CQkCYPHbkILAdLrwE+PH6zpKRxPRiR0k
         TjCsQlzauNtILtIdkGFtbJahCA/lQ976zXQK/xW+GoD8Lh9B+SeVVxkq+BKBCxGIdZUb
         agnsFyuX2D2D4FBAeFmb5GaPjPDmRq5LhXboHTtle+wTa5n7KM+bsyNRH5i/TBNVHRoj
         AL0g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id y3si252208lfb.6.2021.02.12.02.32.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2021 02:32:08 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 11CAW7Kq012063
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Feb 2021 11:32:07 +0100
Received: from [167.87.240.24] ([167.87.240.24])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 11CAR6UY005036;
	Fri, 12 Feb 2021 11:27:06 +0100
Subject: Re: Overflow in MMIO registration
To: Sainz Markel <Msainz@ikerlan.es>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AM0PR03MB4450A4AD70FFBBA0D726D521B68F9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <290f756e-4a93-46f8-0eb6-a15206bdc1d7@siemens.com>
 <AM0PR03MB44507C4040BE5E902027D833B68D9@AM0PR03MB4450.eurprd03.prod.outlook.com>
 <c3dbe31c-29f2-af62-d2d6-9f7d47e8381b@siemens.com>
 <c429c272-3ae2-cdaa-6b0a-96f5bbbe6c1c@siemens.com>
 <AM0PR03MB4450F982DDD1872D12FA09FBB68B9@AM0PR03MB4450.eurprd03.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e4e5f179-ae06-6589-95e5-8f0785c8d09e@siemens.com>
Date: Fri, 12 Feb 2021 11:27:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <AM0PR03MB4450F982DDD1872D12FA09FBB68B9@AM0PR03MB4450.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 12.02.21 10:05, Sainz Markel wrote:
>=20
> -----Mensaje original-----
> De: Jan Kiszka <jan.kiszka@siemens.com>=20
> Enviado el: mi=C3=A9rcoles, 10 de febrero de 2021 14:33
> Para: Sainz Markel <Msainz@ikerlan.es>; jailhouse-dev@googlegroups.com
> Asunto: Re: Overflow in MMIO registration
>=20
> CAUTION: This email originated from outside of the organization. Do not c=
lick links or open attachments unless you recognize the sender and know the=
 content is safe.
>=20
>=20
> On 10.02.21 14:31, Jan Kiszka wrote:
>> On 10.02.21 12:15, Sainz Markel wrote:
>>> On 08.02.21 12:24, Kizska Jan wrote:
>>>
>>>> Something may have caused a subpage MMIO region to be created (page-un=
aligned memory region). If that region split-up didn't exist in the root ce=
ll already, things will fail. But I suspect that subpage is rather a sympto=
m, not the >cause.
>>>
>>>> Where there any compiler warnings when building the config? I would al=
so recommend checking our configs via "jailhouse config check root.cell cel=
l1.cell cell2.cell ...". Or share what you created.
>>>
>>>> Jan
>>>
>>>> --
>>>> Siemens AG, T RDA IOT
>>>> Corporate Competence Center Embedded Linux
>>>
>>> There are no warning during compilation and jailhouse config check comm=
and says it is everything correct.
>>>
>>> #jailhouse config check sysconfig.cell core1-cell.cell core2-cell.cell =
core3-cell.cell core4-cell.cell core5-cell.cell
>>>   Reading configuration set:
>>>   Root cell:     RootCell (sysconfig.cell)
>>>   Non-root cell: core1-cell (core1-cell.cell)
>>>   Non-root cell: core2-cell (core2-cell.cell)
>>>   Non-root cell: core3-cell (core3-cell.cell)
>>>   Non-root cell: core4-cell (core4-cell.cell)
>>>   Non-root cell: core5-cell (core5-cell.cell) Overlapping memory=20
>>> regions inside cell: None Overlapping memory regions with hypervisor:=
=20
>>> None Missing PCI MMCONFIG interceptions: None Missing IOMMU=20
>>> interceptions: None Missing resource interceptions for architecture=20
>>> x86: None
>>>
>>> Attached to the mail the cell files I'm using. The .bin file is the sam=
e as for apic-demo.
>>>
>>
>> Just looking at core1-cell.c reveals that you are neither aligning on=20
>> physical page boundaries for the base nor using page-aligned sizes. So=
=20
>> it is like I predicted. And it is NOT a simple copy of apic-demo.c.
>>
>=20
>> ...and we should likely enhance jailhouse-config-check to catch also thi=
s case.
>=20
> God, don't know what was thinking at... That's working now, cell starts c=
orrectly. I can't see any output in the console, what did you mean in a pre=
vious main with " Hope you do not let all cells use the same UART console i=
n this duplication (PIO 0x3f8 etc.)." I'm now just creating a single cell a=
nd no output is being shown...
>=20

I meant that you cannot hand out the single UART to multiple cells at
the same time. There is no virtualization of this resource. You can use
it, obviously, to bring up one instance of a cell and then disable it
for that cell again.

Connection to the cell should go via ivshmem: ivshmem-net or
virtio-over-ivshmem or something custom.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e4e5f179-ae06-6589-95e5-8f0785c8d09e%40siemens.com.
