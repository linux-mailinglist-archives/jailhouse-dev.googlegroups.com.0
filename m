Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBAPZ7CKAMGQEMNM6YQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103e.google.com (mail-pj1-x103e.google.com [IPv6:2607:f8b0:4864:20::103e])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEF853ED19
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jun 2022 19:42:28 +0200 (CEST)
Received: by mail-pj1-x103e.google.com with SMTP id j8-20020a17090a3e0800b001e3425c05c4sf6853077pjc.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jun 2022 10:42:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1654537346; cv=pass;
        d=google.com; s=arc-20160816;
        b=P17S2Y1t7NOwHnKcgPWqiHKQhUsW9WOCoSYKnkVUXBNCk+qAePmnj8tm+qi/XPTp00
         JdTRM1mDTTkng1VpnsF8nNbhbDHFi+3tui4lrQnUI5mhVPOArqns5krRszB0zymZezAh
         szinJ5Y6m5D7wZQwVzjpbzuzsYXitQjQIRAFqknKoNAZJfYmf7xPG5WvQc+zqw/JsNa0
         ZnaBg4uqHSo90WrxAe5m1/ognVP0rHJDE4RO0edyG113X8DgDdFoidu3d6IPe1ZwtyIH
         33QhlzLr/gNgtkt3/skOpKy1Gk8R5pMJYwzMtuCM0OXgco0ffp+PuEuuw7p1pdN0LD2f
         kJyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=S68HgP6z82seCO7TRbJB7xHC0x45X27opxPHLsCYcXI=;
        b=FlZmGpjTSwYPGgmpE4IJXhkK22vEfZtluAhLgnUu9rv4mdr+SBdnp6jP0+ne2UYc0L
         5aWHDKgGvRRn/WY4709aYlfrIQRy2rkiWSELaDymfAxPe9rxOuy17UFOkDIYwKUiZpMZ
         3x0OkdPbpxMz2n96HzdsfVNqGBSyx3YC4wIzBllDl2VGeoD+3vPMtciMzXkufdAkAwk0
         PDOuvoESiR3LVwfV5e4PrTXYx1x1z9RItfBtWaizNL1eH+BLQiPKGInNC2boCfaFRMer
         0nC5NJQdUSZZR5ZkALU+eyJcQOyOGV++TKJ90NFhrf754cBDt0yPessNKJoqfLM2LH3x
         7iYg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="HJPCtw+/";
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S68HgP6z82seCO7TRbJB7xHC0x45X27opxPHLsCYcXI=;
        b=DiR9muwYkDdUeTxjS4+H4Ny2zdsYkVIS9AGyOqlzWrbufTvwdRDvAXRWnUfXOIXiL1
         2TjmrTmiCBpDjHbSWSguvy5E6WA5hFZcxE/a67kACjs+wAHWGHk76EmcHa+OH9G+R/85
         guL5Wwg2I83fxnMkOyu6maCzWVWnVBWhBwXbwsdm7PPH0A5e8H8zwwyj6Lt0v1oaKmyM
         mL4A0kY6Sn8uuOrcq+Kz5rQj3u8Z2IEHOdPNXesst/r9oQuCq9bG6Id8BkYa37lwK8q8
         JTHIQFhoa2TzYa+KFhZE5qkKxibBgxgGhcIr0EqZbG2b1nzPma6wWstbWdvi0mLg4KiX
         oS2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S68HgP6z82seCO7TRbJB7xHC0x45X27opxPHLsCYcXI=;
        b=F1LldhGE84lFZR1rMJKamWbUetfmIqE8jmK9expj+E+clkEupEnKQhqZW4uQQSMU3Q
         KMuANmLlOlVNYgs7i5StNib+yoH8YazuX9rXytG3Y8uuppGzNY+hH/DoLLSyag12nW/z
         BSN7jf54ElgSw+XTP8yVX7H9tCNjzVzpldsopAEOeimCxCTwdz+S2qc7crqKwTTXOZIY
         kI0KYqkLFJgT5W/c++IJ0/ga1a1w04lX/n3J3CUj8mw8mbRDpInffvYxymUEPkFaAZvM
         MF6ybSOgA5TtbkceWuBL3FeWzlv6BpFhOPnA4G2zqHCRgXKHONbn2NJqpWGPLkpsZTJZ
         V5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S68HgP6z82seCO7TRbJB7xHC0x45X27opxPHLsCYcXI=;
        b=7Vt9FqwmkF9RwRAvjstfPwvOz/GeW20sNa2XsexxAI3/FBSITZ+7EQirlIDh4KAN6r
         dscxAbWsjCNNSCxGYrj7+SKGpYd60LDb7MpQAM3+mV2mCV+zm3xsCOVN8DnPDKWehE4V
         cq3UnEGj0OJ3hbyyUM/o6oDq7QN87ATcbpGmX7JYVN5mFyRWxvJgqWAFyaI/NoHCxYao
         m8VlAnHHJVKtJZHymFEtz7oJn8DsjbvWf+jnKEAA2DujvoiFQZTazWuXO8AV+IbvAV5Z
         E1S8V6PjcS/4Z9Zx7K5pBEx06UYEQ5jZbYZU/l4cloB9B8NzBlZyg3wl4rk/w87GWix8
         OhUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530gUbEwklv6zIik8SSuzdW4jxTFIbe+Fz0kq8GWpZUqesTAKeYR
	Ocdjll1FP0nDDtLRLEGCYYM=
