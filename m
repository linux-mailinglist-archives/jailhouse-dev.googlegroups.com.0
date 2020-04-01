Return-Path: <jailhouse-dev+bncBC25XUMBOQIIPT4S6QCRUBHXYT7BE@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0394F19AE16
	for <lists+jailhouse-dev@lfdr.de>; Wed,  1 Apr 2020 16:39:05 +0200 (CEST)
Received: by mail-qv1-xf3f.google.com with SMTP id v88sf20442402qvv.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 01 Apr 2020 07:39:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585751943; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZoHdt99sasjp2ivV+mbFHFEcFcIpxpLg9skhs1wUCKwtFU+950F/MYGptCL4GsR7FS
         LX0BDTkauscAAP8y2niyxvD5lDKVTPcUGMfbYbGWPbN4sULtphgYgoOg2SCReM7qnfWJ
         8geGQB64myOXuaFc3mkeE6SwLGdCn/6HJjUy7p3BWTCCcdoIi4Si8yQ8Vr/T1K1OCJP8
         Flpfx1EfOhLiEKbYwAVDdyRyLH6VOJ3s2qSggj+e8Gc5iekxmvOe45jAbliNxnTj1Q7D
         Oo5ZcfxTBDb34aF4Gfp74xd3O0cxzFfNd3JfPRbtPfe3xa4bR8gGci/4BbPEx7SthQaw
         rfhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=RvoVwSS11r3iXNdLr/qe7VqA9yrcaMPcNn30XSk+iVU=;
        b=0QKmrxALYKVy0PjFDhQZ9FcIRugQYvNxaPLCnvVYIErljhoNOzmZjIElFoXuXxPBA+
         8f88d7CYvdPPSrwyukpkvtlLj4jgT/N33kKJcYUtos1lIajajgpZCbG0ZzeC2bqpmyPb
         tKw4gCwGUKo3X/7bY70s10YjiPGFyXTwx2y357Qve/F/12077dtaPDjWYoWx8LJ7zC+V
         YhYoIOEVh2PGfRsctw2FQGzbO7wcDUrKkhZPA0rZC7EIEjI+eFLq0Osiwfso2FTGVsE1
         2GcChLxuAJP5WPoZIKXrJIopinwRHAOJJWtDDqu6OPIr+ohSWD23nIfI+fYGw+JOLUCX
         Wj/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="ek/j4h4c";
       spf=pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::d42 as permitted sender) smtp.mailfrom=brgerst@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RvoVwSS11r3iXNdLr/qe7VqA9yrcaMPcNn30XSk+iVU=;
        b=CktGKb0VoQLQI/ppxKlchwTLmjPvbtpaFLhldFfkhVcRfIdjxNteFt9wSEDvz4Myrb
         WDtTDry8T0OU+DXGrLlLQY2EaV/hf/jDr7TrAdMRIJcIzNkllkGRPukSjR1dEZVM3y/F
         3hmfJXyWDulFdNTWpR3FSLxt2iRDxQ6d+5+6mKBOh/1Ybjuo1WNgM5A0Lu1gxlYYmFC7
         8GjNq0Oll7nyxTNy1R09BFtEB5WqU+e2t6bdG3zfsfTxGy/Kg/nqcR7hvVqNP31/DG9S
         9qPdNHmM/JCQj3WxiszxqdpgKQPE3a3F/4C+dSfdg4GC8TQMRI7CRWg+NvYTNXqniWiB
         rzrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RvoVwSS11r3iXNdLr/qe7VqA9yrcaMPcNn30XSk+iVU=;
        b=qigMju6chf2x2kpt7kTCkb7zvLn/nxDnT0yJpIv+jwXpNONC34i2PEZXPfWBuhIWN5
         T5nDtVRbGYg4HdOkQ176RXdpP5wVrzmUrJ80DWMbrjiql/CT6hrGcah+Cs+EN3PK5Wyn
         xYdPUq6jM3cYgOzcVDUzPL527M7xN7AHIoJ9vxpSNVV4FS6MJ2lnn7eZlfzRPzsyFEbV
         t6q1ZvYyweFJHdTaOnn3IOvlZ5m639/BAMbP3ffVA4ANPNXexuCgaYZf0oxIbYXeNNpH
         ReUUdl3om+8hsGhgiSa6qOWq+T3dMvCKyH0KMfx8XbWavSb3ZdnpdllYXz2M5zumP1IW
         ZM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RvoVwSS11r3iXNdLr/qe7VqA9yrcaMPcNn30XSk+iVU=;
        b=HGdogoK86PfVrvftbM8D/XHRUJRMWJwrZYBkIqZZErWnVnn/vb0XujAjhfuKJ4bIgk
         mkKryq7MWvU3qJftX5bjLiaZKUZSnmNYVBTDTJccC20HdrNCeQzXHEXDGoNdblikj8a1
         +HczRRPWuQdR4hLnID2BLBOHG7errhZipuZfaxoO14bupmU+QtIqu3quiIzFgDRv2bOa
         VqQs535oTpetABIXQysNVPtaS/hLQJB2XOSS0El/uIBCPnTsGp7XwM6tb1jXTLfIJ8jS
         bNVNxlhJTTthOflHizBrp9u+p4CQatmhnbTVzzNWAuckSBWyrO3DRT8prWCOmWsA4xj1
         NXlw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0Mn9kTW99plzoKWqtH65no8PlMejZtbg6xv7a88Hbrr1CZZsMq
	HO7fei1MW/MZfSvqTmiOMyQ=
