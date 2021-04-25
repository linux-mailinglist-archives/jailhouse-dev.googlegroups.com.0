Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBWP5SSCAMGQEPF7LWBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB436A66A
	for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Apr 2021 12:05:14 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id w23-20020a2e9bd70000b02900bf1b1c597esf7462490ljj.17
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Apr 2021 03:05:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619345114; cv=pass;
        d=google.com; s=arc-20160816;
        b=zljDNrLoOoEQzliFalp0Jki7U8OyQXKOpOs2HosNXot2HIUYol94TL1mfYOUsOBFFG
         ThUAvhNVQeWpm9wafAz+2jE0kUNtaOtcEysBK+bEbbkKYBZ+/0K2yRUd8RYj7F9TqGJz
         XF7Dq5VdW/GykPmgKpe7C/3oL8uARLtZliWSON7RFh3cx3EyTbU248Rq+tQkItUlq6Uc
         5uOm1bPtsJjHLfT5S34RMqSGI2T1JE2S62KYJL/Q7DeBuI3FWowPZHXEf72+KhV6zVft
         +AX5c2MIEGyO3TVbwVqjcD6D6RlxHv8ZSGMesuk1+jQx3Pjni42BHeWaORrf/I/OmUGm
         Q1dA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=x8d5gvnhDprxwSZpryfLe+n5NhNAaPISdR95qUSgP2k=;
        b=sAIsZCCOxvg1U2adSUMcBDIjYwZJ/F5KZ7dNw19yTYOcgwpQjlPG2j+rpzqn1zjgeZ
         3T9Ku9Yl2RB99tPrg5Zjt3VDJ8zaicWXZpZ5FxWW9RpNPAdKDOv5Ff2x+R0PLoHjtJbu
         QplZFmWkjOpQFKrSU+7PK4dheQCZOIE7LJncbW+LCuqg2hKx+9AM+0G7daDXpskEXGqx
         rVGRdzztRxkBZjYcvqj1UDpGIWTQyAzWt+Z2SAwfyJxuDCplpLl9SvOVe6Hf7DYDrQTM
         ZHmy7uRHFth/+MsLpyUWp4RvJJUBLpgTPzBKu/4eaaY7NYKyVxEruKuUh9nCX8RZOEXF
         jGAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VRIlYfCj;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x8d5gvnhDprxwSZpryfLe+n5NhNAaPISdR95qUSgP2k=;
        b=aOtK2adhkeY1ADD2LcrAxKLc3iJSGKrvQa8Gp16L0RxI3DOeQ3pTZSU0bA6fG6OHiI
         /9OeOoCB2ThSg7qz0f36QOXSU3ok1VUr+qSoKCoUmOUKCZeZjhY3oM8l1tvVhwxTPsY3
         OGNJBBTamH/BZg3s2ESWU985rWex4NNzenu4FcfpkwBbiiemhYeUjMh3bg59WO3SZYDI
         eoFeHCWY9+pnZwlM5wr0CpIw34vB4qfShAWL8Pp6zVi3zeU/FIrGofL1qcSxwS1YTLgX
         Lp1ZRW4GCIVKpnOIlrpnAtAxccNzJ2L1dawiXlUp3It0gYr3kc3BJ9jO+Yc8IVSkfOX4
         BBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x8d5gvnhDprxwSZpryfLe+n5NhNAaPISdR95qUSgP2k=;
        b=EFBHGfW3GjX34Ao0VBXGr4QYoU/Awx1nJ8ORrvHXftkCkSGFBXpb//9j6OHVEsYZtu
         /68K/ywZTsLMuOvOvP8LgaDol1cUY4kt0LIfLfzAvAdG+dPJezj5JHWJzSV+G0SuuBpd
         DD9mQNIbiZdv6812MkDO1U9fXJES6fbC4C5V6Fs9JYWOVIDeXzD+/K47ZsxntKqH0DTM
         cpPNba2c16fFB/KI/mA6z2xqfqJxJcv/vUHgaqizQ0Vp+gS7/K7fq5dikCMjh7fftCXN
         f6WhGGaG/bCCNNqsp10yo8ZgrPTn2zYLCWWgtwRuuUjWzXMlAt8F3rcVqVVbMGGFA4qO
         irPQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Oft6Edh16U4PxVHNA1YUq6Iw6nB1lHNGhDqZZA8jIrgBgNV7r
	AJKOmMy7WPqB7FsiRKS8Kec=
