Return-Path: <jailhouse-dev+bncBD3ZFSMAZYNBBLN45L6AKGQEPMSQJTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA129E979
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 11:49:19 +0100 (CET)
Received: by mail-ot1-x33d.google.com with SMTP id n21sf804676ota.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 03:49:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603968558; cv=pass;
        d=google.com; s=arc-20160816;
        b=Gg7w5UfZTm8kyd9x9KMLeUoKF2zcWsNFL2/XKLDkY+Oyf5+Nv/SwQftVeVRfssc6kf
         2122DO4K1P7B6ncjbP6dsavi3M29Q6zIpIRfoRRBSaNH63Cr+1PXydqp63izras8hhZu
         +AIEWhV8zQZDJE8pqv0W62Khk/o6T9iUFqXo4GO81jQMsGc3eDgKKhzJVGP5VNkit2V3
         3mInwrS+rEQYRhuvLpAh7WgNW1YIhQ9p91n7SamZj2nNHE3CyM5FJIV4UQlHXMF7LzyV
         Lif0VM8AjjYGTVRCNYrgFMbZ1hbnL62/Y9Y8t0Y1mKQ36WQXZsbuZCq1H/t9ik4hzDkz
         l1Eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=gGQ6p8iOtDSv6IcrR1Z1BDoWnj6bRbljgEABZC1hp0c=;
        b=GpSaogAHUfguF8shMborKyF21IPkkP5bECvuIPh+Hv2Cclncb/5zicnCKNS9tEgmKm
         Dqh7O3BLz2JOW/06gRbIg9h/cht/zkhlRBy5wz8GeSFhDrO9DQ9YBQkNTR+Nq04hLn1d
         XW98FltKYZIRrRAox3aZIOE7i6QKkdonGb4N+rCVwkDOz0//XxqqfMJ6UG6B0BNGEOBA
         kFLUP0d2e2zeCHqNdu1RXzIEFgp5kzWHnmApunXAUDttnIW+8IVEtaxoemAKOJgOTdJo
         qoV7tmRi66cdyRMe15oc+10P5KV8iQlrh+AlPu5maAcgAL7S+E7keKRX8uqFipzGuz9v
         MHJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NcQGLcLx;
       spf=pass (google.com: domain of rntmancuso@gmail.com designates 2607:f8b0:4864:20::331 as permitted sender) smtp.mailfrom=rntmancuso@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gGQ6p8iOtDSv6IcrR1Z1BDoWnj6bRbljgEABZC1hp0c=;
        b=FG//BRjoAR8u51Yh7YYhUvleOamawQKFHeDLnRUaEJNbwUXD+FohC2+qrlL2uWXQWH
         yAj/7ZIzocIgS0CHPa9zJs6KlmkKYNJcJUeTBa+Gh0jBJj6+341Q4geED0UgI/jMsaxA
         CEZwpjK6u3r68jmEdJTz1mjMNq9TPQws8sQjS/iSN/WGUBgcUILGVnDeCI+qpEtHN/vh
         0V467ijdSiMqWUyKXWOqdC/hi85a95KcKnDRtCw93ovXSqft6KJVHsMXfLLZNV2u5w+/
         v1R9mvn0EjXeZLXXoP59uwIhyKYiG0Y9wEPOLyuaOVulPHdC/r/wktdYLM4Tk0yHF+Ux
         i8Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gGQ6p8iOtDSv6IcrR1Z1BDoWnj6bRbljgEABZC1hp0c=;
        b=bv+l6a3r55N8WxjhCtII94WVWsh5z6nC/8ks0Mkc9obZ9ZJnypqmT+pRKkLaucPFY2
         3mosJn7DuOABOm/+5BOIZ1u4Y3nF6ffEDqNpz2RZLGiDAeGZ4bPSp/1itmEaB5/N46KN
         JUj70FmVoaDP4Qqes1ZQ7LGAtsACo2Jqs7P+5lBo5N6PlZJ6h31/d2WSt3qj0vlXpjiX
         +6GH1PMWqr2R+zyw9qYygJxecSicev70KyWAG9KLD3Grr4K3q7DtAGAJYMqsweZeu17p
         xfhrl37CJXCf16U9Mb+rHRx+3fSPYvXvyxZqGYoqa/1YaIab6rKFiLhpAG+4Kl9KSBi9
         SYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=gGQ6p8iOtDSv6IcrR1Z1BDoWnj6bRbljgEABZC1hp0c=;
        b=h1UfohSeolOepsZj7WIBWK+T1jQGAsq3zH1rsH5Gw/NbZ/o3rvxgpXXPcORBiX+v0V
         Kwt4KD7X+kFc2FrvDyAKJZeEx6OO9sWEB8FqByq5H/AhE3Clf8+5llFTr5D+tCm3bZtY
         jiqZzJlJ5YZ0QApFhFHI0hT7ks6xyxT2VmTkTo193Fzf84grfW8ffCAK7+36tOS85fIE
         /3OZSimWYcN5UqCeKUPk5mIJy61BfxwZ7mVT22rCNVySfR9NQyFV1/Z/qQkLSCKSfeUj
         9qFttajFwn965b4vJDW+24mexr+Qxxm6hIHF16/b5u/1SD08txvS6vP8JPkgfTqYxQk+
         RWVA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533xWrPj3FjrTV75mgXXbwVBrhS1idPISSn9EBTeRaGrDyUu6sh2
	D8oL2tTw5O4hm8vbEDLmdcw=
