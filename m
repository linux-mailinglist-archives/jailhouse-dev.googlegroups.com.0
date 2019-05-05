Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7GJXPTAKGQEBE7MNLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CAC13FB4
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 15:28:29 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id 18sf9415050eds.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 06:28:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557062909; cv=pass;
        d=google.com; s=arc-20160816;
        b=wFhpPrHH0g+MfJSmSu2uREBjNP0HunQr/D73hhITgN9OsiQkj6hIoQIYu/pgrVYCRT
         iHUkGmuV77MqnfMLuyzEtuicJ3NNfoDGndfGtOOOPnMIv4FqVxcHngsX/mgP4AaGLH40
         2kAchHWmvTfXMtugr/ua8K06b0q5Ft1RoXgSJd2IblDOzmsMa9uO+kEd80a3ENAiqlh/
         VNxfabeeYJoPKDEraTh7HkwqlJCjndsLUGxfjZ3onjKF3cQciBQbwEKRfZ0N83Px45e3
         GLAZjoFy3zGtdJDSkjiQErAZWZYcL7CeqGzwm0XUNYtmLUnSPGlI52GtSYUSF7wM9a40
         sLGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=4fXzNNxQSiCeqEcZR5uO75fOq4g3geTntCm1jZrPbj8=;
        b=CbaHQ0QdPhN9tHpn1r9aL3Hc7HmXjHb4Yaqn+rwtuVQvk+dKys34Q9t8lPxDTMJ0l0
         jTCkGfOFgSU6YuaWRK4BRe4VQe8ygoJV5Zk3DD0Nd+zELyFhAN9f0o8UuZon1uBJlU2G
         Y3o89xdzja4M74dyD/fmfPfD5nYSVZWRFZyiQ6NM4wWpkYvV9AzzDkPpunrriMXB+nah
         Jt9jwJf2XSTsLpgXLxpIm5YdHoUXsChDJebJR7cJAz77QAxCwpzRINogGknInK9IynGI
         6Gr7Cz4S6+DKBqVYF3MMe0Bl3NL+x8r2hyXJSVklLRDEv5RXj0/3AfJYWrg5drkVZXzX
         Y8zw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=nGnHCAz7;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4fXzNNxQSiCeqEcZR5uO75fOq4g3geTntCm1jZrPbj8=;
        b=d0MY4nlh7YyTT4DZsMBKDL3yhKxmEmmLHquIXriRjmf0Kv8WItUxRovImvn6jVKeo6
         jTJLGtQtk/fXSAF/TMD75pUCpO/OYN2HkaKlCV1FU4mIJ83m/vvaj8T0Xs6fWol/900N
         T1UdSExmJrfioJGOZ8PcA/Lk6QXblLOpZ0KoLtgqCkUbudcF8MCbwmi+tyrqG2TZJl8s
         pNi9iCjX346AcuK+xtwtffVGA/il44CZV9UBzzIm/UD5Qma7MTMwHYTenV/MpqnuwA+z
         BsBFYA5C1iEorvvq0oEdROYIxbaMVM98kIbRtDdEUcuyccRDcwbK2LwLcrULJ5EiR+BT
         8MLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4fXzNNxQSiCeqEcZR5uO75fOq4g3geTntCm1jZrPbj8=;
        b=YUBhmyEdei4BbHx9bWvXDR4wCVtnEzip5/FiC9HRPsfrXcFKvIPJoE94/oAkdZWkbZ
         oea9D+ziafFOPtXMWxp+qZc76Zm/xd9m9r+0/v8qLWGWNAGVrd8LaPJmB1QIzW5jeWn5
         nFPbVFmtQAgp0Xwv/CQUR5ZgyMENSIvDQnMEKxLLPa9jo7/a8p90RfcYf2zhVuOx2o2H
         3YrUpaQYCjm5GBVRJTWSEeQS6hBuRTtxFkO0xqrZrI1G38VsBLJVHJHwtejibDDyDEh2
         71NfT1Js8smlBRlpwdyETN8Sq5Kvn9Pw9Oo2M1Wx0FYsER2F+Ux61q3+utEX0KwDLFZI
         SbKQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXK7jAU+ckUYRSJWv6fEoRSAtSYOzHu+5mqLB4sQ8UOOiAl484F
	mJYCLehZC9W+maDqxtiqFWk=
X-Google-Smtp-Source: APXvYqyAMAVIbfJwayUwtKO/uxWAZJNHpzAvPi3+Ps1hPZk1vO5Oury4Sl+fDtaaKlnkM+2ZaO7vwg==
X-Received: by 2002:a17:906:5252:: with SMTP id y18mr14900880ejm.186.1557062909276;
        Sun, 05 May 2019 06:28:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7ad7:: with SMTP id k23ls1985745ejo.6.gmail; Sun, 05
 May 2019 06:28:28 -0700 (PDT)
