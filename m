Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBY45YH2QKGQEXDMDJ4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x239.google.com (mail-oi1-x239.google.com [IPv6:2607:f8b0:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EA01C4257
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 19:20:37 +0200 (CEST)
Received: by mail-oi1-x239.google.com with SMTP id k3sf6256656oig.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 10:20:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588612836; cv=pass;
        d=google.com; s=arc-20160816;
        b=R6GaO+FenO2vdX1jZbGuLVjhEw2VaNw/PbHfA65uM04VlcbwrvdKlHtVWAMQBGhKqO
         hgejQWpVJ+l8R2tNADDaoJpS0jpGeobglclRX481TbsyrjPlrWv8r/2QeFR3JJTq036B
         AxjLnXlbYDzvlG04QEeSEadJsQPaoDssf8C4lLxH9aPLUkapMlqkukMtsiiRVsc4/kPC
         gCfMF32tNIn29B4MhngaDS7kcsdJiYu2KoVTd+L+QqkqC3FEUwJFsHrueIb9mKhrFVZh
         qJGpCatL4IPlzOiAhxItLNTPvA4GfAw8D56rSQDE4W8gPadATmugPo6DpKm/mQA7a+Sz
         eZlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=9Ten62cWGKGOMxviapBFZvqEtq0+rz1KFlqq9j/kRH0=;
        b=M2mOChHh0inIwAMOHR5Ywqc4A4tHtji5M8b5kY+lG7RIPRWiXNeov+VypON13kCPS7
         sdQiJcQouXBn3ncwdHScV780xLL3O8FvviEaLrAdRgj3d0fV07Kk87nduV4aoMrUIPZx
         bPzEfypFvO12quENraiA09JiklT47xI+VMF+dzKM/QlqsrX476dK8iE7OKAero75kYdh
         AgaMPGS9eYFamm13GfNGR1kyVNotf6S0+C5s4gd7Ll4Z4itHdopD5VqaN/DQzxIz0O9v
         CQNmT7GgSLSyQ92o9YNDkcl8QHAN2qCkxTtKm/jnQueKm9NsLDKDzIskoNVb/EoFasgk
         ocrg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wL9oiDkf;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=9Ten62cWGKGOMxviapBFZvqEtq0+rz1KFlqq9j/kRH0=;
        b=n5nVn3xMYnc2umdtdJBlDZyNqex8S5mmDtVbwykj7HHrrLsSrBchbXrhPuXvpaIxyr
         UVWYTXmBXRp5eZ9QJVggmV4+WY055tk65rJLyH728ykS1oLc1CovqmKHRBWNoWnIyPwD
         0cwkWw0UjkjpeWTkMythjYUc/GfPtmv7KBXAynAnshIudNfXSpcWRJfdUxUd1hHfX1PO
         O2hgnIVg8ZgMMqnhd7ckgwxV8rdwuhBwmCC0f6LV59z4lfxsICeUCEaU/3OTfuW+N7yo
         k5L/nmMYUFti0vdgeORYdLUIxhzELrs461earOcNbYtLoUN4SqqxrZl3cxsjc1NC3GP9
         6C8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9Ten62cWGKGOMxviapBFZvqEtq0+rz1KFlqq9j/kRH0=;
        b=rPyt6FPPzCywN3Infkd815nTrmyKgk5cvNZIGDKw9+TiS54w88FoBwSg7DsHJEWRr2
         T1g20/wregjVQ2hbiZ9xxBodzg5NEViyYYxIuCFuNc/JpBYFGT+n2MVHFqfQi1zmAyvi
         KM3VwH/xK8MvwZowKJiuiCCgmLXzPxVtDmq0wfnxZ1Z5kGHy8W702nJtfNr/UdriRWtX
         pQ6ubwhm/reC5Hcx8sZGZ5zyAaB3VgyM7uA4BJip3QDfbYhMMXOkwTCfy8YPFSRbMnPk
         iO/87YcrZdRfup51jcrX9abCEpV26l/uli+sk0LvJJ3sW9MHnu+u4xcBskQN9YhAh2ks
         A/SA==
X-Gm-Message-State: AGi0PuZf4jTxA67pZdyHuAhM9T212oTc0UXQleZv0OrZleAdfH4rNZV3
	t2YHKNowLd9nw4R3QbKbm7w=
X-Google-Smtp-Source: APiQypJcZUblizAZeWnEvzs8t5110cWtTQMQSmuY/tr8o732SnIFjmSxY3ERVxa4WJTRWzbkaZRTSg==
X-Received: by 2002:a9d:1d6:: with SMTP id e80mr15451186ote.300.1588612835731;
        Mon, 04 May 2020 10:20:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:d984:: with SMTP id k4ls735525oou.2.gmail; Mon, 04 May
 2020 10:20:35 -0700 (PDT)
X-Received: by 2002:a4a:9c55:: with SMTP id c21mr15857634ook.25.1588612835143;
        Mon, 04 May 2020 10:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588612835; cv=none;
        d=google.com; s=arc-20160816;
        b=o2MlKqgbqCXq8sKaWkcozgXnlXqYOirlDXmh47w7Ba91VRuv+VmjKpJo6JDW8eF1s0
         V4srkLdyYHsMeIV7iee5rYn8iiqmdh9MfGG5n5UevkEidO8okWpoiPXakYXEWFUEyBf7
         u7okDmumD7SaWWx5vARS1cImugX87LrpuwQPALyIJbeel7t3zQFVWGfO4wbrPF67Ot/9
         NhHtonO95BEVJBiyZUycWPhdKvjzuVjZ5JEjk69MVZ/TYN6weCtBRDLMC31uKVQKf8NP
         MnZ1gFTHX8NVhDLAx65hbtao3jqgL1xscc95TgfExkJKaIU5WD30Bk5lFSF+wMs3IRAv
         ls2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=+jU8YYsLPKed6XjwCaKiNEOHLPq0l27HZkVKUHAVjfY=;
        b=CseJaze2/op0WsC6kI+y7fwbvcK7eAkHkAl3kUJrv5KJX6kF/d6tnfi8hET1mXxC7J
         4/1ZJWEGo0Ngz3mlZr5Jg23GHKG6kZWLGktrj69aPVR/GdfaEsiba92hS56pBznQfjNY
         itTeF4Onvt3f/+vmgCHsLE7bBrcnILBaU2y3c4cQirX/9Figef/RbTwS2x+gA8euKaDI
         6O8CNpr5dDMJLBAkaxH09mJ7++vYu1e80cXpYaaN1ScL/rL0sarWEnhdt5/foXT6HrnH
         k6PlGnRRiMHoaDmuOFk//TxmYP/2e9RrwCL9rGRt+ZnOUinlAMUJ4MY+WPUUOL4LEk8c
         3spw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wL9oiDkf;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id t17si724715ooq.1.2020.05.04.10.20.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 10:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 044HKYUI087634;
	Mon, 4 May 2020 12:20:34 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 044HKY0a086781
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 May 2020 12:20:34 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 4 May
 2020 12:20:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 4 May 2020 12:20:34 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044HKWbU052393;
	Mon, 4 May 2020 12:20:33 -0500
Subject: Re: ivhsmem_uio driver update
To: Jan Kiszka <jan.kiszka@web.de>, <henning.schild@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        "Vutla,
 Lokesh" <lokeshvutla@ti.com>
References: <7c89b273-d0a7-706c-651f-6e658933d93c@ti.com>
 <be05da3a-bd66-b51a-7cd2-53685582de54@siemens.com>
 <5e63fd55-8606-3046-a2cf-2ba8efc80203@ti.com>
 <92c2a027-7a70-5d0b-d12a-45c54272afd8@ti.com>
 <d0581908-3ee2-ad16-6ac1-c0741ab0c6b4@ti.com>
 <a1f4405e-8b5c-9de4-5d8a-edad73cd8f96@web.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <3c98f0a4-6067-8f00-0b8e-0ca15ede7ce3@ti.com>
Date: Mon, 4 May 2020 22:50:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a1f4405e-8b5c-9de4-5d8a-edad73cd8f96@web.de>
Content-Type: multipart/alternative;
	boundary="------------6D98C4740398C96EEF837D82"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=wL9oiDkf;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------6D98C4740398C96EEF837D82
Content-Type: text/plain; charset="UTF-8"; format=flowed



On 30/04/20 8:13 pm, Jan Kiszka wrote:
> On 30.04.20 15:32, 'Nikhil Devshatwar' via Jailhouse wrote:
>>
>>
>> On 30/04/20 7:01 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>
>>>
>>> On 09/03/20 4:52 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>>
>>>>
>>>> On 09/03/20 4:39 pm, Jan Kiszka wrote:
>>>>> On 09.03.20 11:12, Nikhil Devshatwar wrote:
>>>>>> Hi Henning,
>>>>>>
>>>>>> As part of the TI SDK, we were integrating the ivhsmem_uio as
>>>>>> external module
>>>>>> from https://github.com/henning-schild-work/ivshmem-guest-code
>>>>>>
>>>>>> Since the ivshmem changes in the Jailhouse, that driver no more
>>>>>> works (because of the vendor ID change)
>>>>>> Do you plan to host the updated version of the driver in this repo?
>>>>>>
>>>>>> I know that the driver is already part of the siemens repo but it
>>>>>> is much simpler to integrate an external module in yocto.
>>>>>
>>>>> Actually, that new driver is a complete rewrite, not just an ID
>>>>> update. It allows to securely pass access to unprivileged users and
>>>>> provides all features of the new ivshmem interface.
>>>
>>> With this driver, I can get the uio device registered but when I run
>>> the uio_send and uio_read apps,
>> Using the uio_send and uio_read apps from
>> https://github.com/henning-schild-work/ivshmem-guest-code/tree/master/uio/tests/Interrupts/VM 
>>
>>
>
> Yeah, Henning already suggested to shut that repo down as people are
> still finding it...
>
Hi Jan,

> Please follow the *updated* description in
> Documentation/inter-cell-communication.md regarding demos.
>

I am now running the tools/ivshmem-demo.c application.
I am getting failure to mmap the registers region because the default 
sizes for most of the ivshmem regions are multiple of 4096
When runnning a 64 bit kernel, mapping a 4k memory chunk in userspace 
fails with EINVAL error [1]
How can this be fixed?

[1] https://elixir.bootlin.com/linux/v5.4.38/source/drivers/uio/uio.c#L737

Regards,
Nikhil D

> Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3c98f0a4-6067-8f00-0b8e-0ca15ede7ce3%40ti.com.

--------------6D98C4740398C96EEF837D82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 30/04/20 8:13 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:a1f4405e-8b5c-9de4-5d8a-edad73cd8f96@web.de">On 30.04.20
      15:32, 'Nikhil Devshatwar' via Jailhouse wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        On 30/04/20 7:01 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
        <br>
        <blockquote type=3D"cite">
          <br>
          <br>
          On 09/03/20 4:52 pm, 'Nikhil Devshatwar' via Jailhouse wrote:
          <br>
          <blockquote type=3D"cite">
            <br>
            <br>
            On 09/03/20 4:39 pm, Jan Kiszka wrote:
            <br>
            <blockquote type=3D"cite">On 09.03.20 11:12, Nikhil Devshatwar
              wrote:
              <br>
              <blockquote type=3D"cite">Hi Henning,
                <br>
                <br>
                As part of the TI SDK, we were integrating the
                ivhsmem_uio as
                <br>
                external module
                <br>
                from
                <a class=3D"moz-txt-link-freetext" href=3D"https://github.c=
om/henning-schild-work/ivshmem-guest-code">https://github.com/henning-schil=
d-work/ivshmem-guest-code</a>
                <br>
                <br>
                Since the ivshmem changes in the Jailhouse, that driver
                no more
                <br>
                works (because of the vendor ID change)
                <br>
                Do you plan to host the updated version of the driver in
                this repo?
                <br>
                <br>
                I know that the driver is already part of the siemens
                repo but it
                <br>
                is much simpler to integrate an external module in
                yocto.
                <br>
              </blockquote>
              <br>
              Actually, that new driver is a complete rewrite, not just
              an ID
              <br>
              update. It allows to securely pass access to unprivileged
              users and
              <br>
              provides all features of the new ivshmem interface.
              <br>
            </blockquote>
          </blockquote>
          <br>
          With this driver, I can get the uio device registered but when
          I run
          <br>
          the uio_send and uio_read apps,
          <br>
        </blockquote>
        Using the uio_send and uio_read apps from
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/henning-schil=
d-work/ivshmem-guest-code/tree/master/uio/tests/Interrupts/VM">https://gith=
ub.com/henning-schild-work/ivshmem-guest-code/tree/master/uio/tests/Interru=
pts/VM</a>
        <br>
        <br>
      </blockquote>
      <br>
      Yeah, Henning already suggested to shut that repo down as people
      are
      <br>
      still finding it...
      <br>
      <br>
    </blockquote>
    Hi Jan,<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:a1f4405e-8b5c-9de4-5d8a-edad73cd8f96@web.de">Please
      follow the *updated* description in
      <br>
      Documentation/inter-cell-communication.md regarding demos.
      <br>
      <br>
    </blockquote>
    <br>
    I am now running the tools/ivshmem-demo.c application.<br>
    I am getting failure to mmap the registers region because the
    default sizes for most of the ivshmem regions are multiple of 4096<br>
    When runnning a 64 bit kernel, mapping a 4k memory chunk in
    userspace fails with EINVAL error [1]<br>
    How can this be fixed?<br>
    <br>
    [1]
    <a class=3D"moz-txt-link-freetext" href=3D"https://elixir.bootlin.com/l=
inux/v5.4.38/source/drivers/uio/uio.c#L737">https://elixir.bootlin.com/linu=
x/v5.4.38/source/drivers/uio/uio.c#L737</a><br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:a1f4405e-8b5c-9de4-5d8a-edad73cd8f96@web.de">Jan
      <br>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3c98f0a4-6067-8f00-0b8e-0ca15ede7ce3%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/3c98f0a4-6067-8f00-0b8e-0ca15ede7ce3%40ti.com</a>.<br />

--------------6D98C4740398C96EEF837D82--
