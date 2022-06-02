Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBZ7P4GKAMGQEG6UUB2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103d.google.com (mail-pj1-x103d.google.com [IPv6:2607:f8b0:4864:20::103d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F34953B545
	for <lists+jailhouse-dev@lfdr.de>; Thu,  2 Jun 2022 10:42:17 +0200 (CEST)
Received: by mail-pj1-x103d.google.com with SMTP id s18-20020a17090aa11200b001d92f7609e8sf2491499pjp.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 02 Jun 2022 01:42:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1654159336; cv=pass;
        d=google.com; s=arc-20160816;
        b=r43BqeeH4hXBl169hxKY5dV4iPU6LcrOOvBcMq7jFDmsHLphkvUPCqS1UAkTHHpoH9
         PwWK6Sx/CTrFRv+TRhy7zepVvQwwLF0HQlaOSBGJaQp245JxMiNtXXo29pg9eEDeb3Xd
         qr/T4YwjSljsMCpnS6QrY9CqUH1gNZLzXru/aNZ631oS8XC/XBHTS1ONaA2qpC+K43qA
         g6ATRIUSiTOQgQJJfXE5c9yq4IfzpsqtcEu9JndhDIMM8uR/67H/bnig4pvofyODdyuO
         Yy4Nv/WKX6dJAoY2cQ3Qi06imYKxcyZLDEJTMP5wnJiPdwfm0E7naE8nu8jeXl4e5ucT
         ISCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=O19w6Wkai9FSYTEIXr+FzGfVpMi2FDkUH8bDKyvMRfM=;
        b=F2cBppmgxhW3shi4yytagFt+UiwvxDXmMflk/wFuqHvvAf0Rka9QAjAcdnPq6/rvPk
         j0Od//oQ7+77gEv8NFiFmsIs7ODZbbItp8nYefuUfn224PzICpiaMuUdI+mlL3F3yLVP
         BOU+MUvZucCCwAs5LbxRpCVYnKP+0x2X8IzhAC6b2BgTplfTKAu8Qie/JmZnWsV+LN2Q
         87h9q9yyeS+fiAZhL5Ef0Vn0gQNIZz5ES/8B442NtrxYSPI0IgYsWK0cuyjTsKAuo/Db
         a0xaq7igyggoIufWG1CHv6u4lMkyCjZwjq0vVjrfAZzr0hDz/hYqTIly8cCrUSNDRlxo
         wvHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="Eu/0mgrf";
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b32 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O19w6Wkai9FSYTEIXr+FzGfVpMi2FDkUH8bDKyvMRfM=;
        b=nLtkLNxxEbCmjmI7be+i0sngY8DZvfoa3WUBUhlpqQkvDVPQ7M5HMrMCeMBVYvUNbh
         XAqr3cLV8BuHaKMgOMGlwEfbVyIhTiqE3ozpX6LfgM8mykiAUkZsZU0HKGBTuHCoHnp+
         bR3ZDR7FhFuNUgal7zoDGCdJwhakBjoVaTXWOIsYs/h+OwD45PdhbzqHW8sL1GOH6zWC
         dAAx39RU3whS81CZyq2Bo+4bF8Z650b9FJ0YGhwFe6inHChDUM5HlWTk9l4bIz18iCQK
         LUlQFnmbIRMmPRl+j/U8VcHr/9oirAbmzIQbMLkCOaNY7iDt2SaIfVWhqKcwwLdFczJl
         ddqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O19w6Wkai9FSYTEIXr+FzGfVpMi2FDkUH8bDKyvMRfM=;
        b=m8kZ4NbUu57JI0vRr2HQ3UJdoGnsNf2WymSn7mucl563LodzAUH28HP4D26OEvsI1E
         TnpaiMmOTIQCRb3ZrrR0lhPfIWgkLjtihO4pFaz8qAEyMB9XyXue7hNVHxVEuSaamxnH
         rWXYoTatJmRkywYUzipmE38+XSQk7c6iHm3geUcbwOUzOtij1Ak7brIyedfdA1actGRZ
         oqVrXKZ7Y/mvfUff3EneFoURiYd96luZZdSs/v7oJpmc8vk2gDyjQv6l8unkIhDJX2Wi
         S2meUWKLsok7/Om/TdBDy9aYb4YtAgm653o1VVrRrUy4IF8a3CZ2IZo36if6OlXjOfHB
         XjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O19w6Wkai9FSYTEIXr+FzGfVpMi2FDkUH8bDKyvMRfM=;
        b=gwCXzp/MKvWm/CfQdobDy8MizJL55mL6B157Vpg+gughHUUK3Cinvyg6J7YQuf6Roq
         CUHqFN6C9rC+EqeFSiUmDtromcM8gmzL307mz5hl6M7731ZCD24tosuSSYs5vt4O7aOa
         yUt5zYcwC5Us/lwj+GfplvORdSuHoMFZnuPoYMu8/caG4Jf9zIOfNGxtRr21MocAlsx7
         GmmCnrDidJd3eYXSPlHdKgBhgk4hUfdK+vYXGCwpOS2lNHt3WHHB2LiHAhxyzFgMTHnB
         Ssm3G7Qrjxu0zCyaGINw2HejS7/a9qbfJORoX8qmi8CV/yJBuRzJUNZbQgZSHwOoQEto
         ZAkg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NOrQy2RK7HmEdSSxI4hOMoe4QRLjidjk/S3rK0BBUDdLmIg6v
	riD/xRIHzRuP5Qjpi1oNMxk=
X-Google-Smtp-Source: ABdhPJzeHsU9X97Xtpss7dZd4Lpl3XcRB7RXAr7jZT1xdkVs2X7UZsQ82/aKF87YmSe0eaLmTd1kYA==
X-Received: by 2002:a65:6a16:0:b0:39d:4f3:67e6 with SMTP id m22-20020a656a16000000b0039d04f367e6mr3345543pgu.84.1654159335730;
        Thu, 02 Jun 2022 01:42:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:1a53:b0:51b:b47d:4c10 with SMTP id
 h19-20020a056a001a5300b0051bb47d4c10ls2149596pfv.11.gmail; Thu, 02 Jun 2022
 01:42:14 -0700 (PDT)
X-Received: by 2002:a63:91c2:0:b0:3fc:8f8e:ec48 with SMTP id l185-20020a6391c2000000b003fc8f8eec48mr3220292pge.578.1654159334518;
        Thu, 02 Jun 2022 01:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654159334; cv=none;
        d=google.com; s=arc-20160816;
        b=C8NHIYoRn5l4gUDC76AmIvgeEGBWYcGS7YhlAlHH76IR6KhOTuIGOvhmT0mcUX044N
         AV6SO1dJRujTl99/4M6ND4/eb54YjXfo7sHBJmWvASTUytgkcqoICGfam2sHM+AwTnkR
         Axebh5zppCfsQTuH30dbvphVW2hrOT5yaxRXugdXOkBOYSQTjFRKDsCZN1HIlLUG2tvI
         jkuQuyQaBeBV6i+oH5QvvfWBnPlHbLmvgUcEPt9LspJFXCQm+yxXxwLgEvBo7poTmS7a
         X52R7GF0lSGSSapKrABaWBUGj0d728VtQXjmXQgM2fw1fyywXC0O7xh5PCNxSVlsNpOG
         8JtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7Xpv4xY4lmU84DkB8MyQuiasQCQLI6CtFUGK1eALjCg=;
        b=BvQNGP6BANAksBXmZD4oa1ZssZXAm2MiZbsGqNTfyBskaUaI9zAIR0kvv7FrCZNRf0
         pL6FUrSe/SJ6yj/W5x7FLbTg0LXeoagrJkDM2FFVMF2G59lVzRRvQmYjeg+4uyQ3ngwl
         02Bdnwq1Vqm2UJUuPX/mIArTSTPDnbF56Kpmel7UAOyErq0p2RO+QHjbRvf9Fh9SQzLj
         248wVztC/pMVqTeFyqsw2WVQZL1c4sml/D26KtBbiIMBWbccL7beAyfQVDpi72F4K9XB
         1wsEUdMNgLjnvlifLj7R5UkCj1G0QS9y6psgk2R2awEfRtwH9PvIeD0Xb1cWqm6toryx
         2i0A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="Eu/0mgrf";
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b32 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com. [2607:f8b0:4864:20::b32])
        by gmr-mx.google.com with ESMTPS id y11-20020a170902d64b00b001635db610absi154412plh.3.2022.06.02.01.42.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 01:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b32 as permitted sender) client-ip=2607:f8b0:4864:20::b32;
