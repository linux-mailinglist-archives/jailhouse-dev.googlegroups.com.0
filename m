Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2FIRSCAMGQEHNNRQBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 365BB3699D8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Apr 2021 20:39:37 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id 93-20020adf80e60000b0290106fab45006sf10857575wrl.20
        for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Apr 2021 11:39:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1619203177; cv=pass;
        d=google.com; s=arc-20160816;
        b=GTuZmrhjpJmfciXSORGMYX3J36Fb1iNhuXa4eR87AkNQ9HtM/IJq/a0JIEN9Fkz661
         D/bLx1mPZAwC40EFP0aGq7TPEjMi8svQJ4HepyMbVy2ty0Dv+aydxqf4FbbYxXuxNGXD
         WC9VOG7EKK8Kq0INGS3XZO25CJ4xGDf8ruwmg4pPGlE04qUHzkgLUe1UTMESh1lK/bn4
         Yn5h8V8928NjGRw8TV86tH3YkV5brjn3evOqjpNUJh7VZ26wRMrcTYH4aKpkE1m4/aqp
         wPkQZ3/ceFb1W+4Y7V7ticpB7nh2fqEdiuCNWbeBA4yGxKpH3dc+APz7m2aO+0BuOUqq
         DIeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=9dYrX7MDIEEobZPAR8ptDi+510Np8lcG2vQ50u++TlU=;
        b=uED8PBQxC5W8/5//ixG4qgpDmuAS7gQyVHvApj7duKTvSR7q9r+4xiX+cVrpm7ydSz
         L20gTU+uF6fv3ykXq11mNKukXcaX1p3SgzU0GMHtvUwu+rforiwSzw7TJgluYA7Y9xft
         2JiUFHHjp2XNGZR3qIRJzpuoAbq/coPWBs5Che/HDRAAaL2jZQS0VJosSHcl/qL+36M6
         aIbInh/Ji7oeXHIIG9l+e/jjXrNCCUmNjjSlOZXuNrZp6bh74o5lXgcoCt631Gfnpmpp
         FkVXSDxgxWbxHXo7aFlImHYWPg88P08ccsLeq27P9Aelw1kFEc4lLrQbhnDouPZdEs39
         ZO9A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Atd6xu7T;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9dYrX7MDIEEobZPAR8ptDi+510Np8lcG2vQ50u++TlU=;
        b=FLzYYnr2aXtjJ6mt2G+DL3Y7dKZPLnRpcvBtEBe9o75ymRwXMWFWKjljx2l/sU9G03
         6aY/UU/5glaM8vEOQAlqd44zymR4hIXLmvQq8rsvzT2ZoJ6PUh1CAVOBBCednCli81t3
         Z65fmNU1xlkgb5D3ci285FxczNWQ0UsfQ+wPI/xGeOgCmXtdCnRk5O+zCAZ8ybk/q6Z1
         1PacH2NdVdoVZeHFyyD7zm6ysfdy5RbPcDsw+xqvOyyjeUXB4aK2eaZTEjOxMlXzt+0X
         f1OaySxmvXb5QEQBmtDFoRj7n8wSjEN55cNOs8+OihrqYFsQRrbfMSJ36X/v/2LHsboT
         VdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9dYrX7MDIEEobZPAR8ptDi+510Np8lcG2vQ50u++TlU=;
        b=XMx0BDfv1JTJlRMyxmT7rSv4GCviJZKu37zCSYmfU9PbiNCox1nOgdK9Pqs8h2PaAa
         RuDKD4PrjRG9+AsQJVFBCvx13RO8xH2LgHdk2PcR4Cm1jRe7KDSbREiOA81/78XcDXoF
         rNR6JDdgKAfgWi7M0m93msfgmkkiEt8IDBkIGpFn9exLVjeW3TIFVtbUFm8J6URv5y61
         Z1FnyG8wLxAiR9q3nFHI1B4MC7MwuanzdnN8UstYyQu+fX7Zr38a4g/FYu1U55dUcJCB
         ob0wFSr/dHY1IdiHPi9Ts6J/iE1zucbA92XNm04eoRUfnOSsV8Ejdxotnsu1UMv13XjS
         j3VA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533CbfviT31SSxFhSS+hQvOJ/bCIXKS88FjlFhyFcJVGVCTkDER8
	wRfpeFr1qCm60M1D2lGmD2Y=
