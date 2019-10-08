Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBCHD6LWAKGQETLPAWNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B6BCFE2E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 17:55:53 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id m8sf4426681ljb.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 08:55:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550153; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y9X07jIZBglOgIJFUY7wX8Q/hufs84VBBpFvfONyLHTYujqwqZAAbyg32eefTiZTTw
         jkm8s+BjfKj61ZCB2+6CD1lBb4UvSbaafwCgMN83v/yFGNjrJSE+RTgasHKQQii/mX0F
         ln9kqf4tfQt5A0bHV/KUfsorNQf+RpvKxHw4UVXl8WuRkOnhtUpjQdX6a5oqgfLKJZoC
         6GuWRS56wt80ep7LakaUqgCy5wACZAzlBycjSgYCZktklGk5Ro7rOiL69JMWiEWmD/xF
         1L+P2TUttrqPX62ecANCFAxn18lT0SnJnxoEWp6ll+dJPp9LQ+Rt+GVaoVSAW+Lgum9w
         UfAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=5ZCqs+e8hap+OohuuWwe6IONUTknW/VzZPu2vJaq/ac=;
        b=RcjGVY+NfGJ7V5W3vpLJwf5QNGxkC8vu7PHoZWj7OVpQUEKigo3GKCInu8TIgLkOar
         CijlWReXIxMGA04ykbP4QBEQqsJSa5q/p4sLba4TGhzSXqf6pP2W3YhhLwfZbQPpkqQB
         tPZ+jKSA+7InWs/2ln9ZyF+pvdAHWZxyRl4cy8FGeB7Tkzirf5SxGjdGp8ome1jsepXC
         vnCIvcFcXetgd4XyIGyQUxZ6uaWvWuTxJ6aZu6taYUvNr2N0BIxhufynkFHT8hxaRq+/
         T+BBBQWQKAs7Dp8zp72oLfCFNXFwlBcvNJVSjE9XSrhsQiv7xQKLR2imOaXT9/BYMv3X
         G84g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Qym9X5zl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5ZCqs+e8hap+OohuuWwe6IONUTknW/VzZPu2vJaq/ac=;
        b=R+W0t5jLkrsfI8zELCNEDEF54mECRebFG8Bn0u3bh2ZTJKTR71bKftG2sASHAFM5Ll
         A/r8Yr/v1Zl4TA+gdxkzh6UrJC0O3knMW6xVTACoYN2LxBG2bUJFC3kwA1xGmWEvjFZt
         XvtObPlRyvY649rUqnPp7NZpP2evrIX7xkGMQQtk6KtxkFCRDkw3zoaKC8qc/sYC7lQH
         chj2huzsYNRUSesfgDBupsC2NQirWUtsXaseIH1rId1d48d/g/Q4cIzJkLgmMAwVCx9t
         xg79TlFjfD8H2tFVO8ABGJJzEs1DnPSjvIaqvwK6P0RuCSiP5Z9zEWBrHPYpN0TM8B5V
         ereA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5ZCqs+e8hap+OohuuWwe6IONUTknW/VzZPu2vJaq/ac=;
        b=SqBiMVC9DgeRiGWsUaaLGpxjAAvDByi1JhV374iUIM00AEk8r47luIbAqFNwtBIAcR
         qszpMbBPsiuZqnwc9PIKbXMVxSZwKVKZksThurVOaBoLIUbRozll7jHn/Fiwoqbeqogl
         PSeSyAO2cfmOA0D1z5V0ntQRRkmGrPAKRbaAPMRmZ8pVwri7i0TJLGLUjtOO4AA5A9Uk
         7L1QToEhLAxn3gK4/DZd/cLmiNgtRdEaZTgOqM5Yvtobd6FhxCTu4tNbh8XKhTQVpFRr
         Ob/tBt0ckfXZmxH3hJtV5iI4dkQ6GsanrIl2s5W1UrT5+qS0I3qcKzgKd09XfKbK+Uja
         nJcw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUui8caALxZBzJSw48g43AM16rIUFpPadc8Csb31Yl59Rtb87dS
	4sxZ760d0vkpS4NIHnyEvlY=
X-Google-Smtp-Source: APXvYqy82ujz7QT2bVrxJJXDvTpU0nEY9QmokM/DUXo16XBf3cIY0izgdpzgaJzmRBKxA3gH07UjXw==
X-Received: by 2002:a05:651c:229:: with SMTP id z9mr21890113ljn.206.1570550153291;
        Tue, 08 Oct 2019 08:55:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d44:: with SMTP id y4ls545058ljj.4.gmail; Tue, 08 Oct
 2019 08:55:52 -0700 (PDT)
