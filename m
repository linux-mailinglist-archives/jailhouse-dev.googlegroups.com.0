Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBDM46LUAKGQERXAOZHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5395E2AB
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 13:14:21 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id 21sf443186wmj.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 04:14:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562152461; cv=pass;
        d=google.com; s=arc-20160816;
        b=l2pXfzr7+9i83OeVXEARuGsJS9ICP/kUgJSAAnRp+SSNa3HC22IFnhVuHaNhoW4X63
         0UL9Z7aS05Lcz6oKNT5nC6g7fQWIWe+l82V8KN2TcaPd7WN169KTJkkDDXrh2yEmhtia
         FnKHMbrzlw12IxpArayR2yVASwHO56kgdEy2X61RgGoIHYvg6PDcvAinAklnHBBMq4qY
         OMWZcVC8+MMiJbK9ZWAn0v89L6kWbY1D4HI6GYVAHwbC6+ZwbUDby9ipJIx9rRTYSdXw
         rt65AtzN/P+paAp9w0kpcNgoc59XCzhIoduT+3bqxPaWVtrHw4Ob564281lDE3gVk++n
         2NXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=Wi4xWzr7pZwaim+FPYmmhzccplL6ojb7QQPQbQg30lw=;
        b=gKJ/rD4X/HfBo2zJ1nj4VMiV0Spt2HtYA0V0bpQ5nIhCirS8267D3t5mD8Nz3/khyO
         +RhC4XT9xatit4BknWTPrNly9eQqLSGLFQWWtQNfUbz/uf87uF6dJclz+Fpt36p1vkD2
         t143tEh9MCipULjtvzmOCWYndQVthu+ciXbEozSU/VDreMBuxezlns6E9TztEkxF6b73
         uWIKxuttTm09a5uaNFnjZ4ttKeyz5eHnRgFwnoHTVhf6Ie6XuQ61DlIKo38K2LD+NBAZ
         Z9EtiaOK2oyqQPEgUiixIfHLKt3ISggt/bzxka+Xnf8A7M6XTn2NgIaaPcPvXwVmrLQc
         g4ZQ==
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
        bh=Wi4xWzr7pZwaim+FPYmmhzccplL6ojb7QQPQbQg30lw=;
        b=CsLJ4RxBay6D7wS/YCOqRxVvn+VOHZByyG8sYdK7oUIQ0Zb3RB/QVc7XoLptpXQ2i1
         d1lS5tSwhh0gJ///aMk3rkJ1QRKjfG9FOuolQ40Ai3GNXhxnEiGPZJVWdg31qUoUTgWu
         3I1u+s09lUKdnU1ZbQYZJM1ZGAH1kLGGN2zADJ2jywrNfFh2cE2eaWI92XPekgz8+2yB
         4Xo+080y3MDqdgNYhr05hZaF3xQ40B9ZYYZJHMSbbuF2HG3qG9ABfmIGM7hvEzvY5IGf
         mS77ab2jluYevMMWEbpRHAi6L/YS/kuRzK/i3fb4QAXMAfhlYA/pwp79ZzP7txGMG4J2
         exsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Wi4xWzr7pZwaim+FPYmmhzccplL6ojb7QQPQbQg30lw=;
        b=TTBzJxDiUyqg/l49TnbguZO8az11+qZ9u2ptKHMtVerh50sIpos6f0FP5H3B2wMIM0
         its5CQ2Xx65FAt/EvSi7zNABMiWxo/ZJs4KYZbWh2/ExZjdHRz0aKOCqpqymiQoCJCAt
         QryQCTnCY5Rh3bBWNtqtLOAkU6cputkp4El7lWc+vUIaR/shpwWqpMVOfju+j4HWFxBO
         qg44mCoHUsYp4Ra9EvZYsCOG0kdKCyP0mo0Kq9wkWZ0pc6ipGRGv4Fim8OmbWCs30DND
         mrr1NgXS2RZ/BWHovJ7sKJf5En4bZKpDxI4jhvTOCVGTPx2Iz8fuRlbJdejlCEOCxKve
         wwvg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWo1qEXRZbOvtANUXZJ4eVnWGDF6jecQWMIjnfQMulVSV4aXyIx
	9a0l2zMvtB48d4MAOSbjbyg=
X-Google-Smtp-Source: APXvYqzjTM2lvPx77ZiSfMyXZzavM/Wi+ocRTIk47jSE9b9VYTGiy1G5fQNIvygFJua7ErtDR974Qw==
X-Received: by 2002:a7b:c4c1:: with SMTP id g1mr2254915wmk.14.1562152461459;
        Wed, 03 Jul 2019 04:14:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d45:: with SMTP id g66ls592397wme.1.gmail; Wed, 03 Jul
 2019 04:14:20 -0700 (PDT)
