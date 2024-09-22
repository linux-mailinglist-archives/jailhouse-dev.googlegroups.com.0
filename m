Return-Path: <jailhouse-dev+bncBCT5ZD7AVAKBBPN4YK3QMGQEDZJQ7KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 0672D97E418
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Sep 2024 00:46:24 +0200 (CEST)
Received: by mail-qv1-xf38.google.com with SMTP id 6a1803df08f44-6c35b4e1709sf44372196d6.2
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Sep 2024 15:46:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727045183; cv=pass;
        d=google.com; s=arc-20240605;
        b=dqqtI1epme8pdZU4om/n2UXiYQlEtv+0oWsjNOda6IffCprdGU4uOPC+wjcUpfRGuq
         EDVqB9YAwx8hl50pbGag7dvHNmh0H/nieSRrBrDcyHZU1zMut2D7VkfUucVf7dDps7y3
         RQE7FLwPbacYCDjfHmbjHG8W52+/lw8IS2NsjvJzxatpV9OqAQElkO+FrJwvN5+A+l/+
         HqGL9d3XWKlBtwo+zUY6S/k5q5vgydkG6qBczNn0Xh/tArw72tXss/i274s9xxVhxhmC
         iMq4SIJ3AThMCU2tV1nGz38gkLFishric42KEZbGS+LPl4WW5HxYTfGO9Y67Y/0+H7bq
         Cf7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=Ta2ZSl32LEU/roO4BsQan+YaG6nC+/z+6eVwGlh+kkA=;
        fh=BBLqN+gLoYe49MYT/NolsjnwFAqq13gt7zSJQLpVMBE=;
        b=igH4QKBOfckfb2BeAdmMMKP8Ej96CYA0n2kmPwJ6IvgnHMdymaJajE+aQJA28jsxUg
         xtbm+fqm43t4j8fX/JQY0cLtY2K/nXZwj5toszJlHKZpOCsIXlP7CLhHm+RKu5FQQisc
         0g+j9xJHDPbvHIKyVCSIw4a8rk12oUIkT+RkxjW3AL63Jh+aJ0lHbyboax3sErIq//3k
         c2vLHfZehcKjsDBcFOrCSUsMc+mgopM6dunvxC4KE6vy/gzEtboOSP/5X3XjXFyl/mlv
         yZgm2pc3sQJBndtPYFQJVrMUyV13snMb74e5eOk66oqOOdBht5UrOWGfi5FgaGaCgUnR
         eUTQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ho3SKkzy;
       spf=pass (google.com: domain of felimacdona51@gmail.com designates 2607:f8b0:4864:20::c32 as permitted sender) smtp.mailfrom=felimacdona51@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=pass header.i=@googlegroups.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1727045183; x=1727649983; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ta2ZSl32LEU/roO4BsQan+YaG6nC+/z+6eVwGlh+kkA=;
        b=g2xG2/Q7zpUr13nUGlDvwrfYfa4OS+DaqdyTs6A0Anc3H2Y1RY/gYgGe0IUK/T27Vh
         i2gwk2WmiJ2QW8qzxc7BGyPaeSmcSUM6m+fkSKncU66J5KTVuqxxlGQfUUQ4DL1U/9+T
         ERTpzaHQB0zNFmTa7UCylFN4dWzmlPzIkU7OwhHiF91OCt7oD30lxF+mITkLxbZOfUDl
         vmWkfGRZxUukawcQO3F0V5TUv/3RjSFzzYO5Dg/vHseLCSbWoUF69VAUQVle6Ep3qrd0
         vD3rz9P64kyAhR+5hJY8Y8aAb8V8ugrejEvnAI8rdRaX3Ryntas2uarBjmyor39eWDAx
         soBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727045183; x=1727649983; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ta2ZSl32LEU/roO4BsQan+YaG6nC+/z+6eVwGlh+kkA=;
        b=grAL5EBQ0aVM9Wkl/n6BFlzPrJoITHzh8Gdr6lOdXTWOiRfGGeFRCVbUw4FV5/fIir
         AuOSJjAFEl5UsH/tK+xAn6dvdDaQ19JGAEJS5DkhEgpR63DR1FNBx16FWixD1/WSBBjI
         XHnEL+FAr0yjlI32FZxfOBkh2lopXLPh5+D+OGJW9gY+BZmREDe43Bh+pIHdO5tuUkIO
         c4um2dm354tc07eZxt4BzmhKmKfRl6TZ8sC2uI7grUlQ7yry0gUiTVR6xgVmJqe0G7Pf
         YShT5iZGr4DeorqBkAPpr2ahagHLzqOjU+r9HNZ5oWs/MI7LMl8F3HEEGf7hN4O7oayG
         VkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727045183; x=1727649983;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta2ZSl32LEU/roO4BsQan+YaG6nC+/z+6eVwGlh+kkA=;
        b=T+Dv1jPFfJePDPR+Bv775lSvgsAbldSzSdqxmE6nQoeOoYlNiT1s0AxDej4K93fXlJ
         2ay6CIT25w/eowvIN2DXorNLiyFugnH9kRNGkoCMTjRqQ53J/e7XU8IC+kDLp1A9u/yq
         7GUIk861RHbHgEWSmAvVhTXtCUWOCL6nGg/YpHf0EMuFlrr64nVsqTNabdmtXHJKJKRi
         9sE52TeRHSfFrH8CaSdVvYJNhuKP49sXaw5z/BOk1QUbu2BhXCTqn+R0EfvHuf+j4TC5
         HEa8UvX3JGiWfOIfpL+bkXIW3vR50q95NG1qUEBiF5blUZWxtq+U0ZnT+zm6Ry6XXYFD
         LkAw==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCXm0kI/bnwlgbMxRSuvqIopWA5vtpE/SvEupqJyjlwncbps4+tfl/AazsOSXeRgvgHYrZ1KBQ==@lfdr.de
