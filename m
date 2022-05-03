Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBQ7PYWJQMGQEJAXUH5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43b.google.com (mail-pf1-x43b.google.com [IPv6:2607:f8b0:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ED8518C86
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 May 2022 20:43:17 +0200 (CEST)
Received: by mail-pf1-x43b.google.com with SMTP id 67-20020a621846000000b0050d22f49732sf9830425pfy.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 May 2022 11:43:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651603395; cv=pass;
        d=google.com; s=arc-20160816;
        b=tIeOCykq6rR+aDrR+WyquUyp0ij96AAqhonZpUS5Jkp1THgMQxmqap0NC9ggjshsrH
         QSQnnqUh7mHzmfcK9hLBXA+8zO+osHEltZ8QN1uZLUAIiNpX+IFFx77LS4qpEA7FrvLK
         B+ioCY+xnfpw/aueozkC36tpXxC2QjS437WrfMbPJWfZBEwJt0aH6Y7AZyw/3s3uwAjz
         Y0u1Z8FsJmS3JLo4YFxi9YZuHJSYdTDamOC9CQSghWXZ3OXqM/gZrRkICiM1g+KHwT3P
         DQF80OA+o9DBko938qj72zeQPHEUlH3n5hWDj7sPE3yZodCHgJBQmyEdat7ImJqmwuZz
         40MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=uur6alCHUVNi089V01IsAS/DLYw/ueFpM3Ke29Pmya0=;
        b=fcRpidlBkaJ1LWmBO1t02ve4d3UVl8Bie5oG92fDFB7YhmPzJpO3DtgcE77OH1R+0D
         N6dMZHhKTEXId/0VVS31jUvhxU/72G2AfctGRE76x595aRpPkQLBvulyZ2b+Qqi4qQMc
         bAtY1fFTfBxKZhI5wQIcpMNkp5qVy0uo/GJ98H4g725Qo/vBBUPz36l+ACByJRSiAT+K
         +J/4TZP7U+WoIH9XsTOVoYwlkwEwK991aM6eKljMpg/WjluIdGJIAae7Rgdg+kN+PAxv
         LMc18WFTsHmzE5/3m3Cf5xbXGntW4TrJrTMpy9df+7gcvZBa7UbmL9DoLQvaY+Q9xBVd
         xXvw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q3nK8GYT;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uur6alCHUVNi089V01IsAS/DLYw/ueFpM3Ke29Pmya0=;
        b=qAf7D+r1TsxT78/NQ1NCqmIsaa/j1yHvNDaHNgC7GiCC0CmImW5+ERtfdqQ2D+34in
         nbNSctP4V+CORoDQrYJGHwtkEzT7Iz1ypmuHXyBYRcVEAQNBsjayuk5hK+2aDSJJRkK+
         zhSLZuNYIJOhEEmiv7LvVlLmViiPrhkXoiUYSo0pA0ZcZfwC/0siBr8CSmvLLCe+TEym
         QTjdT/Wkw6w8hFj6PwbOpc6opLj9vJLhHpLX8xj27FBhHf8xvnyagBpIByunwKqaO4XB
         s02OxZtjRSFdFx/sXCNM1/QhQmHgp9wm/dQYOus9Q6J3l60B/p51ZGDqsrjQaFN4zR/s
         kRww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uur6alCHUVNi089V01IsAS/DLYw/ueFpM3Ke29Pmya0=;
        b=glU7WDC77zx35PKYl8FEwMR36ua0if+ArDoUteByO4z1TBviBpq+O4u6dEAF3ouFCd
         FVlFivR3gAV3kSGezKcvm16BE4StwEQ+Y4AjgnYFNtHjqN8tvQvXZb/Y0is8w2wx1m0z
         AbOzGpwK1J+IWk66O1HozBTd7bGhpk7FN1k7dGMvy/XaXL2YIyCD7dpud8qs5iW6IY1N
         F0GKihT2NFZ/hxOBbb8phVy+LiLs+wTo/4VDiro2zPuKcmCI7KGDAOzOg45YL0hwkG9t
         MZr0DAfvdGWE7BmL/EHngiFBlqNuZ8Q8d/NRv8bf9n3VFij7fiB23ewPdDq1zPxBEOG5
         a6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uur6alCHUVNi089V01IsAS/DLYw/ueFpM3Ke29Pmya0=;
        b=PcX2lm9UDPbbvuayQM77eVuFEnxww0E6gqpHeBFe1Ck69LjkJGMd63e9QiSbqBChGB
         nqMbwkrSqhNQ3XiGzHJfmX6LXJi+ul6IbTYeoJvIC93454wXMVTyHfhJOGlTmCQkk4/x
         ZienKzsRDcqyJa8pIEd44IYWBeqPynOF3ngzn9clB+Gew+1KHdR35iftXbvKOTS9rGar
         t544KsqF9UGVYdx/fUgoWdKmq/ON6ZBHF8uXlUlBvSgCOBFQUnlb/od0ZHDDvnEhukS1
         h1wNFeqg8ipu2MgLt0mo0HRw698pcY0n0zTMGcxDMtpLHfcMirLCwL2Dykc4LVHI0CIr
         fmjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5307pWgmarWSCN0YNzineh+/quIBv1Tq9qlKoR/eDjScXV+E32xu
	eRdZJbP1m5urJ2JQvTX5bP0=
X-Google-Smtp-Source: ABdhPJw5UnfUr1L+y5xIiTtIsuxEhHwn198A9i/3xWkmBN+Z15I1hmfa8VIsUqlcqu2JcUd/GgHwMg==
X-Received: by 2002:a63:90c1:0:b0:3ab:e31:e298 with SMTP id a184-20020a6390c1000000b003ab0e31e298mr14430243pge.395.1651603395610;
        Tue, 03 May 2022 11:43:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:3a92:b0:1dc:5f94:3fd6 with SMTP id
 om18-20020a17090b3a9200b001dc5f943fd6ls2380577pjb.1.canary-gmail; Tue, 03 May
 2022 11:43:14 -0700 (PDT)
X-Received: by 2002:a17:903:32c7:b0:15e:8d43:53c1 with SMTP id i7-20020a17090332c700b0015e8d4353c1mr17209743plr.168.1651603394444;
        Tue, 03 May 2022 11:43:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651603394; cv=none;
        d=google.com; s=arc-20160816;
        b=XjTiC5MQDtNg8b9P5JJPZSWfFk/Bsy6vDGru/Ji2DsJVKwbkt8Ij7OKcw3FkUQnL01
         Tzu6sfyevoELTZV4BD+f+B7QRONmBolVquc3B1cztxtnjre5t5MZBEbMbBEvuSPr5bNo
         pyC/ae1eRubTxH596Sja1LnJ+kAgt4hqGimKLPW0ZcdQGcYke7R55DW9lpNin4fjhR0s
         Gtd/aSbeGVRRnyYh+9ha2oT7mZYzj91XnaJrEu0t1TfxDuXx40oLX09j9dQpwoq2Dlpl
         fu9pho5rJxf/MvuklUZl4Ww4HL+eXLnoi9y1XRjekerE0Gfwgf1IF19/bW711NdZB06H
         pDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mV27V8HoBMOtrmZt79pK0XbMzYFk9mzpAtX3Oh29t3E=;
        b=obBP8jCPRe623Se5frmWWddZZY0i8aJWYUifKj7odc5ecPtjNopvje10NqBO/OKP1Y
         ZM7ZO+HZ2vLXO5ZupnghZJqhSEPvFA72DIH1R53FdcNK/u5URKF2oETNOr/zsJncDdyE
         xI7T9TF9gL4MlB8UnbOVp8IGGr718HeDkC3owID31DYrTXXJqyixZE1To7MBOLPwntV0
         y1rNNs3ROu8cvBwSpluAifrZLTaK/uyqGkcvBPUhBox+pUugIUO3sR6MAIcra8j9wOJo
         ger/pSF7kH+10ReqhNl8FnqWpdojiAKZ9zveX77hmebO+p1qyhP5gBVXrS9UnCmND6Y0
         Ookg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q3nK8GYT;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com. [2607:f8b0:4864:20::1133])
        by gmr-mx.google.com with ESMTPS id i22-20020a17090acf9600b001c69d267568si211165pju.0.2022.05.03.11.43.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 11:43:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) client-ip=2607:f8b0:4864:20::1133;
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f7d7e3b5bfso189756417b3.5
        for <jailhouse-dev@googlegroups.com>; Tue, 03 May 2022 11:43:14 -0700 (PDT)