X-Google-Smtp-Source: ABdhPJy6KPJYxJdqkKvhvBMgTa7yympDtoFB5v3QhjXhEUqI4yuc3XtDPnF4bKv/2U58oQN0d+EdfQ==
X-Received: by 2002:adf:f504:: with SMTP id q4mr6441453wro.304.1619203176912;
        Fri, 23 Apr 2021 11:39:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a70f:: with SMTP id q15ls386771wme.1.experimental-gmail;
 Fri, 23 Apr 2021 11:39:35 -0700 (PDT)
X-Received: by 2002:a7b:c098:: with SMTP id r24mr7030744wmh.179.1619203175393;
        Fri, 23 Apr 2021 11:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619203175; cv=none;
        d=google.com; s=arc-20160816;
        b=mwxqrh5a20u3SDKEknYjGQG79IHyznM5XQ7adHFOSNI7jpnJ9TKeQ4jTmH4i8QqlT8
         Ekw6VGQR6s5+A0w38PkzYmUK7+c3C8dac5qYP+g8JQ1REZYx8gQwyt3hqKzbQYxy7c9g
         XcN78nGmYhsCsQw4TOL7QpXIOP9QAxs4HOGbWnWa9cMgvBpblACMQeLyarzL1OVK9gWs
         7MgvpfoWIAeNgaIm1tNOjai/2TRiLlZQGisQKbUI8LDU3qf+VOqF6C8A04DN8H3MRplr
         0OClTq8yko9uy4HXOp6Sg6oMptrR3yWQhRQSX/yPJUkEJ3XLMMuQWFqn9s7yRj19wOK/
         QobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=KZzYFQu6clFHEhiqkKJ5mQirpW0+tKy+nW8Iy8LeNe0=;
        b=ViSEPUzhYN58kyFMVMX18dwbnuT5vH6l2ROiSUi9GVqHWOESN9yBuJiHgfCDdozIKb
         LIRGjRRjjhKYMRc84FPkq5Jrlkh3q45zAae/4l6CGaIXoyG3IQhTg5SPQm8vN7VRy00G
         btyR5BHYiiytJrV6YGMpaxFh8fEsa9dsw5O2cwsTdCsN6SO48IhFcIW/JF4gWdxZ1zkg
         TFyVp5i4uWxJSio1DQ33qpoxa+KdgS6wtOZjS7fBk6ZYn4W/ELAALg2JvUghK3aHmPqD
         vfoVscLuwzIWeYgLRSXc2yd//Ml3gqQ6GZwrU/kn+wBu6iVZYbmohTd5ua4b71pyohGg
         s3LA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Atd6xu7T;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id k6si750831wrm.2.2021.04.23.11.39.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Apr 2021 11:39:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4FRjkZ735Dzy0s;
	Fri, 23 Apr 2021 20:39:34 +0200 (CEST)
Received: from [172.23.3.173] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 23 Apr
 2021 20:39:34 +0200
Subject: Re: [EXT] AW: AW: Inquiry
To: Moustafa Noufale <moustafa.noufale@uni-rostock.de>, Jan Kiszka
	<jan.kiszka@web.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
Date: Fri, 23 Apr 2021 20:39:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Atd6xu7T;
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

Hi Moustafa,

On 23/04/2021 15:04, Moustafa Noufale wrote:
> Hello,=20
> I would like to thank you for your support and maybe you can give me a li=
ttle help with building "jailhouse.ko"
> I have tried make, make install with and without root in this directory "=
jailhouse-master/driver" and I am not sure if I am following the correct pr=
ocedure. What I have done so far is building an image of a virtual x-86 thr=
ough running ./build-images.sh and I can start it using ./start-qemu.sh.=20

