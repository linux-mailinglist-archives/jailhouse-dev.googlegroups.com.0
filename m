Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBPXD6LWAKGQEBHRNCAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1C1CFE34
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 17:56:46 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id m81sf4408845lje.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 08:56:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550206; cv=pass;
        d=google.com; s=arc-20160816;
        b=ixz3TO2bqXB9bDi/ne7l+7ZeTwAY/G46PR2nDdt5ttHCHXwBDDdKVinPiLO8bKCVYJ
         Eew853e48HgzyA/3vauwELvzTKfHU8HAT/sJFXG/wb7vRiJoSznMSOTvBn1+Xpg8QsQg
         6FQuP3bUWoVPZauY1qppG2X8MCYVHAayMNAXIBBCk0ng2L9Gb90kkY9Q7ne/zf2JK1Zt
         AQx4IqvEvZtrvYrGNzlJpLL6y5rDkyq1d6BTKOa1pKpM5PTXIdZHTGquClkTErBuyx+L
         Mw8wZEDII3PzBef/kSo7xpXultUVtvgp99xPJOV2QMLn6/AeRHp8qNLAtMq1HrC4dIUb
         qo/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=aR7JmRfoUU25O4NnlQwE4e6mz3R7N3tUnoFkSH88aAg=;
        b=VWNI9gYfK41EikwJXSMafGj5RT+O8Ys4rJwteF5HuwSnURseObMjavSURj13QSq3vL
         my4sp4kuOcvCJ+7qXUjnNQirMxGIqljJGtQr1pwtnhQShtNeqPnJfCitwoIOx1qKlbB5
         uuoV8cDQMf0DglmYh2v5xSbQngkNuzvrznuvoKksafn7gMljH03KHsEpitKDRvZTo0sK
         gSlJTuA8TbeMdQX/PSimMe8Ok94kFS4z9kZ1DZXwVEYvMXE9XzPKcnjHTX7XMSPxGwPE
         ow17RaVNf/ogoRmm/WfsPPCiGPBkd8rFImZzgK2Pde5loYfNe4WVWsFKJMKnjdHmL45P
         Fe+w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=cv5KvFH5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aR7JmRfoUU25O4NnlQwE4e6mz3R7N3tUnoFkSH88aAg=;
        b=DAGNihpExN37dhTToUtfbq+vYOgOD7vd5hBHH7xCADztWznc4UTTJAt93iJKMBA2qD
         pA8itzd1wMHRwePQvF2bwht4kk0vtdtz1OQQI/R1sa+gzCRgouzF70u1E05F4U3rX1t5
         MXg7F+UyNu9Mu8tkI2YQqaavTZlSpWBPL3mhV7rcPpFhhHqnFqsZmLvpJ2psqXreV9rf
         AtECsOGAiwz09Zxtg4/h48VpFIX/uNi3TxOul8WkM6niPy+QMvbLGnghX4SyTE3tfhzD
         J3jZbkRPMKCiEz9mO6pNYyZv7CM+AD33rb4W8spL1ZhZVJGQAPX1unqgn5axSXiWIr4h
         xLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aR7JmRfoUU25O4NnlQwE4e6mz3R7N3tUnoFkSH88aAg=;
        b=F1kPGB9/e2TWyxfQcL8VzE8/AliOBZ24lX4BLkrY7p+xLZ9jF8fB0eb9AyYCqW3NX4
         rOodxoYcCRmMAaRJEvhUSNOvKEUNF/X2JKT2je/t7RlQ8s6FwX2T/YJaRdHWv/75dIjy
         9GsKJAUp3wTK884FsbJ37tFRUxJYpTYK6tKZIIOc9IHYSOaRj/WQBYCKGwr6JCe2cdEl
         L9ZAdl6oVNvCS0uJXj6ZYJhce7rYL4qVQ0s7524ueoMWK7Jk3W0Lb6aAUZwsJDAppH9K
         lcLxWHPe9eHQ7nYcnokAwleMbEaijXztAso31qLdvWf98lz5XtQvSJhVD3Hq7ShJ7Nae
         f7cg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWsuNBpIjR4eEFCmd1s2waF6bLVkCF0pXSmYfEhKPtCQI4wqj3R
	7WJ2R1knKZBqplH9F47sy4E=
