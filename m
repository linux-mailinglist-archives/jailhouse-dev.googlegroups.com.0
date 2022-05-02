Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBFPGYCJQMGQEVFKDDQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63e.google.com (mail-pl1-x63e.google.com [IPv6:2607:f8b0:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id A881E51777E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 May 2022 21:37:59 +0200 (CEST)
Received: by mail-pl1-x63e.google.com with SMTP id u9-20020a17090282c900b0015ea48078b7sf1592660plz.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 May 2022 12:37:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651520278; cv=pass;
        d=google.com; s=arc-20160816;
        b=YHY7eK4EESUrCtyOlbnMTjGSsZS7t5ZjJlAIFkPT5i5O1lFqFGWxzWubRul8tMBtY3
         +Mtne+wgBCkZFDiVSfnYajsp7Oq18FYNX/q84VNWbNjSXBC4w6WgEv5NUPpj83ytQXpu
         srE/053vQo4h+2BSmuc7Bda3qYx3zb97AOYAfw+4S5mo5Gx7uYizHHrsx4UrBxeAzwFa
         nyiL53ywbikjHXnMhTuz19kgfdh6w/t1U/Llo4k+x1jMIucM0Kx8LBCCD0tZTL8ttc4s
         jm+HZVTOvjrkBDlu7/seZj/a3zYzewv/JBM3plXFaDlaezzs9DEmz40YOwBOT9iqU8KP
         manw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=GgYKTiXVhS+baGgSUuIJ1m4EZpS87dBmJKfSUV84KH4=;
        b=R15JXf9O9KCleJSMYv6eNcgaGBBAbikKZ4aumnK07n7yxSowKJvr6Z0XuH1dzOl2WK
         85BeNVMUiv5PHLecbX+wS51PcQLSQjfOU2qebZBTZvIcw1ed2oIKoQTwy3mNEsXY6tp4
         XZJhNKjWYxWS3WetVQfy6AEiBuFeKTTBfqeAdiDf8Jc/JFga81GtUEvZnC4DdBbanFVt
         /c/H8AVOR6YhE0q20E26SEDGnz7HxQmuexkMrekRvqqxTWO86MhGpNggESjQwTCh2EqE
         3WP3moxF58DoapR+ZgcqfR3GsSDXWQ+KjPN1f6HUXh9kXh9efB9GJRAgEclfEdMU2Q0C
         0a1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gKCYeMYC;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GgYKTiXVhS+baGgSUuIJ1m4EZpS87dBmJKfSUV84KH4=;
        b=t2G71W2s98i3nQp8A2TDQXT0/tDGGzrFQnaWYUU3bP3XyiyrEoo1zzqw7npoK76vwr
         ORzcy5aNaYE8YvzTapacZY8WPismcOQGuPep5UHEeaFQhu3b0HPl1bpJlb4qhH/MANYD
         7Yms47WI7agkM5TVPJfRbgkQ1UdCxChXFkqp2IaIyOF5TtNL7VDZcsE0TkF2UQk1Yk6/
         IMCPBR+uSfEH324JFud+050cmJDyMYrUqyj1Dp4vSkhvRnJuzCD8WRHYrIGwcDFTuVzL
         V3KujwRlbXaXjo6xsfTLE6Y4gdRTSf0QMBWOBYS0ha0Pz8tLNo+h8L3ZHKatQbihYWTB
         aKMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GgYKTiXVhS+baGgSUuIJ1m4EZpS87dBmJKfSUV84KH4=;
        b=qs7p7cGhSuvGIZ3GxFRC38ZWgMhahOXQIZ34W6m1TCYqTRicfYm2qZV3Lh22TGKJ0c
         ZUd4Wxl4dYO//9zg6n9if8dSj4qRNjJSVtXUWlRLv5+V828CUe1HdvWZM9Skz/tq4R78
         42c+ZSHBwaHysr7YIcVtP2yf2XyS96IK4uFS0pwkAOewQWkV9n2cDK7AUaYjWjqyEBCa
         2ufAqzGioiiONZTYoIIX9ymvxUlrHfHdBZztTmyNdUphOY4QdICKZM6bACbVZD1MvQB/
         J+A/pwnGnB9mQXFzmxBf8JYds7jlJTBOqPPyN71gX/oUMLHDYew7WrSrpo0RYSu4x+6E
         xxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GgYKTiXVhS+baGgSUuIJ1m4EZpS87dBmJKfSUV84KH4=;
        b=C85GqmEvDWj3j4PbNw/At6BsiAqYtxP9JqMlftoQxdC6qOoDKPBZqhd8qTVFP2JszA
         0pbCGCtV8BIAm0WAC5pO+9BprWEfunAcfuDaIH1Kg2spk8v2Ur3Ehjtk4WWloyZa/RNi
         h2/sX9B2HpqmwzcCVeQ+9jnFsp24BTWaKDebHbAetEYG4v6Ri4Hn2Cso1HP0Sji5gJmw
         /DRxNs/Yu2nUPOYpwyTu1VuRcZnVuwvkxELvTUZxjf2rYDJBkewKGyvvttKsRz44XMR0
         R+kE0Gt34nWxFEIry6LdaRaT69EnlJH8xuoYExpz4HMo+S5OIzHcK3t/rlkWYwrNz+2U
         elIQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532XXbB12W3FN8g0DXG0HAuRe+FfH/zwXaFr1fwzPdNOBXza53x5
	HKS35FcXan63YVvG3zHP8Aw=
X-Google-Smtp-Source: ABdhPJzwLz5KCLwdIG4IjPOHbotOthugjp20gEjFs4e9ieosG7j57Z1xQAVaRtzNnfnu26NuYzJ/vg==
X-Received: by 2002:a05:6a00:2481:b0:50d:4839:5896 with SMTP id c1-20020a056a00248100b0050d48395896mr12495261pfv.37.1651520278158;
        Mon, 02 May 2022 12:37:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:aa95:b0:15e:9fdb:4846 with SMTP id
 d21-20020a170902aa9500b0015e9fdb4846ls3489318plr.1.gmail; Mon, 02 May 2022
 12:37:57 -0700 (PDT)
X-Received: by 2002:a17:902:f789:b0:156:5f56:ddff with SMTP id q9-20020a170902f78900b001565f56ddffmr13492877pln.116.1651520276992;
        Mon, 02 May 2022 12:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651520276; cv=none;
        d=google.com; s=arc-20160816;
        b=EnPx57M3v4P7eZo3VQNIprfhTFKIl9opkkbFFvw+d9o7w5Kl/hhUz4K8U1GeXhUr5q
         gGkE5H0r9iyPC3DNLa+GUqRnJBXsyH23ppB3v1ALyN/0hdSSPzNNgPm0HKeNXl7iKzxY
         EZ+kjebEr3lO6x8gHmzdzcG9hpd9/hCdwN+MREVSb8kSs/AhtqJJf8ec3l9yRxNhnaXB
         v7R5ZLPH9YHAAYMPv/+sq7/XzsbI80R+X2cewiZjkLYxcnZv/MjDTeOeOeSFdvj8MIZv
         Wd6tr0c9zbLnGBnDJt1qflRrWWBnSpdec4ms+fT7PytkBdkv6H7RnhjRjrwbM9AFdqei
         FTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OCxOdAmginhqA5+KHjx4cOrKBAf77+j0Hp1VQDyAIDM=;
        b=vaJMnDUSVzgETgLjuQL0j45LFuomvt2k9OpQyqLfFNll2avfs+D2uszD1jbiScH9Oh
         VHPgZyXDgsykVlVs76WtCIewc0ncdb0u+y7p9bJQDH6CQNF+JosvSd7deoA234pPOcXI
         fT7JBIwzJPTOPnCz+wlICOJ7R5Vhbdo4z7qnIlECVmLUhpq8JGG7eUQg+8EbpKrMercI
         5DXHdTJQnOYxrRunSO7YzsvvZvA3sCjoPidD7zHSKSiz/wN9KkFr4/DwiZda8Hh9gRs3
         LxpD+HMRw1Hj3EMG3ZUvp7tvWmKy9ivsyshYqd84twQgGBX8WdMzZNKmk/ESxLDWaTLC
         LV/Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gKCYeMYC;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com. [2607:f8b0:4864:20::b30])
        by gmr-mx.google.com with ESMTPS id be6-20020a170902aa0600b001584be476c2si1012502plb.9.2022.05.02.12.37.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 12:37:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) client-ip=2607:f8b0:4864:20::b30;
