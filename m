Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBJWR7XVQKGQE2PATWHI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C3AB3895
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Sep 2019 12:49:10 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id v24sf211751ljh.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Sep 2019 03:49:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1568630950; cv=pass;
        d=google.com; s=arc-20160816;
        b=gHWLDOfO0jT7Xwzf+jRntFrJ7G46AyBncMJMEzc5cRAKH2K9gknAKGjlECaTKIX45t
         bdO5Coqut3XL9zzbaYNoo15Az2EpLQaypF26Szd2Qn5daWdJc+GTUQPEE9S66qvbRqtY
         P46Zu173ab1qc3Vu1G90iS/YWVUN2qBZldPpzXnUhIMJiZraCv2E07T0eHY4uaNxCrQ7
         S79dCw2PdMoQYrdaZkVXyUglU1flXuEfT4l8Y6qUO0EQrafQs2w+I8r2IpPXr3MW0ofZ
         7TcsLUcgeBVqkDtCQZ9it4x948b/ii34b0cYa2LuS/GO2GEEYbFBvGmUl0SRNCJL5Fhn
         NwQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=VL+lwDl0jgYjDfZ2FOn4oYfTk9l8y3ZSAMR8E5V39T4=;
        b=aVSI0ZcySz1rnNHYDDDLulwZ7K03e9qhmw5mwEX+kqP3vHUnwgIGEyCrDi9wJql5n5
         PHGl+AOr7LpY0dYbpyrCze7ZEYS6Zlk7ueVtOcYfZNARsFbjAJ7NN4nuQXFHSZXezYOb
         TNR8PlZHb13eRIKPHgUWTTgXxjsTIGXlit1yRjWv/Xye/dqZ4BXUmENiHErIJJRCgJYk
         j8e7SsYXnm1dsIignMkd2B+IukthaE3R+cqyx1b3cIZ8unTP2aXT7QTjY1OY7V4TcNEv
         GMvgpzU6gJY3YcJNKRDYnWNaZrfqZtB3zsqCA+m0ACNoKSHjIGxmaifVQuXVyBi4O6iD
         NyLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dWiLUGye;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VL+lwDl0jgYjDfZ2FOn4oYfTk9l8y3ZSAMR8E5V39T4=;
        b=ZZyZLsqJKFphf5pSQJ2PR4NVYlkUUOScplM5uRQK/NPx/tq8hFbuvyiXskHvynbbRd
         2dcnXW6McrqLGlgy1NDS9/79Y/5wzjnuSguRqFy2Bm69S76BU6n0HbJDc7nhEEU9/Ywu
         9cvdAqjRnKMAUa8MydtUYrLqoTnJPCTTsw7ouuVGNHqgioI5+NvbjA1HfIkmQPqdgEX0
         g303+kBt7RCpmlPAEalJPN0UgKVBYLy9sVW9YszUPNbi5abePEgrhfHHqsJ4nOAuayTp
         vhCe3hzIhsSyoD7JWFrUryVpyL/Ve4gIEMQntqPVbU+12THODq/E3ssGWtZuZT0GsMc1
         c94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VL+lwDl0jgYjDfZ2FOn4oYfTk9l8y3ZSAMR8E5V39T4=;
        b=OdLnS+nqgAW0oTdyJGplO1uIs/xrd3AZH10rQI110qpzMNR+UpmSsAam8GMFxxCxAc
         6t0JyhowcSHsxATDyE0JuJhUwQcikH5U8BRUXUVYXqZJP/3Y6YjcFBOAHnFzpqku3lLX
         +DibAbXdN0I9ouDIE+BLgZZzgq8THXaSZ1uhXd7IICq8amR7VPHfrAA/wWS5TPMfhVML
         OVmJNmDIymWtbwDnySY2fjoRuf0mm5YKGnJmtvstAmzV8NRBBm6CvA8d4Yi/W79cggKT
         /hRe4NoeJuZbLIzcn5HWMVp/lTTiiGn8syDUmAEEaX+snJeqAq654n19b1BCOqZz8eAo
         IT2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUrgZQ0kUkZie6jR2jLSxOatcrHhKrD0XmWJcgZMdCvQFN3RvoN
	K8h2HxHMh2DgjzfliZGgt+8=
X-Google-Smtp-Source: APXvYqwUZBLESt+RYAWknKzIvtrhTUCF8EbJ7biJi5g6qweHEF4lNx+ewXo+OU8eLV93mjd3oaPIPQ==
X-Received: by 2002:a19:5515:: with SMTP id n21mr9928187lfe.131.1568630950320;
        Mon, 16 Sep 2019 03:49:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:428b:: with SMTP id p133ls1608723lfa.6.gmail; Mon, 16
 Sep 2019 03:49:09 -0700 (PDT)
