Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJWJ6SAQMGQEKQME5QY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECFA3287C3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Mar 2021 18:30:15 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id h16sf6010893wmq.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Mar 2021 09:30:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614619815; cv=pass;
        d=google.com; s=arc-20160816;
        b=sivrAp3LouWQ0dsUOh4zEV1Qvdyv+TqWD+BOUI6d6VPfdA01NzvAhbP5h28gBUTwB/
         PcMIWGh68teK1jwWoU7M1i6R8hhdy1scqVFQ6VAl8y5ocoCBybbxm7/QS3IJPfCWlj7h
         DFlE34Uj7U5UHj8RFBVvqhHKxUNE8byKJnjxNS/omQA2WJ/+lL8EfOFUnB0vkTS+LuLd
         q4cuWhvZW+Z9Tk/r5Hsn6KrDdiXATxmTsRETAz2F4JPTWG3rIjSDDNckf19vo4F1imbg
         uweX/ZOulAO+RCsi424otC5IJkJsdIYtzCU9t5kljsmwWm52fXCcGLiH9p+9//Dz/n09
         Y2/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=XobKQ+pY7h8pJMoqZ4OzYItaEJbOrDOhmJdArcHzmjs=;
        b=gNT4Lpg5UZQBfAFi4Em7zsuLhWNCfGq0w11sdsuUUf3xRWvN/cwQOm6cz23Mcb1I8d
         Ph2+7ywyG0jCZLMeiIVTwr4zkCxd4YhS+vLPNNV6IV68InCS04MBfA3+oxzYq/7soVcp
         DskxF9w2DnUrmM2hWTlBW/wSTpGkgML7bNVW2TvRDQIFXccX804LoJ12Zrh+fV4UqT4c
         KEiCrDJtFJU4rnFg/ACgd77kv0QcRyKRCqjjwOWMCv/fgge3cQpfek+47vsMHhvvw++y
         F7rRt1qm/3pxISDbZpyEfRVX7PjvafxILgL/6HQBLS2YnggmbHbLhiVMwaHycrPRow1j
         Fdog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XobKQ+pY7h8pJMoqZ4OzYItaEJbOrDOhmJdArcHzmjs=;
        b=YdNw7VUF8ofx6ipKVanOrseqLbHWaFmbjNMlwIli+S40es2Lg//OWjaZa7sM1sX5fC
         7UvhtK4E6Ik/Z0GxX0ghixDhqRlgJYz9plqtaCu0Z0uN+Oite0NDqOc3s8mvxuCH/TYZ
         O5wvBFgmJ2IgsHeI7RD3gZUmTOcw5CTMdr5t5x3oj4OiKagP6ClZ0R10fYcoJfedrKcz
         qVIKyZzBu37GuID2PoTHCmm65wZOB1Dmr34Ecyn9hAsQy4w3tmhdw2EMLJAkU1IJafdd
         DIDr5jfPAsuLEsXj4LnQ94T1UPBvNQLJ/gk7yrNBkBmXsoRSL3NHwrqKxGJGPjHej8tU
         Of6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XobKQ+pY7h8pJMoqZ4OzYItaEJbOrDOhmJdArcHzmjs=;
        b=mFPikTXJp4vsEvnlBwuxiny1OCexpe0fV9mioN6FQfH6g0LCHyCibckHmVlPzQsWs2
         wr3hjx/BuxuNO0rI3x9MkeBtSZ8J15wEn82xbFJhN4r+RDpZKlFuL9zY1GqmD/zf3wID
         dwPD3hXEZcJMfwDDpyQn6QheIsEgnq9VnJgF7O6vCjQsU/ObY8EonqA60sUO7/vF7H94
         0CFouzRmWHaiImHzKbi4YGl5fyW+t6vnxc9U0Z8bLm/tzqKZr43dR0DL5/Hwd/AWOIuh
         5AiBoPWm6HqqDC8faOJ03YPZFG4BUuLn2y3CJTOPhZLyLj2p7pqfiZRlvZzYHy8A8nSz
         gxIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5312JPJ+ciAAIETtHeV9VUDjvVa+YsMhKX3Az4ZaeLslPCOidH7J
	4Gg5KvXOGk44yybqTR4Hk/I=