X-Google-Smtp-Source: ADFU+vtqfefjcyCXuoylxWFYeJjX5SWBhutwFduM1Gu2GKfzQ4SF0M34qfNPcb2E+ZelcY3+kHLt7Q==
X-Received: by 2002:a37:a84b:: with SMTP id r72mr10552914qke.414.1585751943795;
        Wed, 01 Apr 2020 07:39:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:38ad:: with SMTP id f42ls10036966qtc.9.gmail; Wed, 01
 Apr 2020 07:39:03 -0700 (PDT)
X-Received: by 2002:ac8:7316:: with SMTP id x22mr11159901qto.4.1585751942944;
        Wed, 01 Apr 2020 07:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585751942; cv=none;
        d=google.com; s=arc-20160816;
        b=acdtWj5HVkZhE8V0aUT1r2f3AxiuQiEsmVJcx/xaPdicsDRGd7yT3UVx0YA7KkUhk5
         74+NrUQpCDRnGOoRr/iw6vixzO1YBWs0XledfeYFz5XZuKt2fHkHux9B7VOIHMvH5sxf
         uKdVe3jVnrcYnC3KoK/tR8nPrmdiJrFBuR9ADbx9Kib8JesuwO/YTJf+nDxht51XKc8T
         JviTXINcW9IDM6lxW7Pf6PY+mJB702xI1IlB5jhT33YjEluc3u88UF3cNbMQ5uF5QGSy
         rpMyAxcr0+Og0f9MvBdAHKonglUL9gkvc22l+Dli7O2z2pX270Iq8gH/8dPoubmHFlab
         Yt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Bc9t147F81S9ClX5m+UTR/FQ0DxmDDOUUXqttzbZFk4=;
        b=o7kNiL0BJCZ5gQLcI7KokoityZt6sapY/6dBFBWqRR37dsL1qvO8UvsGQzsV0b9hlK
         llhkRqGCuSvKkFFsitAY9sWeRSutRuJNPYtsxWGjOUhLP1g7uVLhsljnxQWJnKKG8kug
         TT33NwWQ9HV7Mw0PkS6eoKa7Fc3VQ6uHThe1NEn3itaY2GX9NsIaLeyaJiiGUfkw1ioG
         KkoZ29bnsbRWvkJZ5WnFH4001PZzba4wHxeI/4JCaXnPObdXiaVKKUWs27L2lyop25yE
         +X5WUvnZB2TGFnSgg8RrbAYshHMehrONGODOuM8X5RECXBvldqaAKnZLoUzQNNeAGWXB
         iXVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="ek/j4h4c";
       spf=pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::d42 as permitted sender) smtp.mailfrom=brgerst@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com. [2607:f8b0:4864:20::d42])
        by gmr-mx.google.com with ESMTPS id m6si169227qtk.2.2020.04.01.07.39.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 07:39:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::d42 as permitted sender) client-ip=2607:f8b0:4864:20::d42;
Received: by mail-io1-xd42.google.com with SMTP id o127so25892281iof.0
        for <jailhouse-dev@googlegroups.com>; Wed, 01 Apr 2020 07:39:02 -0700 (PDT)
