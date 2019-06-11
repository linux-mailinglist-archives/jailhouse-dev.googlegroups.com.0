Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJ4477TQKGQEFTXOA7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F7B3D15E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 17:52:07 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id y6sf2210800ljj.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 08:52:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560268327; cv=pass;
        d=google.com; s=arc-20160816;
        b=W0/wH5HbRMJJfRnVyHHsLBLg/6gWPykFTtCOsYwAIHppW/ZU4BpsvLeVWLXz9X4NQ/
         tdD9P3k76dUT5bLsIIqFdKfBeZPjSFfbNavr8UNtkuacRIpOoynuaJ+tUDjCCJSVl5b2
         oo8Fp4UFIj9tPqCubQmYMy/mzTu+uhmGAyiklZAKiSPkLHTrxPrpOcCSkpOyk4feZs0H
         S6NHOgHNhRjzH+f59qq4PatsoJhp7V9Lbia+7B54Mpr+hOMDBLQA+qEQDfgCZbB49B1Q
         lFtrYQNczqEPeVPsL8FixFqAnZHF3mSSSyT8D1vh4Z2dZDhwhKCwgkgWP7/xO9MMCweX
         pWkg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=8gBlXkKO7KzmxgzC3di44WwbixEh3ValOip/GwqAz3A=;
        b=W7l3+YZMyuou+1J/rsPF5twSTpnU1QfUxCuCaclTn3MJ1r/EF8Fj/35cyq35wqy210
         cwE8aMUZ+bNH8NcRvDYvEQ0091IjRAgSuj39rouqG8XsQZWlPw37XvXd2+pkMi9L/Q1l
         OxMUIKZFUv2vydrr5jz8GPEy0J3cPFEm11876bH6dxyffTpJUfSt/n2WnVrBk37iq4Xo
         k0c2hkye7D8Vdlq3NISVzii3LsNLCKBHhvFlIzwSATzlrNwCRw7dKNHO+FF0ZaRpVwH/
         uDU37XHHJh7ssVqlnR9E15TI+G16Wd+EOLBToVgR1aajkH5gFJNrbM1FwErauwuCipUI
         4mOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HbYWihrl;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8gBlXkKO7KzmxgzC3di44WwbixEh3ValOip/GwqAz3A=;
        b=E+bB+IL8ick5M+6elLWRc2QB4Niv/Rppn9U31MDVs6Fl/ot8VQMLKEUh3Cw6Mmnkol
         UpeLTHOzGLKLUBgX1vpIcP0zoDBk9gKCx6awz+KSVh5sBo6iYW0fNapYt/3tkWGR9HY7
         BvzideJbvT4rTjXJjdb4aM08WY3itPZ1GkWQQUndezR1+wHnQBaKTbXWbcsZnk4mT+Qe
         OrfXR3RtZ4jvlXutHkJ2bGRszYq3SoC5r65WSi0CZkNDMsuS0LDajsWEXiF1FPThJRNf
         m5hbNA8aj5Ul+QwTEV+TAAM/+mDyUeVUuuxqLyJ792YH8BjQW8qA1pSUbtrbvHxwlnAt
         znHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8gBlXkKO7KzmxgzC3di44WwbixEh3ValOip/GwqAz3A=;
        b=MVVbrlJzvHcuo2Jzm/WKS+62JK/MoKntEEY/6JafJ0O9zKzt2Cwuhqg3kyMI8rZKhG
         OsWJaO+Nq0Z87k6PW+7ODra6/CPHk+ZW4dy7rHPyIgWgMSd2WmFSHVRybQQRATQxn6mq
         z3XH/ujas71oOrAz/sL9WVgs/pmCl4cZA7XgbvJ6bfusJD644L2FzJHOxHcPNSwZvR9j
         iwFFtnCEVg61ZVcN0GXLlho48M4IroFhpr5roX5ApDDO68wYWxGXPhKdtcIa5t0kpJSi
         nzOA6AA7z0kEi4zzVCjidgaDf4ZJjM+sY+gWHPY7qXbNfo8gKvIVg44kroRF9Q0zC31X
         AH3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWaRnQND06DZY2D05KhPZFur8j38ibwWYsM+MDB59omypA7o+Tb
	7BM6hPwhJLdTTDUhfZrERTk=
X-Google-Smtp-Source: APXvYqyIB+KKFWKwP5xaXNgg5mZZnrvei93euDk5nQj3vKfvkbWTPXe1ugevKBNPYQh9T51dBmJNtA==
X-Received: by 2002:ac2:5601:: with SMTP id v1mr24509797lfd.106.1560268327417;
        Tue, 11 Jun 2019 08:52:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:2d4e:: with SMTP id t14ls1757676lft.7.gmail; Tue, 11 Jun
 2019 08:52:06 -0700 (PDT)