X-Gm-Message-State: AOJu0Yz+vF79At8tO76noYe3IpKc1cevAuDR0yO0oWXjvErJXkCZ5ZJ/
	7xJRm3gQEYuFVGPi+ePcI1VeZnkE5L+V64/46cZVKTRFADUr+nVm
X-Google-Smtp-Source: AGHT+IFVzlFn1muy6lQslSdWCdmNX9kPutDW1k6mBfgDsECY+baxyn5axh+SdO0lySH+MM3evSEEPQ==
X-Received: by 2002:a05:6214:3c89:b0:6c5:57e2:88d7 with SMTP id 6a1803df08f44-6c7bd57528dmr169178046d6.36.1727045182481;
        Sun, 22 Sep 2024 15:46:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:21c4:b0:6b0:8881:bc19 with SMTP id
 6a1803df08f44-6c6a7f9b1d2ls71060886d6.1.-pod-prod-08-us; Sun, 22 Sep 2024
 15:46:20 -0700 (PDT)
X-Received: by 2002:a05:6214:5c4a:b0:6c5:32a5:567a with SMTP id 6a1803df08f44-6c7bd486c6bmr152082576d6.1.1727045180666;
        Sun, 22 Sep 2024 15:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727045180; cv=none;
        d=google.com; s=arc-20240605;
        b=KU5/XhJ7LHb84ijysVjh5Fdg8hm4NMlVbK960u9w/DQsDkBahbg66CMxNiOF7LdPBj
         cvM0HjCSieuQpMFuKpqmeSRnds/MoxfP3kZ9ZuePcegd3oBXQqoodiGxtY6UZkaI5WqF
         g6fc0vZ+U55Inn7ziV27LWyaiutHlNKWRD58XMdKhxJ0Rferpu3Gso6iVrCkmNbNjbub
         xY+8aXMLuhuK4w12efku2tLrBgve6S+NKuIWRmlMoOvSwReb3Yb/Wf+0yBF5sJmWmjPK
         d4jkxXoTQqFrp029YOJT0GidILdhKPWMyywK0zq6EqAz25oTWYku729KOX61Ufcu0j1n
         t+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a+v5Q0L6Da8TOLWFYSAQ3ffyVz4sqHtNmt8gzvlfaMU=;
        fh=Q4AAM4eg9j3QJiO/8QJIpkmL+R6Vr4Y5H4sj5pe1QIo=;
        b=VMkQ0yu7mkz4xJo90ZdBolZUTwQpxQ/jhp1JYH38QQTNYHAXEO/CeNCaPcz4ReFvVn
         5ClSdMzA4u83UNHD3n4dFGWp+Xh0RhzyMZJY8DK1s6zAycQuhpWpkJnIt7V9pHo3EUPg
         FPVYzTxwOP/8m9K2RXNUzvuR2HCMRqZ32QyPUMXZJKk6CdRsPjloXPzr4xZ7SJBGe/4N
         zgl5S7ajzwdiFoIKS/N2Eh5o2zgMxcA19DUIuM9tCUP2frpXtOe2z9k6gvlLF6xcMWFE
         yZrN9buhwQpD2AEy0lA/vBItwAhAPwlc33aA9kNXycmnuMVEYc42EvVO928tIkAdcpA1
         EBRw==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ho3SKkzy;
       spf=pass (google.com: domain of felimacdona51@gmail.com designates 2607:f8b0:4864:20::c32 as permitted sender) smtp.mailfrom=felimacdona51@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=pass header.i=@googlegroups.com
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com. [2607:f8b0:4864:20::c32])
        by gmr-mx.google.com with ESMTPS id 6a1803df08f44-6c75e44d59dsi3639266d6.2.2024.09.22.15.46.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 15:46:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of felimacdona51@gmail.com designates 2607:f8b0:4864:20::c32 as permitted sender) client-ip=2607:f8b0:4864:20::c32;
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5e5568f1b6eso1862747eaf.1
        for <jailhouse-dev@googlegroups.com>; Sun, 22 Sep 2024 15:46:20 -0700 (PDT)