X-Google-Smtp-Source: APXvYqxUEJ1+fnkcPo0d4qyHbWBuhDh3FeXaPr0tBgFdyoCu+V2Bd6zcfMYbFdNG4RK1lerorGh57A==
X-Received: by 2002:a19:c6d5:: with SMTP id w204mr7046027lff.53.1570550206562;
        Tue, 08 Oct 2019 08:56:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9450:: with SMTP id o16ls533620ljh.16.gmail; Tue, 08 Oct
 2019 08:56:45 -0700 (PDT)
X-Received: by 2002:a05:651c:229:: with SMTP id z9mr21892466ljn.206.1570550205343;
        Tue, 08 Oct 2019 08:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550205; cv=none;
        d=google.com; s=arc-20160816;
        b=yt54M5katKMgXCQNxe8An+qTuq6Zb8Cyk9zpmsJGDn90qVJ/ts/vHWgvbNun5CQyhB
         RJGlVQbtbN5i9P6+hACcL7h9W4Kan08UcQSao0yfZQ/BIH0eAo/zgouNTYcgX8CzwB+7
         7gjiDC05iWquSGRadE5eBa5gNvZJKIDBi3iqZdjXuCW0MznSQPajMwfCOxIGGWruroE+
         27GqPPdCH4yaO3l4qbLG7VbFaQFrt0d8M3swet95np3n4cjH1WhGMkbWPITw591ltMyj
         qqH93aeEfIpMzIPvS3F1GCEhlwobxrl9z6wnKtiKcXqoBH4Z+5wEcNPE4b56KS8GFJIJ
         0aUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=hx51RiT2Z7ekW68x44QMYgO9pXXgto1K8AwNfrFFTRo=;
        b=VdVBgXgwGjp4becEQuyrqXkFUQamSr7H58OYXMvIrbGohdfhvwkbJ2GtiKugunRh84
         aKpk8BZV52AYq8ynnrmdxuu8IpKGwfTTuyTYrUi7fi4lVNQqs1ZSRP93H2ONUjv07lFr
         qche4ED0aLYjB6xjHofdrrlczsYqdFwOLJ8CYfaOu3FrjqpQHuNxBPqyZh74oIHceUhZ
         LbdLnLIEuQ6MYPfefcPQaczm8yEP+BSA/7gSGJJjBNgxfdEpidOW4b8qrnEivXDLNjCC
         NXvVSpgjrJFL6Hi4p4bswHrCyBDV/KxV/FDG1tcSBVy6LWasmrHAfq8YrLhm6w0+Unn0
         7YDw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=cv5KvFH5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id z4si1408630lfe.4.2019.10.08.08.56.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 08:56:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46nhmX4TxSzy9v;
	Tue,  8 Oct 2019 17:56:44 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 8 Oct 2019
 17:56:41 +0200