X-Received: by 2002:a19:d5:: with SMTP id 204mr35594364lfa.66.1560268326826;
        Tue, 11 Jun 2019 08:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560268326; cv=none;
        d=google.com; s=arc-20160816;
        b=riU0Rpepkw0Ip8wAgZq8g51O6hKlPCrOrMi4a18c/cIN7JylBqWH+o8HNU75RKQ/a4
         be+8SI8Mfby3F2oniPy7gSZ6414RDIHLlyqJ0GenYgRosr9ssyH1hLgFPp4qYZd7Q3qK
         zprk2ouOgGwAiPLu3G86rkXi8XMD950x2Fjgys3fGvM0d18JlQx8C0P8O+GQjy24VPK2
         Ii+Y8YbXZToSlwuSPqrXi/8TL2/KmT5vaphKmwcqROtLgik3YMsa41P0guM1zfnxU9+H
         tSn2SUyg/JekYhAfBWiREOeGxYkQYdgs/ffJr4WEEBjowPJjpAovBUl91WvhsI4N174v
         tdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=lJU4Tt4z30MQTOTJHee3hUYqX3aLQRyV551h/iYuJoY=;
        b=p0FDQlvs50S7kLWfzDqAo36jK5YLSCfjjYhfvDtIZOA+X4fI7pJwstiKgKTN16qtTT
         H2UUEX/bYdzCK+sulWMWfn2ffoC0yfo9vIrNUXzh9iXVKqcnCUpm8T6KCpTcmVSOngMQ
         YJPohO+D618+jkD7ixLYsN7MYIbcoFwd3u3+NMnRNhS39hmBLOGcrkKb4WpYc5LNbSt2
         Ic6JxZMfAGsBywU09fDww2X/OHIPmpF7yRoM5BPnQtHtea5REtzxiwz/BXLmmNSoTrgc
         wodYUQa6EPw7cZd34uwsY30zhFnWWQv/7tseM0gthqjKKcYqAOD+A6oq6cHZeuPlb6cz
         VehQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=HbYWihrl;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id v29si893982lfq.2.2019.06.11.08.52.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 08:52:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.43.205] ([109.41.67.205]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MKJ7S-1hZ4N93mQI-001faM; Tue, 11
 Jun 2019 17:52:06 +0200
Subject: Re: [PATCH v3 01/10] inmates: x86: use correct types for
 pm_timer_read
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20190610230330.21419-1-ralf.ramsauer@oth-regensburg.de>
 <20190610230330.21419-2-ralf.ramsauer@oth-regensburg.de>
 <3e76db5e-9fca-3064-27a2-fb8da0249692@web.de>
 <2a46268d-4f8a-2b23-2ad0-2f7ccfa8d5a6@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <ca4ba28e-157e-0576-49e8-f2ef0b4689e1@web.de>
Date: Tue, 11 Jun 2019 17:52:03 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <2a46268d-4f8a-2b23-2ad0-2f7ccfa8d5a6@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GzcNa6UytYk7WrSFjTDjJTNDf5jjtW+lhMKDppFrpUR43CU8Tyy
 osj6iGGJv94WbI/GivxZRlNnce8MOztoRANQE9cH4+udaJFVr+Jos6PBDziqOr+yStOcJ3g
 D3eZscbg7eXAhwj4m22XpUa7TnPmrDBAATqUg5igXX4Lzi+/QxPHvMTtkFTG1VlpuZUMXY4
 gDLhIR+ltrru18h7sVEsA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WoyysQha4K8=:5xzDBpiSMs4cVIAcS1XdK/
 kGGPqrdYFLkSEi3TX11H7PRJLnAzFEBSTL00Iy5n2z2JhG19zTJtCkgzYUTG5sNvf8pt2YSln
 ri/vlcfznLfDlOsquCTi4Kv+mael55wV3VVbP2hxLUcjv0U9nngIfd7E36AeI4IB4KfXi3Rxb
 KE26CicwrCvnARiR/YFhs8AHhvb4dXZZZFDR34NCSAToqXs029oYYef/B6dIoOR25BL8sWZif
 L4qt/+wB5mKELtQ0z42ttmiLeeGjcrYTYxRZ4vfbRzkNTsggP5JflKG18NLJwnNoMA+NxM4+v
 BfjgybAK/Y3u9LaLjSHB+YbZjOfbEOfIZ9tcRHJmftRWdnbTkhBqAGTqYnSlWbTZs4QYGCnFr
 NrGuUgH2BjyDcXHJfUKPirAQNGYx0h7bjclIb+E3vdHACUmRwLojKXZho1tRbvL8ZubrmBGLe
 3c+aia1R/b3Hx9g5uDIVOMCxHU60bVxnzg/9j7PX7eV1XaW6S7q3sapTYg6yv2iPzzXmBsRaZ
 oMHRRzIiX7uMX4N7vZhr0Lqq51XRq17+7JhJDwVa9gD8qd4zhaoy3AZEav4JcVW30lnYgxIRM
 2pXhWbl/xdq8AWEnK3F3BNUXdwuHxTRSuYIdsBJ5WSkCb1UN+jlKNtVQuwJEzCjCcBfWEhx5C
 1ow6PJ6JrjuvVDXdfqu0HTGCfAjwMrF3hnxAbBjOYltL9BnDN+EdCRoN/PkUcMjGPVMU0E6Z1
 x/9tms3X0NKp1ll5eEaIglylHNfJhqct19G2sJamCHjYQUQ3SZD5Lk6CIecpjr5bBjBufPxuG
 eLpaHSz3mzo7JPqV6ZVQBMIksjz8yjkbIusMpNd8k81ShBs7Uf8Gp2yFlVRQ0aPiMtoHdkxos
 kOZaLejow+JQda9JplnlHKRt6Br2MnhXACPo7vELiOVFYYeRPCsAPHg+xKtAbbiGuXTnUmdaJ
 lVZCdQN+p7VrxXLwR4DFjdrjSqPKUzAaU5Os/Ha9HXglox6Oso08m
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=HbYWihrl;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 11.06.19 17:16, Ralf Ramsauer wrote:
>
>
> On 6/11/19 5:07 PM, Jan Kiszka wrote:
>> On 11.06.19 01:03, Ralf Ramsauer wrote:
>>> If we should ever compile timing.c for 32 bit inmates, then unsigned
>>> long is
>>> the wrong type. A 32 bit type (aka unsigned long on 32 bit) is too
>>> small to
>>> hold the result.
>>>
>>> This ensures that we won't hit a bug when enabling on 32 bit. Once we
>>> will
>>> enable timing.c on 32 bit, we will have to implement 64 bit division
>>> intrinsics.
>>>
>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>> ---
>>>  =C2=A0 inmates/lib/x86/include/inmate.h | 2 +-
>>>  =C2=A0 inmates/lib/x86/timing.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 8 ++++----
>>>  =C2=A0 2 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/inmates/lib/x86/include/inmate.h
>>> b/inmates/lib/x86/include/inmate.h
>>> index 7664570d..e4f75206 100644
>>> --- a/inmates/lib/x86/include/inmate.h
>>> +++ b/inmates/lib/x86/include/inmate.h
>>> @@ -241,7 +241,7 @@ void ioapic_pin_set_vector(unsigned int pin,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum ioapic_trigger_mode trigger_mode,
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int vector);
>>>
>>> -unsigned long pm_timer_read(void);
>>> +unsigned long long pm_timer_read(void);
>>>
>>>  =C2=A0 unsigned long tsc_read_ns(void);
>>>  =C2=A0 unsigned long tsc_init(void);
>>> diff --git a/inmates/lib/x86/timing.c b/inmates/lib/x86/timing.c
>>> index de41fc35..d179da0f 100644
>>> --- a/inmates/lib/x86/timing.c
>>> +++ b/inmates/lib/x86/timing.c
>>> @@ -92,13 +92,13 @@ unsigned long tsc_init(void)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return tsc_freq;
>>>  =C2=A0 }
>>>
>>> -unsigned long pm_timer_read(void)
>>> +unsigned long long pm_timer_read(void)
>>>  =C2=A0 {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu =3D cpu_id();
>>> -=C2=A0=C2=A0=C2=A0 unsigned long tmr;
>>> +=C2=A0=C2=A0=C2=A0 unsigned long long tmr;
>>>
>>> -=C2=A0=C2=A0=C2=A0 tmr =3D ((inl(comm_region->pm_timer_address) & 0x00=
ffffff) *
>>> NS_PER_SEC)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 / PM_TIMER_HZ;
>>> +=C2=A0=C2=A0=C2=A0 tmr =3D ((unsigned long long)(inl(comm_region->pm_t=
imer_address)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 & 0x00ffffff) * NS_PER_SEC)=
 / PM_TIMER_HZ;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tmr < pm_timer_last[cpu])
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_timer_overfl=
ows[cpu] +=3D PM_TIMER_OVERFLOW;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_timer_last[cpu] =3D tmr;
>>>
>>
>> This is not yet consistent: pm_timer_last is still unsigned long.
>>
>> Do we need the conversion in this series already?
>
> Nope. It's just a 'reminder' that sth. is odd there. But we can ignore
> it. Same for 2/10.
>
> Just some assorted stuff that I hit when (unsuccessfully) trying to
> enable SMP on 32 bit.
>

Both patches make sense. I would just address this typing consistently, rat=
her
then hiding the issue again.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ca4ba28e-157e-0576-49e8-f2ef0b4689e1%40web.de.
For more options, visit https://groups.google.com/d/optout.