Received: by mail-yb1-xb32.google.com with SMTP id a64so7108180ybg.11
        for <jailhouse-dev@googlegroups.com>; Thu, 02 Jun 2022 01:42:14 -0700 (PDT)
X-Received: by 2002:a25:d609:0:b0:65c:f2a1:6cf0 with SMTP id
 n9-20020a25d609000000b0065cf2a16cf0mr4136683ybg.417.1654159334000; Thu, 02
 Jun 2022 01:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <94bae287-eaf2-4ae2-bcdd-fc87342256e5n@googlegroups.com> <CA+V-a8uE2PzOF2mh0xEQmQ=akMTWXHy7usqEaM1C754DHS1=+w@mail.gmail.com>
In-Reply-To: <CA+V-a8uE2PzOF2mh0xEQmQ=akMTWXHy7usqEaM1C754DHS1=+w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jun 2022 09:41:48 +0100
Message-ID: <CA+V-a8uJVDLNGjtcoZHN_FcvVMnxq5MjQRudtR1zQznPja2Kng@mail.gmail.com>
Subject: Re: Linux imate unhandled read
To: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b="Eu/0mgrf";       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b32 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Tue, May 31, 2022 at 8:13 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> On Tue, May 31, 2022 at 1:52 PM Prabhakar Lad
> <prabhakar.csengg@gmail.com> wrote:
> >
> >
> <snip>
> > * Looking at some of the linux inmate  configs there are two regions of RAM specified is this a strict requirement?
> > * For the inmate RAM should the virt_start = CONFIG_INMATE_BASE?
> >
> After updating my memory layout, i.e. after creating one region for
> loading the linux another for DDR RAM and lastly the communication
> region in my inmate I no longer see the unhandled read error.
>
>         /* linux-loader space */ {
>             .phys_start = 0x59000000,
>             .virt_start = 0x0,
>             .size = 0x6400000,
>             .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>                 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>         },
>         /* RAM */ {
>             .phys_start = 0x5F400000,
>             .virt_start = 0x5F400000,
>             .size = 0x19C00000,
>             .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>                 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>                 JAILHOUSE_MEM_LOADABLE,
>         },
>         /* communication region */ {
>             .virt_start = 0x80000000,
>             .size = 0x00001000,
>             .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>                 JAILHOUSE_MEM_COMM_REGION,
>         },
>
> I am able to load the linux on one of the CPUs but I cannot see any
> console output on the serial.
>
> root@hihope-rzg2m:~# jailhouse cell linux
> renesas-r8a774a1-linux-demo.cell Image.gz -d
> inmate-r8a774a1-hihope.dtb -c "clk_ignore_unused rootwait rw"
> Started cell "renesas-r8a774a1-linux-demo"
> root@hihope-rzg2m:~#
> root@hihope-rzg2m:~# jailhouse cell list
> ID      Name                    State             Assigned CPUs
>    Failed CPUs
> 0       Renesas HopeRun HiHope RZ/G2Mrunning           0,2-5
> 1       renesas-r8a774a1-linux-demorunning           1
> root@hihope-rzg2m:~#
>
> Any pointers on debugging this? (jailhouse cell stat 1 doesn't seem to
> updating the number so I assume it's panicked somewhere)
>
I was able to get the console output on the root cell for debugging by
setting "console=jailhouse earlycon..."

I'm seeing that when trying to initialize the GIC its causing a panic:

[    0.000000] ------------[ cut here ]------------
[    0.000000] unable to map gic dist registers
[    0.000000] WARNING: CPU: 0 PID: 0 at
drivers/irqchip/irq-gic.c:1393 gic_of_setup+0xa8/0xf0
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
  5.10.31+ #37
[    0.000000] Hardware name: Jailhouse cell on HopeRun HiHope RZ/G2M
R8A774A1 (DT)
[    0.000000] pstate: 60000085 (nZCv daIf -PAN -UAO -TCO BTYPE=--)
[    0.000000] pc : gic_of_setup+0xa8/0xf0
[    0.000000] lr : gic_of_setup+0xa8/0xf0
[    0.000000] sp : ffff800011203dd0
[    0.000000] x29: ffff800011203dd0 x28: ffff800010f936c0
[    0.000000] x27: ffff80001120cc18 x26: ffff80001120cc18
[    0.000000] x25: 0000000000000000 x24: ffff800011209000
[    0.000000] x23: ffff000077c36460 x22: ffff80001120c000
[    0.000000] x21: ffff800010f93000 x20: ffff000077c36460
[    0.000000] x19: ffff80001120cc18 x18: ffffffffffffffff
[    0.000000] x17: 00000000000000c0 x16: fffffdffffe00340
[    0.000000] x15: ffff800011209948 x14: 0000000000000056
[    0.000000] x13: ffff800011203a70 x12: 00000000ffffffea
[    0.000000] x11: ffff8000112914c0 x10: ffff800011279480
[    0.000000] x9 : ffff8000112794d8 x8 : 0000000000017fe8
[    0.000000] x7 : c0000000ffffefff x6 : 0000000000000001
[    0.000000] x5 : 0000000000000000 x4 : 0000000000000000
[    0.000000] x3 : 00000000ffffffff x2 : ffff800011221450
[    0.000000] x1 : 0000000000000000 x0 : 0000000000000000
[    0.000000] Call trace:
[    0.000000]  gic_of_setup+0xa8/0xf0
[    0.000000]  gic_of_init+0x88/0x390
[    0.000000]  of_irq_init+0x194/0x33c
[    0.000000]  irqchip_init+0x18/0x40
[    0.000000]  init_IRQ+0xc8/0xfc
[    0.000000]  start_kernel+0x2ec/0x4f8
[    0.000000] ---[ end trace f68728a0d3053b52 ]---
[    0.000000] OF: of_irq_init: children remain, but no parents
[    0.000000] Kernel panic - not syncing: No interrupt controller found.
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W
  5.10.31+ #37
[    0.000000] Hardware name: Jailhouse cell on HopeRun HiHope RZ/G2M
R8A774A1 (DT)
[    0.000000] Call trace:
[    0.000000]  dump_backtrace+0x0/0x1c0
[    0.000000]  show_stack+0x18/0x68
[    0.000000]  dump_stack+0xd8/0x134
[    0.000000]  panic+0x188/0x3a8
[    0.000000]  init_IRQ+0xe0/0xfc
[    0.000000]  start_kernel+0x2ec/0x4f8
[    0.000000] ---[ end Kernel panic - not syncing: No interrupt
controller found. ]---

I have the below GIC node in the inmate dts:

    gic: interrupt-controller@f1010000 {
        compatible = "arm,gic-400";
        #interrupt-cells = <3>;
        #address-cells = <0>;
        interrupt-controller;
        reg = <0x0 0xf1010000 0 0x1000>,
            <0x0 0xf1020000 0 0x20000>,
            <0x0 0xf1040000 0 0x20000>,
            <0x0 0xf1060000 0 0x20000>;
        interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
    };

In the inmate cell file for GIC configuration, do we need to enable
pin_bitmap mask just for the peripherals which are only enabled in DT
(For now I have the pin_bitmap mask in the inmate cell same as the
root cell) ?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uJVDLNGjtcoZHN_FcvVMnxq5MjQRudtR1zQznPja2Kng%40mail.gmail.com.