X-Received: by 2002:a05:600c:204c:: with SMTP id p12mr7710335wmg.121.1562152460752;
        Wed, 03 Jul 2019 04:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562152460; cv=none;
        d=google.com; s=arc-20160816;
        b=dWLyRInx6Fz/sh8e0sQ+EDz6/ldlz3meJ/MC9WBgbWX1RQSuIspY88oQYPEAFbiRrt
         SThjw8jEJBcJSBfks9yKocYvgQG+c+G5vRd1B2wo/cRARYr8S2Eam/d9WLlJyL8UALUM
         aCgsLZIlSrOceH0LPf2fydvAlilr5HhcBzfUU9pFzL9yeLQZzz2YfREVZOmHXdHyWrw4
         wYIX95jSND2xX5SI/rQv0TNPmYCcXTCRmDJcuDzfBbpsesSOfc/bKua1kJZPHRWeiYbs
         4KA1miRri2F9d/2cxdAQTKKKT0pHlHmh4VK9iZpnQ2I4gVHLmXMB/fTsGECM9Wks0ap/
         /0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=J2WPye/M9kPurrWdsL3BvZmMxwAWGy3rfFuyLMtH6G8=;
        b=P6l0jLFiqttP9YYsyAYTihQi0bWmmwkpytGneWz1fdkE538cEqlgqrg71O8fGt5TFq
         i0qWnYs4VSanCNRMcKvzloLxtFxN+JzaF23ShbTQUkenZg9Usvcr3M13AW5Ax1v2VBbS
         DA/5Lg+FGgSQh9KRVhDKaKYYwhny/+xMhUpJeohH8Zk+3QAbjtivfRSBpkEK+yo8ehKk
         UibBJYXwYwCGFcHf52VsDhDSNZjD0H9Ck2rlqcmcCQJok1KvnQvg5PQfgpor0KtSCzcj
         2jmmneQmnliXBpbg+7gd9zsbQnJk48iwXStexhqNptwxmccJfQs6RRJJFQjt+CRICfl6
         PuBg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id t3si106203wrp.3.2019.07.03.04.14.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 04:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x63BEKS9008380
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jul 2019 13:14:20 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x63BEK73009650;
	Wed, 3 Jul 2019 13:14:20 +0200
Subject: Re: [PATCH] pyjailhouse: sysfs_parser: Ignore empty PCI bus regions
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190702135846.20045-1-andrej.utz@st.oth-regensburg.de>
 <6d75be0a-73ee-bd9c-2982-7e262f82b637@siemens.com>
 <caa1784e-d110-ffcc-6fd0-d0aadd71ea04@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f8a69ebc-ebcd-5e3c-b178-9d04e83adbea@siemens.com>
Date: Wed, 3 Jul 2019 13:14:19 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <caa1784e-d110-ffcc-6fd0-d0aadd71ea04@st.oth-regensburg.de>
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

On 02.07.19 16:17, Andrej Utz wrote:
>=20
>=20
> On 02.07.19 16:12, Jan Kiszka wrote:
>> On 02.07.19 15:58, Andrej Utz wrote:
>>> On some systems the config generator permissively maps huge chunks of
>>> PCI Bus MMIO space. This area needs to be intercepted by the hypervisor=
,
>>> as parts of ivshmem-net devices may be behind that area.
>>>
>>
>> Just the make the boundary conditions clearer: This mapping only happens=
 when=20
>> the PCI bus memory region has no device resources so far. If ivshmem the=
n adds=20
>> a region later on, we are doomed. But if there is device already, nothin=
g was=20
>> broken so far. Am I right?
>=20
> Correct.
>=20
>>> Hence, ignore such regions.
>>>
>>> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
>>> ---
>>> =C2=A0 pyjailhouse/sysfs_parser.py | 4 ++++
>>> =C2=A0 1 file changed, 4 insertions(+)
>>>
>>> diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
>>> index f48f249f..4a06ccdc 100644
>>> --- a/pyjailhouse/sysfs_parser.py
>>> +++ b/pyjailhouse/sysfs_parser.py
>>> @@ -105,6 +105,10 @@ def parse_iomem(pcidevices):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D []
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for r in regions:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # filter empty PCI buses
>>
>> "Filter PCI buses in order to avoid mapping empty ones that might requir=
e=20
>> interception when becoming non-empty." Or so.
>=20
> Certainly an improvement.
>=20

Applied, with that comment.

Thanks,
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
jailhouse-dev/f8a69ebc-ebcd-5e3c-b178-9d04e83adbea%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