X-Google-Smtp-Source: ABdhPJygYZRfeQirngbNd80IaDwhWCIbYqToTnUSSs5+p2tKBKeQnfc7DVl0NXI3hi/ol7AnhkwqaQ==
X-Received: by 2002:a05:6512:3087:: with SMTP id z7mr8613130lfd.285.1619345114022;
        Sun, 25 Apr 2021 03:05:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8518:: with SMTP id j24ls4320401lji.3.gmail; Sun, 25 Apr
 2021 03:05:12 -0700 (PDT)
X-Received: by 2002:a2e:990c:: with SMTP id v12mr9072685lji.309.1619345112820;
        Sun, 25 Apr 2021 03:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619345112; cv=none;
        d=google.com; s=arc-20160816;
        b=qV89SxabmGRUjdF+9f+WykNpy35ee8SWZT2pPpSL1Ei1WvrMvaL6DJDMWvO78waks6
         uF6+83jW0mH7BsQJ6Jm5zTaoxgzrKC1VbYsBhuV+nZALYqSrZK8n9oswHPy9h0bEyxzJ
         UJb84IiG/DUZUyu4uBL+jUNw05/3bfAPjS4xAya3ZLovGi5gAQt7UZJa+wrgBcU5LAbm
         Vn2zlm2KbzWRVsn1xzS8u3LyKDk7MedRoI1snYnYWzgQc8XZDPFT96H5dmtz9QsT3UZr
         DsXZ8irMCB6FNrFxN78dVwTJcp43Nznxmkcx+9G3FYD0Ac/9FvYPm6jrVMXSZm8ML4p2
         BScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=STsxEYuGfkCHRVhyHdOyCaqnGmvISaNl680N8KrCj50=;
        b=o2igLmPjMxZeGtKP1LssTbOOPyR90K0nNwMPWhyhqSRUbK8HCEokATsqkah/JQgLbF
         JC9YNRipcSDbKmDwefb2+hCPHTPgAGFnRj8Y0somiGPcdhbn+nSxyDOjX4RcnEA0jNS5
         jPOiOA5dhaZuGgOUCp2gwSopB/qGiVMhWbhJ8i/AfL4fNgC4DfrLDdkDq2e9207GFYP+
         feN0OMrD4t9pvkFl/uQVo9c+x9BAKkfUVn6ofMVeGjuRZn5xUwJ1W6CkTT6PD4NH3EDA
         bBJb+wPhvwqWCVmk5YVZ/o4YOapYaInHSgRHThFaoE/3MzEUjzmx1wOmM5641vMaDqDL
         uMeQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VRIlYfCj;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id z33si113186lfu.12.2021.04.25.03.05.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 03:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.53]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LfztP-1lH9rg3o8R-00pet4; Sun, 25
 Apr 2021 12:05:12 +0200
Subject: Re: [EXT] AW: AW: Inquiry
To: Moustafa Noufale <moustafa.noufale@uni-rostock.de>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
 <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
