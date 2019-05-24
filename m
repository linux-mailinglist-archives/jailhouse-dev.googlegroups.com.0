Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBKPHT3TQKGQE4GOUIHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x338.google.com (mail-ot1-x338.google.com [IPv6:2607:f8b0:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B929421
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 May 2019 11:04:43 +0200 (CEST)
Received: by mail-ot1-x338.google.com with SMTP id e3sf4191998otk.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 May 2019 02:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=j4qG6GiAj8HG5LvdtthnK1+RC5aEBms+FcLvrBDCPHI=;
        b=jg3HWQQsCGiuqWIcJtEF5UVBx9Wn0STywxu7TOyoRJMu+/uOJbRdq6mRDx8cV8ca9B
         XkCedGgCTTclDezMg3oOM6RoYz/XGInnTYTOOvKnXRoRf47O3oo846g34B20CDmm9SkQ
         j5ZVwb8dmOUD/zLZxp5ZwhH9XhttV3jJtTOyrvLTmCeg2Klpvnlj/A4EffOrXoM6BBKC
         Jt9Sf31lYefx9pX1G+J7gSRlcEu5bMPxzkDo9SzVtH3/rBqD/wkJee41WKmhKS3E6Xje
         7eykW2XJVvIONh/KKGpOiXV+RDUMxcWMnTWbJernrQMkkXoq78odVaNvGiQ22WVpj64U
         IkRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j4qG6GiAj8HG5LvdtthnK1+RC5aEBms+FcLvrBDCPHI=;
        b=U5hgTpVbMT4CwcgIOoEAfxmORFSQme4aDPGlD0pyi1eNIUHGF1xRVhZ8h7Dl3JI78C
         pQP/LHTpU+r9+ClErVgRIXMaykBprl1o53h6b+QhjcuP48hRlonMFVbsBGV7vGaNSVVU
         K3Rl7a+yGv9fqH0h6ZNSrdK635xTtdAXj3pH42L1Gxl0lg3Gm0lb79SIdqTZAN4ESJTS
         904SYMKC8AKpKEU4N0QIJh8wbS66MCYZRGDeGwEQ4OYMrMAsChqw0Rpldmwe3YHVptTJ
         7G7C2/5dX35gg0PbLheK1zxb7fzyA6oBsLidsf1REZE6D9rsgLrANwbBTTR1q2vvPvCy
         Pf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=j4qG6GiAj8HG5LvdtthnK1+RC5aEBms+FcLvrBDCPHI=;
        b=T3DlHQgDWLd6t0Oim8s2rkaccc0PUkmkrpCHhy1DA/vwJScS8BJqql/6uQs5yJzcqf
         3f/ZSayQmJqqEyhQKUfy1n9uzkmk65Ji1xcyaEmDAPj2PX5nd7f/2w6qHeX2zMb2AKyk
         RlvJ4VsVzk6khqCWogJ/pH0VM9pD3549DLh9du6qN7xORQGkucr8FE8wt6AN1DGrSqHR
         XgmIN4SGXsxogjGDJnm39/5x/NO5CnGbms32bnyH263wJF7duGtAbP4Aq0kvwo7sGbji
         VR1sG4ROpg42ChU4p2TGUWeeN4uQF6GCKVZCr1z4kD/WpXArcGv1p0YHIwRiZ8AZ2aOj
         XByg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVK1Kv7v7dDPKYTWJ07bXtcvjOlLdpqFMN8eSsNbnzPxTxqZ//C
	/DmN1m/eDRNyTDuG4OCnbJc=
X-Google-Smtp-Source: APXvYqyNT/RIQrXg+b7fFK+cX2zwyx0hnjxap63xOzILviOumQWjBJ0cDmFaK40S4wCkW72Br1R7VQ==
X-Received: by 2002:a9d:7a85:: with SMTP id l5mr31921695otn.170.1558688681895;
        Fri, 24 May 2019 02:04:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:19c8:: with SMTP id k66ls1635891otk.15.gmail; Fri, 24
 May 2019 02:04:41 -0700 (PDT)
X-Received: by 2002:a9d:5f04:: with SMTP id f4mr232798oti.240.1558688681291;
        Fri, 24 May 2019 02:04:41 -0700 (PDT)
Date: Fri, 24 May 2019 02:04:40 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <deca16ad-b539-4447-b865-f0fbcb5abe3c@googlegroups.com>
Subject: Ivshmem, MSIX, irq_find_mapping return -EEXIST
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_850_1462220002.1558688680603"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_850_1462220002.1558688680603
Content-Type: text/plain; charset="UTF-8"

Hello,

I am looking for some help.
I am using ivshmem-v2 with virtio.
I am planning to implement a virtual serial driver on top of it.
I ripped off the ivshmem-net driver, and obtain a queue which I should able to communicate with other cells from host.

The problem is that during root cell's PCI probing, pci_alloc_irq_vectors returned -NOSPCE.
I went down the rabbit hole with ftrace and found out that in the MSIX initialization, irq_find_mapping returned -EEXIST.

I have cross check the code with ivshmem-net, there is no difference except for the NAPI registration.

I am filling quite helpless down this rabbithole, and can really use some help.
I can provide the trace log and driver code if it is necessary.

Thanks,

Yang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/deca16ad-b539-4447-b865-f0fbcb5abe3c%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_850_1462220002.1558688680603--
