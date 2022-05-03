Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBWEQYSJQMGQERCKJLHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E73C518288
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 May 2022 12:47:54 +0200 (CEST)
Received: by mail-qv1-xf3f.google.com with SMTP id t15-20020ad45bcf000000b0045a8cfef66bsf3627367qvt.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 May 2022 03:47:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651574873; cv=pass;
        d=google.com; s=arc-20160816;
        b=s8hCWkn1z7OtOF+q/uRCP4z2Bc2jcfUCKANXOHfnBlIIQdrZik0QEjIKfnN6pwuvI5
         8g9nIw9tLdzR9pYPqRfLpevomcObQrqnKau5jgGqsCOU5qoPMaSZ1TBR69Sktp610sIR
         5LWx9qV3Y0/m84kTcTKadVJWbhWm+rd2qma5HfLigm8XqBA9jX8hnSnnXxj9bg8ZpSRM
         2z/TlD+iZP/9/CJ2z9stfYr3q7HEc3u6fQal8v2cbM1yUEthsoLqB9YUZCVfdLRQOyx/
         iMhyuFLr+xyXxMA6Eh8ZTx7TC/oSXvjJNPMnepb03GZtxECFgFns2hFLuhrZ32/szI3W
         t8WA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=r/FWiFWZ1t5Ix3ufQxJcd65ZOAL4EhQBPJqWtXGBAVU=;
        b=V/dDd3yeRJhoAR/CCPxwnMQXbcqbETMvzvF4kMktEf01YNHAI537YAlnTdaYHtZtiT
         RwBzERRWdtgtjMA+byyWpE4X1O23mBGhaC06rMZl+BLIbz5YjHK+3Y7JQtmRsJbJnrSX
         1EOVu9MN3zRY+wZ+erd5C7wnfbY5BQgKcN/xrF5iG5fpZqM39ZIGJxKSX9pA9KXGVgko
         hm+ZsizaZG/ALOylQcrWJV1z/tMYfUjkO7oAceCmBtgol0TtvqoCRtW96OxBUcxGhVhi
         +kG/3qL67pf68p8CQ0XNQKakAX5k26BBso+jzcLJs+L6l4Cu5P9ldE59wgai90wvVYbv
         0cEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=qmPQkz7u;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r/FWiFWZ1t5Ix3ufQxJcd65ZOAL4EhQBPJqWtXGBAVU=;
        b=KzmuCQ3b7T1hkaO3TZCgVC1QZsneY6pMfkUJNdEL7mRY6R/TQKGoyVi2ILLGh53lQT
         eHjG6NvrDE+Xx2pW+ZVXYOyCY6NhcSmUGyBrWKAWdFozUAI/qKpg35c10Dw2ldHk5WKd
         tZUi3Fkyna5gR/GPYvUjbDT9GSApiF99Kfp6RG+CeyUBWVxerIApWIFBc2bd9PxF/qvw
         zpHFslkGTCF+IZwGRG3UUflLL3sJeEbO6uOANPaZjaSdQwB1sNvopNQ2eyKzATawiTB1
         xZb9+UFUQLKIm/mNThUCldYR80clHfrJZarCD6dYe3d2TGhF4CIHRFwu8lpARH0OFmNv
         GKpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r/FWiFWZ1t5Ix3ufQxJcd65ZOAL4EhQBPJqWtXGBAVU=;
        b=IK7s0DZiKi5Ue7LeHHJ64YLIYuVOWoYTs5s5NgU+N2jn9G9GFCbG8fF8gFBgmKjKoX
         rxQ/E95JEerLjVcaT5DXfG/Br815o0zHuWKTHdxXrVlxtkCPbooZjKLUEFgdHTP976sc
         RXn09moc1shDkn9CwXDrLMdCj2K+Ss3cDqWNGs0NiDovYLMlvnfphUjVCvV6TaLWM4QI
         V450U/sj+evEl5qPNy26tsesVUX9qOlwAgbOszIf5dyLpCLaF0DmCeZ4QrraM6q9gw28
         70zyQxvRzSnd6EP26Ejd0MG5H5wxNuo8lIP9wVKz0ybKcVfUVhYSviZbRwRtgPzTc1ia
         xs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r/FWiFWZ1t5Ix3ufQxJcd65ZOAL4EhQBPJqWtXGBAVU=;
        b=D5MC9B3m4Pqop4h/f+2Llzcrv3R0rGWobKh+l1I8LA083+9C8TcSmIlY7rcJSuCeli
         vsfJ5Erbz2avZ9KNqs32ysWf7R0QSvwiPScTvvCMliEP2GrFmp0VVjSg1uc4j4LIyKbX
         ywlFr6HupzVwnIW1gfk6Vp+KECbqcfz6ls2bCHK7FQTg6zzBr5iZgEtQ6aL2fnox4tmQ
         i41JbUqYnEyVRZ9rkWZMMi1LNhNxcDlWnWuwetE1KR3HxWGdxgwjJcEOMX0fRGwD2RZF
         Sl6jp4AmV3CgIXUV5t99cI6imwkXEPic+51YyVYvC2D3JVovqHX6rsnaKg1VfwtOIExk
         ay5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530T4vc60ctKqBhXuwqOcBf3M4pqRCQIaUFDVCEzhh6zsfjfWgz6
	V+YsOBST/WcBMr2buuuU1j0=
