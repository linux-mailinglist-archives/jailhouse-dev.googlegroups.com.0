Return-Path: <jailhouse-dev+bncBCFLNWPPWELBBCOI3L4AKGQEVR2NF5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EB2227A4D
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 10:15:06 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id h14sf4933147ljk.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 01:15:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595319306; cv=pass;
        d=google.com; s=arc-20160816;
        b=bmPlKu9ajtI8CiS6RRGfeV6gTxEencCLukakqDkfZy8DeeG0y8UFQMWMbiWMUREeg+
         mRxfPyKIDfwEpWZc4N/LQP9pxH9ciuGK0xmZ3QqB54c62/D+qtA30S0v/BeYDyO71yNi
         RpxP4aGQBZS7OtjP7wlMMBFQyMXmvFPD4x/X6kf51Yz5Omkht87vE0+1g2XZwalGL4Hh
         6iy4N2aubETwMupaMM/J2x+lJujmrbMtuJanFW5YTzP+CnPit23wnTIAZRFIiI8LwVJj
         fiBODC3us7uvvAWsBpKBjDmYp4gZl8lqhRIMPzrKSGPTHzHbHAdOBS6E3EBnJr1AsjCJ
         7csQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=Bq4I7QFEpmER9YP5uV3I2WZGUgR8xsS1HS1kB7VJ/vs=;
        b=lvzcbtvcJg2vy5rkNoOPp3me2EHRSS/g4v8scE2NZ9jV1YOWMArSB0poeyAQjoIGQP
         gBtLmEp1QXCqHk+5N6MzwMwIWpH6ewSUPEwBOSaIzu5EXwpSgil6+SSFrXQQ2T6B8wBE
         AIhrVf2MeTcCLiKlBQuq0f7MNpKmlx/IcP5AEQVZd1AR9ISs0RUZXMFLa1A/dghBeE0t
         xmyzrSaPjRU+OMFNFBrMdtXKc8h/4d1Uga5SsbFz0fsqVAkSmm8NubCgDTuP21hRajmk
         9YJ1pgvDhKCtczHdkyKrQd605regeWnupdltUkmjJAioqM4Tv01hwvXE7gYBTCRs/tVT
         FZVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qqt0GsGv;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::532 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to:cc
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Bq4I7QFEpmER9YP5uV3I2WZGUgR8xsS1HS1kB7VJ/vs=;
        b=EHlKKQHoycaCBnt6HzZY63Oyf1y5+QLJzKj5QdDUGE66F47nDUK5e2vFj82KVebvfm
         g5Vo4Lp5iXXTKjUxaghpFWn5YZhmTWnNLvJbPyUDaEmg1/oDa1/qSifmQy9ArqTdE1jU
         g3Q9KSkwrHnK/ZReKp0DhfvMAqH8f22QQz5D6lXpZ8nRq0m7hMH44RXhe/knSvxqyXEo
         UTSXRP0BsgGEcANVc4a/hBEsn7gOOB3EqrApG21FAWjevif3ZUT1bSIoCHcMGqjG4pOu
         E8ow5aVpNcSmip/8WwKj6SO+Y0Sz47LrlYLSWezdchRIpGghGIgf2gSZKruPPOOesfbT
         znFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Bq4I7QFEpmER9YP5uV3I2WZGUgR8xsS1HS1kB7VJ/vs=;
        b=E6iM4i3fnHuoKmUOlLaekMwxT4PZqnhFDFoU7pP4BF6vrWWNny3DfLT2Ol1xQmeuvy
         jRFnVnPNRCA8DvWfl69DDZ0oOfKABcwKeJnIVeTw9IkDC545qFnlZ49JjWeyJx+pNiss
         wLIoiL9/RpJGbSTPbq3jFUu2Agw5V26hMpnUB+DxRKChXHbK6aa1itJjyZsxyn/QnX0k
         jogWocIgXV/ERF91IE/wo6bWA8moCIUG1WWU9rzZ1IgkpIE81G7NF/ojIOCz89OXFGtK
         RHXXZw2972toOilWK0LZlCSysRnVOu/vc8K0XgqIOXIRCjiLx2iX9pGh16GBnFoC+YZF
         Vm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Bq4I7QFEpmER9YP5uV3I2WZGUgR8xsS1HS1kB7VJ/vs=;
        b=Capes1lKHTZNDQ3bkl7Uq5Gd5SR7FAgVsAAzHQpdBPdlz3/YjPImsppLf+o3mtO29g
         Pknf+BJG9DbHw8suJwBM2jej8KK/RAyV5dPAob89Ksinv89xNadCJUP0LCZPVSdiv2qh
         ISC8nIGwUW02jcZ3k13xPkqRNtVgBH1ZuJpYjzTf4iO7u2mfut0hmP/NNxwKdTax4pvd
         nkwRHN3SXQSIE+VLZXg5VyZG8gzK0KdfNvc0Q4aCJ5NMT0x0+QlYvuAhXGMaxzSOiEat
         bJjjx3z15KfyEI/+Kg+9+7Q48ZRbEa2efgtnzkARtRcHVNzvmqNFPYpTRFtcNGVWOPv4
         dUOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531tW7P4A0zm9PUKPD3ZE6z+2ZQnjeVvCqCe3l2UluqmS2DbNaQB
	5LJAgGUi+GXdAXA5KJulohs=
