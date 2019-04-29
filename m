Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBLPYTPTAKGQE5ZXNMRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DEEE3BF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 15:29:17 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id j3sf4828637edb.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 06:29:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556544557; cv=pass;
        d=google.com; s=arc-20160816;
        b=GzAmbHCil5zRjHZTf8Lob/a0kDPcBVTAPuydgw67HX+7t0Rq8Fhtsqt/4YzBwTUgNS
         5C804XiGPKD5iPhiLoM1tP4Pnx0g1yO8CiBwlkZiNAimqSuDdK7gTT4CBuIjkIX98HYl
         bybJ5oeVveqIUFcDtpRnBmTMm3/gGSrYAiYsYm0ZtnxR7kkgsPXAk3IbDNFOMS0NWgTS
         cEwdM7dNxa0bOdsWEoQzUgm91WzNScB0ngQpwCdqJIJA5uWsIiyPR8vqq3NnqEL1cnAb
         Ht9HPi0IC6V1IMxfODzDw4rXof3tsUoql/yUBEFye7MEkYuCjTkqG/jSsy0lhxfE51ej
         ve/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=JRuivXcCl021Z1p3nXk1lhC7xmbRjjG1Tq+iWyC8nJI=;
        b=Yw9ybYTCtsSpTi9Syr1wNyk71vLQhWdof7Cf9jVWt4B83nRVFHjoWZ/nPsHe4AHcWQ
         7AOj6/c0BzvS+6QijPEuKJUWrbAppOIn8EqdxJXuQvliNULKPMMGxd5d+aInrUmCOBqD
         Y8uoeHw4lNzpOavrzu2fgpur4yshWOe5RIdDKgSbL9jm2lOWD/wEd3cEyFWP1FopZEe+
         xZ+4NqSzBH/3/M3qsUVymRss+Be7IappTu5jeroM4G04Zz2E6r5ag998/xe7v1RETq7j
         EhvQ66iR69u84tP8M8D237+HcU+Lwbwlwqxi8xyZblIZOQsDSVfc88bM735Omb15fQ/s
         qDfg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JRuivXcCl021Z1p3nXk1lhC7xmbRjjG1Tq+iWyC8nJI=;
        b=brR/v5x8VyT2WGYvKE/Bqos2HUMZnAwpOdRsHZf1rXrCzIzhLfSO//DE7KJLtQ5/NZ
         y3upA2QBLcUC/51zIlggceDguc5EkKLG12DDXnYm3RCExaDBSl7CwJOTMwv+/tFvo7f0
         dCeHs0IxC4YXMqo6/GeePQWlMUgiroU8HiDyZU+GEYxghrpbYOO0yh7LUKT3DAk8c+i0
         Jn7RI+hJwVfQQjKBVLJPsNtT4/EzAsOM5yFW12tEaaaErx7HHnpxODzw1UMz9VRZtutC
         V2F0ch3zcGFYY/sV72TeOafoeNmu7U84JwFdgxJqWy35K+Bk+n5pApZ+YFaOjvHnpiV+
         GDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JRuivXcCl021Z1p3nXk1lhC7xmbRjjG1Tq+iWyC8nJI=;
        b=e02Ccgl3llH9y0PBT3XTVENEtoD6yOZROM3nWmbZlN23fYfsXzkjmTKUNtnoxBHUR4
         Q5VcSTsscSqb6egJHJxNvq2B0Df4SzH+5lyQgYt9WBpesAvgibhR0IC4EeDwIJm1z+E7
         MmUEjRk0naaNDvK1AWw/wqkNfMSIULU1XQj1zErSgUXsJSgmE52YQJ0dWFSAhdWJJYRy
         JXNDJfO23JSq1YeT4zwjAunvBp/+xLXcVq2fur/YoE2BxC3cfPzJRzw/rGig5tip7hs+
         DHvvQ08NuOZifx4A2Grog7HNU9JrfdMYJKzMPUtkmglCMmdjHF+SMnN7RwbiZv+nvM8f
         oJfA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXrOb1jMOqaQysP8qzQF+pO04n+pn5u76jmvaz/BBZwMLDHpVCy
	46vLD4k6bshB/PqDYgPw2ao=
X-Google-Smtp-Source: APXvYqzfwnXWlFpQfJhH3lu4HaMJQUnU9b03ECA3bpZa46XfWmfMqdJKvaG9r6fuJgNm3TSIdu8b5A==
X-Received: by 2002:a17:906:a4b:: with SMTP id x11mr5466468ejf.200.1556544557305;
        Mon, 29 Apr 2019 06:29:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7b15:: with SMTP id e21ls294665ejo.4.gmail; Mon, 29
 Apr 2019 06:29:15 -0700 (PDT)