Date: Sun, 25 Apr 2021 12:05:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9IqPwJPv0h50C1Ym8dxLabkeDL6PzeQ842243u4B5Hv+BHOMeYm
 2sGatVc6wtoggQdIWzfP4SqNslpPPLfGFsOiGsqVQ+ggCHUo9/4SZPfZnFZRqIUuRNb0rPq
 DB/qk6ghpnuQOBZRDJneligMKyJ9YCEml/Jo99L1s3tFK5AXqH0gGmFxfaPSkca/1cmRm+g
 f1Js9Eoo7NlVRoLGuwmBg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hoVYMU/lnSI=:jRCkX7E4kd0+1YYRFNFtDk
 JsZh3xEhacUnNuMo4sNRvU+h8X908sEguWMFU2qaQq8dZv05UQpjXl9wbYFX06lX26fuKwyWG
 02daFxz/3G9FugE9q4Qht65cw/iFXXRrhHm/QnT+OGd4JAAj0d6SXqXBNKvrZDrpNQVoptcBR
 IxDDRBIUo0TZEqZUUwazyaI34r/RHJieVhVoveA7vocZ+F+igzWoerLhVc12tjqTw0ZxEnXaz
 K+fW7/jw9XTDCwbZ3q2f157/6+UZ0YyrFZIM13t0iGjvtTEWAtSwKucaDunnl4vR5uyZqeUTr
 vKeRRkyqvcevjlinfDNWUeTGxQ05D5T6lfcX+3O3J7+j0G09zbPpONmvwuw1rC35h1e0NuS6t
 A9qnZitjJ3NuQbK+xWmfq5yjTVt1xLm8kxuRlrHIYgX9tpyxn3rtp0Wrwmp4ipK+hJYW9PJhV
 FP6s6kZNlPy/gnCeBH/hjybF853NRyTma4cVTeYHbSGK7Qq/atruDqeWSQnpElEewdjnQnbsu
 MnHAggRkyPqoaHuFYdFJh5GlYXpdrjw6ocEOBN0CfJiI/hFPReW6xY+OSn4irQetZ7AAy7q6v
 PlW0i0LmPiEKDMcnesx5MjajkOS0y9MXgytkqZfvzEOvDg51+iayTHoSyFisyJ9lc2hbIcsNb
 BkmyRFNLR41Uj8fSGUaLMwdKyvcoAbnbx4OEg568hcU4t/7DJtK1tcm/yCFtPm15i9c0941Sh
 4IZNY7ZPhhDVnHo8+pj8KaF1hOTSWqXWTqvlChyDbs9hPMOSua2LdIUiJMETD0ECtkrlkqgiJ
 YsVPBjQ5s/JHUqsFbO3he5+IgC6gZ7ZzdJn4BNGzIEmneJ381k31FsBLIs2brfouHDIPncT1T
 fkP0xirqJt7mj1HefJBNpzevBRo5Qj/yoXNV4VgTPOuXBYlRN7ddWSM25keHuOUz/pxyRNz54
 CYdRt24NzVNNtT6l5aeMqbKGQge570hewhCvoZc9VAiRDbohJpLWnSZ+kRcuxNaXbR0S1vfBs
 URGLpfyOFZff1yPHexitpHymsn0LvEA5VJjAocNrVBDlsy1hSbF1EW77QzBlkFE3qkV/EHxNl
 18+dqq/0P5Eb4wvVR5lUQ/nV2rQBJqxDs4T3UT1a6sb73b/ErrUBhIMMhxtpnL8RrGwzGYfmS
 yPy2kCJmAA+L6d2Lkanf2yH8iE4+INCdGTyTeHOEWqZJhY228tvy0uQPTV7tVEF5nztKc=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=VRIlYfCj;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 25.04.21 11:32, Moustafa Noufale wrote:
> Yes, the machine is working and jailhouse is present in the list of Modul=
es. However, when I run this command:
> jailhouse enable /etc/jailhouse/qemu-x86.cell
> I get on the QEMU side " Input/output error"
>
> and on the terminal:
> Initializing Jailhouse hypervisor v0.12 (0-g92db71f2-dirty) on CPU 2
> Code location: 0xfffffffff0000050
> Using x2APIC
>
> Then I ran jailhouse hardware check and everything is available, except f=
or:
> "Virtualize APIC access             MISSING"
>

Also when running on a native Linux host? This is unusual. What CPU do
you have (lscpu)?

Jan

> Then I tried to figure it out with different ways:
>     sudo modprobe kvm_amd nested=3D1
>     sudo modprobe kvm_intel enable_apicv=3D1
>
> or editing the kvm.conf file, but with testing with the following command=
:
> cat /sys/module/kvm_intel/parameters/nested
> returns Y and it is okay.
> cat /sys/module/kvm_intel/parameters/enable_apicv
> it returns always N.
>
> I tried two setups:
> 1- Ubuntu 20.1 as a VM on Win10 machine.
> 2- Ubuntu 18 as the main host machine.
>
> Thanks in advance
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> Gesendet: Freitag, 23. April 2021 20:40
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka <jan.k=
iszka@web.de>; jailhouse-dev@googlegroups.com
> Betreff: Re: [EXT] AW: AW: Inquiry
>
> Hi Moustafa,
>
> On 23/04/2021 15:04, Moustafa Noufale wrote:
>> Hello,
>> I would like to thank you for your support and maybe you can give me a l=
ittle help with building "jailhouse.ko"
>> I have tried make, make install with and without root in this directory =
"jailhouse-master/driver" and I am not sure if I am following the correct p=
rocedure. What I have done so far is building an image of a virtual x-86 th=
rough running ./build-images.sh and I can start it using ./start-qemu.sh.
>
> Okay - so you did build successfully build your target with jailhouse-ima=
ges, and start-qemu.sh gives you a running qemu instance?
>
> In this case, everything is already installed and in place. The jailhouse=
 module will already be loaded - you can check that with `lsmod`.
