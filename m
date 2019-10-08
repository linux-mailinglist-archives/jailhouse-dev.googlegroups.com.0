Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBTPD6LWAKGQEZRPAIEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8BECFE36
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 17:57:02 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id o188sf1587075wmo.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 08:57:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550222; cv=pass;
        d=google.com; s=arc-20160816;
        b=SAu1UD4cI0OO4SSUTpUv11F2/YP6mS45qEkRcgDoUsqDU3rYec+u3fs4i8Y9GQwn0f
         r5qn4+0cGlptRhYfHALpfc8EHwkSEjMcQxvDm10McScm9i7vXVEXUlmvVM9YJHRH4Rub
         XABPRxXj9GkA6XWq2eEZIq8Cey6TgQO+UUFsE2PMhxzio+x/wD5thSxVsZgq0TzALFAC
         OjOI/dzMdLKLXDwZFISFi2uXXsP7GVGxmsneZ71a+1K5o/ZE5fb6QcrnOC/c+5JJO+re
         vKuPResSXID7roLLYXytpQCMtOYE/ltxCAITpH03u39v9DprjrX/ULGrDtFZf4s+Yaz4
         EdsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=YLE07wnnmiTXYaDsAnzU7u4Z1OoLaxrJ+ezoOesGhus=;
        b=Lf9++G2gjzBZlb60FHN7+6c4bTt1So41Thx73DvvJSWJyBcWHzU8T9lJY2db3W9jfP
         LIP7nsvSqbqTkMJSae4kbN1HDj59Qcisne4VpsdpkrbtVk4tCfAt1oHR1vZ89yl0oCex
         qMbQIfnUK/KCLAEx1t1zEyuUuTrIrwOqMBfuLgmhLdn0WSJDqFGvhixO21qaLQX2MZRU
         M4oTUxxlugfzKQVE2arSDYAZhPhqM7XEKE8IzbLWnWRTZj2XjM/GD3VkiTV/QaVCCOt4
         1g5DNzemxorFjjmz78d807YCROyfRnLH1jRLHBYwkFHOsxl5aDz7HUWKVfIt3BroARY0
         VHCg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=khfjnTAK;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YLE07wnnmiTXYaDsAnzU7u4Z1OoLaxrJ+ezoOesGhus=;
        b=kzg+9U2Q05wWjyVB9fY14heleqByU7U1rQjwMN3mcWNME6v8jX2nFNECXYQb7QdEJH
         h/rmrotpZxLEwHLn2kR35c0RiW9gIwIsbvPHSxKix1txckziS90pgRlS8HFhrJqLc6jg
         ay1c+1Riz89qQA88W8lzQXf756xhI+GPBijRqCAMPFJC93lBeq7vtCwVsHXXr4xr/nN6
         DIMoXApXgqunM3WtFRFqI7jNkPD1LNDnqlDAqoDooMQXFVNLsuigZrWUAcNAF1I30m59
         lHB1vbxNIayso3jqghHv9BUxCDSEi3UqmG4ujfAs1d2sH4VWL1EEcbgVZi2OsX6tD38B
         mf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YLE07wnnmiTXYaDsAnzU7u4Z1OoLaxrJ+ezoOesGhus=;
        b=t8cMNYrkvEH14jHD854Xc77CBDJ/kYx6/yJOJaOH852yKwXX6DbnjvhMleWigknqxO
         1NBQgyNRoQTvbOM++Z1gV0ajqCNU2l4kwGOnQO2L+QzuCenmTIZlY6BCr4teVwJV+e84
         pKjyS8khj8WOA3gyPKG9k9E4MBkVLMJ8MOX97xUtd0TlbYv92ivhs8RlIBHNyeccwdJ6
         NVt/1ab4NCf5HbIu931d24pmsHt19d9XYeFkKtsTVMASTrrH55TQ0PGeKyVzM8rJdgBO
         4kVVCRszSRuF/nE12hgwwskcIjEu1wIHZpO9KZNkRMfdCTU3L5reumA/5tbI/+uH+UhG
         a0yQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUrdyN/P3gqZS8hTTY6z6fRZgd3uO2mWlD+zv6A04l/eGjRT2wW
	lhSwOtkHOllFX7THhXeMrig=