X-Received: by 2002:a17:906:d293:: with SMTP id ay19mr169647ejb.92.1556544555784;
        Mon, 29 Apr 2019 06:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556544555; cv=none;
        d=google.com; s=arc-20160816;
        b=dxpG6mMMgLOerUefWRgNS710YdX7CIgUlmmAGn4qFY+yBylyh8GLLP4Fa4PwKyqPeE
         UTDAUfJk86IFC2YxB+f3SaXBUHsPHsFmaxOEUjuEJjc73ad9waMQSWMndpFKdpWTnGyw
         Abf7uX9Dy1aVnixfEIX58nkOevHeugWwIDmJEwpEX/8OwDu81Lpn8audy4azrdmaTCWE
         IeduVKOiPE3VxwS2go1nGjQuo5QnEbmFxyzCLhQOjbjZsbu4sphVQSweYbNBER11+S08
         8/WQlOFfHKZPVd8WN3/zgsD/bxIgXGUnR63IWQjunoREvC5ubMv3DWVyEMHc44wpJlos
         MugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=3gyH/6pd4KupJ9pB7GZr9Vv6D6gEVc6dS1IpaTvEB90=;
        b=raHJOv07eASonyfb/TOlCEZtbrn9dtnDX2yNdNgCyNsCuTFmwIJv8SoJjpYEW/ubz8
         CmkoTuaEC2jOfLFzUeMy27EFRv1UBFDIXsBBlrqJz2LCSajHIoxJlWqmmCIg84NKlz31
         pYTvXFFmiiaUjnlQwU7Z1X/bSv2q1kodGO205j+blBVZJs1OQIhLEZCJHlgIL4DpwtOc
         8jkKcWcxODb+BXDpoZclLcbakLH0qgdaF5AQNh049EQZehR0g+FBJmbUCvsM2HcBN2sJ
         ESIQWwiU/4pYFgfS8Zq1rJdGKjykaKhTk2OUu1c1RKnq917qB8JEdBBcVnpcKqAlR6oz
         px7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z45si203444edc.3.2019.04.29.06.29.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 06:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x3TDTFN8028766
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2019 15:29:15 +0200
Received: from [139.25.69.165] ([139.25.69.165])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x3TDTFXP029843;
	Mon, 29 Apr 2019 15:29:15 +0200
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
 <8ef112a9-2f0f-9205-3e67-f0c6fed498ba@siemens.com>
 <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <eea40cc7-543e-cd7b-beee-afc9affc477a@siemens.com>
Date: Mon, 29 Apr 2019 15:29:15 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <3cb885a7-8b66-42b4-adf2-6fc98375efa9@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 29.04.19 13:55, Hakk=C4=B1 Kurumahmut wrote:
>=20
>>> I debug Dell R710 Server new errors. I tradce  vtd.c file line 1063
>>>
>>> It is reading "Global Status Register".
>>>
>>> Read value 0x84000000
>>>
>>> 31 bit : DMA remapping is enabled
>>> 26 bit : queued invalidation is enabled
>>>
>>> "queued invalidation is enabled" root cause of the problem.
>>>
>>> Do you have any suggestion? It is not supported by Jailhouse?
>>>
>>>
>>> As noted in the other reply: Turn DMA remapping off (intel_iommu=3Doff)=
, but you may leave interrupt remapping on because that enables faster x2AP=
IC mode.
>=20
>>> Note that, as documented, intel_iommu needs to be on during config gene=
ration, but it must be off (except for optional interrupt remapping) when J=
ailhouse is enabled.
>=20
> R710 server problem is solved by this method. I have not find any documen=
t, please can you share a link. Thanks.

For the runtime needs: README.md, "Software requirements"
For the config-time needs: That is indeed not documented, only indirectly i=
n the=20
form that the parser will refuse to work if it's off.

>=20
> Some regions of config creator have changed at every restart, so this met=
hod needs some manuel correction at result config file.
>=20

Which regions? Could you send an example of two successively generated but=
=20
different files?

>=20
> 29 Nisan 2019 Pazartesi 11:44:35 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
>> On 28.04.19 21:45, Hakk=C4=B1 Kurumahmut wrote:
>>> 28 Nisan 2019 Pazar 17:31:20 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
>>>> On 28.04.19 13:18, Hakk=C4=B1 Kurumahmut wrote:
>>>>> 28 Nisan 2019 Pazar 11:22:30 UTC+3 tarihinde Jan Kiszka wrote:
>>>>>
>>>>> Hi Jan,
>>>>>
>>>>>> I looked into that code again and noticed a long-pending bug here, a=
nd also in the MSI hand-over logic. The effect was that actually no event w=
as generated at all when interrupt remapping (and x2APIC) was in use in the=
 root cell. Your commenting out of the code above probably just made the lo=
ss of the event (and, thus, the keystroke) less likely, but the proper fix =
is to do the injection.
>>>>>>
>>>>>> There are a number of commits in the next branch now that should fix=
 the issue without the need for commenting out code. Please test.
>>>>>
>>>>>
>>>>> I test your last commit with 2 laptop at next branch. (commit d235bde=
2a4738b4cddb1df926a39b8a1e11c0acc)
>>>>>
>>>>> I was only changed all pio bitmap values to zero.
>>>>>
>>>>> On "HP EliteBook 8460p Notebook", works very well. ENTER keyboard str=
ike was disappered. Root Cell CPUs were not crashed.
>>>>>
>>>>> On "HP EliteBook 8470p Notebook", ENTER key strike was disappeared to=
o. But it is generating some crashes. I think they are not related your las=
t patch.
>>>>>
>>>>> I have installed Fedora 29 Workstation with "4.18.16-300.fc29.x86_64"=
 kernel at "HP EliteBook 8470p Notebook"
