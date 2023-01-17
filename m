Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBEMJTSPAMGQEBURBBWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x1139.google.com (mail-yw1-x1139.google.com [IPv6:2607:f8b0:4864:20::1139])
	by mail.lfdr.de (Postfix) with ESMTPS id D14A766E7B0
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Jan 2023 21:26:58 +0100 (CET)
Received: by mail-yw1-x1139.google.com with SMTP id 00721157ae682-4c6bd2981d8sf300403917b3.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Jan 2023 12:26:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673987217; cv=pass;
        d=google.com; s=arc-20160816;
        b=D+YKsO43z27OBxHyOhKKI7rmcHXYmXm+FHHkg7V1MEKagQoIYQ9aY9B5c/M37AoV5U
         b2Uhfjf+HRIAD4irUgjqM+DKWDP6eDBjvmG1FVVRvymFRXmS947WKXa3H91JdWLtQ5Ul
         gugklb7RvsPSQpq52VtRzES/YJ/lDrR5Lenuogv5ZZoyrKtVN0rJevPfBvfYmphQEKss
         TP98kw1TMVJnvvbsYw9Wq5hC//P051jmBASk9ZbqInaQ6f5zYm657JSKi1iNm21gof7j
         2O6MSLkmEMugcCeIXLYkwpYibTKjyciGPmkBKHxUW1ON3I3hTw8yCmZsUGWlpY0LZ9Ab
         xf+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=b9rFmvsEKFshctQjnZJtIyB6+x+YB2RykYqUKCM+n6Y=;
        b=L6ZWyzxmfc+riBKYQHkYmIbxRwyIDij8gttJ79/UPLhZeVEzXqA0s5oGD6AFqEGrm7
         +iO9ZI8Xvxna+wt25DZEF+I3aCEgNs5SZ8QCpOsms+/V7D7pupv1+UomhDW+en/l2j3R
         i/03mVEHqAjFGdCHPv9NuTtPDbY5+10N7vsxRTOLc9+ENeSSYgC651+K6vyroj7rQhL3
         THarjrUX1zq0KtLkhwOqpqOmIDshMiw/JyxmzLX8AKEvjjqaJgEFmdYxsIp9KRL632io
         k+xcSrjr2tGcEQ9Cb7+2fzcPWNrRoCdwUrfr9JScKtbjYAUTOxuVIFI+1XwKTjBf95ZS
         jCqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ewivZhi9;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2e as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9rFmvsEKFshctQjnZJtIyB6+x+YB2RykYqUKCM+n6Y=;
        b=ok44cl7Q/QoOzg5C74m0IcgAhD62uw/T0ZG8ANvMgwMNweAiH3qJ0QzxZlR1Z0xNWH
         z3130LceZoiueMB0jZtX2yoFURrNC9I+EmzApg02q2Jiz3T4x8ILX+nGyl9Bu9o328Wq
         0UHwbo/x7d5CLipGn87meErg6QsmmlfbgbTsQQrYbB8N2o6Z/e7TpjpuOsOl41GKafPq
         leKIYGHmJ31FbUicIwKeJrUSUgboB+oSDPoce5w78GwxDDheiSCc5n+W/VbBeg5OSmmm
         VVt8jxaFX3WH9qS4eGdLY/rEUtHH5ZGyPYZlUpbsi03fWG6cDbU0Bf5c2FlPTVZeJhlY
         yU0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b9rFmvsEKFshctQjnZJtIyB6+x+YB2RykYqUKCM+n6Y=;
        b=VQnujzFiqcW/g1k7Wge9DmT/7mI1mCQXge/bkZf/q08SdIzl0JI5BTNs8HiCg03USs
         E7QE4JueSMvUc8JB6qe0DWT4S0hJlEucBNkG0/n5s8dw6ytRTqHtQORQf4uKL77Z59Tg
         VsXnDSsiSONXnKzNsh1FhaYfZLIOAM8/adot/HzHI+xSa7LX2AbKYcdkDfDtDY47kJCL
         yM/6kT5g0JVYTc6gJqZpCJgoQ9rNl9WmCXELu6rQ/l/P/sh8PHO4ZCor3yHJnfu0iweL
         Dk6/b+0sS+vZhZvjOHElyVfeN6+gIS8NGPlUw0KEaIfmmW+bEW88W+2aSSex2Ef30ihF
         kF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9rFmvsEKFshctQjnZJtIyB6+x+YB2RykYqUKCM+n6Y=;
        b=0nbbRl6ERhgKzzaIVPgC9Zfge4b/Re1XjMwcIr5iBGS8/zExnDBphCg50k4SCS3igJ
         OV/RiKjTvv/HPrM5wvUtWP16YanZ0j4/+rJaEiB7/vThZu0uMTVjE8xOF8sqkPI5hVT/
         ADr0WFoDE4d3lnCzE8zaDCd+uLbhL318sBhhktrPKapbviIOiYzkQZU0bfmrUST4MM+7
         8Reo+UQQKgzGy4XzGtcdec4hsdRjrmq81j/Guv9QoRXmIYUBPKdK3WKhCzkFeS0Kzt2q
         XPbzXbP9koPgXJ4Xvo3MqFrT7d96RMeJadjhe6891VQeENm/j1v0+iOOHKshUxVjKxBH
         JZ+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koVk6VDFdJr7bg23tymXfYYo/mpjC8jhDxsCDjQTTZ2tlrh35mi
	ferEiBB1lCQLTaxozNiARck=