X-Received: by 2002:a0d:dd16:0:b0:2f4:dc1e:e0d8 with SMTP id
 g22-20020a0ddd16000000b002f4dc1ee0d8mr16805223ywe.413.1651603394073; Tue, 03
 May 2022 11:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <400480ed-70db-467a-b47d-b4c3f3641777n@googlegroups.com>
 <b7c5f1aa-e91c-3a9b-b74c-2255184d66a5@siemens.com> <CA+V-a8vGiT237W59_OMqxLuFSAsPYYVCGZW3mn5vaGnUhDCK+Q@mail.gmail.com>
 <aebdee8e-4074-b223-2cbe-42564624e7f6@siemens.com> <CA+V-a8vpx00x21N12bRQ9eGPHH3TnWr96HmxUPpJUgtHyMy-LA@mail.gmail.com>
In-Reply-To: <CA+V-a8vpx00x21N12bRQ9eGPHH3TnWr96HmxUPpJUgtHyMy-LA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 3 May 2022 19:42:47 +0100
Message-ID: <CA+V-a8u0bPPZBk49twr9xuLNCPKV8isdSGTt+Pj6mYV=Dkh2OA@mail.gmail.com>
Subject: Re: Linux and u-boot requirements
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, 
	Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=Q3nK8GYT;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Tue, May 3, 2022 at 11:47 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Jan,