X-Google-Smtp-Source: ABdhPJyY+eDZvqtJxmc/XTa1LZIgmJWLg2w7jaP68y46KA2aYwSEgG4YqgNrFRZmXE6X0Wj/nzDGag==
X-Received: by 2002:aca:ac8c:: with SMTP id v134mr2478947oie.128.1603968557879;
        Thu, 29 Oct 2020 03:49:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:53cb:: with SMTP id h194ls570443oib.4.gmail; Thu, 29 Oct
 2020 03:49:17 -0700 (PDT)
X-Received: by 2002:aca:f146:: with SMTP id p67mr2563136oih.28.1603968557404;
        Thu, 29 Oct 2020 03:49:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603968557; cv=none;
        d=google.com; s=arc-20160816;
        b=H3l7ZGvR7e86lcnU55LqTor89/7fdtXScSh6KXO+eC/tW7p3sZ5sIIKO3bbwrWD/4W
         NtflaKopdw+0wvlxydf+mJ0B1fokiP4sxoqxfQYmHzUqft9j6UwHaRQPRi9BpU5DdfSm
         VFstrYA3QOqV1q+bZoPXxF6dsG4htn92OTQX4qjsdpHYaFs/I8VTKmTxEv/7IgQ5ft7T
         AecgKWiLzJHivch4JRnDbQqCuws7FD6MuwjvYypam+RAAzKxN8qjadfqppAIsAnEPpZh
         tvgZGiQR5p21SQKMgMiI0EZhV3BNvemI/h50Sxn5Nyk0xZYyF0FAVg7bc0NBzODSF1N7
         ql+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8D0bXGqt5djMYdKMxkqhHnowE6RVFxvxSBqW57AKYys=;
        b=xI2H5+8btbSLtHa/7YgFafoYy6QGHONpH40oK311ZrR3kx3KEsoETLgIVpkDgZpvIr
         9M2VwfMKhkeLiiqsShd3EwxcPRgge9clXxcMKS9jZuMPvcFRKC2q/Chx1JdUo5coC0j7
         aOve1MeOlqvV9soy9cx4P+yaBHnmf9DeaFotKi2VkWbvuUZSMKLtIoob/7g9vw9oj7sr
         Frt3NVnhAXlar0a7+2K9qyAVhG7hQ9Qu5P9dF8FnRP7s7eOF3DMDjQkSTZL/qsSg42pA
         WNVFx2nTb34mkzFcSLyVoq/8Tufg5gaywYvf1XA087ei2KjHYw3Xv8h+1NYm1taD7J6L
         v/8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NcQGLcLx;
       spf=pass (google.com: domain of rntmancuso@gmail.com designates 2607:f8b0:4864:20::331 as permitted sender) smtp.mailfrom=rntmancuso@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com. [2607:f8b0:4864:20::331])
        by gmr-mx.google.com with ESMTPS id o22si153318otk.2.2020.10.29.03.49.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 03:49:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of rntmancuso@gmail.com designates 2607:f8b0:4864:20::331 as permitted sender) client-ip=2607:f8b0:4864:20::331;
Received: by mail-ot1-x331.google.com with SMTP id m26so1818895otk.11
        for <jailhouse-dev@googlegroups.com>; Thu, 29 Oct 2020 03:49:17 -0700 (PDT)
