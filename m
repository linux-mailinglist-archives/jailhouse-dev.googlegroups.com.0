Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBQXD6LWAKGQE446TQSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id E3ED1CFE35
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 17:56:50 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id y66sf11478669ede.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 08:56:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550210; cv=pass;
        d=google.com; s=arc-20160816;
        b=Baac+gNiQEUGLjbD8Oi2NcUPoqHYe2FP2EhQNMlmlLqey/A9ppOOxr9edySiqShkgX
         XcsS9sBeFg7sC5IhLFvydIntoW2WRKII9JVOnM8rz4/o/PiKp6Mj/HwHxBDcoFmXMnSN
         zXixEUo3Y+pOyAi6RC+4zMz4JENRfaxpF5Wz8PCDtE6tuTr9LmI+AIRaJ7coEbpB5Wxo
         qZ6LwKgVWpvK+L0TzaKmCGD4acQ7PfalaPDZ27HBBNtZTUefSZ2eJqEWmj1boyCL9suy
         oXVK+FKt6Pe+wZTdYwc0FmiiGoDGbqZuBG7oB4p8IC3e0sUW9/xUT+zfuCDwtSnTOBvK
         NZDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=Vm3Oi7JrjxIFZw4cS+tIsnWzjUW0D5tS2zfK1+pGn3o=;
        b=COqHFPM8BHRJykX5VebZHBgQSGyG7sX4xEmWCVF0cBYWoA2X4KtnNIeZbpPZLEx1qL
         IuznzIAtYlOc4olDa8FPpptn+B8so0WLK4uQ9PL2lavRQcaw7JpEpDb5o5JGmrVkHk1i
         xklt/TTH3FkUljbm4A9NBBoTlEBMHrlcoxe6f01rpqFby+AgkwuUtQ7oyQSp83pnt5K/
         YzImaiUcLVrb+ER48MAgsxAeeYwkzWUBQ1jgdoRVEdgWYQ44Z7d/gcTr2vqJWIDLNz3t
         /RHVkMWYJQpCeFMdjq8mOILriFEwf+QHOV17iv4grSZ4sqScqgGRtmJqBwUeMUImEjUL
         rESA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QN3KLRcM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Vm3Oi7JrjxIFZw4cS+tIsnWzjUW0D5tS2zfK1+pGn3o=;
        b=iXsKQxkIrENzS5DSAede7Y24HKwyn4fOTcAAQKWZ+RF7rG3CN2Tm+n18KrofAL9IQJ
         p4Vu7wKiMPr4LCGY3H9rN/de3YhamN44AjmRlWkFvSsCg3xJXxX2Yor2fhEifC5dJXDs
         /khOIKVDj1gVSrukjiLb8yIZ0JYBm7hDd59VrydP2ayCCB7n/XSACeZ0CqcgnzP7gIAc
         UXgXqpvNw3jU2mNuyCIKmDblHhnFHxiaVUoTYJOO/zikvyVcrny8YuonRYSLTINqnK6d
         i/7FyaC0c5YN+YuOlXUMzBe4d/uXHq+u0t73PVKoVkEVgX+44kYMp2uYzkdrjoH8aGwu
         D39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Vm3Oi7JrjxIFZw4cS+tIsnWzjUW0D5tS2zfK1+pGn3o=;
        b=uTuIAG1AyeNezpKqTf2O7NV6qLAldlgYAaU9xNoIcyxUIj1Qi973TW/lBiRTiIJRwa
         d9THfby0KQHNTbyeMea8qDpFd5ElUMP7bF71EGK9FBtaeAkeurHHm0VPBZoiJyeLZ8gl
         UeTLM2WyXCBPMj5Tc4evb+vB7VQir9DYW0CCp3XriJrc202YWK1uvgIgtuTvZwngTKWe
         /Q/4towVb32Wnl90cgbPSEevnUr9DK8Pg5FKpnVNfvUN245RRjN7H61X4UL6ui69S+lT
         yynzkz2shp3BDl+vY8UuFrR5qiVPlVK30l7reiSjZEemWo/MMUb8ho1fT5oab/XemhHM
         B1eg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWU8izmv2z5AGlVciHlqzNjUYff1CStd3CfGFSDNKuqUXFrMLvt
	oFIcyrLgnZ+xsrKV9UV6bJI=
X-Google-Smtp-Source: APXvYqxWd4hxozi4534pObsu8+TnW7fccH0yrQNWHObVfcrzVXk1xy0AiulSOn1EnoJ71vlsA0xeLQ==
X-Received: by 2002:a17:906:5a96:: with SMTP id l22mr29218906ejq.310.1570550210602;
        Tue, 08 Oct 2019 08:56:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:4420:: with SMTP id om24ls989413ejb.2.gmail; Tue, 08
 Oct 2019 08:56:50 -0700 (PDT)
