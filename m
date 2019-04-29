Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4XSTLTAKGQEKOND46Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 5054FDE34
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:44:35 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id g36sf217722edg.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 01:44:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556527475; cv=pass;
        d=google.com; s=arc-20160816;
        b=TWr38rSrkLvl3Ti6fFUiJXK0VnLYeTu56b/c8H/HNVqP0NwE7ibVnwlovjLtjm970g
         /R5DMxO14yIPHYkFOsBQ/lQ5X4ZvBNUZfNufLJSOYjnK03hCNIrjDViAWe7WnecRSM0Q
         cAs9sAzO/YpKpmwyhhLEDdiJoOjg3ocLfVQe0jDRV8u+L1Ssa9yEbI8GUGY84UFxwVJE
         UpNd3gcE4qYljjLJtk9Rg2uG9AdQwo5m74bwkgJJ1ypUWvOjaCK3qw4ai5Fqwqlmv0pC
         C1s3Po7sNbfFITzU/kalqe1OMkHxYM64qpMA9++zSKBGUGOuG/8a+rgsgkrXqWHzSVT8
         +a7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=d/BrVgm1NigjBX1cBudznvPxhm6TC85VFNarSPFYZJ4=;
        b=QgvGgf6WZutdpga2HPyCYedFcXBRmW6KmKgh221eGTYT09GWJrY0ulw3U8jW6on/WM
         28ExUnoJiL+Kj8tHUKPdxwyPDlWU+qTyj4FPmkBWpQv9YkgVSmZHRgYPnMdAW3xkk14L
         +gZSCgal4GocxggdGr3WFbl3GjSzmdMeX8aZT112ZWP8gEh4Q75vorVbCqQJkuJIq5X+
         +p7f/H0YgjWcPq4RH/idbUKUlSPWCN3knwh5hOa3GkoDfQsWggPL8Wm0n2WzYMz1EgUf
         JRowBzs0Hy3bm4hw4gHlSnco9w0+xD+nHEynBrWvWDWBHMlI7KLNGjotdL0rSxgkCPCc
         c6ZA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=d/BrVgm1NigjBX1cBudznvPxhm6TC85VFNarSPFYZJ4=;
        b=Kjyi38PpBEY5BgPDoCT655PvCo0CJSlihx+ymw3JmLM71uPav22m2dlNr/Cijn5se1
         gDwXKUGmEXniZxuCJwRx2XJe6E1iMupBTy0dYOj3I9f8m/riNx+Nyh3dZ05XDKSOp6Bh
         2ybkpoAiLUn2tx2c3JwVtuPIiiN5MqIUPV6mWjPKW9EyjtaXwzfAwMutjR7Y7UqP+yhj
         BHtYMwvjxxF/AFyZTW2jSgFRYVJiC8PsMY5X0NCRgR56O59vLfTLmysepQbPrPt7M1xB
         AFExaKewoC1ndNvFZ3PYKTwPuRYB3/CprRRpUnwdFpEH9tApV+iLrvpWSLEGp9ee4ZR4
         ln4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=d/BrVgm1NigjBX1cBudznvPxhm6TC85VFNarSPFYZJ4=;
        b=pZUe7u8hcVqRElgl9/Y9RMnfZzbbBgYb2ucGo9iKqvCCFi+R0gArZbbWFT1LLAU7wJ
         qtyK5vCAJqlnwUt5faUQLv3xN53b37OMg40yei4ffY67npI1ZegnPHFwjDOTFbsSYWy/
         rLniIMHUS/gg2T2hyVvLCH7jMgJG8g2us1I+mTfxGaMfQLBd0s/Kzq7GJw7qUYjk9HK7
         wvFZSZ+9TFAp/33NKJQ+FPQctNJ2UEuwutRAxeMpqAMFbr+Ev6KvKycCaYqIdlLSDXsN
         IO2K8ViFDWwM1iN4hfkgviZ0qq5MRqj9/JZ2zZdn5HclU4BBRHsULy5KtALNWxOBqPP8
         TwRQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVBZxSg3sPrRB2gDrqoW+CkxT234ep6v6XYTz72YnMl9THDtGFP
	+jYSiPUM/sTjY2Ov6DGKLQE=