Okay - so you did build successfully build your target with
jailhouse-images, and start-qemu.sh gives you a running qemu instance?

In this case, everything is already installed and in place. The
jailhouse module will already be loaded - you can check that with `lsmod`.

To enable jailhouse, you can simply check the history of you bash, or
have a look here:

https://github.com/siemens/jailhouse-images/blob/master/recipes-core/custom=
izations/files/.bash_history-qemu-amd64

HTH,
  Ralf

> What I have understood from the tutorial is that I have to inject jailhou=
se.ko into the kernel and then start the guest.=20
> Thanks in advance
> Moustafa Noufale
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>=20
> Gesendet: Dienstag, 20. April 2021 11:39
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka <jan.k=
iszka@web.de>; jailhouse-dev@googlegroups.com
> Betreff: Re: AW: Inquiry
>=20
> Hi,
>=20
> On 20/04/2021 11:29, Moustafa Noufale wrote:
>> Hi Mr. Kiszka,
>> I have tried to  build an image through running "build-images.sh" with a=
nd without root access:
>>
>> without root access:
>>
>> Select images to build (space-separated index list): 1
>> docker: Got permission denied while trying to connect to the Docker daem=
on socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker=
.sock/v1.24/containers/create: dial unix /var/run/docker.sock: connect: per=
mission denied.
>=20
> your local user needs to be in the docker group.
>=20
>> See 'docker run --help'.
>>
>> With root access:
>>
>> Select images to build (space-separated index list): 1
>> Error: Running as root - may break certain recipes.
>> Better give a regular user docker access. Set KAS_ALLOW_ROOT=3Dyes to ov=
erride.
>=20
> Simply read the error message and follow the instructions: If you want to=
 run docker as root, you have to set KAS_ALLOW_ROOT=3Dyes to your environme=
nt. For good reasons: You shouldn't do that as root.
>=20
> Anyway, solve the issue by adding your user to the docker group.
>=20
>   Ralf
>=20
>>
>> I have installed QEMU version 5, KVM 2.2 and enabled nested virtualizati=
on.=20
>> I would really appreciate it, if you could me a hint.=20
>> Thanks in advance,
>> Moustafa Noufale
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Jan Kiszka <jan.kiszka@web.de>
>> Gesendet: Samstag, 17. April 2021 11:45
>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>;=20
>> jailhouse-dev@googlegroups.com
>> Betreff: Re: Inquiry
>>
>> Hi Moustafa,
>>
>> On 16.04.21 10:29, Moustafa Noufale wrote:
>>>
>>> To whom it may concern,
>>> I am a Master student in Rostock University and I am studying=20
>>> Jailhouse this semester as a Master project and I would like to=20
>>> gather information about this Hypervisor, as well as I would like to=20
>>> ask, whether it is possible to install it on an Ubuntu Virtual=20
>>> Machine? I just need an outline, how I can learn it. I spent today=20
>>> reading the code on GitHub, but I need more information and appreciate =
it if you can help me.
>>>
>>
>> A good starting point for experiments can be the images generated by [1]=
, both for KVM VMs, pure QEMU emulation target or also real boards.
>> Note that emulating target inside a VM will work but using KVM (for x86)=
 may not or is at least fairly slow. I would recommend a native Linux host.
>>
>> Then you will find a lot of presentations on Jailhouse on the internet a=
s well as an (aging) tutorial on how to bring it up on new hardware.
>>
>> Jan
>>
>> [1] https://github.com/siemens/jailhouse-images
>> [2]
>> https://events.static.linuxfound.org/sites/events/files/slides/ELCE201
>> 6-Jailhouse-Tutorial.pdf [2]=20
>> https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d6df4ded-1fb9-f75d-1a1b-0cef2513acf9%40oth-regensburg.de.