X-Received: by 2002:a05:6870:8716:b0:270:25e:b341 with SMTP id
 586e51a60fabf-2803d0e90f3mr5612763fac.36.1727045179985; Sun, 22 Sep 2024
 15:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm+5WSxvr3-A@mail.gmail.com>
 <56b684d3-7bcd-444e-b7d0-2f01429fdc72@oth-regensburg.de> <e934ce47-a4c0-435e-95f8-204ff6b2e76an@googlegroups.com>
 <f9f09503-807d-4393-8757-9da544d82a39@vmexit.de> <6d0e6008-d33a-4ec5-9203-dc4f17db7814n@googlegroups.com>
In-Reply-To: <6d0e6008-d33a-4ec5-9203-dc4f17db7814n@googlegroups.com>
From: Felimacdona <felimacdona51@gmail.com>
Date: Sun, 22 Sep 2024 23:46:10 +0100
Message-ID: <CAKNOR23kamvG8s_9CtAD6VfWUpUCYqsDcEUBX=LiV662wLFJ6g@mail.gmail.com>
Subject: Re: Jailhouse triggered exception #14
To: qiang xu <qiangxu431@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="00000000000076d8d80622bd0aab"
X-Original-Sender: felimacdona51@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=ho3SKkzy;       spf=pass
 (google.com: domain of felimacdona51@gmail.com designates 2607:f8b0:4864:20::c32
 as permitted sender) smtp.mailfrom=felimacdona51@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;       dara=pass header.i=@googlegroups.com
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

--00000000000076d8d80622bd0aab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Where to buy  one up  psilocybin mushrooms
gummies_,3-5ghttps://exoticpsychstore.store/

Shop/ products/ best place to buy chocolate chuckles/
https://exoticpsychstore.store/ products/ DMT for sale
Buy chocolate bars/ https://exoticpsychstore.store/
https://exoticpsychstore.store/ products/ microdoxing products for sale

https://exoticpsychstore.store/(trippy exotic dark chocolate bars for sale
https://exoticpsychstore.store/ milk chocolate bars for sale
https://exoticpsychstore.store/good products/ LSD muchroom for sale

Psilocybin Mushroom Chocolate Bar (Chocolate Chuckles) are just one of the
discrete and convenient options available in the world. Many stoners
shop/product/buy-chocolate-chuckles/worldwide have now found themselves
curious about the world of magic shrooms ever since Initiative 81 just
recently was voted to be decriminalized , but worry about the taste or
un-appetizing nature of raw dried mushrooms. Not to worry, Chocolate
Chuckles has come up with a delicious alternative that infuses real
psilocybin mushrooms with delicious dark chocolate to mask any harsh
aftertastes. These mushroom edibles are ideal for beginners and experience
psychonauts alike, coming in 3.5g to satisfy the needs of everyone. Magic
Mushrooms is a potent and well-rounded mushroom strain that is known for
its=E2=80=99 euphoric buzz and intense sensory hallucinogenic effects.
https://exoticpsychstore.store/
https://exoticpsychstore.store/
https://exoticpsychstore.store/
https://exoticpsychstore.store/

shop/product/buy-chocolate-chuckles/
Each bar comes with 12 dark chocolate chuckles pieces 291mg per piece
(Total 3500mg). Recommended dosage for beginners is 1 square for micro
dosing and up to 3-4 squares to experience the shroom high. (Depends on
person=E2=80=99s tolerance as well)

shop/product/buy-chocolate-chuckles/

https://exoticpsychstore.store/

shop/product/buy-chocolate-chuckles/
Each bar comes with 12 dark chocolate chuckles pieces 291mg per piece
(Total 3500mg). Recommended dosage for beginners is 1 square for micro
dosing and up to 3-4 squares to experience the shroom high. (Depends on
person=E2=80=99s tolerance as well)
https://exoticpsychstore.store/
https://exoticpsychstore.store/
https://exoticpsychstore.store/
https://exoticpsychstore.store/

Psychedelic mushrooms are one of the oldest and safest traditional
medicines in the world and has been for centuries have a nice spiritual
journey! Additional benefits: These products have been known to reduce
stress and depression, stimulate brain cell growth and increase focus when
micro-doing.
https://exoticpsychstore.store/
https://exoticpsychstore.store/

https://exoticpsychstore.store/
https://exoticpsychstore.store/
https://exoticpsychstore.store/

https://exoticpsychstore.store/

Global psychedelic write:

https://exoticpsychstore.store/
https://exoticpsychstore.store/

https://exoticpsychstore.store/
https://exoticpsychstore.store/
Trippy Treats Mushroom Chocolate Bars are an awesome mix. Granting you to
enjoy great flavor as you munch down your shrooms.

https://exoticpsychstore.store/ buy 5meo DMT
https://exoticpsychstore.store/

https://exoticpsychstore.store/
https://exoticpsychstore.store/

to
Email Address: shop/product/buy-chocolate-chuckles/
BEST.shop/product/buy-chocolate-chuckles/product/psilocybin-mushroom-chocol=
ate-bar-3-5g/