>
> On Mon, May 2, 2022 at 9:30 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >
> > Hi Prabhakar, hi Chris,
> >
> > ok, now I understand your question last Thursday, Chris... ;)
> >
> > On 02.05.22 21:37, Lad, Prabhakar wrote:
> > > Hi Jan,
> > >
> > > On Mon, May 2, 2022 at 5:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> > >>
> > >> On 27.04.22 15:19, Prabhakar Lad wrote:
> > >>> Hi All,
> > >>>
> > >>> I recently tried to build the v0.12 tag with the upstream kernel
> > >>> (v5.18-rc4) for emconrzg1h, but the build failed due to api changes
> > >>> (cpu_up/cpu_down mainly).
> > >>
> > >> You want to use master or even next for very recent kernels. I haven't
> > >> done a release in a too-long-while, so patches to account for kernel
> > >> changes can only be found there.
> > >>
> > > I see. I came across the linux [0] tree which has
> > > jailhouse-enabling/x.x branches. Is this a good starting point for
> > > Linux? These branches merge Linux releases into the jailhouse kernel
> > > which makes it a bit difficult to track the changes specifically made
> > > to jailhouse. For example, for the 4.19 branch it's currently on
> > > v4.19.81 whereas I plan to work on 4.19.198 which makes porting things
> > > a bit difficult.
> >
> > Not at all:
> >
> > git log --no-merges --oneline v4.19.81..jailhouse-enabling/4.19
> >
> Thanks for the hint.
>
> > The 4.19 branch was retired a while ago, so rebasing over latest stable
> > or merging that in would definitely be recommended. Actually, you likely
> > want to check the latest enabling branch or [1] for updates since 4.19
> > was retired.
> >
> Great, I'll start with the latest enabling branch which you pointed to
> and use it with the v0.12 release (I'll have to port my platform to
> this though). And then later I consider either 5.10/4.19 kernel.
>
> > >
> > >>>
> > >>> So I wanted to check what are the strict requirements for Linux and
> > >>> u-boot as I plan to add new arm64 platform.
> > >>>
> > >>> Also is there any document/link that I can refer to porting on new platform?
> > >>
> > >> No written documents, but if you follow the commit history of
> > >> https://github.com/siemens/jailhouse-images you can see how new targets
> > >> were hooked up there (mostly Jailhouse-unrelated integration work).
> > >> Jailhouse also does not depend on U-Boot, first of all only a working
> > >> Linux / firmware integration, ideally from upstream.
> > >>
I followed the jailhouse-images repo with the master branch and
started with Linux first. For Linux it uses the
jailhouse-enabling/5.10 branch [1] (commit id:
eb6927f7eea77f823b96c0c22ad9d4a2d7ffdfce). In this kernel version the
cpu_up/down api are static [2] due to which the build of jailhouse
0.12 is failing ( I tried to build for zynq platform just wanted to
make sure build passes before porting my platform)

I looked at the kernel recipe and there aren't any patches which
exports cpu_up/down api and nor do I see any patch in
jailhouse_0.12.bb [3] which drops cpu_up/down api. Is there anything
I'm missing here?

[0] https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linux/linux-jailhouse_5.10.inc#L17
[1] https://github.com/siemens/linux/tree/jailhouse-enabling/5.10
[2] https://github.com/siemens/linux/blob/jailhouse-enabling/5.10/kernel/cpu.c#L1253
[3] https://github.com/siemens/jailhouse-images/blob/master/recipes-jailhouse/jailhouse/jailhouse_0.12.bb


Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8u0bPPZBk49twr9xuLNCPKV8isdSGTt%2BPj6mYV%3DDkh2OA%40mail.gmail.com.