>>>>>
>>>>>
>>>>> But I have received below exceptions. Do you have any advice?
>>>>>
>>>>> I have attached sysconfig.c, data collection archive, dmesg output an=
d lspci outputs for "HP EliteBook 8470p Notebook".
>>>>>
>>>>>
>>>>> Activating hypervisor
>>>>> VT-d fault event reported by IOMMU 1:
>>>>>     Source Identifier (bus:dev.func): 24:00.0
>>>>>     Fault Reason: 0x25 Fault Info: ee00000000000 Type 0
>>>>
>>>> Does this one still appear, even if you enable the device only after j=
ailhouse is running?
>>>
>>> I jave disabled wifi (airplane mode) this error was disappered. I have =
test disable and enable Root Cell continuously, but new problems are seen a=
s SATA based "Invalid MMIO/RAM read" errors. I will study this problem with=
 taking into account your below advices.
>>
>> Do the problem reappears if your re-enable wifi *while Jailhouse is runn=
ing*?
>=20
>=20
> When wifi re-enabled while jailhouse Root Cell is running, I have not see=
n VT-d errors but sometimes I have seen linux hangs again. I thinks it is a=
bout MMIO problems. I will discover it.

Yeah, the hang should be correlated with potential messages of Jailhouse to=
 see=20
clearer.

>=20
>=20
>>>
>>>>>
>>>>> FATAL: Invalid MMIO/RAM read, addr: 0x00000000b9c34010 size: 4
>>>>
>>>> proc/iomem reports this as "reserved" but it is still used, likely for=
 BIOS
>>>> topics. Expand the region at b9c7f000 to include RAM down to b88ff000 =
as well.
>>>
>>> I will test this situation. What is the parsing rules of /proc/iomem?
>>
>> "reserved" regions are currently excluded from the generated config. Tha=
t tend
>> to cause problems, so there was already the proposal to add a switch to =
the
>> generator to include them. Currently, you need to do that manually, on r=
eported
>> access violations.
>>
>>>
>>> I have a Dell R710 Server. It is need intel_iommu=3Don because DMAR reg=
ion does not seeen /proc/iomem. I have enabled it with kernel command so DM=
AR region is seen under reserved region but parser ignore this line. I debu=
g parse_iomem_file() python function, I seen that parse_iomem_tree() functi=
on ignoring other than HPET.
>>>
>>>         if (s.lower() =3D=3D 'reserved'):
>>>            regions.extend(IOMemRegionTree.find_hpet_regions(tree))
>>>
>>>
>>> I have attached below code to find_hpet_regions()
>>>
>>>        if (s.find('dmar') >=3D 0):
>>>           regions.append(r)
>>>
>>> Is my approach correct? Because I have received additional errors :)
>>
>> Sorry, can you describe again what you did when?
>>
>> Note that, as documented, intel_iommu needs to be on during config gener=
ation,
>> but it must be off (except for optional interrupt remapping) when Jailho=
use is
>> enabled.
>=20
> Patch is attached below: (for jailhouse master branch)
>=20
>=20
> git diff
> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
> index 46c95fc2..6d36f4fb 100644
> --- a/pyjailhouse/sysfs_parser.py
> +++ b/pyjailhouse/sysfs_parser.py
> @@ -860,21 +860,24 @@ class IOMemRegionTree:
>=20
>           return root
>=20
> -    # find HPET regions in tree
> +    # find HPET and DMAR regions in tree
>       @staticmethod
> -    def find_hpet_regions(tree):
> +    def find_hpet_and_dmar_regions(tree):
>           regions =3D []
>=20
>           for tree in tree.children:
>               r =3D tree.region
>               s =3D r.typestr
>=20
> +            if (s.find('HPET') >=3D 0):
> +                regions.append(r)
> +
>               if (s.find('HPET') >=3D 0):
>                   regions.append(r)
>=20
>               # if the tree continues recurse further down ...
>               if (len(tree.children) > 0):
> -                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> +                regions.extend(IOMemRegionTree.find_hpet_and_dmar_region=
s(tree))
>=20
>           return regions
>=20
> @@ -903,7 +906,7 @@ class IOMemRegionTree:
>=20
>               # generally blacklisted, unless we find an HPET behind it
>               if (s.lower() =3D=3D 'reserved'):
> -                regions.extend(IOMemRegionTree.find_hpet_regions(tree))
> +                regions.extend(IOMemRegionTree.find_hpet_and_dmar_region=
s(tree))
>                   continue
>=20

This will cause DMAR to be mapped into the guest - that's a bug! DMAR is un=
der=20
Jailhouse control while it is running, thus the region is not mapped but=20
accesses will be intercepted by the hypervisor.

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