X-Received: by 2002:a9d:7119:: with SMTP id n25mr2929504otj.9.1603968557027;
 Thu, 29 Oct 2020 03:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602664149.git.jan.kiszka@siemens.com> <78334f5d-b665-8de6-31fc-10599877b3b1@siemens.com>
 <DB6PR0402MB2760F60895CFBCCAEA5F2F3A88160@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <bee3d688-1c2d-f4d8-f434-b9ff8d50ce10@siemens.com> <fd8fe9cc-9e69-4406-21e2-979b282b6d16@siemens.com>
 <8c0cec16-dc86-b316-ef84-af51a15c80aa@tum.de> <4b408440-354d-521e-0a88-e1541eaed1d7@siemens.com>
 <fa5b83f2-fa5c-e158-4b99-cc86db20ea43@tum.de> <eaa35809-1823-9bac-a971-12b9e4a2ec54@siemens.com>
In-Reply-To: <eaa35809-1823-9bac-a971-12b9e4a2ec54@siemens.com>
From: Renato Mancuso <rntmancuso@gmail.com>
Date: Thu, 29 Oct 2020 06:49:05 -0400
Message-ID: <CAL30Xq9rJCRQLTqdhuMdLz+RXEoJDqv+r4jZVbmmX+FnqvvBCw@mail.gmail.com>
Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Andrea Bastoni <andrea.bastoni@tum.de>, Peng Fan <peng.fan@nxp.com>, 
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>, 
	Renato Mancuso <rmancuso@bu.edu>
Content-Type: multipart/alternative; boundary="0000000000001295d005b2cd0871"
X-Original-Sender: rntmancuso@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=NcQGLcLx;       spf=pass
 (google.com: domain of rntmancuso@gmail.com designates 2607:f8b0:4864:20::331
 as permitted sender) smtp.mailfrom=rntmancuso@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000001295d005b2cd0871
Content-Type: text/plain; charset="UTF-8"

Hi Jan, Andrea,

Thanks for looping me in on this topic!

Just a not that I in my version I don't just recreate the root page, but
the entire page table tree to be NC for the SMMU. That immediately gave me
a stable system on the ZCU102. I have tested that even with a dynamically
recolored root cell. I haven't tested with colored DMA-capable inmates, but
I'll do that soon as I have just added support to boot colored Linux
inmates. I keep SMMU and CPU tables in sync by duplicating any change in
map/unmap operations at cell creation time.

@Jan, when I started working on my current repo, I did it to quickly port
JH to a dev board I quickly needed to work on (the NXP S32V234). It just so
happened that I branched out quite a bit. I am quite happy if some of my
effort helps with upstream dev. I just don't have too many cycles at the
moment to propose well thought out patches. I am actually looking forward
to having this conversation in a few weeks.

Cheers,
Renato




