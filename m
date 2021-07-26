Return-Path: <jailhouse-dev+bncBDR6BW4XXEARB3W27ODQMGQEQ2JMFMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2CF3D6545
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 19:14:24 +0200 (CEST)
Received: by mail-qv1-xf3e.google.com with SMTP id m15-20020a0cbf0f0000b02902e60d75210esf8709168qvi.19
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Jul 2021 10:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=E5Sf+OGNIZohowAWIxTKy9AeQc327KH55ugCHfrOnbk=;
        b=IpXGXJ+YTrqaP8Jnbsx2Kez6e6OziReiusV/DHK8jrih4wfNcP++l0FYx6CN6vk4s8
         HuSYC1LeZFZYXZppqlkcFfShq0H1izCjKJTQ8jPixktuS8v909Xhy+oP6kX3D8SmE31A
         k0Xo9NXJHuuSoNk5JEjhB/3C7SC3P9LgTEhfAhVx2H7iL10bC+3PB6RS/YMBWGUGk8DA
         h86u/RbCUk3G2MmtcXWL4zyGY5Yr+TPNwsQOe256PWzXV9ukwVNeAqAXIzjhxbDtXttD
         AK91YqW4UQVdeW5JjrVnQfqF3f585o/C5TY55dJoEQG0loKhrNpMdLjCQuSxMuRVYJ1D
         pD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=E5Sf+OGNIZohowAWIxTKy9AeQc327KH55ugCHfrOnbk=;
        b=fRZkDOUrvLBTuJwvDzw2ZGo3jbxDh/3oAniJ7vCo3RLVkooEBmthNs2dpUdVJjoK5w
         4DLSuRrc9URCIenjcH99JeNQLuUyAU9So5EtlSuwo93KA95By7IhXB2uGFcpcLHv1Zto
         xcfVk9LaME5CqkppGvMVbRulsVdJT+Izb6zfar4NhlnbvcA8zarhwhhLSLxI832qn6HD
         Oj70sZv3kyBKpKjN2HKy5o1YyyxjL+OnH7fsmBhEeElmdVmKWSp7eX0LPU88C8pMRsY7
         AMPE9MNQP6SXa9CbUymWyaLvGTmN4D4kt+P0n8nC7ZXSFEEfD67EkFgNuNewfZumO4bc
         I+ZA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532+z/ZDy5EEcxf6zv9zGrbvEqR7yIzSZoz8X8+raAB8UO2rKxX2
	yK+BDhVa0lGnvU216L14xUM=
X-Google-Smtp-Source: ABdhPJyJ6OUUossOC6PtscckkEuU2xie4ZkSri8YEXAtGt9N71QYkRrojeL+mNH5d6fanT41Ky/2vg==
X-Received: by 2002:a05:620a:1398:: with SMTP id k24mr1952846qki.12.1627319662816;
        Mon, 26 Jul 2021 10:14:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:e01:: with SMTP id y1ls12826846qkm.9.gmail; Mon, 26
 Jul 2021 10:14:22 -0700 (PDT)
X-Received: by 2002:a05:620a:90c:: with SMTP id v12mr18221890qkv.190.1627319662073;
        Mon, 26 Jul 2021 10:14:22 -0700 (PDT)
Date: Mon, 26 Jul 2021 10:14:21 -0700 (PDT)
From: Huang Shihua <shihua.huang@prodrive-technologies.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6f3f0b24-cfee-4c08-86c4-8a0cc9183a2fn@googlegroups.com>
In-Reply-To: <3372d9be-7223-0713-50bd-8db705d4f0e5@siemens.com>
References: <e52ea42b-f7ac-4f70-b23f-717c5d530dc5n@googlegroups.com>
 <3372d9be-7223-0713-50bd-8db705d4f0e5@siemens.com>
Subject: Re: Ivshmem-demo: root cell failed to receive interrupts
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2562_433418793.1627319661490"
X-Original-Sender: shihua.huang@prodrive-technologies.com
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

------=_Part_2562_433418793.1627319661490
Content-Type: multipart/alternative; 
	boundary="----=_Part_2563_318825764.1627319661490"

------=_Part_2563_318825764.1627319661490
Content-Type: text/plain; charset="UTF-8"



On Wednesday, 21 July 2021 at 17:50:53 UTC+2 j.kiszka...@gmail.com wrote:

> On 13.07.21 18:09, Huang Shihua wrote: 
> > HI, 
> > 
> > Currently, I'm trying to run the ivshmem-demo to establish communication 
> > between Linux root cell and one non-root cell. Configuration files are 
> > attached. 
> > 
> > Two cases were tested: 
> > 
> > 1. Let the non-root cell load the ivshmem-demo and then target at 
> > itself (target=1). _All interrupts can be sent and received correctly_. 
> > 2. Let the root cell and the non-root cell send interrupts to each 
> > other. I.e., root cell runs /./tools/demos/ivshmem-demo -t 1, /while 
> > the non-root cell load /inmates/demos/x86/ivshmem-demo.bin -s 
> > "target=0" -a 0x1000 /and then run. The result turned out to be,  
> > * the non-root cell got the interrupts from the root cell, 
> > * _while the root cell did not receive any interrupt._ 
> > 
> > As Jan mentioned 
> > in 
> https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCgAJ, 
> > tuning the iommu index should do the trick. 
> > However, unfortunately, it did not work for me :c 
> > 
> > There are 8 iommu units on the hardware, I tuned the iommu index in the 
>
> Wow, 8 units... 
>
> > root cell configuration from 0 to 7. The same behavior, no interrupts 
> > were received by the root cell, remains when tuning the index from 0 to 
> > 6. When the iommu is set to 7, the kernel crashed immediately when the 
> > demo was started on the non-root cell.  
> > 
> > Any idea regarding why the root cell always failed to receive 
> interrupts? 
>
> This may require in-detail debugging. For that, you would have to 
> instrument the hypervisor along its virtual IRQ injection path. That 
> starts in ivshmem_trigger_interrupt() (hypervisor/ivshmem.c). The 
> sending side will call it on writing the doorbell registers. Check along 
> this call path if conditions to actually send the IRQ are not met. 
>
> If all are met, the hypervisor sends an IPI to a target cell CPU (will 
> be directly delivered to the guest) that should cause the normal IRQ 
> processing there. But usually, we do not get so far in such cases. 
>
> Another function of interest here is arch_ivshmem_update_msix() when 
> called for the root cell while it defines where ivshmem IRQs should go 
> to. Possibly, Jailhouse decides that the programming Linux issued is not 
> valid and therefore leaves the irq_cache that 
> arch_ivshmem_trigger_interrupt() uses invalid. You can also check that 
> via instrumentations (printk). 


Indeed, when .iommu is assigned as 0,1,..6,  irq_cache is invalid. I suspect
the reason is that their correpsonding VT-d interrupt remappting table 
entries
are not for ivshmem devices, i.e., unmatched device ID.
When .iommu is tuned to 7, irq_cache becomes valid.

(BTW, as I mentioned before, the kernel crashed immediately when the
demo was started on the non-root cell. *One missing detail here is*, on the 
root-cell side,  ./tools/demos/ivshmem-demo is running/has run, i.e., 
init_control has been set to 1. If ./tools/demos/ivshmem-demo has not been
run on the root cell yet, then starting the demo on the non-root cell will 
not
kill the kernel.)

To avoid the kernel crashing situation, I only ran the demo on the
non-root cell. With .iommu being set validly, I will expect at least seeing 
the
interrupt count increases,  when grep ivshmem /proc/interrupts.
But nope, *still no interrupts received on the root cell*.


> We likely need better tooling (tracing) for these hairy cases... 
>
> Jan 
>
> -- 
> Siemens AG, T RDA IOT 
> Corporate Competence Center Embedded Linux


Any more hints?

Kind regards,
Shihua

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6f3f0b24-cfee-4c08-86c4-8a0cc9183a2fn%40googlegroups.com.

------=_Part_2563_318825764.1627319661490
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">O=
n Wednesday, 21 July 2021 at 17:50:53 UTC+2 j.kiszka...@gmail.com wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bord=
er-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On 13.07.21 18:0=
9, Huang Shihua wrote:
<br>&gt; HI,
<br>&gt;=20
<br>&gt; Currently, I'm trying to run the ivshmem-demo to establish communi=
cation
<br>&gt; between Linux root cell and one non-root cell. Configuration files=
 are
<br>&gt; attached.
<br>&gt;=20
<br>&gt; Two cases were tested:
<br>&gt;=20
<br>&gt;  1. Let the non-root cell load the ivshmem-demo and then target at
<br>&gt;     itself (target=3D1). _All interrupts can be sent and received =
correctly_.
<br>&gt;  2. Let the root cell and the non-root cell send interrupts to eac=
h
<br>&gt;     other. I.e., root cell runs&nbsp;/./tools/demos/ivshmem-demo -=
t 1, /while
<br>&gt;     the non-root cell load /inmates/demos/x86/ivshmem-demo.bin -s
<br>&gt;     "target=3D0" -a 0x1000 /and then run. The result turned out to=
 be,&nbsp;