Received: by mail-yb1-xb30.google.com with SMTP id y76so27811781ybe.1
        for <jailhouse-dev@googlegroups.com>; Mon, 02 May 2022 12:37:56 -0700 (PDT)
X-Received: by 2002:a25:2a52:0:b0:648:f7b4:7cb8 with SMTP id
 q79-20020a252a52000000b00648f7b47cb8mr10739483ybq.431.1651520276271; Mon, 02
 May 2022 12:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <400480ed-70db-467a-b47d-b4c3f3641777n@googlegroups.com> <b7c5f1aa-e91c-3a9b-b74c-2255184d66a5@siemens.com>
In-Reply-To: <b7c5f1aa-e91c-3a9b-b74c-2255184d66a5@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 May 2022 20:37:29 +0100
Message-ID: <CA+V-a8vGiT237W59_OMqxLuFSAsPYYVCGZW3mn5vaGnUhDCK+Q@mail.gmail.com>
Subject: Re: Linux and u-boot requirements
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, 
	Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=gKCYeMYC;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

Hi Jan,

On Mon, May 2, 2022 at 5:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 27.04.22 15:19, Prabhakar Lad wrote:
> > Hi All,
> >
> > I recently tried to build the v0.12 tag with the upstream kernel
> > (v5.18-rc4) for emconrzg1h, but the build failed due to api changes
> > (cpu_up/cpu_down mainly).
>
> You want to use master or even next for very recent kernels. I haven't
> done a release in a too-long-while, so patches to account for kernel
> changes can only be found there.
>
I see. I came across the linux [0] tree which has
jailhouse-enabling/x.x branches. Is this a good starting point for
Linux? These branches merge Linux releases into the jailhouse kernel
which makes it a bit difficult to track the changes specifically made
to jailhouse. For example, for the 4.19 branch it's currently on
v4.19.81 whereas I plan to work on 4.19.198 which makes porting things
a bit difficult.

> >
> > So I wanted to check what are the strict requirements for Linux and
> > u-boot as I plan to add new arm64 platform.
> >
> > Also is there any document/link that I can refer to porting on new platform?
>
> No written documents, but if you follow the commit history of
> https://github.com/siemens/jailhouse-images you can see how new targets
> were hooked up there (mostly Jailhouse-unrelated integration work).
> Jailhouse also does not depend on U-Boot, first of all only a working
> Linux / firmware integration, ideally from upstream.
>
I see the tf-a and u-boot do point to upstream with some tiny patches.
For example, for xilinx SDEI is enabled in TF-A. Is this required?
(I'm still reading through the docs so this nooby question!)

> Which SoC are you targeting?
>
My plan is to start with the Renesas RZ/V2L SoC (cortex a55 with
gic-v3), but will soon switch over to the Renesas RZ/G2M SoC (cortex
a57 with gic-400).

[0] https://github.com/siemens/linux

Cheers,
Prabhakar


> Jan
>
> --
> Siemens AG, Technology
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8vGiT237W59_OMqxLuFSAsPYYVCGZW3mn5vaGnUhDCK%2BQ%40mail.gmail.com.