X-Received: by 2002:a17:906:5950:: with SMTP id g16mr14765600ejr.57.1557062908450;
        Sun, 05 May 2019 06:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557062908; cv=none;
        d=google.com; s=arc-20160816;
        b=ENvyf1PwnxF9zCSZeECIV2UZfk2tu+l1Qv4sYrD/k/ejMtKHftxX0T52yc3PrV5x8U
         HjcUeWi34lE5Jc9eixfAYqkfqpoo+3e7ClErSfP9jc6859V9sLUH5MHW9D9GZQvP66kh
         o/om4LONBw9/eH7/3409fG4DrqJQbhYCed6+1OM6Aqpqt583cKu2MljXboTCkc+ei9Ot
         EPeFAJQ/ok0Cmb1mbay/Pw4i6edu+0pRMywh6R/u0NRzZih6wrpMjYKlxIpLP6qBHyI7
         1r1vyNbLxIuD3of2bMIttYZlDq6c0JGsi0qU2KB8jJaZ6RiDZHiA7CDZKDTY4kcTpRzF
         0PcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=KdwLyeelYqP1HcZ5i+8UWTehjnAHXWsfpd5nDPOnJ0I=;
        b=jpqDRFQfGWDqBjb9vuhXfX3L9MYGNVmAZcQvs6AyapL+p5ESk5CSwLILJQkwAyVG/W
         KKSKN+fRzDFsaEyAxqoxnOckqbfp6jUo88vdJDLqIj74mDRrERjhmJudvk5VWMZM6MJZ
         yOnSnBCsXJzwrLhSEG1sq43iiACysjwKl7xEEthZ5yOmTc+TXd77sGys57nv/Uw+Hwe1
         wApmaVDaQivY4dJ0QT3xt8g3kf7883y+r3kvDZzQ+kmyeaVeYgBCVxdQDQbQKqIlGZHN
         LdT66PjgH1ii9f71QkgLYNHhmKSuFasPIqN6HZsO6CRokFr2uDyJmSyx6jhV27qQ7sue
         zPoA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=nGnHCAz7;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id u16si245747eda.2.2019.05.05.06.28.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 06:28:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M7bQ3-1gZJUq3GqN-00xHqQ; Sun, 05
 May 2019 15:28:27 +0200
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
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
 <26834bed-4a78-4bac-b093-d8f9e2646e72@googlegroups.com>
 <6ca6fe6a-27b7-4110-884f-e3c5be79134c@googlegroups.com>
 <f09baf4b-72c1-d6d8-56af-966b1afbb88a@web.de>
 <be558db9-b112-5891-119c-0290c33ef7f0@web.de>
 <c5cfbbaa-9df7-4b63-a584-3fa5e9603780@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <3d0e75b6-6de1-d6e5-e393-309f39766d2b@web.de>
Date: Sun, 5 May 2019 15:28:27 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c5cfbbaa-9df7-4b63-a584-3fa5e9603780@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:adjSR5YRVJfoLH6hERfO6YWT+4lBqFFlxMS7kzEbjRG+Ul6v0Sq
 Uc2FrPrTixSAMwSbJCTbXnzrPW+YPecAA5iZnWNULLuTPVbsJdK+Egv1gEbypO8AachslCU
 uDoLR2CEhGihc/+8TCeIhIJWgG5sNHc9YBERfKiHmwXmA5Xc0wym+xO6M3Q4VPzTAUfugJk
 XHi+D/dMHnqKXI6AXz0SQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4MQccIz5QQg=:5vhv5dtWqvWelfFWP5gNGH
 QwPTr4g6Z9v8ocat5X3rPjc7LeKH+7KZpEh9EfiqbUycmKuhCLhkRTEQWUSmFkynQLr+XDwgf
 JIOtUw30/TU2shEsqTCpyOcxRMsUr1ABuOhsjeiQsjfxeHMPBw+2bPjvya9kIwajd6MKpWD/c
 0Wtl24jVVfSPZA3ZgDtwHj1502tmaius18rBkmNW5TNTu2yg8e1lHktD8e4nuOxkeELxnzz86
 U2N6zNzHdvhB/mH8Ktg3KmMdslFSnUSa2tHk+09mBn0vBm8OgXyOg6bltaLYfYxXPQJyvE9ya
 sqfLssVqzh1lYObV9DjOfQu1XnQyFUDcPoCyW9o1nuHquymw/XODLWnrtjfMfFjlQLkBolgHt
 kRc9rWt3gHlHk9EMTVqSTEGnOGC3DkOBHhNyE2uKMPNtuh3Mo0vGVXJchDVYKE/7cHRifJ6ze
 T8H+GDd+XCzWws8ktMLluoSQOCsg65ulcor0HrdSv6ibNdpGL5+edflqW5oRUB7Ai2qKJlBzb
 uEyPElqm39qGOb3Ro9VVGe9HuxTu+n4akn+CRb94GclvXkU9vObMhOy5jtCkVUxaiS4vbZ8sM
 R7w6VSXQoBdbF3hGWcynEorZLutaILW0/Z7xEus7RW0bcWqkJqroaRVTob5dxRAezec2xMJ1u
 Hhms8x5dqGqt5RjzdkL/3Ig6vW4YYIRmVnYkAERNnt+sGVZBREx53IW9ULcA57Mk9opPwckQl
 jwUaOijxa9UA0BMBbv2qnx78EuXDRVuYTTDL26dZs8G4EvE8ADT56A0HMl9WIvvBX+0DamNlh
 +Lwdq1/TfFseHQjn84KODAvTtB+IXnarBNnFlo93RFstWgcJyTXvM2ZcenLegENiXpm0dIFN+
 dHE2CoYCXZ8qc8spK3q4KS7Mxonu0UJO/xB+hYoTwz5n9tAGHr0PTMWAZcuTyy2pMwY9ftEJ9
 cLAq4fXKKiA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=nGnHCAz7;       spf=pass
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

