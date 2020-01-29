Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBXW2YXYQKGQEFPZTTFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC3E14C9A4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 12:32:47 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id z14sf9975988wrs.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 03:32:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580297566; cv=pass;
        d=google.com; s=arc-20160816;
        b=fypAVXX/gou93G0554vqSphNfIEJk9HK/2nPJRqUKXwtzur15osEtjUDfHbraiBV0a
         DeuXNZ2PNQFoGMa/CvDU/xhEXR8bfeDxEy+ubErdcIjicQ5+ZjZsSLla2z8L07mnZXiE
         2fdaul28tPtFn+eh44SG2CyRnWSMzLizp+EIlWOlL+2H1Lass2osJaooyL45wtj7bzM/
         l37cF7xpjxKlOpgkcEkhlZAYL63CpKLLPBMpkqec3HyGBMSAf7EkYxhulET1VU4s+04P
         cJb0FeDzkjWRuz+DndO1OgMBd+GHps0Do/mfJzDM3n1iUNPW600Vnr5sOYfPk+UeoxBp
         1Bqw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=x1t07dleLhzKmWLkWacvg2R9VZDYkRqdj0Cxwsgw3l0=;
        b=PnLXVBeBEJ0AtPn9jAzWuobTwjiFq/tpdd+wSYA1AJmCwUbKLpife9N4Jiy3hyEduC
         ZUQ6OvQH6LYMAPqKQxMzjrq/oOl/u3KQH3ooMQWyrauNXceQMJUL6a6wqmKyi0uSv3s/
         xl6fRYhIadArCDXOAOhskWgFBZ4OeobtjXCUBpA3ePc8763U79cV1PqDxRJe0Oh0MK4s
         4tgpwmjnsieWh/SNz5nVS+M8Xqfj4vt9kNHSZ5j88DdcDyjdpf2d/i1/4sasHAaHHN2x
         jfC9/DaE4OGD67/VTQy0TmhrWjeaQt7UhdGzSsbzTKGd/5M2iPEL9hnnnu2IK3SpXHSb
         skeg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x1t07dleLhzKmWLkWacvg2R9VZDYkRqdj0Cxwsgw3l0=;
        b=U90HIuGvoSlLT++5e5j0lqTgiK3Xu/RtipuMRxhB6pNYCFSxhdT0vRQBjkhBGXU47W
         bMCm0Ouupm6Qw+THpUHPUAbyjYGue6dCiJMfkc+GnoVTcpFiJRUMoCArj3QAjOVXURjX
         YKrc53KiCxGmpP6gms1CinlZ64nrkulzbzq3R4VbrN/v4inVQiVNHeaj28y9bjj0o+aw
         AqTGUR6SEr7GTpdygDCH+Tva7VUekBKwBwwgr+87Wz68ItaLXPcdA+OskpVZY11kWCrQ
         ft8OGrteS0Om4J7jlvAE6qEpqMjgugIi3O2oYDeyZ3ybUy5v2fd6xkRJe0KUybZbd6ns
         soKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=x1t07dleLhzKmWLkWacvg2R9VZDYkRqdj0Cxwsgw3l0=;
        b=BpYRc80QwppDu9uU47IbEVH3pv2eYrMfBmlA/wwBGlfMOCWd7Xo7WCOgA7WbymRdvb
         yyavpbNTp7hLScbYb7xDefN27kauIfPb6Sl9imAZeoJHvk+rzvCRB9KuVaBcJBu2E8pb
         k9ZplGBJ6bOmIIktVjKQOrClkMemqqVwNiFg1N39ttRqhhWuN5Sl9I96B6z7F6Z5ey7J
         YfNy0OzOejxgRWdAGPZvyi8m1vGc35jyIS9WcGHKr3IvNG6GhEfxoCzlw1FWx7B4pBke
         IeJjwf/AOxhO3fZJEyjj/K2wuZfNnOtD81DXjSVnaSY4ofUtgV2rSz124vNyZSOPRsm8
         LLGA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVacFWO5zdQhtmt/0oiQm4hzno4O9hVo/ORosA1GFpsAmbbdHoX
	qwpAZQ6XbVa/DeTRkULDOcA=
X-Google-Smtp-Source: APXvYqwTD+bljouBAwpsS9H6fPUD1BQFM16ZdBtqzAXafeUk4DMeBXVMgGe127H1Et9ZbPH6KxhBIQ==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr11578120wmi.51.1580297566730;
        Wed, 29 Jan 2020 03:32:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f403:: with SMTP id g3ls11927526wro.3.gmail; Wed, 29 Jan
 2020 03:32:45 -0800 (PST)