X-Google-Smtp-Source: AMrXdXsFN2apgKIOSu4lNEzbaIflYhcckwztQ94HIt+LCdUPE3jrA1liUjAtl0nNClu6gDa1hJNKxA==
X-Received: by 2002:a0d:fa85:0:b0:3e5:4d1a:e506 with SMTP id k127-20020a0dfa85000000b003e54d1ae506mr655099ywf.299.1673987217596;
        Tue, 17 Jan 2023 12:26:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:c5c3:0:b0:7dd:f5d0:e6ff with SMTP id v186-20020a25c5c3000000b007ddf5d0e6ffls4727785ybe.7.-pod-prod-gmail;
 Tue, 17 Jan 2023 12:26:56 -0800 (PST)
X-Received: by 2002:a25:b7cc:0:b0:7b0:7586:7ee9 with SMTP id u12-20020a25b7cc000000b007b075867ee9mr4233209ybj.3.1673987216686;
        Tue, 17 Jan 2023 12:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673987216; cv=none;
        d=google.com; s=arc-20160816;
        b=HJBgsv5tuTs6cL0LVCNuoBT5QCAOR5UKzAIXgnQ45xPO5oEhMclK38IkroK+fUHBVL
         OWCEjcTsAk/6bhVo7081yIaHrLyG9MdHmKXmE/DS1Uc2OCxqu2zpoqWzhTIFMz3tV/95
         uC94GqHcYdEjMAdfSHwrl0qCQjitbxmfzXw81iFHr27psiJeH05T4aCofDCZYTILaU5l
         U/kPvwVmPJcIW+ZpWDGMC844uDMf8IFdBZYv7ERW0QOYkbFY8RU6Ndl+MocYI5JWUVQ3
         oclv3JY2k7JZfqIvYJnbqdJBg/DwluQ1qmxPkJTBFxUPqhNMuosHb6V21koBCAPymJ6d
         Nu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pwswqx7WKUjhMiheOt4uqcQHCZurGcJpmRQbw6yBhbk=;
        b=cFcgtY0XwvyG6CBPkxGQdKMekQswNQBi2Vq0KuEanTwwIe8NmZeZUgnODV1F+lVlVK
         1icLY9p/FG1uBoC04MLDwAFbJ387sLWKwzSn8lLAVjJq7FvK7+1vXbVzg+eed0clnWkY
         pVRKckYUkAuI/QnCTkRoAqLvwltL/Y9JsGz/2M1DKNTUoRPtnhD61llJTHMP71awQpwY
         BO4I3xDGCBL7/XdlKQoKT+LbBm18FdIPgo8ryokoNoRn1YuKeMncy3N3Xjq5/fZltlJ0
         2DAC30SFVduFJRlsK8Fkc1aRZ8r4uQH7vTXUiveQwFoLzndsoeyJvLqT9WwVwUA+KbFJ
         cKsQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=ewivZhi9;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2e as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com. [2607:f8b0:4864:20::b2e])
        by gmr-mx.google.com with ESMTPS id c2-20020a25b442000000b007b62d9cf791si3357760ybg.2.2023.01.17.12.26.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:26:56 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2e as permitted sender) client-ip=2607:f8b0:4864:20::b2e;