Psilocybin Mushroom Chocolate Bar (Chocolate Chuckles) are just one of the
discrete and convenient options available in the world. Many stoners
shop/product/buy-chocolate-chuckles/worldwide have now found themselves
curious about the world of magic shrooms ever since Initiative 81 just
recently was voted to be decriminalized , but worry about the taste or
un-appetizing nature of raw dried mushrooms. Not to worry, Chocolate
Chuckles has come up with a delicious alternative that infuses real
psilocybin mushrooms with delicious dark chocolate to mask any harsh
aftertastes. These mushroom edibles are ideal for beginners and experience
psychonauts alike, coming in 3.5g to satisfy the needs of everyone.

On Fri, Sep 13, 2024, 4:34=E2=80=AFAM qiang xu <qiangxu431@gmail.com> wrote=
:

> Hi Rlf=EF=BC=8C
>
> Thank you for your help. Here is the situation: During the initialization
> of the Jailhouse root cell, Jailhouse hangs, causing the device to become
> unresponsive. After adding print statements, I discovered that the
> *arch_pci_update_msi* function assigns a value of 128 to the vectors of
> the device at 01:03.0, which causes *iommu_map_interrupt* to return
> -ERANGE and subsequently leads to an error in Jailhouse. Further debuggin=
g
> revealed that all the data read from *msi_registers.raw* is 0xff. From
> the email analysis above, it seems that the configuration space address
> calculation is correct, but why is it not readable? I am quite puzzled. I
> hope you can help analyze this issue. The required files have been
> attached. Thank you very much!
>
> Regards,
> Qiang
> On Thursday, September 12, 2024 at 7:29:27=E2=80=AFPM UTC+8 Ralf Ramsauer=
 wrote:
>
>> Hi,
>>
>> On 11/09/2024 08:17, qiang xu wrote:
>> > Hi Rlf=EF=BC=8C
>> >
>> > Thank you for your reply. I solved the issue based on your suggestions=
.
>> > However, I've encountered another problem. As shown in the image below=
,
>> > I found that the MSI Capabilities of a PCIe device are being read
>> > incorrectly as '0xff'. When I don't enable the Root Cell, the readings
>> > with setpci are normal. However, when the Root Cell is enabled, the
>>
>> Please don't use images, it's very hard to understand what's going on.
>> Please describe your issue in a temporal flow.
>>
>> > device hangs, and after adding print statements, I found that reading
>>
>> What means the device hangs? Does Jailhouse crash?
>>
>> > msi_registers.raw is abnormal. I have verified that mmcfg_addr is
>> > correct, but the read values are still incorrect. How should I proceed
>> > with further debugging?
>>
>> Would you please share (as text attachments):
>> - lspci -vvv (before enabling jailhouse)
>> - jailhouse-config-collect yoursystem.tar
>> - Jailhouse System Configuration as C Source
>>
>> Why are you trying to change in PCI config space, what are you writing,
>> and what would you expect?
>>
>> The device should not hang and there should be no need for you to modify
>> config space after enabling jailhouse, the device should continue
>> working as before.
>>
>> Thanks,
>> Ralf
>>
>> >
>> > Screenshot from 2024-09-11 14-02-51.pngScreenshot from 2024-09-11
>> > 14-03-23.pngScreenshot from 2024-09-11 13-55-20.png
>> >
>> > Regards,
>> > Qiang
>> > On Wednesday, September 4, 2024 at 6:51:03=E2=80=AFPM UTC+8 Ralf Ramsa=
uer
>> wrote:
>> >
>> > Hi,
>> >
>> > On 04/09/2024 05:35, qiang xu wrote:
>> > > Hi Jailhouse Team,
>> > >
>> > >     I am trying to run Jailhouse on a real physical
>> > machine(x86).When I
>> > > run jailhouse enable xx.cell. I encounter the following error.
>> > I'm not
>> > > sure what is happening. Can you help me?
>> > >
>> > > 'Initializing Jailhouse hypervisor v0.12 on CPU 2
>> > > Code location: 0xfffffffff0000050
>> > > Using x2APIC
>> > > Page pool usage after early setup: mem 48/974, remap 0/131072
>> > > Initializing processors:
>> > >  CPU 2... (APIC ID 4) OK
>> > >  CPU 3... (APIC ID 6) OK
>> > >  CPU 1... (APIC ID 2) OK
>> > >  CPU 0... (APIC ID 0) OK
>> > > Initializing unit: VT-d
>> > > DMAR unit @0xfed90000/0x1000
>> > > DMAR unit @0xfed91000/0x1000
>> > > Reserving 120 interrupt(s) for device f0:1f.0 at index 0
>> > > Initializing unit: IOAPIC
>> > > Initializing unit: Cache Allocation Technology
>> > > Initializing unit: PCI
>> > > Adding PCI device 00:00.0 to cell "RootCell"
>> > > Adding PCI device 00:01.0 to cell "RootCell"
>> > > Reserving 1 interrupt(s) for device 00:01.0 at index 120
>> > > Adding PCI device 00:02.0 to cell "RootCell"
>> > > Reserving 1 interrupt(s) for device 00:02.0 at index 121
>> > > Adding PCI device 00:14.0 to cell "RootCell"
>> > > Reserving 8 interrupt(s) for device 00:14.0 at index 122
>> > > Adding PCI device 00:14.2 to cell "RootCell"
>> > > Reserving 1 interrupt(s) for device 00:14.2 at index 130
>> > > Adding PCI device 00:16.0 to cell "RootCell"
>> > > Reserving 1 interrupt(s) for device 00:16.0 at index 131
>> > > Adding PCI device 00:17.0 to cell "RootCell"
>> > > Reserving 1 interrupt(s) for device 00:17.0 at index 132
>> > > Adding PCI device 00:1c.0 to cell "RootCell"
>> > > Reserving 1 interrupt(s) for device 00:1c.0 at index 133
>> > > Adding PCI device 00:1f.0 to cell "RootCell"
>> > > Adding PCI device 00:1f.2 to cell "RootCell"
>> > > Adding PCI device 00:1f.3 to cell "RootCell"
>> > > Reserving 1 interrupt(s) for device 00:1f.3 at index 134
>> > > Adding PCI device 00:1f.4 to cell "RootCell"
>> > > Adding PCI device 01:00.0 to cell "RootCell"
>> > > Reserving 8 interrupt(s) for device 01:00.0 at index 135
>> > > Adding PCI device 01:00.1 to cell "RootCell"
>> > > Reserving 4 interrupt(s) for device 01:00.1 at index 143
>> > > Adding PCI device 01:00.2 to cell "RootCell"
>> > > Reserving 3 interrupt(s) for device 01:00.2 at index 147
>> > > Adding PCI device 01:03.0 to cell "RootCell"
>> > > Reserving 16 interrupt(s) for device 01:03.0 at index 150
>> > > FATAL: Jailhouse triggered exception #14
>> > > Error code: 9
>> > > Physical CPU ID: 4
>> > > RIP: 0xfffffffff000b250 RSP: 0xfffffffff023ef50 FLAGS: 10093
>> > > CR2: 0xffffff800400b000
>> >
>> > would you please disassemble your hypervisor binary with objdump, and
>> > see what routine executed behind 0xfffffffff000b250?
>> >
>> > Rlf
>> >
>> > > Stopping CPU 2 (Cell: "RootCell")'
>> > >
>> > > Regards,
>> > > Qiang
>> > >
>> > > --
>> > > You received this message because you are subscribed to the Google
>> > > Groups "Jailhouse" group.
>> > > To unsubscribe from this group and stop receiving emails from it,
>> > send
>> > > an email to jailhouse-de...@googlegroups.com
>> > > <mailto:jailhouse-de...@googlegroups.com>.
>> > > To view this discussion on the web visit
>> > >
>> >
>> https://groups.google.com/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn=
70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn=
70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com>
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn=
70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com?utm_medium=3Demail&utm_sourc=
e=3Dfooter
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn=
70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com?utm_medium=3Demail&utm_sourc=
e=3Dfooter>>.
>>
>> >
>> > --
>> > You received this message because you are subscribed to the Google
>> > Groups "Jailhouse" group.
>> > To unsubscribe from this group and stop receiving emails from it, send
>> > an email to jailhouse-de...@googlegroups.com
>> > <mailto:jailhouse-de...@googlegroups.com>.
>> > To view this discussion on the web visit
>> >
>> https://groups.google.com/d/msgid/jailhouse-dev/e934ce47-a4c0-435e-95f8-=
204ff6b2e76an%40googlegroups.com
>> <
>> https://groups.google.com/d/msgid/jailhouse-dev/e934ce47-a4c0-435e-95f8-=
204ff6b2e76an%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.
>>
>>
>> --
>> Ralf Ramsauer
>> PGP: 0xC85252CC
>>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/6d0e6008-d33a-4ec5-9203-d=
c4f17db7814n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/6d0e6008-d33a-4ec5-9203-=
dc4f17db7814n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>
> .
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAKNOR23kamvG8s_9CtAD6VfWUpUCYqsDcEUBX%3DLiV662wLFJ6g%40mail.=
gmail.com.