On 05.05.19 14:56, Hakk=C4=B1 Kurumahmut wrote:
> 5 May=C4=B1s 2019 Pazar 15:18:16 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
>> On 05.05.19 10:10, Jan Kiszka wrote:
>>> On 02.05.19 17:06, Hakk=C4=B1 Kurumahmut wrote:
>>>> Hi again,
>>>>
>>>> Is my last patch in my previous message correct, I am asking for my cu=
riosity :)
>>>
>>> I still think it's papering over some other issue, but I need to regene=
rate the
>>> config from your data.
>>
>> Checked the configs that are generated from
>> HP_EliteBook_8460p_2019_04_29__18_59_data_collection.tar and
>> HP_EliteBook_8460p_2019_04_29__19_00_data_collection.tar: They seem to d=
etect
>> the DMAR unit base addresses correctly, and they also do not map them in=
to the
>> guest - all fine. So, there is no need need for your patch. In fact, as =
I stated
>> before, it would create a bug as it would map the DMAR unit directly int=
o the
>> guest which breaks isolation and more.
>>
>> If you still see access violations on DMAR addresses then this may have =
one of
>> the following reasons:
>>
>>    - you forgot to disable the intel_iommu before enabling Jailhouse
>>
>>    - your Linux kernel uses an instruction for accessing the DMAR
>>      interrupt remapping registers (which Jailhouse can emulate) that we
>>      do not support yet
>>
>> Please post the complete access violation report if the issue persists.
>>
>>
>> Regarding the different configs generate due to different kernel RAM add=
resses:
>> That is a harmless effect. The RAM regions, in their sum, will still map=
 the
>> same memory. We could avoid that effect by detecting and coalescing neig=
hboring
>> regions with identical parameters.
>>
>> Jan
>
>
> Hi Jan,
>
> I have reported two different issues. One of them is about HP8460p machin=
e, the other is about HP8300.
>
>
> ---------------------------------------------------
> ---------------------------------------------------
> ---------------------------------------------------
> One of them is about kernel code, data, bss section location that is loca=
ted different areas when PC was restarted. I sent you below message for it.=
 Therefore, the config file must be manually edited at every restart.
>
>
> HP_EliteBook_8460p_2019_04_29__18_59_data_collection.tar
> HP_EliteBook_8460p_2019_04_29__19_00_data_collection.tar
>
> I attached sequential restart --> jailhouse rebuild --> config create res=
ults for HP8460p.
>
>
> Difference for Kernel code, data and bss sections.
>
> First restart of PC (HP_EliteBook_8460p_2019_04_29__18_59_data_collection=
.tar)
> 100000000-23dffffff : System RAM
>    146000000-146c031d0 : Kernel code
>    146c031d1-1476928ff : Kernel data
>    147919000-147b61fff : Kernel bss
>
> Second restart of PC (HP_EliteBook_8460p_2019_04_29__19_00_data_collectio=
n.tar)
> 7a000000-bbd90fff : System RAM
>    adc00000-ae8031d0 : Kernel code
>    ae8031d1-af2928ff : Kernel data
>    af519000-af761fff : Kernel bss
>

As I said, this difference is harmless.

> Consequently, result config file is affected this changes. I think conseq=
uently restart for IOMMU ON and OFF causes new problems. Maybe I'm misinter=
preting.
> ---------------------------------------------------
> ---------------------------------------------------
> ---------------------------------------------------
>
>
>
>
>
>
> The other problem is about DMAR regions under reserved region. Config par=
ser needs a patch. I've added the details below:
>
>
> Hi Jan,
>
> While kernel command parameters are intel_iommu=3Don intremap=3Don at R71=
0 and HP8300 machine, proc/iomem shows DMAR region under Reserved area. Thi=
s patch or something else must be done for config creation to complete beca=
use of generating DMAR region not found error although it exist.
>
> I have write a patch that is attached below: (for jailhouse master branch=
)
>
> It is not touch to tree only update dmar_regions variable.
>

The patch is very likely incorrect.

Please share the collected config for this targets - or point me to the lin=
k to
the one you already sent. Then I can double-check what may go wrong during
parsing (if anything at all). If it's a runtime issue: I've sent the two
possible reasons in the other email.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