X-Google-Smtp-Source: APXvYqwc4OzMXKCy8zjztJPj8OziR+q6ApAOzkT0rDKX5ztIedXp4hoD5k56UAKreLa/O0HNSuUWag==
X-Received: by 2002:a50:b244:: with SMTP id o62mr37962405edd.224.1556527475066;
        Mon, 29 Apr 2019 01:44:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:6047:: with SMTP id p7ls158377ejj.5.gmail; Mon, 29
 Apr 2019 01:44:34 -0700 (PDT)
X-Received: by 2002:a17:906:e10e:: with SMTP id gj14mr8126983ejb.285.1556527474435;
        Mon, 29 Apr 2019 01:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556527474; cv=none;
        d=google.com; s=arc-20160816;
        b=nHHkdLV8EBpLiB4y/xp9VPztPk+K/pRswloS/64DjnS+w6DsHNwsjOORDfMm8CmA//
         tJ4e7zqyKBJUVQQVyu+1PEUEteasW4Lm75GFDi5a6b5hqr+LRnX61sdX0dIpqFAqxyGm
         Xid8o7hxU6aww2gXW8olob1KF9QKALBj6o9T0u3eXQ3FohLRkw5VHoQOK6+B/u2dKkVc
         eRYd5qndEm/YY7ZjAgeo/agfa1JovvwQKRoSvf1vbvU7b3Dj2EG9IoL3XzGBINgIMB9/
         0AFaTYxpy1GGfeauNwDOKVeU/54+q/TSdDPBXSOxMDyNI++ASkrB+4ub4WxN5WJKMDYh
         t1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=NMvroEY9ki+MeTp+ULYoBQ9sKAWYN/vTKYwxCoLyv4Q=;
        b=ywy1iycn6YYESwiRIHE1Q8QBIfYhtBquY3dxV1EzkB2fvenKuyJnaRcNKaX2Ia8uKt
         58If65LS9gjVB5jVGZ09hkPm5HRuoYYOP8NCpLSK5n28+WFQMEnJyvf49ufBYmpOiOUm
         PcEdlSJ86ABUoYIrXqLXccuLw0oX0JztwQfnjnSgRJGP73n1WiwJHpIJ1aKJ0DLn775S
         2a/lyZZ/dq2XcGSmcNnfsez2Nh3wKZdXEW5GCCSr8IkF8JSxudqSLtq8u+UMPzaBkuvJ
         k9OiBAzdo1v/AvUGcu2nGXb5NM7BkXTLnuBNcVkGAGHIKDmRVO2gjjKhancrR6gd29/c
         0VMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z45si161894edc.3.2019.04.29.01.44.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 01:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x3T8iXhi020716
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2019 10:44:33 +0200
Received: from [139.22.43.249] ([139.22.43.249])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3T8iXMG021248;
	Mon, 29 Apr 2019 10:44:33 +0200
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <6526d7d9-09fb-c25e-0037-628998267794@siemens.com>
 <81bb9c90-1557-47ae-990d-b1bf417a58b9@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
 <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
Date: Mon, 29 Apr 2019 10:44:33 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

On 28.04.19 21:45, Hakk=C4=B1 Kurumahmut wrote:
> 28 Nisan 2019 Pazar 17:31:20 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
>> On 28.04.19 13:18, Hakk=C4=B1 Kurumahmut wrote:
>>> 28 Nisan 2019 Pazar 11:22:30 UTC+3 tarihinde Jan Kiszka wrote:
>>>
>>> Hi Jan,
>>>
>>>> I looked into that code again and noticed a long-pending bug here, and=
 also in the MSI hand-over logic. The effect was that actually no event was=
 generated at all when interrupt remapping (and x2APIC) was in use in the r=
oot cell. Your commenting out of the code above probably just made the loss=
 of the event (and, thus, the keystroke) less likely, but the proper fix is=
 to do the injection.
>>>>
>>>> There are a number of commits in the next branch now that should fix t=
he issue without the need for commenting out code. Please test.
>>>
>>>
>>> I test your last commit with 2 laptop at next branch. (commit d235bde2a=
4738b4cddb1df926a39b8a1e11c0acc)
>>>
>>> I was only changed all pio bitmap values to zero.
>>>
>>> On "HP EliteBook 8460p Notebook", works very well. ENTER keyboard strik=
e was disappered. Root Cell CPUs were not crashed.
>>>
>>> On "HP EliteBook 8470p Notebook", ENTER key strike was disappeared too.=
 But it is generating some crashes. I think they are not related your last =