X-Google-Smtp-Source: APXvYqyhqSu9o44OeL4U6obUk0lXtiFij1yF1BVC/ySxX9Wur/ZWGKzdD6dvFHzL1OyiChS8GPaaig==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr4552805wmk.52.1570550222144;
        Tue, 08 Oct 2019 08:57:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fe43:: with SMTP id m3ls1325894wrs.4.gmail; Tue, 08 Oct
 2019 08:57:01 -0700 (PDT)
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr28758580wrr.64.1570550221525;
        Tue, 08 Oct 2019 08:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550221; cv=none;
        d=google.com; s=arc-20160816;
        b=yUb3wV/fAUqnZWSQImO9su6OfFSDtCkwyH/nBEEAuRL3XhJODrSxa/n4LLaJy8EpQH
         b7YZukKMiJXDKx9dMQjPWwBjjeYztABNNoR13a/6aaZduI985Tf2iz3fq6ruHPlE0PiT
         5p7gGw+DCg3BUATQzt8IEryhzi+QzDdRJGEVxJPuD7AFZzBOHSDJuIgmW89r8KEag8Xq
         w1iJ256Eb5zGAGxFKIx3fvW76S/rS5pqc2fCCZERsXBoziw1c5VHwOZKFsg8RSyfjitS
         RF/z2E8lIecgq/YGZOfC287JorGyyAJ2P0PNPlvF6sf1ogtQEyFP4lyXY3UlbrRQkI9f
         ON5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=qTFxWBZ+Y/HEPCuUB3f91uMeuWjFPne80gKC3R3BGqM=;
        b=B1F6RzhqP6nS7WVy6ZRIFH7TX4lp+XZJr0WpEbO5L1pNf/FW0rYDffQHVUv1Et+WIO
         6BRz/Vc+YrkF/f8Ec0kIIY06zJbaNSp/eZvTIk3F4ui/zDFJVyVY/IFbORNuSZlVMfwl
         rUNO2ehWSxVKm34fsQYy1RL1Z8lptwgKCr/qM1qcjARDN8+dbr//V6SUFjYI4jbimL1S
         zigvtncyp1t14rPUkCqNKAqhTRHJoVTCOfDdw3/aOV6d//4n5Tx+F4PfodKLxf0gXoD0
         biTh5Gydvnp/IUq9ig4Md7CMrBZYg5kkqVFhrGQtVpjwCK7wjGUTDnWYGhlIQ6hXMWWR
         Eaaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=khfjnTAK;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id x8si326093wmk.2.2019.10.08.08.57.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 08:57:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46nhms1W4fzy9p;
	Tue,  8 Oct 2019 17:57:01 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 8 Oct 2019
 17:57:00 +0200
Subject: Re: [PATCH v3 11/14] pyjailhouse: sysfs_parser: move
 find_regions_by_name to IORegionTree
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
 <20190930193857.2866-3-andrej.utz@st.oth-regensburg.de>
 <8a2c4fd1-fa38-b0bb-1665-64ddb1bf5255@siemens.com>
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
Message-ID: <e0c005f0-40a3-f72c-760b-3213c4938c76@oth-regensburg.de>
Date: Tue, 8 Oct 2019 17:57:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <8a2c4fd1-fa38-b0bb-1665-64ddb1bf5255@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=khfjnTAK;
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



On 10/7/19 6:29 PM, Jan Kiszka wrote:
> On 30.09.19 21:38, Andrej Utz wrote:
>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>
>> We will reuse that function, move it to IORegionTree.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  pyjailhouse/sysfs_parser.py | 42 +++++++++++++++++--------------------
>>  1 file changed, 19 insertions(+), 23 deletions(-)
>>
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index d2b36876..3027f82e 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -831,6 +831,23 @@ class IORegionTree:
>>          self.parent = None
>>          self.children = []
>>  
>> +    # find specific regions in tree
>> +    def find_regions_by_name(self, name):
>> +        regions = []
>> +
>> +        for tree in self.children:
>> +            r = tree.region
>> +            s = r.typestr
>> +
>> +            if s.find(name) >= 0:
> 
> I just wonder if we intentionally matched on anything inside s. Or if we
> should match on the beginning.

I asked myself the same question when moving the code around. In doubt,
I would say to leave it as it is.

  Ralf

> 
>> +                regions.append(r)
>> +
>> +            # if the tree continues recurse further down ...
>> +            if len(tree.children) > 0:
>> +                regions.extend(tree.find_regions_by_name(name))
>> +
>> +        return regions
>> +
>>      @staticmethod
>>      def parse_io_line(line, TargetClass):
>>          region, type = line.split(' : ', 1)
>> @@ -902,25 +919,6 @@ class IOMemRegionTree:
>>  
>>          return [before_kernel, kernel_region, after_kernel]
>>  
>> -    # find specific regions in tree
>> -    @staticmethod
>> -    def find_regions_by_name(tree, name):
>> -        regions = []
>> -
>> -        for tree in tree.children:
>> -            r = tree.region
>> -            s = r.typestr
>> -
>> -            if s.find(name) >= 0:
>> -                regions.append(r)
>> -
>> -            # if the tree continues recurse further down ...
>> -            if len(tree.children) > 0:
>> -                regions.extend(
>> -                    IOMemRegionTree.find_regions_by_name(tree, name))
>> -
>> -        return regions
>> -
>>      # recurse down the tree
>>      @staticmethod
>>      def parse_iomem_tree(tree):
>> @@ -944,10 +942,8 @@ class IOMemRegionTree:
>>  
>>              # generally blacklisted, with a few exceptions
>>              if s.lower() == 'reserved':
>> -                regions.extend(
>> -                    IOMemRegionTree.find_regions_by_name(tree, 'HPET'))
>> -                dmar_regions.extend(
>> -                    IOMemRegionTree.find_regions_by_name(tree, 'dmar'))
>> +                regions.extend(tree.find_regions_by_name('HPET'))
>> +                dmar_regions.extend(tree.find_regions_by_name('dmar'))
>>                  continue
>>  
>>              # if the tree continues recurse further down ...
>>
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e0c005f0-40a3-f72c-760b-3213c4938c76%40oth-regensburg.de.