On Thu, Oct 29, 2020, 4:53 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 29.10.20 09:39, Andrea Bastoni wrote:
> > On 29/10/2020 07:36, Jan Kiszka wrote:
> >> On 28.10.20 22:29, Andrea Bastoni wrote:
> >>> Hi,
> >>>
> >>> On 28/10/2020 21:14, Jan Kiszka wrote:
> >>>> On 27.10.20 10:22, Jan Kiszka wrote:
> >>>>> On 27.10.20 02:25, Peng Fan wrote:
> >>>>>> Jan,
> >>>>>>
> >>>>>>> Subject: Re: [PATCH v2 00/46] arm64: Rework SMMUv2 support
> >>>>>>>
> >>>>>>> On 14.10.20 10:28, Jan Kiszka wrote:
> >>>>>>>> Changes in v2:
> >>>>>>>>  - map 52-bit parange to 48
> >>>>>>>>
> >>>>>>>> That wasn't the plan when I started, but the more I dug into the
> >>>>>>>> details and started to understand the hardware, the more issues I
> >>>>>>>> found and the more dead code fragments from the Linux usage became
> >>>>>>> visible.
> >>>>>>>>
> >>>>>>>> Highlights of the outcome:
> >>>>>>>>  - Fix stall of SMMU due to unhandled stalled contexts (took me a
> while
> >>>>>>>>    to understand that...)
> >>>>>>>>  - Fix programming of CBn_TCR and TTBR
> >>>>>>>>  - Fix TLB flush on cell exit
> >>>>>>>>  - Fix bogus handling of Extended StreamID support
> >>>>>>>>  - Do not pass-through unknown streams
> >>>>>>>>  - Disable SMMU on shutdown
> >>>>>>>>  - Reassign StreamIDs to the root cell
> >>>>>>>>  - 225 insertions(+), 666 deletions(-)
> >>>>>>>>
> >>>>>>>> The code works as expected on the Ultra96-v2 here, but due to all
> the
> >>>>>>>> time that went into the rework, I had no chance to bring up my
> MX8QM
> >>>>>>>> so far. I'm fairly optimistic that things are not broken there as
> >>>>>>>> well, but if they are, bisecting should be rather simple with this
> >>>>>>>> series. So please test and review.
> >>>>>>>>
> >>>>>>>
> >>>>>>> Alice, Peng, already had a chance to review or test (ie. next)?
> >>>>>>
> >>>>>> I gave a test, sometimes I met SDHC ADMA error when
> >>>>>> `jailhouse enable imx8qm.cell`, sometimes it work well.
> >>>>>>
> >>>>>> I suspect when during jailhouse enable phase, there might be
> >>>>>> ongoing sdhc transactions not finished, not sure.
> >>>>>>
> >>>>>> I have not find time to look into details.
> >>>>>>
> >>>>>> Anyway, you could check in to master I think, we could address
> >>>>>> the issue later when I have time.
> >>>>>>
> >>>>>
> >>>>> Hmm, I would still like to understand this first... Do you have the
> >>>>> chance to bisect this effect to a commit? Otherwise, I guess I
> finally
> >>>>> need to get my board running.
> >>>>>
> >>>>
> >>>> It's running now (quite some effort due to the incomplete upstream
> state
> >>>> - e.g. upstream u-boot runs but cannot boot all downstream
> kernels...),
> >>>> but I wasn't able to reproduce startup issues. Shutting down Jailhouse
> >>>> often hangs, though, at least restarting does all the time. And that
> >>>> even with next. Seems we still do not properly turn off/on something
> here.
> >>>>
> >>>> Interestingly, this issue was not present on the zynqmp.
> >>>
> >>> On a different version of the SMMUv2 developed @ Boston University
> (Renato in
> >>> CC), re-using the same root page table as the cell created problems
> due to
> >>> different attributes (uncached) needed by some devices.
> >>
> >> Why are so many folks working downstream on such essential things? Not
> >> helpful, for everyone, even if the goal should be "only" experimental
> >> results.
> >>
> >>>
> >>>> diff --git a/hypervisor/arch/arm64/smmu.c
> b/hypervisor/arch/arm64/smmu.c
> >>>> index 41c0ffb4..60743bc0 100644
> >>>> --- a/hypervisor/arch/arm64/smmu.c
> >>>> +++ b/hypervisor/arch/arm64/smmu.c
> >>>> @@ -220,6 +220,7 @@ static void arm_smmu_setup_context_bank(struct
> arm_smmu_device *smmu,
> >>>>         mmio_write32(cb_base + ARM_SMMU_CB_TCR, VTCR_CELL &
> ~TCR_RES0);
> >>>>
> >>>>         /* TTBR0 */
> >>>> +       /* Here */
> >>>>         mmio_write64(cb_base + ARM_SMMU_CB_TTBR0,
> >>>>                      paging_hvirt2phys(cell->arch.mm.root_table) &
> TTBR_MASK);
> >>>
> >>> The issue in the BU version was solved by allocating a new page for
> this.
> >>>
> >>
> >> Only the root level? How were those entries different?
> >
> > Only the root level. IIRC, NC by default, instead of Normal.
> >
> >>> I wanted to check this effect for the version on next, but didn't find
> the time
> >>> to do it so far :/
> >>>
> >>
> >> How was the issue triggered?
> >
> > From the discussions I had, on the ZCU102, devices were randomly
> triggering
> > erros/ stopped working.
> >
>
> I just ran a enable/disable loop aside flood-ping + dd on the Ultra96-v2
> (I would expect it to be identical to the ZCU102 in this regard), and
> that did not trigger any (visible) issues yet. I'll retry with lowering
> the enable frequency.
>
> Jan
>
> >
> >>
> >>
> >> I made some progress meanwhile: Linux was also using the SMMU. I'll send
> >> a patch shortly that detects that, like we already in VT-d at least.
> >> Interestingly, this should have been broken on the Ultra96 as well, just
> >> didn't notice.
> >>
> >> With that, I'm running enable/disable loops now, but I lose my Ethernet
> >> link after a while. Returns after ifdown/up, and the system looks fine
> >> otherwise. Seems as if we drop transactions in the transition phase.
> >> However, a dd running in parallel was not triggering any issues.
> >>
> >> Jan
> >>
> >
>
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAL30Xq9rJCRQLTqdhuMdLz%2BRXEoJDqv%2Br4jZVbmmX%2BFnqvvBCw%40mail.gmail.com.

--0000000000001295d005b2cd0871
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Jan, Andrea,<div dir=3D"auto"><br></div><div dir=3D"au=
to">Thanks for looping me in on this topic!</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Just a not that I in my version I don&#39;t just recrea=
te the root page, but the entire page table tree to be NC for the SMMU. Tha=
t immediately gave me a stable system on the ZCU102. I have tested that eve=
n with a dynamically recolored root cell. I haven&#39;t tested with colored=
 DMA-capable inmates, but I&#39;ll do that soon as I have just added suppor=
t to boot colored Linux inmates. I keep SMMU and CPU tables in sync by dupl=
icating any change in map/unmap operations at cell creation time.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">@Jan, when I started working on m=
y current repo, I did it to quickly port JH to a dev board I quickly needed=
 to work on (the NXP S32V234). It just so happened that I branched out quit=
e a bit. I am quite happy if some of my effort helps with upstream dev. I j=
ust don&#39;t have too many cycles at the moment to propose well thought ou=
t patches. I am actually looking forward to having this conversation in a f=
ew weeks.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><=
div dir=3D"auto">Renato</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 29, 2020, 4:53 AM Jan Kis=
zka &lt;<a href=3D"mailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 29.10.20 09:39, And=
rea Bastoni wrote:<br>
&gt; On 29/10/2020 07:36, Jan Kiszka wrote:<br>
&gt;&gt; On 28.10.20 22:29, Andrea Bastoni wrote:<br>
&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 28/10/2020 21:14, Jan Kiszka wrote:<br>
&gt;&gt;&gt;&gt; On 27.10.20 10:22, Jan Kiszka wrote:<br>
&gt;&gt;&gt;&gt;&gt; On 27.10.20 02:25, Peng Fan wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; Jan,<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: Re: [PATCH v2 00/46] arm64: Rework SM=
MUv2 support<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 14.10.20 10:28, Jan Kiszka wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Changes in v2:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 - map 52-bit parange to 48<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; That wasn&#39;t the plan when I started, b=
ut the more I dug into the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; details and started to understand the hard=
ware, the more issues I<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; found and the more dead code fragments fro=
m the Linux usage became<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; visible.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Highlights of the outcome:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 - Fix stall of SMMU due to unhandled=
 stalled contexts (took me a while<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 to understand that...)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 - Fix programming of CBn_TCR and TTB=
R<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 - Fix TLB flush on cell exit<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 - Fix bogus handling of Extended Str=
eamID support<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 - Do not pass-through unknown stream=
s<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 - Disable SMMU on shutdown<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 - Reassign StreamIDs to the root cel=
l<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 - 225 insertions(+), 666 deletions(-=
)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The code works as expected on the Ultra96-=
v2 here, but due to all the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; time that went into the rework, I had no c=
hance to bring up my MX8QM<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; so far. I&#39;m fairly optimistic that thi=
ngs are not broken there as<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; well, but if they are, bisecting should be=
 rather simple with this<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; series. So please test and review.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Alice, Peng, already had a chance to review or=
 test (ie. next)?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I gave a test, sometimes I met SDHC ADMA error whe=
n<br>
&gt;&gt;&gt;&gt;&gt;&gt; `jailhouse enable imx8qm.cell`, sometimes it work =
well.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I suspect when during jailhouse enable phase, ther=
e might be<br>
&gt;&gt;&gt;&gt;&gt;&gt; ongoing sdhc transactions not finished, not sure.<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I have not find time to look into details.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Anyway, you could check in to master I think, we c=
ould address<br>
&gt;&gt;&gt;&gt;&gt;&gt; the issue later when I have time.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Hmm, I would still like to understand this first... Do=
 you have the<br>
&gt;&gt;&gt;&gt;&gt; chance to bisect this effect to a commit? Otherwise, I=
 guess I finally<br>
&gt;&gt;&gt;&gt;&gt; need to get my board running.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It&#39;s running now (quite some effort due to the incompl=
ete upstream state<br>
&gt;&gt;&gt;&gt; - e.g. upstream u-boot runs but cannot boot all downstream=
 kernels...),<br>
