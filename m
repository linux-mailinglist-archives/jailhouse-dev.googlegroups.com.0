Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBGPGZWJQMGQEJEMD5QA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x640.google.com (mail-pl1-x640.google.com [IPv6:2607:f8b0:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id C41CA51B832
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 May 2022 08:47:55 +0200 (CEST)
Received: by mail-pl1-x640.google.com with SMTP id u8-20020a170903124800b0015195a5826csf1854844plh.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 May 2022 23:47:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1651733274; cv=pass;
        d=google.com; s=arc-20160816;
        b=VX6+g4TNaOxTEoJ+NWTH3txH8gFINoInCLfuwStjwcKKCTCidTCBsx8qqp1Cag0ZHU
         r7cQxNIAMq4YQ+OQnznr1Ol98BNsoqM4RJfakK63/lIQYD4I7XEFbHV6rCsHtZ367ZoZ
         fMkery3wUoAGhvsCwWyVXCddY8/f9QTMU0rUS3pqt90tu4dk9+SraF6yww2oLG4+SNo5
         L+u8eyeuZG95sOU9aVACHrU8bsnx1+TzOo0e7r8wbrQeNtAGZRfmgqCq31JI2dlg+Y3S
         F+43IPWwRVtAERNYhMTnyZu///KS1VGUWh3eN7Lj9Laj2mLX17C7pub758080sIsrNMe
         v7tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=JeIs95WFH3+gnGFm2V14XWq8SI90ltFWbnmuHCXSn7w=;
        b=IZSaRmJY1K2jURhjgdo4nUiRjmVtEhqkKacmr4RofqjW8y25asEceHMkDX5scWwA4g
         LyRLwgmHKyta1b+izYZ0o66SoGzccl3UpaS8zHH89lA9PfJtiE419Sqs7TEZxTQNZbsu
         AEXfXplCPAvc6Ulrb++T5kRqB8BaC8BspT6zYGeSAFVP4Ej7osHsi+Q3h0+8/jzp04eO
         Mt6wgdL2C79MMM9R8xqLaTDZn1Aq9myC2Ro/bWF+H4T7Y9kjjrCLPpzj79KtePYldgqk
         hME+9CHzVVcln0V/kKzHCF+rhJnexBzcZCACCrjjhRcoRS9r7oZQuFgRh9+pk82vnlRY
         k7WA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q0E1pALf;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b36 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JeIs95WFH3+gnGFm2V14XWq8SI90ltFWbnmuHCXSn7w=;
        b=Ba6FO8v3dUzOcYrePLGTCsY9Lh58bIBdUlrnvgdA5HqV8CDciWR3asr3l4W2AzBw71
         LnDR+yHJJNHsrnfGj2mou5pF/+bB8dyn0DYIRzrTAdfWCvS8DX6kARIA/j7pI/b1L/7n
         ZgXPA/9Z2RWtN+YakNu/Ktt6mjW/uXi7w23cKgvsZg+t1gjnNnBnqn2eYbgbTQZZOYG1
         xTIlOYMWti9ldsvsVOf9OM5fCVciTAoPNvqWEs8HnOJJRmeOMfDdQKaj/OQIY9pdAnNQ
         wu2iVtzYdRLQJ2+UpjyAd9L7vOOSqgVsXuXd/b+Nh/8zy/46FHnshNkq+uCYwGjv6rRS
         IJeQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JeIs95WFH3+gnGFm2V14XWq8SI90ltFWbnmuHCXSn7w=;
        b=fMB5Mx03q+5Ki13AB7sYsOBJXpR2NJMjlrgA/FnPkTW2jIpXc/c7QoP3vQOBjV2Pyz
         W3Lr63NNe9NDxm3I9Sci3UMgbeZiIpzbFBWvMqj5PKG5/kku9gzXDvGJMIBZ3vyUfNSJ
         psdf5COipsYdJma8s02amo9Dh5dB6c2tI1TTDqlA4QfT+51T/HEau5Uf6ZMiSlUEpbrI
         Utv8rfZ85qxT0TIWouOXVXFSd1ft4VF+R3xrs0f25xeo57HAn3spV8OP832sIbLSTwvd
         gv0lhkmGZcmGNLKVegcyUClecJJu6mAAq6yuOtNI4RjDaJAtzYeX/WM4a5o7482jXRG8
         NRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JeIs95WFH3+gnGFm2V14XWq8SI90ltFWbnmuHCXSn7w=;
        b=SGWxgoLHeGjFQo52VQZuf+drFi1PlvS9MeSMBWKeIO+bSk9tMPbUb6Fjn8Iqu2IBxA
         exz/vEArEfiWGeg81SoGFH65agFHcQeTf01AapJPksNPA9sb3jsDfzezJcE1g1+TuMiD
         rGD0hA60NR5//W7UaMmjP6kT2U/Azd6EJKkRVNA+ofbsoF6I9nI3xd8NGDedVS9ORhBp
         p1o4WLv87quXcXzFoq0lEOoO7N44N/s+3woIVqz8+4uH8lhcs5RRgWzSo7/op68184Rs
         x0G4UAeAzysNRHvkitGtbznPTfmobKMeiZw0C8QEVhKZbE9VCrnFeeUf7rvrpYogFycz
         0JDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WI1Xt/7y8KMFDbvogMSnm4DVG32TgeVSw2pRnDNiRjywiR1jh
	bp3igQCdF0DXvsPW9NxCRpI=
X-Google-Smtp-Source: ABdhPJyOwFnWwv/gVIrQzlehUmpZ4MyrxtrTWVaTf0LXofiTNd6SxshzcXpdTyO2gQxvf/7CXJppJg==
X-Received: by 2002:a17:90b:3884:b0:1dc:5838:1bea with SMTP id mu4-20020a17090b388400b001dc58381beamr4276876pjb.90.1651733274138;
        Wed, 04 May 2022 23:47:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:244:0:b0:382:b131:96eb with SMTP id 65-20020a630244000000b00382b13196ebls1506557pgc.3.gmail;
 Wed, 04 May 2022 23:47:53 -0700 (PDT)
X-Received: by 2002:a65:6556:0:b0:3c2:7f43:c116 with SMTP id a22-20020a656556000000b003c27f43c116mr9129653pgw.221.1651733272869;
        Wed, 04 May 2022 23:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651733272; cv=none;
        d=google.com; s=arc-20160816;
        b=j8Tlx199tO/iUZtwKC0nIJcoH13aKh900qzY0d7eGgbwuoyzOGeGibQzXvdFAdf7QV
         qFO2+Q1RzUpGt8//QhrvgO6gtbPV+v/7Knkcbu7BCjUdVoRtDMmou7+mA7VZO2ctvJ2v
         ibws1otRKLlUm0WTJRUfFhQHN0cpyoKUu31CUOZcfainj+ArT68NOkzIxbTNc2DR+2LY
         JhMH73b0hr3m9LUQTDIZ1gp0Y2ovqh0xNwNaSDFZsWU5R0XPgMnw8ypQETyaGwQdZqXS
         1cBBk3HMRKT4I4uZAwIK/T9hZrgtYP1U7x4TlfAXhusS5a1NcFbbFTPZLs6xtpalbZGV
         cHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P00hLriTbvUotvng8KLIcXRAAtE2rFXAFBUK7lYwsWc=;
        b=pa0fuKxCJxKqHVOGADuuvcqgKTnGWvUvJQKQCZufpsZkSUFU8Z+B0CzWZrUHygFeD7
         uj7xeSVRW8gvbKZFZ1Xu8vX3/WTmB/M6sSnVeEOwZbaDnMnv7C4DPiqQg3Zc5VmBOvic
         KA0W1V8MXc28DsnY4YV2IrMAIOtC+WMRkfvuOADYRVdxhRcE/6ct7lXy+NLK/QVq76sF
         GjSwv5H2IN07ZoXACze3Q4H42bXAbVEUku+a6Kwb/l3zeuJdHPC5Ox/aWy4IHWS58RB7
         bCtJwnZ5arZGPwoLYFoGFRzZbYekWqfrSKe4TAXxlRGPudqoI2Kdd8x4kz4zQtpx4n60
         xDtQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q0E1pALf;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b36 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com. [2607:f8b0:4864:20::b36])
        by gmr-mx.google.com with ESMTPS id d16-20020a631d50000000b003c1fd25c98esi36036pgm.1.2022.05.04.23.47.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 23:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b36 as permitted sender) client-ip=2607:f8b0:4864:20::b36;
