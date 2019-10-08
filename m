Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBWPD6LWAKGQE3PBYWGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 02680CFE37
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 17:57:14 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id m16sf2322334lfb.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 08:57:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570550233; cv=pass;
        d=google.com; s=arc-20160816;
        b=Zer9AqaHvnimvw4AtpTWHqaic+ncb7IqHcoYl1HWLY+2sZu3Vd8tytNfk72O5FPzMz
         OStN6nU6VHPpx8p0fpFB3UNBwvUoa5x8ql0YaLvVBXNkjm5CoH/9S839UTZdvqYdX87s
         flxegzg3PW1uRjwwvUVlchWx0wQ1GonvVJhiIhfpgAN35vKTHwVLaKzoau0z847RvrW9
         WwaYKPaC7avWyGu8ePJeTwZDVbWd4wiIM/e+0+I6+pdpprIDttpSFdB2mUclW1Tkvbb/
         J3jChEdVsOBvZ1AoiwFBzCB4m4Vkd0FYkG/a4spmPlRYBusONPgHJCo2P5GEYzwX5xJ8
         X9XA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :to:subject:sender:dkim-signature;
        bh=pmO8CVuwmMQd8ZotYjAdQ3fbM9cmiBlfC3NY8q6pNY8=;
        b=QY2Z1BjAPTefFweFHkLPoWkMO1JcnrthbhsOq1u52Z/zhQZK4e3PNggBpnTLtAgsL9
         z3bDuTOFNAVqEQJnGovKnunHzKAWswQ84nktHSkWveEsTWieXicP0uRkStzq777NePkB
         RRU6qSQpQTucqncArM0MgedkR8pahmAwN3FWQQ8jO/ANbdWnPmwov1QCTgBAcDdUs1qY
         BKXuE6YNo7MNXzYZgtTZTvI0mEwTd50ayP6rMDtOEFlTFDC4SxklYELnm75sxIXjyckf
         3jfhZ2vSrFReePzeh3Sd5/uMkhlETNNB7CBnlkIPUoUAB6xlijl9ATnOu++Z3wYTlBW9
         iCcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=C+x5al6w;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pmO8CVuwmMQd8ZotYjAdQ3fbM9cmiBlfC3NY8q6pNY8=;
        b=PNhoH2cUg+bKSHTpxGUpYNQubZy2AJkpeYZvD5qrUZQGsfvj4UDmxW/W8EjUqBpPjL
         pXAzz5HsZNx35lSroDYrXucO+yBs9+qE2P2HI8KsXJvA6FYlmiK0c8tkMCavfzw5Fhww
         SgX5PPsokFPjVy+Ht3/nY9OYkV9pQlioIYNmaAKewMXRBddJu9xMBK3h+TB43x+We0Iu
         2pvWfyzO7Jvi7h+Hf4tl+65YYhHYLJjJSJkA8hL46qjUBrIIfZZvGqHYNlt2OEe42dta
         g+mI6sQ+wjeRuzCZycf6nmdOfoLFSbOJS60/zK3hl4oJMiaW8qo20Cnts+pt6xaJxKkW
         CupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pmO8CVuwmMQd8ZotYjAdQ3fbM9cmiBlfC3NY8q6pNY8=;
        b=eHUXjqKHImyjrsKjrZ+bRzu1wfupwgeIzuIhRqqQDMWszDuvfvuRvS1FsqXj44w6w1
         TH/eXm3hekRS0l/0J0yxI0yTPC1DolDfNYIrrX0OrUWLBM4sYel91OR/eAJPHVgw8Jgd
         QJqNqIDVXmkCg8+McC2lq8IxkOus6ELRlZz/7M/t7fs+iMPVG1lW4jfhyQSt8nZVrmgO
         ug5PpJujxK12cNi7Pq41wbcXCatayoZcngB20kI5lTY2lN9Zlu/QiKSb5nYfoU3cZS+r
         0B0DZlPD0USm14SLtJTxat8WpK3IDUBwFsX8EpcgNaaXafX6a85ALNdpOQWz3UvtSdbU
         aG3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUjqMr9PACAvzlDmOB/nWQZuAdGpXh1gnDv/LMrzwAsRaRpuzL5
	1WPCn/C6dbVr+5K070aoibc=
X-Google-Smtp-Source: APXvYqxa4PBm1SoaLPscfpdA+LzCBWTwIKVvHeuH8Yi6WW6UCWkWoarfiQpByJB9ppJoESmlZQ6Gag==
X-Received: by 2002:a05:6512:50f:: with SMTP id o15mr5398450lfb.149.1570550233610;
        Tue, 08 Oct 2019 08:57:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8915:: with SMTP id d21ls543171lji.0.gmail; Tue, 08 Oct
 2019 08:57:12 -0700 (PDT)