X-Google-Smtp-Source: ABdhPJzgeQjvBPOwPL3hIHEMaRwfKErh9S+Jn3NtjiuaxhbAk4t0dFfYf1DqrAs5LvBGecxzhMBcQw==
X-Received: by 2002:a2e:8e97:: with SMTP id z23mr12956480ljk.288.1595319305899;
        Tue, 21 Jul 2020 01:15:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4f43:: with SMTP id a3ls2822305lfk.3.gmail; Tue, 21 Jul
 2020 01:15:05 -0700 (PDT)
X-Received: by 2002:a19:ef09:: with SMTP id n9mr12758451lfh.215.1595319305175;
        Tue, 21 Jul 2020 01:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595319305; cv=none;
        d=google.com; s=arc-20160816;
        b=lr/hraXGXvNEpD+S7aQwrJa7Mc2hV/mFRVoMT2O5kLnCIgDM7qrecBIUnlLFpy+UOM
         6qE14fZ52PfTwSCs/8LlpdsMhv02rdh/0K5Bxx/ZAYklr1aF1867VfdpcpxdaRMZCPkj
         Fya5OABDxtxgrf38m1TtTNDkIRKKbFUDU4uSfBGVWeWScjaN8J75GgC5KsnAKuSRMNyz
         0Djwl++5iNG4Ozf6d1FylPZ6wA5s9YE9PfyZdA+k83hnv0DDBmqs4J8OrrJw1AylXThT
         NcYrTPhDJRpvDNPjCHX8Y/G6kp/q2wx0/oGqGVRcHEqx8Zgdh0D8Wh8em779Ky9EPVjW
         UzMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=cExNrIeNq3tLBg2oF4bMmYH2GjpnRfzKfMBEUYIMJAg=;
        b=gd6BsgtpES/ebIbJ9TByc37Brt6F5RcqzhCrfOt8Q/pyvKSN8wnIJJobID3yc91VnP
         Dl14btzYVktjTmW8syodAL9eZ4mz6alMRbJ+Ol4FFZPNnYuzTcMmutPjiNvFVvbXknPJ
         vJFNvXFtJH9CTz8ah+IXA13XJHKZ01Qo0m5KoSZKfscECFrgNOpCo5uxQYAJQOCxMgcP
         waL/BMMzJh564rqjPtctFuC5zPeTcg+8Crp3X6URoyH4nOk0zQ5qVMgSApvQkCLVURaz
         4jdpBYMuUk9ONZKHumtc9xcXnCxk+KQmKeLYzbVyZI0O0pfH+0aOM/ZFa+bLk2qc28It
         +CcA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qqt0GsGv;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::532 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com. [2a00:1450:4864:20::532])
        by gmr-mx.google.com with ESMTPS id o13si590396lfc.0.2020.07.21.01.15.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 01:15:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::532 as permitted sender) client-ip=2a00:1450:4864:20::532;
Received: by mail-ed1-x532.google.com with SMTP id z17so14640472edr.9
        for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 01:15:05 -0700 (PDT)
X-Received: by 2002:a05:6402:202e:: with SMTP id ay14mr24815631edb.233.1595319304706;
 Tue, 21 Jul 2020 01:15:04 -0700 (PDT)
MIME-Version: 1.0
From: Prakhar Bansal <prakharbansal0910@gmail.com>
Date: Tue, 21 Jul 2020 01:14:28 -0700
Message-ID: <CAD6ScS_uBX7NCU+VinzamffEFH_kfh4B-MfR8nxt7+5VuNpRUA@mail.gmail.com>
Subject: Libvirt driver for Jailhouse- Test set up in jailhouse demo-image
To: Jan Kiszka <jan.kiszka@web.de>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000075e0f405aaef38d5"
X-Original-Sender: prakharbansal0910@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Qqt0GsGv;       spf=pass
 (google.com: domain of prakharbansal0910@gmail.com designates
 2a00:1450:4864:20::532 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000075e0f405aaef38d5
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

I am not able to set up the test environment by mounting host folders into
the jailhouse demo image- QEMU/KVM Intel-x86 virtual target, as you
suggested last week. Since this demo-image is created directly from
QEMU-system and not by using Libvirt, I can't manage it through
virsh/virt-manager.
Also, the space in demo-image is not enough to build Libvirt inside it.
Please help with the setting up the test environment for testing the driver
in the demo-image.

Thanks,
Prakhar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD6ScS_uBX7NCU%2BVinzamffEFH_kfh4B-MfR8nxt7%2B5VuNpRUA%40mail.gmail.com.

--00000000000075e0f405aaef38d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jan,<div><br></div><div>I am not able to set up the tes=
t environment by mounting host folders into the jailhouse demo image- QEMU/=
KVM Intel-x86 virtual target, as you suggested last week. Since this demo-i=
mage is created directly from QEMU-system and not by using Libvirt, I can&#=
39;t manage it through virsh/virt-manager.</div><div>Also, the space in dem=
o-image is not enough to build Libvirt inside it.</div><div>Please help wit=
h the setting up the test environment=C2=A0for testing the driver in the de=
mo-image.<br><div><br></div><div>Thanks,</div><div>Prakhar</div><div><br></=
div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD6ScS_uBX7NCU%2BVinzamffEFH_kfh4B-MfR8nxt7%2B5Vu=
NpRUA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAD6ScS_uBX7NCU%2BVinzamffEFH_kfh4B-MfR=
8nxt7%2B5VuNpRUA%40mail.gmail.com</a>.<br />

--00000000000075e0f405aaef38d5--