Received: by mail-yb1-xb2e.google.com with SMTP id a9so18887339ybb.3
        for <jailhouse-dev@googlegroups.com>; Tue, 17 Jan 2023 12:26:56 -0800 (PST)
X-Received: by 2002:a25:9291:0:b0:7c9:4b7e:79b3 with SMTP id
 y17-20020a259291000000b007c94b7e79b3mr628753ybl.535.1673987216410; Tue, 17
 Jan 2023 12:26:56 -0800 (PST)
MIME-Version: 1.0
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8uMPfCWMPxJ90AE=dzLSiEEk61Pn4Oxicpv_Sxd9hVhHg@mail.gmail.com>
 <a9e1e756-978a-f2de-c4cd-838f1417a8fc@siemens.com> <CA+V-a8u7x=JW1XE8xAcj_uH4EBw81mS8Lk3t6ZKf+ScgeiyO5w@mail.gmail.com>
 <c81bdfb1-055a-071f-8838-66b35173241b@siemens.com> <CA+V-a8vGTk42JrrN6_5N21i_mcUgsuzVc+v0wT1VQUaqmjcrEA@mail.gmail.com>
 <e26f0792-ec58-9edd-1bce-dcc8a6df0382@siemens.com> <CA+V-a8t3nrEiDV9b--ktgAKy3UVVUrg32N6O9gT=J6NRFdQyDA@mail.gmail.com>
In-Reply-To: <CA+V-a8t3nrEiDV9b--ktgAKy3UVVUrg32N6O9gT=J6NRFdQyDA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 17 Jan 2023 20:26:30 +0000
Message-ID: <CA+V-a8vf658EH67cL_-XYLL_7RU1r44wJdJgNp01FhRyV-P3Rw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/3] Add support for Renesas RZ/G2M
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, 
	Chris Paterson <chris.paterson2@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=ewivZhi9;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b2e as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Tue, Jan 17, 2023 at 7:14 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Jan,
>
> On Mon, Jan 16, 2023 at 5:26 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >
> <snip>
> > > I had couple of question,
> > > 1: For the pci_mmconfig_base should this PA? (If PA what range should
> > > be ideally selected and should this be reserved in the root cell?)
> >
> > If you have a emulated PCI host controller (which is the common case on
> > non-x86), this address should be free in the physical range of the target.
> >
> > > 2: How do we calculate vpci_irq_base?
> >
> > There have to be up to 4 unused (but GIC-wise supported) interrupts at
> > that base.
> >
> > > 3: When do we need to configure the stream_ids?
> >
> > Only if you configure an SMMU. Do you have one and plan to use is?
> >
> > > 4: For the IVSHMEM 00:00.0 (demo) the PA range should this be reserved
> > > in the root cell?
> >
> > The PA should be physical RAM that is otherwise not used by any cell or
> > the hypervisor itself.
> >
> > > 5: And similarly for IVSHMEM (networking) the PA range should this be
> > > reserved in the root cell?
> >
> Thanks for the pointer that did the trick. I am now able to ping from
> root/inmate and vice versa.
>
> * For the Linux (root/inmate) IVSHMEM what is the test case that needs
> to be run? (Ive done devmem read/write on root & inamte cell)

Ignore the below errors, I referred to the previous commits and had to
set the newly added ARCH flag.

> * I updated to the latest tip of next and now I am seeing below issue:
>   ** Previously "jailhouse config check -a arm64
> renesas-r8a774a1.cell" worked, now when I run "jailhouse config check
> renesas-r8a774a1.cell" I get the below output:
>         root@hihope-rzg2m:~# jailhouse config check renesas-r8a774a1.cell
>         Reading configuration set:
>          Architecture:  x86
>          Root cell:     Renesas HopeRun HiHope RZ/G2M (renesas-r8a774a1.cell)
>         Overlapping memory regions inside cell: None
>         Overlapping memory regions with hypervisor: None
>         Missing PCI MMCONFIG interceptions: None
>         Missing resource interceptions for architecture x86: None
>         ^^ Architecture detected here is x86 which isnt correct.
> * Previously  "jailhouse enable renesas-r8a774a1.cell" worked but
> after update I am getting below error:
>         jailhouse: Configuration architecture mismatch
>         JAILHOUSE_ENABLE: Invalid argumen
>
Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8vf658EH67cL_-XYLL_7RU1r44wJdJgNp01FhRyV-P3Rw%40mail.gmail.com.