X-Google-Smtp-Source: ABdhPJx/j83dQxnGOP6Ks0pCj9D58M6IO6UVBmYS8mDfVLMUyLUeUk8S2Tgkq/Qha7Al8xdBxtVcng==
X-Received: by 2002:ac8:5f0d:0:b0:2f3:b0d6:fb6f with SMTP id x13-20020ac85f0d000000b002f3b0d6fb6fmr833832qta.663.1651574873322;
        Tue, 03 May 2022 03:47:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5f88:0:b0:2f3:5d51:931c with SMTP id j8-20020ac85f88000000b002f35d51931cls7998176qta.7.gmail;
 Tue, 03 May 2022 03:47:52 -0700 (PDT)
X-Received: by 2002:ac8:7dc6:0:b0:2f3:8256:1e3a with SMTP id c6-20020ac87dc6000000b002f382561e3amr14001781qte.220.1651574872417;
        Tue, 03 May 2022 03:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651574872; cv=none;
        d=google.com; s=arc-20160816;
        b=gv/ek8NIqaPA6aCIeBpEkTq3tp6AArqU4aWVb6s1OZxuhq8mHesc52Q0jDbeCRwdvg
         D+v3GDzmWkempSRM7uCe3E12jWAqBDUDD7nYj3kde1aF8PEjArsh3VbRIWoiQhc+j6L2
         rLwuY+ml2eiQm3DwH0e2Zek5HYD9xmRF+OnuWHnpKWJATECB3DfsAzqaBKnbOLP1JjQa
         EC1qxh9FrnF6nI9V8jnI7aNIafC83AZ4jy75zv55C+PWNAchOt9XIfSrHHdt6Geghv7+
         R7d0CIYUoyOUDSJ+z59tURTMUB8PH7T2AhgLlSSmejZ00dsS7LaDr7iHFlcpQHWRHOfx
         7yWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qmItWkQj19KCcki8+4dSBnf+2JA7F5fOfVtalaQ+OLg=;
        b=SO8ReikHSoxW9N03l6YMiBBzolW5+V5QVCrhrImKm/Hy+2TcPPmPWtjc8ehTrx/TQA
         lFkk2MvulLpWlhB50eF1wD5IiQF+/sesWIgG4PaVemGkT8L77L9kH3+SFlRVIGE0VWA+
         Mx1dvMyg7ZfGXbUgYrwgYQligW04VB0iGJvtFKrXOR/+w/PNngmy1qf23xwSoC+eaU81
         S4YWHHVsC2oiLPVwktOcqNJRN2HFKVDie6NY/BP2dtAvYwHjag0g2izm54uKuuCEFpVP
         yl4/VXBmSjjxwdowEuswBqiGiasGkKaXU0gbd0c4zw/TOTPN2UxMB9f0sw9N4bE20VOW
         8SNg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=qmPQkz7u;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com. [2607:f8b0:4864:20::1132])
        by gmr-mx.google.com with ESMTPS id z17-20020ac875d1000000b002f395f5e724si775625qtq.0.2022.05.03.03.47.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 03:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) client-ip=2607:f8b0:4864:20::1132;
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2f7bb893309so174773547b3.12
        for <jailhouse-dev@googlegroups.com>; Tue, 03 May 2022 03:47:52 -0700 (PDT)