X-Received: by 2002:a05:6000:1288:: with SMTP id f8mr36500309wrx.66.1580297565792;
        Wed, 29 Jan 2020 03:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580297565; cv=none;
        d=google.com; s=arc-20160816;
        b=FZx4u9fEHwRwndNofGQBkx3fQU4DfH8FuFhB5gGZWE5PbojvOL/3eev0Fr9ff3gACd
         s/gMYLGg3KODdr3vVo3h4a1P8tWyXaHE7ypRarr6LfehvHJ5bIqEcoJ3yrh8uWfmnM1S
         BHqX6WD9dUeW2qbHsuHWYBsI26anyOlGSHRuJJ5AstiYEkWK3QnHLBFil9WEuikqEiq8
         OWL9OKV3EPagUchw6WDK1EX+lkbo+piIice/YfhBAaTPM2Zd/cOMVg7nQ0mvb/lIys+q
         nBY5LNSW/snW2fg0x5rTN+80I3w9eMCVx6Ai8Mvl03ePl8baSFaOI5EnPiHOql75zJx1
         83mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=hHPbOqFoNgGWrwtWiS44CxRPT/s9FCrj5ENB3QRLPNk=;
        b=alcpDMFwVzDeCpenXSY59Cg6mTckvr4v8dGOVtztnEKled80LIjpziu69YDum9m2vf
         yPb/qeDg0gjAiZmBrjxNd8/bEl57ViGS5USfrR+dJbbW9qEWOHF9SQXpyiyzO/H+AQ6e
         sqiQphE/AUAL6SbPxXyB3pI2d0rxfvAX+Ry1Hk5EDUhAO7SNbmYvd46RxErjpB5ObeEn
         mJGzVqv79ye6QrQG9/Mh/Oh6j5ZaZPJcw3sfWNV7Z0/j3ZdLyEwPpB2yhi3a4IHJRfTq
         AkMtAEv/+QtSrrxm8zMcm065sOpQk2u7/waQUhm1E6Pe9k/WO40LKNHo1ljuRYRuDk0z
         DmAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p23si83763wma.1.2020.01.29.03.32.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2020 03:32:45 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00TBWiIN007126
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2020 12:32:44 +0100
Received: from md1za8fc.ad001.siemens.net ([139.25.69.193])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00TBWinh015425;
	Wed, 29 Jan 2020 12:32:44 +0100
Date: Wed, 29 Jan 2020 12:32:44 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Saroj Sapkota <samirroj2016@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2
 kit
Message-ID: <20200129123244.22fa5113@md1za8fc.ad001.siemens.net>
In-Reply-To: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Sending code around as html does not really help, especially since i
guess that you have a formatting problem with your bootloader
configuration.

My guess is that you want to "append" to the APPEND line and not create
a new line behind it. You might want to add a completely new entry for
that.

LABEL jailhouse
      MENU LABEL jailhouse kernel
      LINUX /boot/Image-jailhouse
      INITRD /boot/initrd-jailhouse
      APPEND ${cbootargs} quiet mem=7808M vmalloc=512M

This would be an example entry expecting two new files
"Image-jailhouse" and "initrd-jailhouse", making sure you do not have
to overwrite the previously working kernel.

But as long as you do not see the change in /proc/cmdline you have a
boot configuration issue not related to jailhouse at all. Consult the
documentation of your distro or the booloader used by it.

Henning

On Tue, 28 Jan 2020 13:50:09 -0800
Saroj Sapkota <samirroj2016@gmail.com> wrote:

> I'm trying to run jailhouse on Jetson tx2 kit. I downloaded the
> jailhouse and compiled it and run the command 
> 
> =>sudo insmod Downloads/linux-jailhouse-jetson/driver/jailhouse.ko   
> 
> // there is no error message in terminal console
> 
> but it gives following output on the serial console:
> 
> tx2@tx2-desktop:~$ [  129.954491] jailhouse: loading out-of-tree
> module taints kernel.
> 
> After this I tried to enable jailhouse through this command
> 
> =>sudo jailhouse enable
> Downloads/linux-jetson/configs/arm64/jetson-tx2.cell // terminal
> displays: JAILHOUSE_ENABLE: Invalid argument 
> 
> //and on the terminal console it displays:
> 
> [  333.421533] jailhouse: mem_region_request failed for hypervisor
> memory mem_region_request failed for hypervisor memory
> mem_region_request failed for hypervisor memory mem_region_request
> failed for hypervisor memory. [  333.428303] jailhouse: Did you
> reserve the memory with "memmap=" or "mem="?
> 
> I have changed /boot/extlinux/extlinux.conf file as follows:
> TIMEOUT 30
> DEFAULT primary
> 
> MENU TITLE L4T boot options
> 
> LABEL primary
>       MENU LABEL primary kernel
>       LINUX /boot/Image
>       INITRD /boot/initrd
>       APPEND ${cbootargs} quiet
> *mem=7808M vmalloc=512M*
> # When testing a custom kernel, it is recommended that you create a
> backup of
> # the original kernel and add a new entry to this file so that the
> device can
> # fallback to the original kernel. To do this:
> #
> # 1, Make a backup of the original kernel
> #      sudo cp /boot/Image /boot/Image.backup
> #
> # 2, Copy your custom kernel into /boot/Image
> #
> # 3, Uncomment below menu setting lines for the original kernel
> #
> # 4, Reboot
> 
> # LABEL backup
> #    MENU LABEL backup kernel
> #    LINUX /boot/Image.backup
> #    INITRD /boot/initrd
> #    APPEND ${cbootargs}
> 
> but this change is not working. So what's the wrong in this
> extlinux.conf file as boot up is ignoring *mem=7808M vmalloc=512M
> *this statement. Please help me through this error.
> Thank you
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200129123244.22fa5113%40md1za8fc.ad001.siemens.net.