X-Google-Smtp-Source: ABdhPJynuuG9wvzvvz17PlBsX298jbhtv9SUQdP5nMBcYS55XDZjyeBxzGP9WKFZK/aHdNnW2YUN2g==
X-Received: by 2002:a05:600c:4f85:: with SMTP id n5mr16874611wmq.3.1614619815138;
        Mon, 01 Mar 2021 09:30:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:60c2:: with SMTP id u185ls7340935wmb.2.gmail; Mon, 01
 Mar 2021 09:30:14 -0800 (PST)
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr16901746wmj.81.1614619814133;
        Mon, 01 Mar 2021 09:30:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614619814; cv=none;
        d=google.com; s=arc-20160816;
        b=E4goTZKPqO0nWgAdbDRBV7nfye4Xn1IuoZnAO8zJhKAmdDiG1QKrlaIzjPa1gQmrDF
         1LSnMeBMeOIaL5JaFwDM8WtTwKYXX0BCS/ZIZ9ZVCKFgyFyiVLR8hz+6UQoq0Wtp9UrW
         N/uKNtChbJmqIBTjdD/TLRvGTYiBC6AJ7HwvVrHuZB52XWkAm2XQm8Fy+IYgboCcLYBG
         VSF/a7O60IcSKYhfs4pvK073cLr+HNsw70l1Cn9Q9XgwpQ5lw3bAm7s/CuqFFYSH4UGJ
         AhOGiY8kGMHFqlEytf7P0Yfl6R8g6oOccJVk8YPwRk808bDLdaf3uwm+5x1nPBkRqFf2
         8SnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=akXfgvMN8Jpp77ZehsRiyzEAxG6AT9F6CN771pjECtk=;
        b=LTufHYoc6QnvCAjk41hOqqiTQdtQnH92SoWD8sZSF98wDIQtvCMI/YURJVuEQKZIaH
         /9dULTSfIuNWbSh0ZVEJK/slMB+zBEwYrk8tpbWe3TavAAGOY5eP4CbKTmn/EWT8Zy2i
         u2SUJNH3pM04Pic2UI6eInDTRU/dE32fLjgwmD8m7RMyAjX7vKIPrfGYP8VmcmVdmhXB
         WpDCTtK4Siz/a7YHAuuCxwVN/6P4wLlDhEbLgFV6i2xulrJRcfu3CpfP/RK7QzPUcMRg
         EBSa/fgWVrq+kDXQKXy/rIQTM8ftewJPUrjNmhPJAKZeUJvw5dmp2uU8pbnW2Y9gTgj/
         RW/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o17si186978wrp.5.2021.03.01.09.30.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 09:30:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 121HUDnN025163
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Mar 2021 18:30:13 +0100
Received: from [167.87.94.143] ([167.87.94.143])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 121HFCIK003883;
	Mon, 1 Mar 2021 18:15:12 +0100
Subject: Re: how to run linux with root in none root cell ?
To: Smith li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20a0834c-e41a-855c-71b3-2fea4ff89d14@siemens.com>
Date: Mon, 1 Mar 2021 18:15:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <254a573f-0b4a-4c6e-a5d5-19d0734cf6ebn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 25.02.21 13:32, Smith li wrote:
> Dear Community,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 I have compile the jailhouse-images repositor=
y, and run the demo.
>=20
> =C2=A0 the command to start linux in a cell is like this:
>=20
> #jailhouse cell linux /etc/jailhouse/rpi4-linux-demo.cell \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /boot/vmlinuz* \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -d /etc/jailhouse/dts/inmate-rpi4.dtb \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -i /usr/libexec/jailhouse/demos/rootfs.cpio \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 -c "console=3DttyS0,115200 ip=3D192.168.19.2"
>=20
> What I want to know is : how to set the root to a dir or disk ?
>=20
> I see some=C2=A0 =C2=A0use=C2=A0 =C2=A0root=3D/dev/nfs=C2=A0 =C2=A0ip=3D1=
92.168.1.1::****** :eth0=C2=A0 in this
> page.
> [1]https://groups.google.com/g/jailhouse-dev/c/vXD4tzCPDG4/m/zX_hHNxJAgAJ
>=20
> Can't we set the linux root to a disk partition or a dir ?
> Will somebody tell me ?
> Thanks very much !


Jailhouse does not provide regular virtual devices like other
hypervisors. Everything is mapped to shared memory devices.

You may use network-based storage for the non-root cell, nfs as
suggested above or nbd. There is also experimental virtio-block, backed
by a simplistic process in the root cell. But integration into
jailhouse-images is missing, so trying that out can be tough.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20a0834c-e41a-855c-71b3-2fea4ff89d14%40siemens.com.