X-Received: by 2002:a0d:dd16:0:b0:2f4:dc1e:e0d8 with SMTP id
 g22-20020a0ddd16000000b002f4dc1ee0d8mr14951467ywe.413.1651574872125; Tue, 03
 May 2022 03:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <400480ed-70db-467a-b47d-b4c3f3641777n@googlegroups.com>
 <b7c5f1aa-e91c-3a9b-b74c-2255184d66a5@siemens.com> <CA+V-a8vGiT237W59_OMqxLuFSAsPYYVCGZW3mn5vaGnUhDCK+Q@mail.gmail.com>
 <aebdee8e-4074-b223-2cbe-42564624e7f6@siemens.com>
In-Reply-To: <aebdee8e-4074-b223-2cbe-42564624e7f6@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 3 May 2022 11:47:25 +0100
Message-ID: <CA+V-a8vpx00x21N12bRQ9eGPHH3TnWr96HmxUPpJUgtHyMy-LA@mail.gmail.com>
Subject: Re: Linux and u-boot requirements
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, 
	Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=qmPQkz7u;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Mon, May 2, 2022 at 9:30 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> Hi Prabhakar, hi Chris,
>
> ok, now I understand your question last Thursday, Chris... ;)
>
> On 02.05.22 21:37, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Mon, May 2, 2022 at 5:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 27.04.22 15:19, Prabhakar Lad wrote:
> >>> Hi All,
> >>>
> >>> I recently tried to build the v0.12 tag with the upstream kernel
> >>> (v5.18-rc4) for emconrzg1h, but the build failed due to api changes
> >>> (cpu_up/cpu_down mainly).
> >>
> >> You want to use master or even next for very recent kernels. I haven't
> >> done a release in a too-long-while, so patches to account for kernel
> >> changes can only be found there.
> >>
> > I see. I came across the linux [0] tree which has
> > jailhouse-enabling/x.x branches. Is this a good starting point for
> > Linux? These branches merge Linux releases into the jailhouse kernel
> > which makes it a bit difficult to track the changes specifically made
> > to jailhouse. For example, for the 4.19 branch it's currently on
> > v4.19.81 whereas I plan to work on 4.19.198 which makes porting things
> > a bit difficult.
>
> Not at all:
>
> git log --no-merges --oneline v4.19.81..jailhouse-enabling/4.19
>
Thanks for the hint.

> The 4.19 branch was retired a while ago, so rebasing over latest stable
> or merging that in would definitely be recommended. Actually, you likely
> want to check the latest enabling branch or [1] for updates since 4.19
> was retired.
>
Great, I'll start with the latest enabling branch which you pointed to
and use it with the v0.12 release (I'll have to port my platform to
this though). And then later I consider either 5.10/4.19 kernel.

> >
> >>>
> >>> So I wanted to check what are the strict requirements for Linux and
> >>> u-boot as I plan to add new arm64 platform.
> >>>
> >>> Also is there any document/link that I can refer to porting on new platform?
> >>
> >> No written documents, but if you follow the commit history of
> >> https://github.com/siemens/jailhouse-images you can see how new targets
> >> were hooked up there (mostly Jailhouse-unrelated integration work).
> >> Jailhouse also does not depend on U-Boot, first of all only a working
> >> Linux / firmware integration, ideally from upstream.
> >>
> > I see the tf-a and u-boot do point to upstream with some tiny patches.
> > For example, for xilinx SDEI is enabled in TF-A. Is this required?
> > (I'm still reading through the docs so this nooby question!)
>
> SDEI is an optimization for interrupt delivery. Not needed, just faster.
>
Aha, maybe I can revisit this later.

> >
> >> Which SoC are you targeting?
> >>
> > My plan is to start with the Renesas RZ/V2L SoC (cortex a55 with
> > gic-v3), but will soon switch over to the Renesas RZ/G2M SoC (cortex
> > a57 with gic-400).
> >
>
> I see.
>
> The key steps in enabling will be
>  - getting the patches applied to a tree that supports your board
>  - writing a simple config (there is no "config create" on ARM, but you
>    can more easily start with passing everything through)
>  - jailhhouse config check
>  - debugging remaining violations when starting Jailhouse
>  - writing/adjusting non-root cell configs (for the pattern of recent
>    enablings)
>
Thanks for the detailed steps.

Cheers,
Prabhakar

> Jan
>
> [1]
> https://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse
>
> --
> Siemens AG, Technology
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8vpx00x21N12bRQ9eGPHH3TnWr96HmxUPpJUgtHyMy-LA%40mail.gmail.com.