X-Received: by 2002:a2e:2405:: with SMTP id k5mr12278062ljk.120.1570550152062;
        Tue, 08 Oct 2019 08:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550152; cv=none;
        d=google.com; s=arc-20160816;
        b=nfy3Pheg7RD4c+KlOhO23Cnf8yBU3mj9SOS1OnnF38PtGVsMxkRsG1ERnwKL/H6F0L
         uggu/E0Ry63Ahjq2UczwdQaz9fkdF5vNkVDRUz3mhPwRPKKDKJo/8oXJeFF6GZPa0Otm
         M7EBKw2QIoufiXLw4tvxuXlgJj2CtPR0J6Oo6oW5q8n/oljOyRNU1LnVGtIVertxKUdh
         8KJrs1AmYxmMA+Ygtb+FkaRi/n+Qx6y4+QNin89y0JncUH+nuXRvXygmWZyRB2gSicWh
         gCU9EDvB9oOfhoYQS230iOHNWiDRor9H+Ew4S8OiZ5zt0tNCxKYuqzeT9itqhpHIUz7v
         HCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=w9/eOTu3/cz2BWW6FVClqJ7pL+j/wVAPUnYEj+axaZE=;
        b=IG8sZPk2s6+p/Fa+1mMb4eGzyrqnvbLJteNJOPqbCl6seCkzYkfGp2sJFSBUnQh/m/
         E5aEVJ+gT40qzh+JyOcLEXRRN7BRUwlINAGWA3dC3X5ZtxdNit8XdvkdMh/hBji/CtIT
         STw4QNjKCMDFblytS211RIAO29gcXbZ5SUTa96+NU8K66i64AKVpVXkvsKqVLzGYhaCr
         d01J9Ww48JnpnFC6sesC6J31AYZbZjcSJ82f6s7yibBSwncda8TowyXVoFw0DS3DJed3
         kHfR95b/LduZOnZvCRshSLEbWNxY07+uPpdT65HKb6lS8d8B7THEHi/r3At/1jl3ud4x
         VbVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Qym9X5zl;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id h6si1048450lfc.3.2019.10.08.08.55.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 08:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46nhlV6C5fzyDl;
	Tue,  8 Oct 2019 17:55:50 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 8 Oct 2019
 17:55:50 +0200
Subject: Re: [PATCH v3 03/14] pyjailhouse: sysfs_parser: remove dead code
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse
	<jailhouse-dev@googlegroups.com>, Henning Schild <henning.schild@siemens.com>
References: <20190930191323.32266-1-andrej.utz@st.oth-regensburg.de>
 <20190930191323.32266-4-andrej.utz@st.oth-regensburg.de>
 <2bbcdc0e-40f6-86bf-cae3-61e9ce00bb75@siemens.com>
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
Message-ID: <b145d694-dc70-0a02-b579-c5de00989fe3@oth-regensburg.de>
Date: Tue, 8 Oct 2019 17:55:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <2bbcdc0e-40f6-86bf-cae3-61e9ce00bb75@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Qym9X5zl;
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



On 10/7/19 5:56 PM, Jan Kiszka wrote:
> On 30.09.19 21:13, Andrej Utz wrote:
>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>
>> There are no callers of __str__. Remove it. Seems to be a development
>> artifact of earlier versions.
> 
> How did you validate this?

In order to call __str__, we need an instance of IOMemRegionTree. git
grep "IOMemRegionTree(" shows all call sites of the constructor: there
are only two spots in one function in sysfs_parser.py. I couldn't find a
single caller when following down callers of this function. This job is
a bit tricky in python.

Besides that, I never saw any output like this in any of the tools.
Henning initially authored those lines. Let's ask him.

  Ralf

> 
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  pyjailhouse/sysfs_parser.py | 11 -----------
>>  1 file changed, 11 deletions(-)
>>
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index 67dc85d0..f65eacc8 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -831,17 +831,6 @@ class IOMemRegionTree:
>>          self.parent = None
>>          self.children = []
>>  
>> -    def __str__(self):
>> -        s = ''
>> -        if (self.region):
>> -            s = (' ' * (self.level - 1)) + str(self.region)
>> -            if self.parent and self.parent.region:
>> -                s += ' --> ' + self.parent.region.typestr
>> -            s += '\n'
>> -        for c in self.children:
>> -            s += str(c)
>> -        return s
>> -
>>      def regions_split_by_kernel(self):
>>          kernel = [x for x in self.children if
>>                    x.region.typestr.startswith('Kernel ')]
>>
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b145d694-dc70-0a02-b579-c5de00989fe3%40oth-regensburg.de.