Received: by mail-yb1-xb36.google.com with SMTP id v59so6059252ybi.12
        for <jailhouse-dev@googlegroups.com>; Wed, 04 May 2022 23:47:52 -0700 (PDT)
X-Received: by 2002:a05:6902:4e9:b0:645:8122:3c81 with SMTP id
 w9-20020a05690204e900b0064581223c81mr21308905ybs.563.1651733271968; Wed, 04
 May 2022 23:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <400480ed-70db-467a-b47d-b4c3f3641777n@googlegroups.com>
 <b7c5f1aa-e91c-3a9b-b74c-2255184d66a5@siemens.com> <CA+V-a8vGiT237W59_OMqxLuFSAsPYYVCGZW3mn5vaGnUhDCK+Q@mail.gmail.com>
 <aebdee8e-4074-b223-2cbe-42564624e7f6@siemens.com> <CA+V-a8vpx00x21N12bRQ9eGPHH3TnWr96HmxUPpJUgtHyMy-LA@mail.gmail.com>
 <CA+V-a8u0bPPZBk49twr9xuLNCPKV8isdSGTt+Pj6mYV=Dkh2OA@mail.gmail.com> <e4e83117-c094-0bec-40f6-627ab1dcd776@siemens.com>
In-Reply-To: <e4e83117-c094-0bec-40f6-627ab1dcd776@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 May 2022 07:47:26 +0100
Message-ID: <CA+V-a8vbErK-PXu0G8VKkff+Hg33dMUSWsG+-ZeosChJS1i1_g@mail.gmail.com>
Subject: Re: Linux and u-boot requirements
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, 
	Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=Q0E1pALf;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b36 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Wed, May 4, 2022 at 6:52 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 03.05.22 20:42, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Tue, May 3, 2022 at 11:47 AM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> >>