X-Received: by 2002:a19:f111:: with SMTP id p17mr2944388lfh.187.1568630949736;
        Mon, 16 Sep 2019 03:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568630949; cv=none;
        d=google.com; s=arc-20160816;
        b=Welg5ClaH6v+snknk01ajlQJ7DCaAoc9k+gBhcJ/rfCVs83Bg+i0KMsSrneCiAVGgU
         Pe6V4+2LFBsXBYhOTGAsMk/LQNH7Jkym6nKG0mQI3yoU6dnIlZR935YNSHySYrWH3Ez1
         ibtz2mEJLOj9feziY9+WhSZpWV8y2bwSwagzZ99zXMKdXEzoLPqdnK2fFFwJtcSFqNwV
         +wJdmGKRZK65MSC+kgDB2V6497oGLUAoDXbg4gkLpaN/dfgi2hMDK8JNjwx6sI8hq4/n
         yoQhX52FC7Ru+u3IKpG/J6hhB1rek6M4vwEGqxQjPtcF8wPQrMhD8pX33zt70bAbK+4L
         vxKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=FsNRrrCEKIru4xrqFO4k9sl1Lmnfrl1Rkv6ivqBXJUs=;
        b=f1XZzXbTi+haShJyCLeMAHiI9FmsTY81ZVsId2N6LZ41OVErFCzvn+96FxD7V/cxxx
         VnWE3AAXkLy/+2j56M0hMGsZpIEED5zmx5nQlG5SrwkUNU3D+UgU1NUy4B0ke+G8Qku3
         ivW+ID8Wa7hE7wNmapfGKqSMmJLfQ9Fn6KpipGosGrdiWLF2v4ME4ZtGK87B88TovGwj
         2A8dI4oIMOo6kFTeBjjNNGWh5cKIlBHzn69TGfoWV3UFSgu3cg1Tok+/UKqgkoptRPZq
         8JDHehapvBXv7u0ZZF2yZ++Sgqy+XIklupJ47IeLy4Y110JKpk8qAiMB5m6k7Z1dFK55
         7u3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dWiLUGye;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id y6si145162lji.0.2019.09.16.03.49.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 03:49:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 46X2zm6Pkdzy5p;
	Mon, 16 Sep 2019 12:49:08 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 16 Sep
 2019 12:49:08 +0200
Subject: Re: [PATCH v4 0/2] x86/jailhouse: improve probing of platform UARTs
To: Thomas Gleixner <tglx@linutronix.de>
CC: Jan Kiszka <jan.kiszka@siemens.com>, Borislav Petkov <bp@alien8.de>,
	<x86@kernel.org>, <jailhouse-dev@googlegroups.com>, Ingo Molnar
	<mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
References: <20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
 <alpine.DEB.2.21.1909161154030.10731@nanos.tec.linutronix.de>
 <f54af247-b27c-d772-641e-4a752a264dfd@oth-regensburg.de>
 <alpine.DEB.2.21.1909161241520.10731@nanos.tec.linutronix.de>
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
Message-ID: <bc2f509c-9e72-8538-ebf9-801e487b1ad8@oth-regensburg.de>
Date: Mon, 16 Sep 2019 12:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909161241520.10731@nanos.tec.linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=dWiLUGye;
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



On 9/16/19 12:44 PM, Thomas Gleixner wrote:
> On Mon, 16 Sep 2019, Ralf Ramsauer wrote:
>> On 9/16/19 11:55 AM, Thomas Gleixner wrote:
>>> On Mon, 9 Sep 2019, Ralf Ramsauer wrote:
>>> Could you please provide links which resolve via Message-ID of the cover letter?
>>>
>>>        Link: https://lore.kernel.org/r/$MESSAGE_ID
>>>
>>> These are way better as they allow retrieval via message ID even if the
>>> archive URL vanished at some point.
>>
>> I fully agree, that's much more robust. I chose mail-archive as
>> jailhouse-dev isn't archived by lore.
>>
>> However, if lore would ever archive this list, here are the links:
>>
>> Link v4:
>> https://lore.kernel.org/r/<20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de>
> 
> Which would work nicely if you remove the '<' and '>'

Here we go:

Link v4:
https://lore.kernel.org/r/20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de
Link v3:
https://lore.kernel.org/r/20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de
Link v2:
https://lore.kernel.org/r/20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de
Link v1:
https://lore.kernel.org/r/20190802123333.4008-1-ralf.ramsauer@oth-regensburg.de

> 
> Now if you also Cc LKML on your postings, which would be nice because
> arch/x86/* is involved, then it would automagically be archived there :)

Will keep that in mind for the future. Do you want me to resend this
series this time?

  Ralf

> 
> Thanks,
> 
> 	tglx
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc2f509c-9e72-8538-ebf9-801e487b1ad8%40oth-regensburg.de.