Subject: Re: [PATCH v3 04/14] pyjailhouse: sysfs_parser: minor stylistic
 fixups
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-5-andrej.utz@st.oth-regensburg.de>
 <606abee9-5e5a-8add-062c-7a00833de34a@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 mQINBFFbFOQBEACuc/5RqBxcHJiMjuQo4cUit/whIFgjcorx77z/srj/Cn5mKnWMLgmhszFC
 nzrgLw+1KewrJ/+qcrJKmX3Dw58VaktfjV0QUEnPmQXND3PUIE4Bl01GZ4Z/NKtaavdTWPTH
 wKzjbDucCzYKMBEYT3AMQRwQLNBF7VboV1T2fy+J505P9LP649c/Ept5vAsFH/3k2YpVVYcf
 Xpxk7ZxxBa9Xj9jMkoEGK8YPj0bHtrjrtG+fDuQRdv4gVwdY+HdalLQXCzYVPEnA/w3kD69A
 tPVuJOK61hJz6rS2n5ByzFLitLB8Fe940AI3wy4Df2pB2UFnD51k2Cg3HKi5HqH4Mpsieixq
 m/pd37SoPwQoTeVX+ASeUNl2CibSi78IsbHnZBKMKfdlSCzqogRWGcZPivKIL0vQDpzSSn4C
 hiRNiTXLH7lhfIhlH/MgmjXanhYDVLzQNhIEYF2Op2XN0HeYD/aFHQxhQQNxvX6aEDj7t0aS
 fAmyULXq1DX+ttI9UY65hcdvQQHUVCNF+87Sggu4x1q8/cxDkdpRlCqdmEigXF7nHkbsOVq8
 T8B1j+Y2cGIU/ivyMO+pqEQm3QOWKBC8ndm49lCgxltsEL5Bd4j4dF08QCcWFVbF9cWb2obT
 KcHX3Vm+1zKz2HLR9gBZiEPjNoP9riVz+81ECNk42w9874pmLQARAQABtC9SYWxmIFJhbXNh
 dWVyIDxyYWxmLnJhbXNhdWVyQG90aC1yZWdlbnNidXJnLmRlPokCVAQTAQgAPgIbAwULCQgH
 AgYVCAkKCwIEFgIDAQIeAQIXgBYhBO+AJoipr99tPvqviPovtFKPEASbBQJbE/G6BQkJui5W
 AAoJEPovtFKPEASb3iAP/jhdGSwc91Jf+kcOKaWe40dFQn2bjFhoYXuD16AYoBHBVNNOFYW6
 ikYyAUFOMaWBvUBUu4eyFwPY8ewr7sXoH5RqheQc7bvtX+2lxI3dLbcDMlp2Apj1NVFUKNAy
 VKjPpWNNdR+iz6JVar/QUye++5WOaJ2Jdgc/AIfBAWZyBcrg16um8hb7TMX5++7OtEUVOSz6
 L9bZkp6S/E6WgnIturQDEcmvxGJjwZKsLMlFNhasex3fzRE8vVq2JONi/gGfso7EQx7jdYNH
 z9BkdSlhL2agtMhmBygRs8L6TXU/V5sv4UD7+BiEINDEJTPF9OAX44MCXslGmGn0Kltvf2vC
 NGfsmcSVcsiptRAvrafxCUW8CqgwGLeuJi/qLKF3oRYjvVYMxpBsqQLIksYrPxvMOXgh2uU/
 JJgxnS+spAh+33uqWLP00CmOT06WNwSY6k3WSYfA5EvsLCsrrmO8NOIUjMC8pLqiEFgXgw6M
 CANKNJN23Aapo+rPF+kHvnMR/YFrgapJn3VGrG5lELovqGyqc7afIgiiEMSUY1zcJ9VlS0Z4
 OvbTjvPYy4tb8aGgMQ6cmsqiaIpHFZ2UJtk4R5asCmwIkbVWQLxvNlX9J5bXr/PHU0UlYJYB
 mp34WgKNwgwyso67v0GZDKJyaBMvk7alZEOKGWcMKEE6Pr3ByURudR8w