> >> Hi Jan,
> >>
> >> On Mon, May 2, 2022 at 9:30 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>
> >>> Hi Prabhakar, hi Chris,
> >>>
> >>> ok, now I understand your question last Thursday, Chris... ;)
> >>>
> >>> On 02.05.22 21:37, Lad, Prabhakar wrote:
> >>>> Hi Jan,
> >>>>
> >>>> On Mon, May 2, 2022 at 5:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>
> >>>>> On 27.04.22 15:19, Prabhakar Lad wrote:
> >>>>>> Hi All,
> >>>>>>
> >>>>>> I recently tried to build the v0.12 tag with the upstream kernel
> >>>>>> (v5.18-rc4) for emconrzg1h, but the build failed due to api changes
> >>>>>> (cpu_up/cpu_down mainly).
> >>>>>
> >>>>> You want to use master or even next for very recent kernels. I haven't
> >>>>> done a release in a too-long-while, so patches to account for kernel
> >>>>> changes can only be found there.
> >>>>>
> >>>> I see. I came across the linux [0] tree which has
> >>>> jailhouse-enabling/x.x branches. Is this a good starting point for
> >>>> Linux? These branches merge Linux releases into the jailhouse kernel
> >>>> which makes it a bit difficult to track the changes specifically made
> >>>> to jailhouse. For example, for the 4.19 branch it's currently on
> >>>> v4.19.81 whereas I plan to work on 4.19.198 which makes porting things
> >>>> a bit difficult.
> >>>
> >>> Not at all:
> >>>
> >>> git log --no-merges --oneline v4.19.81..jailhouse-enabling/4.19
> >>>
> >> Thanks for the hint.
> >>
> >>> The 4.19 branch was retired a while ago, so rebasing over latest stable
> >>> or merging that in would definitely be recommended. Actually, you likely
> >>> want to check the latest enabling branch or [1] for updates since 4.19
> >>> was retired.
> >>>
> >> Great, I'll start with the latest enabling branch which you pointed to
> >> and use it with the v0.12 release (I'll have to port my platform to
> >> this though). And then later I consider either 5.10/4.19 kernel.
> >>
> >>>>
> >>>>>>
> >>>>>> So I wanted to check what are the strict requirements for Linux and
> >>>>>> u-boot as I plan to add new arm64 platform.
> >>>>>>
> >>>>>> Also is there any document/link that I can refer to porting on new platform?
> >>>>>
> >>>>> No written documents, but if you follow the commit history of
> >>>>> https://github.com/siemens/jailhouse-images you can see how new targets
> >>>>> were hooked up there (mostly Jailhouse-unrelated integration work).
> >>>>> Jailhouse also does not depend on U-Boot, first of all only a working
> >>>>> Linux / firmware integration, ideally from upstream.
> >>>>>
> > I followed the jailhouse-images repo with the master branch and
> > started with Linux first. For Linux it uses the
> > jailhouse-enabling/5.10 branch [1] (commit id:
> > eb6927f7eea77f823b96c0c22ad9d4a2d7ffdfce). In this kernel version the
> > cpu_up/down api are static [2] due to which the build of jailhouse
> > 0.12 is failing ( I tried to build for zynq platform just wanted to
> > make sure build passes before porting my platform)
> >
> > I looked at the kernel recipe and there aren't any patches which
> > exports cpu_up/down api and nor do I see any patch in
> > jailhouse_0.12.bb [3] which drops cpu_up/down api. Is there anything
> > I'm missing here?
> >
>
> https://github.com/siemens/jailhouse-images/commit/64c102a9df6f713170129ac0e8f7c94927a8592e
>
Thanks for the pointer. Now I'm able to build the -next branch with
5.10 enabling branch.

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8vbErK-PXu0G8VKkff%2BHg33dMUSWsG%2B-ZeosChJS1i1_g%40mail.gmail.com.