>
> To enable jailhouse, you can simply check the history of you bash, or hav=
e a look here:
>
> https://github.com/siemens/jailhouse-images/blob/master/recipes-core/cust=
omizations/files/.bash_history-qemu-amd64
>
> HTH,
>   Ralf
>
>> What I have understood from the tutorial is that I have to inject jailho=
use.ko into the kernel and then start the guest.
>> Thanks in advance
>> Moustafa Noufale
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>> Gesendet: Dienstag, 20. April 2021 11:39
>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka
>> <jan.kiszka@web.de>; jailhouse-dev@googlegroups.com
>> Betreff: Re: AW: Inquiry
>>
>> Hi,
>>
>> On 20/04/2021 11:29, Moustafa Noufale wrote:
>>> Hi Mr. Kiszka,
>>> I have tried to  build an image through running "build-images.sh" with =
and without root access:
>>>
>>> without root access:
>>>
>>> Select images to build (space-separated index list): 1
>>> docker: Got permission denied while trying to connect to the Docker dae=
mon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocke=
r.sock/v1.24/containers/create: dial unix /var/run/docker.sock: connect: pe=
rmission denied.
>>
>> your local user needs to be in the docker group.
>>
>>> See 'docker run --help'.
>>>
>>> With root access:
>>>
>>> Select images to build (space-separated index list): 1
>>> Error: Running as root - may break certain recipes.
>>> Better give a regular user docker access. Set KAS_ALLOW_ROOT=3Dyes to o=
verride.
>>
>> Simply read the error message and follow the instructions: If you want t=
o run docker as root, you have to set KAS_ALLOW_ROOT=3Dyes to your environm=
ent. For good reasons: You shouldn't do that as root.
>>
>> Anyway, solve the issue by adding your user to the docker group.
>>
>>   Ralf
>>
>>>
>>> I have installed QEMU version 5, KVM 2.2 and enabled nested virtualizat=
ion.
>>> I would really appreciate it, if you could me a hint.
>>> Thanks in advance,
>>> Moustafa Noufale
>>>
>>> -----Urspr=C3=BCngliche Nachricht-----
>>> Von: Jan Kiszka <jan.kiszka@web.de>
>>> Gesendet: Samstag, 17. April 2021 11:45
>>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>;
>>> jailhouse-dev@googlegroups.com
>>> Betreff: Re: Inquiry
>>>
>>> Hi Moustafa,
>>>
>>> On 16.04.21 10:29, Moustafa Noufale wrote:
>>>>
>>>> To whom it may concern,
>>>> I am a Master student in Rostock University and I am studying
>>>> Jailhouse this semester as a Master project and I would like to
>>>> gather information about this Hypervisor, as well as I would like to
>>>> ask, whether it is possible to install it on an Ubuntu Virtual
>>>> Machine? I just need an outline, how I can learn it. I spent today
>>>> reading the code on GitHub, but I need more information and appreciate=
 it if you can help me.
>>>>
>>>
>>> A good starting point for experiments can be the images generated by [1=
], both for KVM VMs, pure QEMU emulation target or also real boards.
>>> Note that emulating target inside a VM will work but using KVM (for x86=
) may not or is at least fairly slow. I would recommend a native Linux host=
.
>>>
>>> Then you will find a lot of presentations on Jailhouse on the internet =
as well as an (aging) tutorial on how to bring it up on new hardware.
>>>
>>> Jan
>>>
>>> [1] https://github.com/siemens/jailhouse-images
>>> [2]
>>> https://events.static.linuxfound.org/sites/events/files/slides/ELCE20
>>> 1
>>> 6-Jailhouse-Tutorial.pdf [2]
>>> https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf%40web.de.