patch.
>>>
>>> I have installed Fedora 29 Workstation with "4.18.16-300.fc29.x86_64" k=
ernel at "HP EliteBook 8470p Notebook"
>>>
>>>
>>> But I have received below exceptions. Do you have any advice?
>>>
>>> I have attached sysconfig.c, data collection archive, dmesg output and =
lspci outputs for "HP EliteBook 8470p Notebook".
>>>
>>>
>>> Activating hypervisor
>>> VT-d fault event reported by IOMMU 1:
>>>    Source Identifier (bus:dev.func): 24:00.0
>>>    Fault Reason: 0x25 Fault Info: ee00000000000 Type 0
>>
>> Does this one still appear, even if you enable the device only after jai=
lhouse is running?
>=20
> I jave disabled wifi (airplane mode) this error was disappered. I have te=
st disable and enable Root Cell continuously, but new problems are seen as =
SATA based "Invalid MMIO/RAM read" errors. I will study this problem with t=
aking into account your below advices.

Do the problem reappears if your re-enable wifi *while Jailhouse is running=
*?

>=20
>>>
>>> FATAL: Invalid MMIO/RAM read, addr: 0x00000000b9c34010 size: 4
>>
>> proc/iomem reports this as "reserved" but it is still used, likely for B=
IOS
>> topics. Expand the region at b9c7f000 to include RAM down to b88ff000 as=
 well.
>=20
> I will test this situation. What is the parsing rules of /proc/iomem?

"reserved" regions are currently excluded from the generated config. That t=
end=20
to cause problems, so there was already the proposal to add a switch to the=
=20
generator to include them. Currently, you need to do that manually, on repo=
rted=20
access violations.

>=20
> I have a Dell R710 Server. It is need intel_iommu=3Don because DMAR regio=
n does not seeen /proc/iomem. I have enabled it with kernel command so DMAR=
 region is seen under reserved region but parser ignore this line. I debug =
parse_iomem_file() python function, I seen that parse_iomem_tree() function=
 ignoring other than HPET.
>=20
>        if (s.lower() =3D=3D 'reserved'):
>           regions.extend(IOMemRegionTree.find_hpet_regions(tree))
>=20
>=20
> I have attached below code to find_hpet_regions()
>=20
>       if (s.find('dmar') >=3D 0):
>          regions.append(r)
>=20
> Is my approach correct? Because I have received additional errors :)

Sorry, can you describe again what you did when?

Note that, as documented, intel_iommu needs to be on during config generati=
on,=20
but it must be off (except for optional interrupt remapping) when Jailhouse=
 is=20
enabled.

>=20
>>> RIP: 0xffffffffbc04eb25 RSP: 0xffffbb66c0e17ab0 FLAGS: 10046
>>> RAX: 0xffffbb66c0002000 RBX: 0xffff998a76d52000 RCX: 0x0000000000000001
>>> RDX: 0x0000000000000001 RSI: 0x0000000000000202 RDI: 0xffffbb66c0002010
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x00000001df20a004 CR4: 0x00000000001626f0
>>> EFER: 0x0000000000000d01
>>> Parking CPU 0 (Cell: "RootCell")
>>>
>>> FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)
>>> FATAL: Invalid MMIO/RAM read, addr: 0x00000000b9c3f000 size: 0
>>
>> The above will address this, too.
>=20
> OK. I will study.
>=20
>>> RIP: 0xffffffffbc901226 RSP: 0xffffbb66c1d1fe08 FLAGS: 10286
>>> RAX: 0xffff998a47ac5800 RBX: 0x000000000000060d RCX: 0x000000000000060d
>>> RDX: 0x000000000000060d RSI: 0xffffbb66c0d11000 RDI: 0xffff998a47ac5800
>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
>>> CR0: 0x0000000080050033 CR3: 0x0000000218966001 CR4: 0x00000000001626e0
>>> EFER: 0x0000000000000d01
>>> Parking CPU 2 (Cell: "RootCell")
>>>
>=20
>=20
> Thanks.
>=20
> HAKKI
>=20

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