--00000000000076d8d80622bd0aab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Where to buy=C2=A0 one up=C2=A0 psilocybin mushrooms gummies=
_,3-5ghttps://exoticpsychstore.store/</p>
<p dir=3D"ltr">Shop/ products/ best place to buy chocolate chuckles/ <a hre=
f=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/</a> p=
roducts/ DMT for sale<br>
Buy chocolate bars/ <a href=3D"https://exoticpsychstore.store/">https://exo=
ticpsychstore.store/</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a> products/ microdoxing products for sale</p>
<p dir=3D"ltr"><a href=3D"https://exoticpsychstore.store/(trippy">https://e=
xoticpsychstore.store/(trippy</a> exotic dark chocolate bars for sale<br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a> milk chocolate bars for sale<br>
<a href=3D"https://exoticpsychstore.store/good">https://exoticpsychstore.st=
ore/good</a> products/ LSD muchroom for sale</p>
<p dir=3D"ltr">Psilocybin Mushroom Chocolate Bar (Chocolate Chuckles) are j=
ust one of the discrete and convenient options available in the world. Many=
 stoners shop/product/buy-chocolate-chuckles/worldwide have now found thems=
elves curious about the world of magic shrooms ever since Initiative 81 jus=
t recently was voted to be decriminalized , but worry about the taste or un=
-appetizing nature of raw dried mushrooms. Not to worry, Chocolate Chuckles=
 has come up with a delicious alternative that infuses real psilocybin mush=
rooms with delicious dark chocolate to mask any harsh aftertastes. These mu=
shroom edibles are ideal for beginners and experience psychonauts alike, co=
ming in 3.5g to satisfy the needs of everyone. Magic Mushrooms is a potent =
and well-rounded mushroom strain that is known for its=E2=80=99 euphoric bu=
zz and intense sensory hallucinogenic effects.<br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br></p>
<p dir=3D"ltr">shop/product/buy-chocolate-chuckles/<br>
Each bar comes with 12 dark chocolate chuckles pieces 291mg per piece (Tota=
l 3500mg). Recommended dosage for beginners is 1 square for micro dosing an=
d up to 3-4 squares to experience the shroom high. (Depends on person=E2=80=
=99s tolerance as well)</p>
<p dir=3D"ltr">shop/product/buy-chocolate-chuckles/</p>
<p dir=3D"ltr"><a href=3D"https://exoticpsychstore.store/">https://exoticps=
ychstore.store/</a><br></p>
<p dir=3D"ltr">shop/product/buy-chocolate-chuckles/<br>
Each bar comes with 12 dark chocolate chuckles pieces 291mg per piece (Tota=
l 3500mg). Recommended dosage for beginners is 1 square for micro dosing an=
d up to 3-4 squares to experience the shroom high. (Depends on person=E2=80=
=99s tolerance as well)<br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a></p>
<p dir=3D"ltr">Psychedelic mushrooms are one of the oldest and safest tradi=
tional medicines in the world and has been for centuries have a nice spirit=
ual journey! Additional benefits: These products have been known to reduce =
stress and depression, stimulate brain cell growth and increase focus when =
micro-doing.<br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a></p>
<p dir=3D"ltr"><a href=3D"https://exoticpsychstore.store/">https://exoticps=
ychstore.store/</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a></p>
<p dir=3D"ltr"><a href=3D"https://exoticpsychstore.store/">https://exoticps=
ychstore.store/</a></p>
<p dir=3D"ltr">Global psychedelic write:<br></p>
<p dir=3D"ltr"><a href=3D"https://exoticpsychstore.store/">https://exoticps=
ychstore.store/</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a></p>
<p dir=3D"ltr"><a href=3D"https://exoticpsychstore.store/">https://exoticps=
ychstore.store/</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br>
Trippy Treats Mushroom Chocolate Bars are an awesome mix. Granting you to e=
njoy great flavor as you munch down your shrooms.</p>
<p dir=3D"ltr"><a href=3D"https://exoticpsychstore.store/">https://exoticps=
ychstore.store/</a> buy 5meo DMT<br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a></p>
<p dir=3D"ltr"><a href=3D"https://exoticpsychstore.store/">https://exoticps=
ychstore.store/</a><br>
<a href=3D"https://exoticpsychstore.store/">https://exoticpsychstore.store/=
</a><br></p>
<p dir=3D"ltr">to<br>
Email Address: shop/product/buy-chocolate-chuckles/<br>
BEST.shop/product/buy-chocolate-chuckles/product/psilocybin-mushroom-chocol=
ate-bar-3-5g/</p>
<p dir=3D"ltr">Psilocybin Mushroom Chocolate Bar (Chocolate Chuckles) are j=
ust one of the discrete and convenient options available in the world. Many=
 stoners shop/product/buy-chocolate-chuckles/worldwide have now found thems=
elves curious about the world of magic shrooms ever since Initiative 81 jus=
t recently was voted to be decriminalized , but worry about the taste or un=
-appetizing nature of raw dried mushrooms. Not to worry, Chocolate Chuckles=
 has come up with a delicious alternative that infuses real psilocybin mush=
rooms with delicious dark chocolate to mask any harsh aftertastes. These mu=
shroom edibles are ideal for beginners and experience psychonauts alike, co=
ming in 3.5g to satisfy the needs of everyone.</p>
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri=
, Sep 13, 2024, 4:34=E2=80=AFAM qiang xu &lt;<a href=3D"mailto:qiangxu431@g=
mail.com">qiangxu431@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div>Hi Rlf=EF=BC=8C</div><div><br></div><div>Thank you for your=
 help. Here is the situation: During the initialization of the Jailhouse ro=
ot cell, Jailhouse hangs, causing the device to become unresponsive. After =
adding print statements, I discovered that the <i>arch_pci_update_msi</i> f=
unction assigns a value of 128 to the vectors of the device at 01:03.0, whi=
ch causes <i>iommu_map_interrupt</i> to return -ERANGE and subsequently lea=
ds to an error in Jailhouse. Further debugging revealed that all the data r=
ead from <i>msi_registers.raw</i> is 0xff. From the email analysis above, i=
t seems that the configuration space address calculation is correct, but wh=
y is it not readable? I am quite puzzled. I hope you can help analyze this =
issue. The required files have been attached. Thank you very much!<br></div=
><div><br></div>Regards,<br>Qiang<br><div class=3D"gmail_quote"><div dir=3D=
"auto" class=3D"gmail_attr">On Thursday, September 12, 2024 at 7:29:27=E2=
=80=AFPM UTC+8 Ralf Ramsauer wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi,
<br>
<br>On 11/09/2024 08:17, qiang xu wrote:
<br>&gt; Hi Rlf=EF=BC=8C
<br>&gt;=20
<br>&gt; Thank you for your reply. I solved the issue based on your suggest=
ions.=20
<br>&gt; However, I&#39;ve encountered another problem. As shown in the ima=
ge below,=20
<br>&gt; I found that the MSI Capabilities of a PCIe device are being read=
=20
<br>&gt; incorrectly as &#39;0xff&#39;. When I don&#39;t enable the Root Ce=
ll, the readings=20
<br>&gt; with setpci are normal. However, when the Root Cell is enabled, th=
e=20
<br>
<br>Please don&#39;t use images, it&#39;s very hard to understand what&#39;=
s going on.=20
<br>Please describe your issue in a temporal flow.
<br>
<br>&gt; device hangs, and after adding print statements, I found that read=
ing=20
<br>
<br>What means the device hangs? Does Jailhouse crash?
<br>
<br>&gt; msi_registers.raw is abnormal. I have verified that mmcfg_addr is=
=20
<br>&gt; correct, but the read values are still incorrect. How should I pro=
ceed=20
<br>&gt; with further debugging?
<br>
<br>Would you please share (as text attachments):
<br>   - lspci -vvv (before enabling jailhouse)
<br>   - jailhouse-config-collect yoursystem.tar
<br>   - Jailhouse System Configuration as C Source
<br>
<br>Why are you trying to change in PCI config space, what are you writing,=
=20
<br>and what would you expect?
<br>
<br>The device should not hang and there should be no need for you to modif=
y=20
<br>config space after enabling jailhouse, the device should continue=20
<br>working as before.
<br>
<br>Thanks,
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Screenshot from 2024-09-11 14-02-51.pngScreenshot from 2024-09-11=
=20
<br>&gt; 14-03-23.pngScreenshot from 2024-09-11 13-55-20.png
<br>&gt;=20
<br>&gt; Regards,
<br>&gt; Qiang
<br>&gt; On Wednesday, September 4, 2024 at 6:51:03=E2=80=AFPM UTC+8 Ralf R=
amsauer wrote:
<br>&gt;=20
<br>&gt;     Hi,
<br>&gt;=20
<br>&gt;     On 04/09/2024 05:35, qiang xu wrote:
<br>&gt;      &gt; Hi Jailhouse Team,
<br>&gt;      &gt;
<br>&gt;      &gt; =C2=A0 =C2=A0 I am trying to run Jailhouse on a real phy=
sical
<br>&gt;     machine(x86).When I
<br>&gt;      &gt; run jailhouse enable xx.cell. I encounter the following =
error.
<br>&gt;     I&#39;m not
<br>&gt;      &gt; sure what is happening. Can you help me?
<br>&gt;      &gt;
<br>&gt;      &gt; &#39;Initializing Jailhouse hypervisor v0.12 on CPU 2
<br>&gt;      &gt; Code location: 0xfffffffff0000050
<br>&gt;      &gt; Using x2APIC
<br>&gt;      &gt; Page pool usage after early setup: mem 48/974, remap 0/1=
31072
<br>&gt;      &gt; Initializing processors:
<br>&gt;      &gt; =C2=A0CPU 2... (APIC ID 4) OK
<br>&gt;      &gt; =C2=A0CPU 3... (APIC ID 6) OK
<br>&gt;      &gt; =C2=A0CPU 1... (APIC ID 2) OK
<br>&gt;      &gt; =C2=A0CPU 0... (APIC ID 0) OK
<br>&gt;      &gt; Initializing unit: VT-d
<br>&gt;      &gt; DMAR unit @0xfed90000/0x1000
<br>&gt;      &gt; DMAR unit @0xfed91000/0x1000
<br>&gt;      &gt; Reserving 120 interrupt(s) for device f0:1f.0 at index 0
<br>&gt;      &gt; Initializing unit: IOAPIC
<br>&gt;      &gt; Initializing unit: Cache Allocation Technology
<br>&gt;      &gt; Initializing unit: PCI
<br>&gt;      &gt; Adding PCI device 00:00.0 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Adding PCI device 00:01.0 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 1 interrupt(s) for device 00:01.0 at index 120
<br>&gt;      &gt; Adding PCI device 00:02.0 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 1 interrupt(s) for device 00:02.0 at index 121
<br>&gt;      &gt; Adding PCI device 00:14.0 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 8 interrupt(s) for device 00:14.0 at index 122
<br>&gt;      &gt; Adding PCI device 00:14.2 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 1 interrupt(s) for device 00:14.2 at index 130
<br>&gt;      &gt; Adding PCI device 00:16.0 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 1 interrupt(s) for device 00:16.0 at index 131
<br>&gt;      &gt; Adding PCI device 00:17.0 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 1 interrupt(s) for device 00:17.0 at index 132
<br>&gt;      &gt; Adding PCI device 00:1c.0 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 1 interrupt(s) for device 00:1c.0 at index 133
<br>&gt;      &gt; Adding PCI device 00:1f.0 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Adding PCI device 00:1f.2 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Adding PCI device 00:1f.3 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 1 interrupt(s) for device 00:1f.3 at index 134
<br>&gt;      &gt; Adding PCI device 00:1f.4 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Adding PCI device 01:00.0 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 8 interrupt(s) for device 01:00.0 at index 135
<br>&gt;      &gt; Adding PCI device 01:00.1 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 4 interrupt(s) for device 01:00.1 at index 143
<br>&gt;      &gt; Adding PCI device 01:00.2 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 3 interrupt(s) for device 01:00.2 at index 147
<br>&gt;      &gt; Adding PCI device 01:03.0 to cell &quot;RootCell&quot;
<br>&gt;      &gt; Reserving 16 interrupt(s) for device 01:03.0 at index 15=
0
<br>&gt;      &gt; FATAL: Jailhouse triggered exception #14
<br>&gt;      &gt; Error code: 9
<br>&gt;      &gt; Physical CPU ID: 4
<br>&gt;      &gt; RIP: 0xfffffffff000b250 RSP: 0xfffffffff023ef50 FLAGS: 1=
0093
<br>&gt;      &gt; CR2: 0xffffff800400b000
<br>&gt;=20
<br>&gt;     would you please disassemble your hypervisor binary with objdu=
mp, and
<br>&gt;     see what routine executed behind 0xfffffffff000b250?
<br>&gt;=20
<br>&gt;     Rlf
<br>&gt;=20
<br>&gt;      &gt; Stopping CPU 2 (Cell: &quot;RootCell&quot;)&#39;
<br>&gt;      &gt;
<br>&gt;      &gt; Regards,
<br>&gt;      &gt; Qiang
<br>&gt;      &gt;
<br>&gt;      &gt; --
<br>&gt;      &gt; You received this message because you are subscribed to =
the Google
<br>&gt;      &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; To unsubscribe from this group and stop receiving emails=
 from it,
<br>&gt;     send
<br>&gt;      &gt; an email to <a rel=3D"nofollow noreferrer">jailhouse-de.=
..@googlegroups.com</a>
<br>&gt;      &gt; &lt;mailto:<a rel=3D"nofollow noreferrer">jailhouse-de..=
.@googlegroups.com</a>&gt;.
<br>&gt;      &gt; To view this discussion on the web visit
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CAC=
FR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com" rel=3D=
"nofollow noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/j=
ailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.g=
mail.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev=
/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com" re=
l=3D"nofollow noreferrer" target=3D"_blank">https://groups.google.com/d/msg=
id/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40ma=
il.gmail.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailh=
ouse-dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail=
.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"nofollow noreferrer=
" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/CACFR-a=
7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com?utm_medium=
=3Demail&amp;utm_source=3Dfooter</a> &lt;<a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr=
3-A%40mail.gmail.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"nof=
ollow noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/jailh=
ouse-dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail=
.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;.
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a rel=3D"nofollow noreferrer">jailhouse-de...@googleg=
roups.com</a>=20
<br>&gt; &lt;mailto:<a rel=3D"nofollow noreferrer">jailhouse-de...@googlegr=
oups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/e934ce4=
7-a4c0-435e-95f8-204ff6b2e76an%40googlegroups.com" rel=3D"nofollow noreferr=
er" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/e934c=
e47-a4c0-435e-95f8-204ff6b2e76an%40googlegroups.com</a> &lt;<a href=3D"http=
s://groups.google.com/d/msgid/jailhouse-dev/e934ce47-a4c0-435e-95f8-204ff6b=
2e76an%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=
=3D"nofollow noreferrer" target=3D"_blank">https://groups.google.com/d/msgi=
d/jailhouse-dev/e934ce47-a4c0-435e-95f8-204ff6b2e76an%40googlegroups.com?ut=
m_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br>
<br>--=20
<br>Ralf Ramsauer
<br>PGP: 0xC85252CC
<br></blockquote></div>

<p></p>

-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com" targe=
t=3D"_blank" rel=3D"noreferrer">jailhouse-dev+unsubscribe@googlegroups.com<=
/a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6d0e6008-d33a-4ec5-9203-dc4f17db7814n%40googlegrou=
ps.com?utm_medium=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D=
"noreferrer">https://groups.google.com/d/msgid/jailhouse-dev/6d0e6008-d33a-=
4ec5-9203-dc4f17db7814n%40googlegroups.com</a>.<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAKNOR23kamvG8s_9CtAD6VfWUpUCYqsDcEUBX%3DLiV662wLF=
J6g%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAKNOR23kamvG8s_9CtAD6VfWUpUCYqsDcEUBX%3D=
LiV662wLFJ6g%40mail.gmail.com</a>.<br />

--00000000000076d8d80622bd0aab--