X-Google-Smtp-Source: ABdhPJz6z+lMJQIULFWmQdLChNHhe+mcry1kPBbdqOuSqMYclgFKW6u3G5P9f+9w6LB5TXQGmHpO8g==
X-Received: by 2002:a63:4514:0:b0:3fc:20d2:2e74 with SMTP id s20-20020a634514000000b003fc20d22e74mr22146799pga.623.1654537346411;
        Mon, 06 Jun 2022 10:42:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:903:2d2:b0:162:1101:c89f with SMTP id
 s18-20020a17090302d200b001621101c89fls6936788plk.10.gmail; Mon, 06 Jun 2022
 10:42:25 -0700 (PDT)
X-Received: by 2002:a17:903:1252:b0:154:ca85:59a0 with SMTP id u18-20020a170903125200b00154ca8559a0mr25226318plh.169.1654537345207;
        Mon, 06 Jun 2022 10:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654537345; cv=none;
        d=google.com; s=arc-20160816;
        b=z3sglDSRvKngDO2EYjbEzSq3JjgbwoC3Thc/G75A1IxmVgNAVFi1/V3PuxPoWLZcIs
         QxBkpThNLrssnQLB93BrvxG3NyNQB4JLXlyDdLs9HiYkUJSco4+mvpgtnIyrbct9b5nC
         o5zybNeL6mfLnpmkgCR51VVTFybJis0nda9CDXLK7gqkksHABSSzC4nIAv0hRXjgqjw8
         8IeGsvC6Ydt3RH6HTNwoopmR/VWFOywRTSrB4z4krGo72MMUN+J6Nno0OjG+m6D2oO/9
         2hbrHuYTXL+XhONlSpp0DXT5iajfnHd9/l0HNtSe/0VgfVMmKv8ReJ9EZyHblmFdWO3K
         6CVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=OYqYcs+AhQSekjdrpokyLHr8m4jTuzRw4lxYz1NeCYk=;
        b=H8nhVhirHt0+NKDaboeBZGwoOmjH8U1pLCfOiPWpALhTsHB2PV174xVkJa+q7iYqMR
         Nx4+d2vczExw9ntAAA1gLIUxydVLcsGtzF6ne9KY38RiHmN/h29u0cspMHGIz4JLVlYE
         7jqGGUOVJ7rmc6VsM0V4CMH6B9syiQLyAEREdJ8u5gN1zJQIs3z+wZayqNv5Z0hefzu5
         INA0qGQ7FZg0XrDuDuMxMYUXnSBUgsDupbOZbBgyjAL0FlsRL09D/oTQdieqSi4RcviD
         I0R19NhA4tADaUsiirAFiDVKgzr8lp47tbi5hB77x64f77x3DBrx9FOsY30WjMhNluXq
         0j4Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="HJPCtw+/";
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com. [2607:f8b0:4864:20::b2d])
        by gmr-mx.google.com with ESMTPS id p6-20020a170903248600b00163a8206ac4si597495plw.0.2022.06.06.10.42.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 10:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b2d as permitted sender) client-ip=2607:f8b0:4864:20::b2d;