&gt;&gt;&gt;&gt; but I wasn&#39;t able to reproduce startup issues. Shuttin=
g down Jailhouse<br>
&gt;&gt;&gt;&gt; often hangs, though, at least restarting does all the time=
. And that<br>
&gt;&gt;&gt;&gt; even with next. Seems we still do not properly turn off/on=
 something here.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Interestingly, this issue was not present on the zynqmp.<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On a different version of the SMMUv2 developed @ Boston Univer=
sity (Renato in<br>
&gt;&gt;&gt; CC), re-using the same root page table as the cell created pro=
blems due to<br>
&gt;&gt;&gt; different attributes (uncached) needed by some devices.<br>
&gt;&gt;<br>
&gt;&gt; Why are so many folks working downstream on such essential things?=
 Not<br>
&gt;&gt; helpful, for everyone, even if the goal should be &quot;only&quot;=
 experimental<br>
&gt;&gt; results.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arc=
h/arm64/smmu.c<br>
&gt;&gt;&gt;&gt; index 41c0ffb4..60743bc0 100644<br>
&gt;&gt;&gt;&gt; --- a/hypervisor/arch/arm64/smmu.c<br>
&gt;&gt;&gt;&gt; +++ b/hypervisor/arch/arm64/smmu.c<br>
&gt;&gt;&gt;&gt; @@ -220,6 +220,7 @@ static void arm_smmu_setup_context_ban=
k(struct arm_smmu_device *smmu,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmio_write32(cb_base + AR=
M_SMMU_CB_TCR, VTCR_CELL &amp; ~TCR_RES0);<br>
&gt;&gt;&gt;&gt;=C2=A0 <br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* TTBR0 */<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Here */<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mmio_write64(cb_base + AR=
M_SMMU_CB_TTBR0,<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 paging_hvirt2phys(cell-&gt;arch.mm.root_table) &amp; TTBR=
_MASK);<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The issue in the BU version was solved by allocating a new pag=
e for this.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Only the root level? How were those entries different?<br>
&gt; <br>
&gt; Only the root level. IIRC, NC by default, instead of Normal.<br>
&gt; <br>
&gt;&gt;&gt; I wanted to check this effect for the version on next, but did=
n&#39;t find the time<br>
&gt;&gt;&gt; to do it so far :/<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; How was the issue triggered?<br>
&gt; <br>
&gt; From the discussions I had, on the ZCU102, devices were randomly trigg=
ering<br>
&gt; erros/ stopped working.<br>
&gt; <br>
<br>
I just ran a enable/disable loop aside flood-ping + dd on the Ultra96-v2<br=
>
(I would expect it to be identical to the ZCU102 in this regard), and<br>
that did not trigger any (visible) issues yet. I&#39;ll retry with lowering=
<br>
the enable frequency.<br>
<br>
Jan<br>
<br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I made some progress meanwhile: Linux was also using the SMMU. I&#=
39;ll send<br>
&gt;&gt; a patch shortly that detects that, like we already in VT-d at leas=
t.<br>
&gt;&gt; Interestingly, this should have been broken on the Ultra96 as well=
, just<br>
&gt;&gt; didn&#39;t notice.<br>
&gt;&gt;<br>
&gt;&gt; With that, I&#39;m running enable/disable loops now, but I lose my=
 Ethernet<br>
&gt;&gt; link after a while. Returns after ifdown/up, and the system looks =
fine<br>
&gt;&gt; otherwise. Seems as if we drop transactions in the transition phas=
e.<br>
&gt;&gt; However, a dd running in parallel was not triggering any issues.<b=
r>
&gt;&gt;<br>
&gt;&gt; Jan<br>
&gt;&gt;<br>
&gt; <br>
<br>
-- <br>
Siemens AG, T RDA IOT<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAL30Xq9rJCRQLTqdhuMdLz%2BRXEoJDqv%2Br4jZVbmmX%2BF=
nqvvBCw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://gr=
oups.google.com/d/msgid/jailhouse-dev/CAL30Xq9rJCRQLTqdhuMdLz%2BRXEoJDqv%2B=
r4jZVbmmX%2BFnqvvBCw%40mail.gmail.com</a>.<br />

--0000000000001295d005b2cd0871--