X-Received: by 2002:a2e:3806:: with SMTP id f6mr23253776lja.143.1570550232850;
        Tue, 08 Oct 2019 08:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570550232; cv=none;
        d=google.com; s=arc-20160816;
        b=yLM0t2D6XtGTl2mNhnrFl5H2TDyyHf1/XC2nHwftZ9tLoiSI+ZhmarpcYqbBxZLkua
         pqtIxpeOW+ZZaemHkgpi9zj4g0vVMTzRmXzWyQTP600fWJDjVWDfRXAprRJW6DK+lHwT
         zBOR/cCPkpgDya4ofyrjvg07iA1950ogTY+V/pvuQ3hfY9ViJDlbznldTCQTcYtjFVOW
         xmN7Vl3kVn/LkKc1kthLfRS+bK0wH/uyLIIT+p3EXz4c7QL1sGFo0/lMp3I93trIYlsM
         JEyYDGfM0wqUMZIAkb7aU370oJS/ho7+vmpB9tF1zbO8V5rYpp1WahK0bRTRLJmm/elP
         5eIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:to:subject
         :dkim-signature;
        bh=wV2Kq3UjYuJImnJziEWgofk8b/gZIUlvdKg1ALbSOL0=;
        b=O3fEkNPm+72m5SMDkwkAKXHgQso67+pQ4dZ3TOW3qjMauwtwLl+keMkenQgQpTnMlW
         KLCeYCUjPI387C75nqU9IG35k43S/WBnC9Mr/c4aFOpnrBr/+Wkpmp5wzTaiOL2Two2P
         v2GdyNORe1ZGAvMV6tlU2LzUy8wGL4KqiPaxjO6K8jt5R9rZ+2aYb48JJVuKRP8Htzbp
         9J5Q4td8Vo455xw1dTn/RkcZqU1kdB8aFn84lT/hIqMBZ2tYZeMEVOoowlAz7h2Lr5UV
         Hqqo2hKVovDEIEKNvCq0p/l6EGBUDp2TKfdkNXMVBwpFa9HGM86ASmwTPqsqe9slUzZR
         PTzg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=C+x5al6w;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id z9si1796806ljj.4.2019.10.08.08.57.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 08:57:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46nhn40SbtzyDl;
	Tue,  8 Oct 2019 17:57:12 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 8 Oct 2019
 17:57:11 +0200
Subject: Re: [PATCH v3 09/14] pyjailhouse: sysfs_parser: entirely separate IO
 parsers
To: Jan Kiszka <jan.kiszka@siemens.com>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
 <1e561df2-a136-2fd1-0c28-d51e026a0704@siemens.com>
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
Message-ID: <3f576aea-24be-df86-40ab-0eaa62de0a52@oth-regensburg.de>
Date: Tue, 8 Oct 2019 17:57:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1e561df2-a136-2fd1-0c28-d51e026a0704@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=C+x5al6w;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 10/7/19 6:23 PM, Jan Kiszka wrote:
> On 30.09.19 21:38, Andrej Utz wrote:
>> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>
>> Everything is in place, we can separate IOMemRegionTree from IORegionTree.
>> Let's give IORegionTree its own constructor.
>>
>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> ---
>>  pyjailhouse/sysfs_parser.py | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>> index cbd6069d..50ca62fc 100644
>> --- a/pyjailhouse/sysfs_parser.py
>> +++ b/pyjailhouse/sysfs_parser.py
>> @@ -825,6 +825,12 @@ class IOAPIC:
>>  
>>  
>>  class IORegionTree:
>> +    def __init__(self, region, level):
>> +        self.region = region
>> +        self.level = level
>> +        self.parent = None
>> +        self.children = []
>> +
>>      @staticmethod
>>      def parse_io_line(line, TargetClass):
>>          region, type = line.split(' : ', 1)
>> @@ -836,13 +842,13 @@ class IORegionTree:
>>  
>>      @staticmethod
>>      def parse_io_file(filename, TargetClass):
>> -        root = IOMemRegionTree(None, 0)
>> +        root = IORegionTree(None, 0)
>>          f = input_open(filename)
>>          lastlevel = 0
>>          lastnode = root
>>          for line in f:
>>              level, r = IORegionTree.parse_io_line(line, TargetClass)
>> -            t = IOMemRegionTree(r, level)
>> +            t = IORegionTree(r, level)
>>              if t.level > lastlevel:
>>                  t.parent = lastnode
>>              if t.level == lastlevel:
>> @@ -862,12 +868,6 @@ class IORegionTree:
>>  
>>  
>>  class IOMemRegionTree:
>> -    def __init__(self, region, level):
>> -        self.region = region
>> -        self.level = level
>> -        self.parent = None
>> -        self.children = []
>> -
> 
> Is IOMemRegionTree now only defining a namespace, no longer an object?
> Looks a bit weird as such.

Yes and yes.

At the end of this series, only two staticmethods remain in
IOMemRegionTree. I can add a commit on top that refactors those methods
to regular functions.

  Ralf

> 
>>      @staticmethod
>>      def regions_split_by_kernel(tree):
>>          kernel = [x for x in tree.children if
>>
> 
> Jan
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3f576aea-24be-df86-40ab-0eaa62de0a52%40oth-regensburg.de.