<br>&gt;       * the non-root cell got the interrupts from the root cell,
<br>&gt;       * _while the root cell did not receive any interrupt._
<br>&gt;=20
<br>&gt; As Jan mentioned
<br>&gt; in&nbsp;<a href=3D"https://groups.google.com/g/jailhouse-dev/c/GRC=
WFzNaHX8/m/ht8z51BOCgAJ" target=3D"_blank" rel=3D"nofollow" data-saferedire=
cturl=3D"https://www.google.com/url?hl=3Den-GB&amp;q=3Dhttps://groups.googl=
e.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCgAJ&amp;source=3Dgmail&amp;u=
st=3D1627398511925000&amp;usg=3DAFQjCNFS6SDXI-AaWDmYx11EvtR54sWunw">https:/=
/groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCgAJ</a>,
<br>&gt; tuning the iommu index should do the trick.
<br>&gt; However, unfortunately, it did not work for me :c
<br>&gt;=20
<br>&gt; There are 8 iommu units on the hardware, I tuned the iommu index i=
n the
<br>
<br>Wow, 8 units...
<br>
<br>&gt; root cell configuration from 0 to 7. The same behavior, no interru=
pts
<br>&gt; were received by the root cell, remains when tuning the index from=
 0 to
<br>&gt; 6. When the iommu is set to 7, the kernel crashed immediately when=
 the
<br>&gt; demo was started on the non-root cell.&nbsp;
<br>&gt;=20
<br>&gt; Any idea regarding why the root cell always failed to receive inte=
rrupts?
<br>
<br>This may require in-detail debugging. For that, you would have to
<br>instrument the hypervisor along its virtual IRQ injection path. That
<br>starts in ivshmem_trigger_interrupt() (hypervisor/ivshmem.c). The
<br>sending side will call it on writing the doorbell registers. Check alon=
g
<br>this call path if conditions to actually send the IRQ are not met.
<br>
<br>If all are met, the hypervisor sends an IPI to a target cell CPU (will
<br>be directly delivered to the guest) that should cause the normal IRQ
<br>processing there. But usually, we do not get so far in such cases.
<br>
<br>Another function of interest here is arch_ivshmem_update_msix() when
<br>called for the root cell while it defines where ivshmem IRQs should go
<br>to. Possibly, Jailhouse decides that the programming Linux issued is no=
t
<br>valid and therefore leaves the irq_cache that
<br>arch_ivshmem_trigger_interrupt() uses invalid. You can also check that
<br>via instrumentations (printk).&nbsp;</blockquote><div><br></div><div>In=
deed, when .iommu is assigned as 0,1,..6,&nbsp; irq_cache is invalid. I sus=
pect</div><div>the reason is that their correpsonding VT-d interrupt remapp=
ting table entries</div><div>are not for ivshmem devices, i.e., unmatched d=
evice ID.</div><div>When .iommu is tuned to 7, irq_cache becomes valid.</di=
v><div><br></div><div>(BTW, as I mentioned before, the kernel crashed immed=
iately when the</div>demo was started on the non-root cell. <u>One missing =
detail here is</u>, on the&nbsp;</div><div class=3D"gmail_quote">root-cell =
side,&nbsp;

./tools/demos/ivshmem-demo is running/has run, i.e.,&nbsp;</div><div class=
=3D"gmail_quote">init_control has been set to 1. If ./tools/demos/ivshmem-d=
emo&nbsp;has not been</div><div class=3D"gmail_quote">run on the root cell =
yet, then starting the demo on the non-root cell will not</div><div class=
=3D"gmail_quote">kill the kernel.)</div><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote">To avoid the kernel crashing situation, I only=
 ran the demo on the</div><div class=3D"gmail_quote">non-root cell. With .i=
ommu being set validly, I will expect at least seeing the</div><div class=
=3D"gmail_quote">interrupt count increases,&nbsp; when&nbsp;grep ivshmem /p=
roc/interrupts.</div><div class=3D"gmail_quote">But nope, <u>still no inter=
rupts received on the root cell</u>.</div><div class=3D"gmail_quote"><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>We likely need better tooling (tracing) for these hairy cases...
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux</blockquote><div><br></div><=
div>Any more hints?</div><div><br></div><div>Kind regards,</div><div>Shihua=
</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6f3f0b24-cfee-4c08-86c4-8a0cc9183a2fn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6f3f0b24-cfee-4c08-86c4-8a0cc9183a2fn%40googlegroups.co=
m</a>.<br />

------=_Part_2563_318825764.1627319661490--

------=_Part_2562_433418793.1627319661490--