X-Received: by 2002:a17:906:eddb:: with SMTP id sb27mr29383944ejb.304.1570550210074;
        Tue, 08 Oct 2019 08:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550210; cv=none;
        d=google.com; s=arc-20160816;
        b=ruxQC8YWqlmiwlkdpF20cG0RPHzIj9pEQnz6dGknwzUmnHmqSHOPRPo8SYirrsydVx
         Ip55fqVPBi3ONDRu52yYWXWhIgysYBY/ymcrqDaUtnSgb8qVS3jOfmxajjLAszWxKF6/
         Jw9B+ZyIU4LJEvH24afAE+xqzN/FRDeKv+IWlZJpxDXtLPjGWRvrSrPz9r1+h/YiaT14
         C3QsQO3ivjuix55ZZWnpIBNOT1N4LFOCpHgkTnV5DjUi/ZvLK1z2CgNnSYxl6e8ohxMx
         F83F7+AwP6YiWCquTO5EwoRAQtVtpV4YTaH+D5l254zXRKpcbbESKpr3e3PdEPpNPuSC
         YBPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=CMbcdJGJ4mVfLMMdkFS/rpnBpOviEQng6q2heaxSAlA=;
        b=j0OHjIpWGyzk7RJkJO5oS0OJkUUh/6DTLMrBnw9tVDKJcWhmi/zcpIRO3ZQ5euElZM
         jTpiIAT8KdYuyYC2p+zQJj1dUrVCKCwgGhvigs2SOP3U3hObcW6uW1kQM5KpGAtxCr5d
         Wg/cpgYQW3XwwqyJpOkzFLtXEM5srxXPEUEDBn1ZWa6cJk1lDVoR3gxpvNANkSqK8+qU
         3Br5kHNR7OzxFhAGF6ATPuOrVduyVomVe6H5md9JzDH29/mgUPQg1b375p38Tu5sKIuT
         UChKS+he/BajfHD5sSRTjKXW1gplrmXUj+vJBXgzgIy+Z8L9hSeoNVgtj8H6TDamAFi4
         GTBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QN3KLRcM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id q8si1723807edn.5.2019.10.08.08.56.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 08:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46nhmd4r9hzyDl;
	Tue,  8 Oct 2019 17:56:49 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 8 Oct 2019
 17:56:49 +0200
Subject: Re: [PATCH v3 06/14] pyjailhouse: sysfs_parser: introduce new class
 IORegionTree
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-7-andrej.utz@st.oth-regensburg.de>
 <81b3858e-05d3-abce-0f43-940656627592@siemens.com>
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
Message-ID: <cd7c421a-ac43-93b6-29bb-75fdee9b9593@oth-regensburg.de>
Date: Tue, 8 Oct 2019 17:56:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <81b3858e-05d3-abce-0f43-940656627592@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=QN3KLRcM;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 10/7/19 6:10 PM, Jan Kiszka wrote:
> On 30.09.19 21:13, Andrej Utz wrote:
>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>
>> Do this step by step. First of all, let's create a new routine that is able to
>> parse a line from /proc/iomem or /proc/ioports. Both files share the same
>> layout, so we can use a common parser.
>>
>> Passing the destination type of the entry to the parser allows to share code.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  pyjailhouse/sysfs_parser.py | 21 ++++++++++++---------
>>  1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index b0a9bf44..a179461d 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -824,6 +824,17 @@ class IOAPIC:
>>          return (self.iommu << 16) | self.bdf
>>  
>>  
>> +class IORegionTree:
>> +    @staticmethod
>> +    def parse_io_line(line, TargetClass):
>> +        region, type = line.split(' : ', 1)
> 
> (region, type)
> 
>> +        level = int(region.count(' ') / 2) + 1
>> +        type = type.strip()
>> +        region = [r.strip() for r in region.split('-', 1)]
>> +
>> +        return level, TargetClass(int(region[0], 16), int(region[1], 16), type)
> 
> Doesn't the style checker complain about a long line here?

Should it? It's 79 characters.

  Ralf

> 
> However, this looks a bit nicer now.
> 
>> +
>> +
>>  class IOMemRegionTree:
>>      def __init__(self, region, level):
>>          self.region = region
>> @@ -864,14 +875,6 @@ class IOMemRegionTree:
>>  
>>          return [before_kernel, kernel_region, after_kernel]
>>  
>> -    @staticmethod
>> -    def parse_iomem_line(line):
>> -        a = line.split(':', 1)
>> -        level = int(a[0].count(' ') / 2) + 1
>> -        region = a[0].split('-', 1)
>> -        a[1] = a[1].strip()
>> -        return level, MemRegion(int(region[0], 16), int(region[1], 16), a[1])
>> -
>>      @staticmethod
>>      def parse_iomem_file():
>>          root = IOMemRegionTree(None, 0)
>> @@ -879,7 +882,7 @@ class IOMemRegionTree:
>>          lastlevel = 0
>>          lastnode = root
>>          for line in f:
>> -            (level, r) = IOMemRegionTree.parse_iomem_line(line)
>> +            level, r = IORegionTree.parse_io_line(line, MemRegion)
> 
> Style again.
> 
>>              t = IOMemRegionTree(r, level)
>>              if (t.level > lastlevel):
>>                  t.parent = lastnode
>>
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cd7c421a-ac43-93b6-29bb-75fdee9b9593%40oth-regensburg.de.