X-Received: by 2002:a6b:b512:: with SMTP id e18mr20432245iof.168.1585751942391;
 Wed, 01 Apr 2020 07:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200325101431.12341-1-andrew.cooper3@citrix.com>
 <20200331175810.30204-1-andrew.cooper3@citrix.com> <CAMzpN2i6Nf0VDZ82mXyFixN879FC4eZfqe-LzWGkvygcz1gH_Q@mail.gmail.com>
 <c46bcb6d-4256-2d65-9cd9-33e010846de4@citrix.com> <CAMzpN2gdkmYYbQatFk66QMpiuZSfnUQUVtJ30VYF7nsX_+XVgA@mail.gmail.com>
 <bdf7995d-2d50-9bb9-8066-6c4ccfaa5b52@citrix.com> <CAMzpN2g0LS5anGc7CXco4pgBHhGzc8hw+shMOg8WEWGsx+BHpg@mail.gmail.com>
 <b1aa5cdf-b446-17b0-6d31-fa8947f67592@citrix.com>
In-Reply-To: <b1aa5cdf-b446-17b0-6d31-fa8947f67592@citrix.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 1 Apr 2020 10:38:51 -0400
Message-ID: <CAMzpN2h5u3gbRFfew-BSUH_=E509QirQaopiTBrVQc6Oq2AcvA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/smpboot: Remove 486-isms from the modern AP boot path
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	James Morris <jmorris@namei.org>, David Howells <dhowells@redhat.com>, 
	Matthew Garrett <mjg59@google.com>, Josh Boyer <jwboyer@redhat.com>, Steve Wahl <steve.wahl@hpe.com>, 
	Mike Travis <mike.travis@hpe.com>, Dimitri Sivanich <dimitri.sivanich@hpe.com>, 
	Arnd Bergmann <arnd@arndb.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Giovanni Gherdovich <ggherdovich@suse.cz>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Len Brown <len.brown@intel.com>, Kees Cook <keescook@chromium.org>, 
	Martin Molnar <martin.molnar.programming@gmail.com>, Pingfan Liu <kernelfans@gmail.com>, 
	jailhouse-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: brgerst@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="ek/j4h4c";       spf=pass
 (google.com: domain of brgerst@gmail.com designates 2607:f8b0:4864:20::d42 as
 permitted sender) smtp.mailfrom=brgerst@gmail.com;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=gmail.com
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

On Wed, Apr 1, 2020 at 8:14 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 01/04/2020 12:39, Brian Gerst wrote:
> > On Wed, Apr 1, 2020 at 5:22 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >> On 31/03/2020 23:53, Brian Gerst wrote:
> >>> On Tue, Mar 31, 2020 at 6:44 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>>> On 31/03/2020 23:23, Brian Gerst wrote:
> >>>>> On Tue, Mar 31, 2020 at 1:59 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>>>>> Linux has an implementation of the Universal Start-up Algorithm (MP spec,
> >>>>>> Appendix B.4, Application Processor Startup), which includes unconditionally
> >>>>>> writing to the Bios Data Area and CMOS registers.
> >>>>>>
> >>>>>> The warm reset vector is only necessary in the non-integrated Local APIC case.
> >>>>>> UV and Jailhouse already have an opt-out for this behaviour, but blindly using
> >>>>>> the BDA and CMOS on a UEFI or other reduced hardware system isn't clever.
> >>>>>>
> >>>>>> We could make this conditional on the integrated-ness of the Local APIC, but
> >>>>>> 486-era SMP isn't supported.  Drop the logic completely, tidying up the includ
> >>>>>> list and header files as appropriate.
> >>>>>>

> >>>>> You removed x86_platform.legacy.warm_reset in the original patch, but
> >>>>> that is missing in V2.
> >>>> Second hunk?  Or are you referring to something different?
> >>> Removing the warm_reset field from struct x86_legacy_features.
> >> Ok, but that is still present as the 2nd hunk of the patch.
> > My apologies, Gmail was hiding that section of the patch because it
> > was a reply to the original patch.  For future reference, add the
> > version number to the title when resubmitting a patch (ie. [PATCH
> > v2]).
>
> Erm... is Gmail hiding that too?
>
> Lore thinks it is there:
> https://lore.kernel.org/lkml/CAMzpN2g0LS5anGc7CXco4pgBHhGzc8hw+shMOg8WEWGsx+BHpg@mail.gmail.com/

Ugh, yes.  I thought it was the title that Gmail threaded on, but it
must be the In-Reply-To: header.  Sorry for the confusion.

That said, I think the v1 patch is probably the better way to go (but
adjusting the comments to include early Pentium-era systems without
integrated APICs).  Then the decision to drop support for external
APICs could be a separate patch.

--
Brian Gerst

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAMzpN2h5u3gbRFfew-BSUH_%3DE509QirQaopiTBrVQc6Oq2AcvA%40mail.gmail.com.