Message-ID: <0c40baa8-30bf-d60f-d8f2-860db42ff7c2@oth-regensburg.de>
Date: Tue, 8 Oct 2019 17:56:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <606abee9-5e5a-8add-062c-7a00833de34a@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=cv5KvFH5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 10/7/19 5:59 PM, Jan Kiszka wrote:
> On 30.09.19 21:13, Andrej Utz wrote:
>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>
>> The sysfs_parser is written in python and not in C. We can save some
>> parentheses.
>>
>> No functional change.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  pyjailhouse/sysfs_parser.py | 29 +++++++++++++----------------
>>  1 file changed, 13 insertions(+), 16 deletions(-)
>>
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index f65eacc8..464b6a80 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -125,7 +125,7 @@ def parse_iomem(pcidevices):
>>                  append_r = False
>>                  break
>>          # filter out the ROMs
>> -        if (r.start >= rom_region.start and r.stop <= rom_region.stop):
>> +        if r.start >= rom_region.start and r.stop <= rom_region.stop:
>>              add_rom_region = True
>>              append_r = False
>>          # filter out and save DMAR regions
>> @@ -141,7 +141,7 @@ def parse_iomem(pcidevices):
>>  
>>      # newer Linux kernels will report the first page as reserved
>>      # it is needed for CPU init so include it anyways
>> -    if (ret[0].typestr == 'System RAM' and ret[0].start == 0x1000):
>> +    if ret[0].typestr == 'System RAM' and ret[0].start == 0x1000:
>>          ret[0].start = 0
>>  
>>      return ret, dmar_regions
>> @@ -835,7 +835,7 @@ class IOMemRegionTree:
>>          kernel = [x for x in self.children if
>>                    x.region.typestr.startswith('Kernel ')]
>>  
>> -        if (len(kernel) == 0):
>> +        if len(kernel) == 0:
>>              return [self.region]
>>  
>>          r = self.region
>> @@ -846,20 +846,20 @@ class IOMemRegionTree:
>>  
>>          # align this for 16M, but only if we have enough space
>>          kernel_stop = (kernel_stop & ~0xFFFFFF) + 0xFFFFFF
>> -        if (kernel_stop > r.stop):
>> +        if kernel_stop > r.stop:
>>              kernel_stop = r.stop
>>  
>>          before_kernel = None
>>          after_kernel = None
>>  
>>          # before Kernel if any
>> -        if (r.start < kernel_start):
>> +        if r.start < kernel_start:
>>              before_kernel = MemRegion(r.start, kernel_start - 1, s)
>>  
>>          kernel_region = MemRegion(kernel_start, kernel_stop, "Kernel")
>>  
>>          # after Kernel if any
>> -        if (r.stop > kernel_stop):
>> +        if r.stop > kernel_stop:
>>              after_kernel = MemRegion(kernel_stop + 1, r.stop, s)
>>  
>>          return [before_kernel, kernel_region, after_kernel]
>> @@ -907,11 +907,11 @@ class IOMemRegionTree:
>>              r = tree.region
>>              s = r.typestr
>>  
>> -            if (s.find(name) >= 0):
>> +            if s.find(name) >= 0:
>>                  regions.append(r)
>>  
>>              # if the tree continues recurse further down ...
>> -            if (len(tree.children) > 0):
>> +            if len(tree.children) > 0:
>>                  regions.extend(
>>                      IOMemRegionTree.find_regions_by_name(tree, name))
>>  
>> @@ -934,15 +934,12 @@ class IOMemRegionTree:
>>                  regions.extend(tree.regions_split_by_kernel())
>>                  continue
>>  
>> -            # blacklisted on all levels
>> -            if (
>> -                (s.find('PCI MMCONFIG') >= 0) or
>> -                (s.find('APIC') >= 0)  # covers both APIC and IOAPIC
>> -            ):
>> +            # blacklisted on all levels, covers both APIC and IOAPIC
>> +            if (s.find('PCI MMCONFIG') >= 0) or (s.find('APIC') >= 0):
> 
> Why are you keeping the inner brackets here?

I wasn't sure if python operator precendence might misinterpret it as

s.find('PCI MMCONFIG') >= (0 or s.find('APIC') >= 0)

Just checked the operator precedence in python -- we can drop the brackets.

> 
>>                  continue
>>  
>>              # generally blacklisted, with a few exceptions
>> -            if (s.lower() == 'reserved'):
>> +            if s.lower() == 'reserved':
>>                  regions.extend(
>>                      IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
>>                  dmar_regions.extend(
>> @@ -950,8 +947,8 @@ class IOMemRegionTree:
>>                  continue
>>  
>>              # if the tree continues recurse further down ...
>> -            if (len(tree.children) > 0):
>> -                (temp_regions, temp_dmar_regions) = \
>> +            if len(tree.children) > 0:
>> +                temp_regions, temp_dmar_regions = \

Will re-add brackets here, and in all other patches.

  Ralf

>>                      IOMemRegionTree.parse_iomem_tree(tree)
>>                  regions.extend(temp_regions)
>>                  dmar_regions.extend(temp_dmar_regions)
>>
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0c40baa8-30bf-d60f-d8f2-860db42ff7c2%40oth-regensburg.de.