Received: by mail-yb1-xb2d.google.com with SMTP id l204so26932604ybf.10
        for <jailhouse-dev@googlegroups.com>; Mon, 06 Jun 2022 10:42:25 -0700 (PDT)
X-Received: by 2002:a05:6902:1407:b0:64a:ecc7:aa2 with SMTP id
 z7-20020a056902140700b0064aecc70aa2mr26178491ybu.645.1654537344265; Mon, 06
 Jun 2022 10:42:24 -0700 (PDT)
MIME-Version: 1.0
References: <94bae287-eaf2-4ae2-bcdd-fc87342256e5n@googlegroups.com>
 <CA+V-a8uE2PzOF2mh0xEQmQ=akMTWXHy7usqEaM1C754DHS1=+w@mail.gmail.com> <CA+V-a8uJVDLNGjtcoZHN_FcvVMnxq5MjQRudtR1zQznPja2Kng@mail.gmail.com>
In-Reply-To: <CA+V-a8uJVDLNGjtcoZHN_FcvVMnxq5MjQRudtR1zQznPja2Kng@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 6 Jun 2022 18:41:58 +0100
Message-ID: <CA+V-a8uoYz_CUxxstk8afHMKjOjHX9c=tWPAhFpoBKjfnb=TPA@mail.gmail.com>
Subject: Re: Linux imate unhandled read
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b="HJPCtw+/";       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b2d as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Thu, Jun 2, 2022 at 9:41 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> On Tue, May 31, 2022 at 8:13 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> >
> > On Tue, May 31, 2022 at 1:52 PM Prabhakar Lad
> > <prabhakar.csengg@gmail.com> wrote:
> > >
> > >
> > <snip>
> > > * Looking at some of the linux inmate  configs there are two regions of RAM specified is this a strict requirement?
> > > * For the inmate RAM should the virt_start = CONFIG_INMATE_BASE?
> > >
> > After updating my memory layout, i.e. after creating one region for
> > loading the linux another for DDR RAM and lastly the communication
> > region in my inmate I no longer see the unhandled read error.
> >
> >         /* linux-loader space */ {
> >             .phys_start = 0x59000000,
> >             .virt_start = 0x0,
> >             .size = 0x6400000,
> >             .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> >                 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> >         },
> >         /* RAM */ {
> >             .phys_start = 0x5F400000,
> >             .virt_start = 0x5F400000,
> >             .size = 0x19C00000,
> >             .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> >                 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
> >                 JAILHOUSE_MEM_LOADABLE,
> >         },
> >         /* communication region */ {
> >             .virt_start = 0x80000000,
> >             .size = 0x00001000,
> >             .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> >                 JAILHOUSE_MEM_COMM_REGION,
> >         },
> >
> > I am able to load the linux on one of the CPUs but I cannot see any
> > console output on the serial.
> >
> > root@hihope-rzg2m:~# jailhouse cell linux
> > renesas-r8a774a1-linux-demo.cell Image.gz -d
> > inmate-r8a774a1-hihope.dtb -c "clk_ignore_unused rootwait rw"
> > Started cell "renesas-r8a774a1-linux-demo"
> > root@hihope-rzg2m:~#
> > root@hihope-rzg2m:~# jailhouse cell list
> > ID      Name                    State             Assigned CPUs
> >    Failed CPUs
> > 0       Renesas HopeRun HiHope RZ/G2Mrunning           0,2-5
> > 1       renesas-r8a774a1-linux-demorunning           1
> > root@hihope-rzg2m:~#
> >
> > Any pointers on debugging this? (jailhouse cell stat 1 doesn't seem to
> > updating the number so I assume it's panicked somewhere)
> >
> I was able to get the console output on the root cell for debugging by
> setting "console=jailhouse earlycon..."
>
> I'm seeing that when trying to initialize the GIC its causing a panic:
>
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] unable to map gic dist registers
> [    0.000000] WARNING: CPU: 0 PID: 0 at
> drivers/irqchip/irq-gic.c:1393 gic_of_setup+0xa8/0xf0
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
>   5.10.31+ #37
> [    0.000000] Hardware name: Jailhouse cell on HopeRun HiHope RZ/G2M
> R8A774A1 (DT)
> [    0.000000] pstate: 60000085 (nZCv daIf -PAN -UAO -TCO BTYPE=--)
> [    0.000000] pc : gic_of_setup+0xa8/0xf0
> [    0.000000] lr : gic_of_setup+0xa8/0xf0
> [    0.000000] sp : ffff800011203dd0
> [    0.000000] x29: ffff800011203dd0 x28: ffff800010f936c0
> [    0.000000] x27: ffff80001120cc18 x26: ffff80001120cc18
> [    0.000000] x25: 0000000000000000 x24: ffff800011209000
> [    0.000000] x23: ffff000077c36460 x22: ffff80001120c000
> [    0.000000] x21: ffff800010f93000 x20: ffff000077c36460
> [    0.000000] x19: ffff80001120cc18 x18: ffffffffffffffff
> [    0.000000] x17: 00000000000000c0 x16: fffffdffffe00340
> [    0.000000] x15: ffff800011209948 x14: 0000000000000056
> [    0.000000] x13: ffff800011203a70 x12: 00000000ffffffea
> [    0.000000] x11: ffff8000112914c0 x10: ffff800011279480
> [    0.000000] x9 : ffff8000112794d8 x8 : 0000000000017fe8
> [    0.000000] x7 : c0000000ffffefff x6 : 0000000000000001
> [    0.000000] x5 : 0000000000000000 x4 : 0000000000000000
> [    0.000000] x3 : 00000000ffffffff x2 : ffff800011221450
> [    0.000000] x1 : 0000000000000000 x0 : 0000000000000000
> [    0.000000] Call trace:
> [    0.000000]  gic_of_setup+0xa8/0xf0
> [    0.000000]  gic_of_init+0x88/0x390
> [    0.000000]  of_irq_init+0x194/0x33c
> [    0.000000]  irqchip_init+0x18/0x40
> [    0.000000]  init_IRQ+0xc8/0xfc
> [    0.000000]  start_kernel+0x2ec/0x4f8
> [    0.000000] ---[ end trace f68728a0d3053b52 ]---
> [    0.000000] OF: of_irq_init: children remain, but no parents
> [    0.000000] Kernel panic - not syncing: No interrupt controller found.
> [    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
>   5.10.31+ #37
> [    0.000000] Hardware name: Jailhouse cell on HopeRun HiHope RZ/G2M
> R8A774A1 (DT)
> [    0.000000] Call trace:
> [    0.000000]  dump_backtrace+0x0/0x1c0
> [    0.000000]  show_stack+0x18/0x68
> [    0.000000]  dump_stack+0xd8/0x134
> [    0.000000]  panic+0x188/0x3a8
> [    0.000000]  init_IRQ+0xe0/0xfc
> [    0.000000]  start_kernel+0x2ec/0x4f8
> [    0.000000] ---[ end Kernel panic - not syncing: No interrupt
> controller found. ]---
>
I was able to resolve the issue by fixing the DT.

Cheers,
Prabhakar

> I have the below GIC node in the inmate dts:
>
>     gic: interrupt-controller@f1010000 {
>         compatible = "arm,gic-400";
>         #interrupt-cells = <3>;
>         #address-cells = <0>;
>         interrupt-controller;
>         reg = <0x0 0xf1010000 0 0x1000>,
>             <0x0 0xf1020000 0 0x20000>,
>             <0x0 0xf1040000 0 0x20000>,
>             <0x0 0xf1060000 0 0x20000>;
>         interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
>     };
>
> In the inmate cell file for GIC configuration, do we need to enable
> pin_bitmap mask just for the peripherals which are only enabled in DT
> (For now I have the pin_bitmap mask in the inmate cell same as the
> root cell) ?
>
> Cheers,
> Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uoYz_CUxxstk8afHMKjOjHX9c%3DtWPAhFpoBKjfnb%3DTPA%40mail.gmail.com.
