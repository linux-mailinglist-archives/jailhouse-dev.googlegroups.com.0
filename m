Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVFYYXTAKGQEKTAA2GY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E33161D6
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 12:22:12 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id c26sf99154lfm.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 03:22:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557224532; cv=pass;
        d=google.com; s=arc-20160816;
        b=bz28ZWx2qZmRynibhpzIwxgPRRz6xT/kJMn0HwNCW/SfwjGWGKGvamTlTSGjOWKRrC
         AhXfxouofxUZ00yQRzwDLEMNiGxVbjs/tmTYnlYRCPTW+BrnVyJqfgXql2m/Jg/e9ag3
         +l9kMh3i5wkLSAfjEnAiqRIJR4s5fqWBCRe6oZAsiCapAqWT98IiC3p+SAR7K6tepZF6
         ZoUn+iEaRBgjRXmcp7JuPm8BC3tuDk3KlCkKFN5MLWcfZS6Gh6WE/6dBSSqfclEQYMRj
         JoYSsvDG7HF4HrdFniD6np6OpC01QNbAZp9xB/KE1G4ZPJpyAD3NKzD+D4QMd4DWwn1G
         0ZEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=I23uqBdqjOYSWP4M8nzxUEz00OolqyETncRsgM1Y+5A=;
        b=GNyvCSReZxaZtNlemNJDYT5b8YLC6i5cY9hwWAhZOI6J0kkz2CNLnS4nN+jJIKKxdd
         E4n8RHv8BvG4VLdAK1/X75Rr8W0M0rCOq+da+7ir1mPEfbLAJxh2ji72XiJEpIxpUECg
         VcXHTVLBWKKax4q0OudfIXW62RKvOGpHf6s8FcUJ856PkbxROO7QvEQdFs4KIrMVSJzX
         +necZfOmNLRXWUy5XxaerKibzLlIEy9EIffAUxOMrfmA/E/KTu0fLHJnR2dgIHgTRxD8
         9LPhuvZLfte5M4cRPbI5hkGzWeCfgRkuiDaNi63SaZ9wFSm5TrlPwm9c7nq+fniIBukp
         v6ag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I23uqBdqjOYSWP4M8nzxUEz00OolqyETncRsgM1Y+5A=;
        b=YXa74TN6e3OmRnoci1XVXHN8hx0VLk2LamGYEFF3h9s5+NtkoHWR45m8Y/875sGxV5
         LvoTbdxmvkPBewitRWSn/QBq0eohYtS2AE7FKMoNQpsKcpBLrLsc9L/2M6LrPGYhMx1s
         BrAzYGY0RTSPLCfJSFG0fuZ+PcSpFo5PMEsnr/iOfq/S1zeSV4I+dh9FAim0G/HAkM/N
         7MTNjsplnN+SKuk1dSk6AWUO45DB9m1A04v5bGYYUo/PPLfJuphbQLGIqqt3prFEOKfm
         MPXlqJ3EIPINIuUdlxJ0n5NN3yqNn0wfCPxmQKtLdvUTSTUtAUJWCy3p/7rXeb2yl9QA
         +uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=I23uqBdqjOYSWP4M8nzxUEz00OolqyETncRsgM1Y+5A=;
        b=HUwfqQHf0myOQgtk8Q3ncUpPF+kkogYwBmou20jpLGx/eL5CLeKODKa2xlXCos6koS
         Zq/vpO++X5pF2T2SCyCB4ouEl0Gp00wPGBGj16eA/LJVSNp/ZdvOW3gx54Ce5CF5NctA
         iSWPvJo/KGgfQH5VXszwCW6TS/2kvAsGJTq7hQJPUMj2t6Y/wDtzKXIyjbdueJnMVWTR
         prV2M2zH/Ustghc7MDYihOPvDeAFjzk0fGNVXUHBUWnl0c9eWlJHmCHrAqk1ej8gisW1
         LFkDvZhbYDFP4BjczGfejV34AVWGQcuSRkPoLEzZ+jAvItdrSxqjEHjwCMOUtpQJz5iZ
         S+bw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUOFkxOm8467mnIHjgqwdam055O8AKzAR1FHYNm7rCkhH3z3AN+
	0eWdZ1yI/SlfKbaa+2QAxuM=
X-Google-Smtp-Source: APXvYqzIW08FGc/f+QcRnWQHmaMTZ9gpt8+vokmgS9JCvsYBE/SyZkqggxma9aEdxYUy05qhvKq65Q==
X-Received: by 2002:a19:4f54:: with SMTP id a20mr15834444lfk.136.1557224532460;
        Tue, 07 May 2019 03:22:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:539a:: with SMTP id g26ls1354592lfh.12.gmail; Tue, 07
 May 2019 03:22:11 -0700 (PDT)
X-Received: by 2002:a05:6512:206:: with SMTP id a6mr1589015lfo.18.1557224531399;
        Tue, 07 May 2019 03:22:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557224531; cv=none;
        d=google.com; s=arc-20160816;
        b=ST3UjlqB7wlqozFKOTx3D4XMSdwzqy2f/+zIy0RAh9uREAn7eK/waa22Yo8O3uNoyK
         IEEX1hsAhDjEguvGvNBBk/2fMdtDWPeGbhrqJFaTA5tvhBhwGeEoBZhKGQ5OhwtZeedP
         4lloTsteRl00V2heqhuGgdRrpMSiT20KsQP86w0dmLYYMBPFrTIB5oySL+khK5j787QW
         OAYHWIy023L695s9ulOeOSVhQAzGwDuGUmqyf2a34otEcPJ36WRWtzUVGFBk3NpKA5v5
         wUf/gR4kFhCBomzNm2DP5Kjx9KGt3uHZJJTftzATlWR14f/wHtJehG8rbGNPsGvqEnPb
         cnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=2OqkmexdBQzMkcrRoN8vwiQnCNCGjGVjM/viK26fXyI=;
        b=GpzdNsDCME7L0CU7neDEi5WPDeinuHu2A35VC9b+UviiBeAnraScBLbiZ1lrSpFAXd
         Nf9ujUt/VrXeOelVqpEGPwSlh4qH2CJUvW7C0NVJ/CI7jLoCUImMZNFqVlEcaTSoFn1C
         cDdIyYiz0mhUbYt77sK5AfMzqnoEee+uudJSvXNqluN9flC/p0bh+8/NE7FeQcnkwh7N
         7gL/wUTe6/KewtBMkEGlaVSccwjvjLdzI01tfUe1n4ooc3M5qQzUlB5bNjD3K6eqpkFC
         jc0THLv0Ppm3UixKbOS9RnoxrGXCkYB/9Rr/+kT5DtemM1hZYQOkLQacWbMUuqBi2krm
         6CJg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id c22si504633lfh.5.2019.05.07.03.22.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 03:22:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x47AMAYs030220
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 12:22:10 +0200
Received: from [139.25.69.165] ([139.25.69.165])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x47AMABb011268;
	Tue, 7 May 2019 12:22:10 +0200
Subject: Re: [PATCH v2] configs: define ARRAY_SIZE in cell-config.h
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20190506114328.32103-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <344b281a-30b9-80c9-d1e4-a57c2f89928c@siemens.com>
Date: Tue, 7 May 2019 12:22:09 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190506114328.32103-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 06.05.19 13:43, Ralf Ramsauer wrote:
> instead of defining this useful macro in every single config file.
> 
> There's only one quirk: ARRAY_SIZE is defined for hypervisor code in util.h,
> which we can't include in cell-config.h, as it's GPL-only. So we have to
> duplicate the definitions, which might lead to redefinitions of the macro.
> Hence, surround the macro by guards.
> 
> Also remove the macro from the root cell template.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
> 
> Removed this patch from the series.
> 
> since v1: Leave a comment why we need guards around ARRAY_SIZE
> 
>   configs/arm/bananapi-gic-demo.c               | 2 --
>   configs/arm/bananapi-linux-demo.c             | 2 --
>   configs/arm/bananapi-uart-demo.c              | 2 --
>   configs/arm/bananapi.c                        | 2 --
>   configs/arm/emtrion-rzg1e-linux-demo.c        | 2 --
>   configs/arm/emtrion-rzg1e-uart-demo.c         | 2 --
>   configs/arm/emtrion-rzg1e.c                   | 2 --
>   configs/arm/emtrion-rzg1h-linux-demo.c        | 2 --
>   configs/arm/emtrion-rzg1h-uart-demo.c         | 2 --
>   configs/arm/emtrion-rzg1h.c                   | 2 --
>   configs/arm/emtrion-rzg1m-linux-demo.c        | 2 --
>   configs/arm/emtrion-rzg1m-uart-demo.c         | 2 --
>   configs/arm/emtrion-rzg1m.c                   | 2 --
>   configs/arm/jetson-tk1-demo.c                 | 2 --
>   configs/arm/jetson-tk1-linux-demo.c           | 2 --
>   configs/arm/jetson-tk1.c                      | 2 --
>   configs/arm/orangepi0-gic-demo.c              | 2 --
>   configs/arm/orangepi0-linux-demo.c            | 2 --
>   configs/arm/orangepi0.c                       | 2 --
>   configs/arm64/amd-seattle-gic-demo.c          | 2 --
>   configs/arm64/amd-seattle-linux-demo.c        | 2 --
>   configs/arm64/amd-seattle-uart-demo.c         | 2 --
>   configs/arm64/amd-seattle.c                   | 2 --
>   configs/arm64/espressobin-gic-demo.c          | 2 --
>   configs/arm64/espressobin-linux-demo.c        | 2 --
>   configs/arm64/espressobin.c                   | 2 --
>   configs/arm64/foundation-v8-gic-demo.c        | 2 --
>   configs/arm64/foundation-v8-linux-demo.c      | 2 --
>   configs/arm64/foundation-v8-uart-demo.c       | 2 --
>   configs/arm64/foundation-v8.c                 | 2 --
>   configs/arm64/hikey-gic-demo.c                | 2 --
>   configs/arm64/hikey-linux-demo.c              | 2 --
>   configs/arm64/hikey.c                         | 2 --
>   configs/arm64/imx8mq-gic-demo.c               | 2 --
>   configs/arm64/imx8mq.c                        | 2 --
>   configs/arm64/jetson-tx1-demo.c               | 2 --
>   configs/arm64/jetson-tx1-linux-demo.c         | 2 --
>   configs/arm64/jetson-tx1.c                    | 2 --
>   configs/arm64/jetson-tx2-demo.c               | 2 --
>   configs/arm64/jetson-tx2.c                    | 2 --
>   configs/arm64/k3-am654-gic-demo.c             | 2 --
>   configs/arm64/k3-am654-idk-linux-demo.c       | 2 --
>   configs/arm64/k3-am654-idk.c                  | 2 --
>   configs/arm64/k3-am654-uart-demo.c            | 2 --
>   configs/arm64/macchiatobin-gic-demo.c         | 2 --
>   configs/arm64/macchiatobin-linux-demo.c       | 2 --
>   configs/arm64/macchiatobin.c                  | 2 --
>   configs/arm64/miriac-sbc-ls1046a-gic-demo.c   | 2 --
>   configs/arm64/miriac-sbc-ls1046a-linux-demo.c | 2 --
>   configs/arm64/miriac-sbc-ls1046a.c            | 2 --
>   configs/arm64/qemu-arm64-gic-demo.c           | 2 --
>   configs/arm64/qemu-arm64-linux-demo.c         | 2 --
>   configs/arm64/qemu-arm64.c                    | 2 --
>   configs/arm64/ultra96-gic-demo.c              | 2 --
>   configs/arm64/ultra96-linux-demo.c            | 2 --
>   configs/arm64/ultra96.c                       | 2 --
>   configs/arm64/zynqmp-zcu102-gic-demo.c        | 2 --
>   configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 2 --
>   configs/arm64/zynqmp-zcu102-linux-demo.c      | 2 --
>   configs/arm64/zynqmp-zcu102.c                 | 2 --
>   configs/x86/apic-demo.c                       | 2 --
>   configs/x86/e1000-demo.c                      | 2 --
>   configs/x86/f2a88xm-hd3.c                     | 2 --
>   configs/x86/imb-a180.c                        | 2 --
>   configs/x86/ioapic-demo.c                     | 2 --
>   configs/x86/ivshmem-demo.c                    | 2 --
>   configs/x86/linux-x86-demo.c                  | 2 --
>   configs/x86/pci-demo.c                        | 2 --
>   configs/x86/qemu-x86.c                        | 2 --
>   configs/x86/smp-demo.c                        | 2 --
>   configs/x86/tiny-demo.c                       | 2 --
>   hypervisor/include/jailhouse/utils.h          | 7 +++++++
>   include/jailhouse/cell-config.h               | 4 ++++
>   tools/root-cell-config.c.tmpl                 | 2 --
>   74 files changed, 11 insertions(+), 144 deletions(-)
> 
> diff --git a/configs/arm/bananapi-gic-demo.c b/configs/arm/bananapi-gic-demo.c
> index 757d9503..855a72a7 100644
> --- a/configs/arm/bananapi-gic-demo.c
> +++ b/configs/arm/bananapi-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
> index e9e584f2..fd1931f3 100644
> --- a/configs/arm/bananapi-linux-demo.c
> +++ b/configs/arm/bananapi-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/bananapi-uart-demo.c b/configs/arm/bananapi-uart-demo.c
> index aeec6f8d..0621ca52 100644
> --- a/configs/arm/bananapi-uart-demo.c
> +++ b/configs/arm/bananapi-uart-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
> index e7e6bb1e..ffc4589c 100644
> --- a/configs/arm/bananapi.c
> +++ b/configs/arm/bananapi.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
> index ea638989..1bf08b66 100644
> --- a/configs/arm/emtrion-rzg1e-linux-demo.c
> +++ b/configs/arm/emtrion-rzg1e-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/emtrion-rzg1e-uart-demo.c b/configs/arm/emtrion-rzg1e-uart-demo.c
> index a2590adb..42c74127 100644
> --- a/configs/arm/emtrion-rzg1e-uart-demo.c
> +++ b/configs/arm/emtrion-rzg1e-uart-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
> index 0a38ed8d..e3872cf2 100644
> --- a/configs/arm/emtrion-rzg1e.c
> +++ b/configs/arm/emtrion-rzg1e.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
> index 61c58666..ad2dceeb 100644
> --- a/configs/arm/emtrion-rzg1h-linux-demo.c
> +++ b/configs/arm/emtrion-rzg1h-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/emtrion-rzg1h-uart-demo.c b/configs/arm/emtrion-rzg1h-uart-demo.c
> index d8076be5..f20c94cb 100644
> --- a/configs/arm/emtrion-rzg1h-uart-demo.c
> +++ b/configs/arm/emtrion-rzg1h-uart-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
> index a23e1589..03e1be5b 100644
> --- a/configs/arm/emtrion-rzg1h.c
> +++ b/configs/arm/emtrion-rzg1h.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
> index 0c3d0cfd..d8b8441a 100644
> --- a/configs/arm/emtrion-rzg1m-linux-demo.c
> +++ b/configs/arm/emtrion-rzg1m-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/emtrion-rzg1m-uart-demo.c b/configs/arm/emtrion-rzg1m-uart-demo.c
> index 3a0eda5c..c89c1d82 100644
> --- a/configs/arm/emtrion-rzg1m-uart-demo.c
> +++ b/configs/arm/emtrion-rzg1m-uart-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
> index f97805f7..84d68f62 100644
> --- a/configs/arm/emtrion-rzg1m.c
> +++ b/configs/arm/emtrion-rzg1m.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm/jetson-tk1-demo.c b/configs/arm/jetson-tk1-demo.c
> index 7562222c..57ea5a3d 100644
> --- a/configs/arm/jetson-tk1-demo.c
> +++ b/configs/arm/jetson-tk1-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   #ifndef CONFIG_INMATE_BASE
>   #define CONFIG_INMATE_BASE 0x0
>   #endif
> diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
> index 16d79774..7ee83f7a 100644
> --- a/configs/arm/jetson-tk1-linux-demo.c
> +++ b/configs/arm/jetson-tk1-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
> index 9e2e23f9..7374ef44 100644
> --- a/configs/arm/jetson-tk1.c
> +++ b/configs/arm/jetson-tk1.c
> @@ -18,8 +18,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm/orangepi0-gic-demo.c b/configs/arm/orangepi0-gic-demo.c
> index 45c38425..51b3bf8b 100644
> --- a/configs/arm/orangepi0-gic-demo.c
> +++ b/configs/arm/orangepi0-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
> index e7154078..49ee10e9 100644
> --- a/configs/arm/orangepi0-linux-demo.c
> +++ b/configs/arm/orangepi0-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
> index 9eca773d..e45c8d62 100644
> --- a/configs/arm/orangepi0.c
> +++ b/configs/arm/orangepi0.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/amd-seattle-gic-demo.c b/configs/arm64/amd-seattle-gic-demo.c
> index d407d6e3..5a4d726a 100644
> --- a/configs/arm64/amd-seattle-gic-demo.c
> +++ b/configs/arm64/amd-seattle-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
> index 96edbc4f..5349323c 100644
> --- a/configs/arm64/amd-seattle-linux-demo.c
> +++ b/configs/arm64/amd-seattle-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/amd-seattle-uart-demo.c b/configs/arm64/amd-seattle-uart-demo.c
> index 61073486..bcaac58d 100644
> --- a/configs/arm64/amd-seattle-uart-demo.c
> +++ b/configs/arm64/amd-seattle-uart-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
> index 911ae1da..b5cff3b3 100644
> --- a/configs/arm64/amd-seattle.c
> +++ b/configs/arm64/amd-seattle.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/espressobin-gic-demo.c b/configs/arm64/espressobin-gic-demo.c
> index 452ab668..6de940d7 100644
> --- a/configs/arm64/espressobin-gic-demo.c
> +++ b/configs/arm64/espressobin-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
> index c0b09981..92da96e9 100644
> --- a/configs/arm64/espressobin-linux-demo.c
> +++ b/configs/arm64/espressobin-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
> index d620080d..a23dc24b 100644
> --- a/configs/arm64/espressobin.c
> +++ b/configs/arm64/espressobin.c
> @@ -17,8 +17,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/foundation-v8-gic-demo.c b/configs/arm64/foundation-v8-gic-demo.c
> index 5d69e01e..8b1ff1ac 100644
> --- a/configs/arm64/foundation-v8-gic-demo.c
> +++ b/configs/arm64/foundation-v8-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/foundation-v8-linux-demo.c b/configs/arm64/foundation-v8-linux-demo.c
> index 86fe8ada..2a448b49 100644
> --- a/configs/arm64/foundation-v8-linux-demo.c
> +++ b/configs/arm64/foundation-v8-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/foundation-v8-uart-demo.c b/configs/arm64/foundation-v8-uart-demo.c
> index f057fbbc..da919d4a 100644
> --- a/configs/arm64/foundation-v8-uart-demo.c
> +++ b/configs/arm64/foundation-v8-uart-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/foundation-v8.c b/configs/arm64/foundation-v8.c
> index 5109929f..7a632491 100644
> --- a/configs/arm64/foundation-v8.c
> +++ b/configs/arm64/foundation-v8.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/hikey-gic-demo.c b/configs/arm64/hikey-gic-demo.c
> index 908b0c71..c7ddf469 100644
> --- a/configs/arm64/hikey-gic-demo.c
> +++ b/configs/arm64/hikey-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
> index 71bc7c82..76dda9da 100644
> --- a/configs/arm64/hikey-linux-demo.c
> +++ b/configs/arm64/hikey-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
> index bcfbe188..7e6bb952 100644
> --- a/configs/arm64/hikey.c
> +++ b/configs/arm64/hikey.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/imx8mq-gic-demo.c b/configs/arm64/imx8mq-gic-demo.c
> index 041751c0..ae1877d0 100644
> --- a/configs/arm64/imx8mq-gic-demo.c
> +++ b/configs/arm64/imx8mq-gic-demo.c
> @@ -13,8 +13,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/imx8mq.c b/configs/arm64/imx8mq.c
> index 95b4b363..7d113264 100644
> --- a/configs/arm64/imx8mq.c
> +++ b/configs/arm64/imx8mq.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/jetson-tx1-demo.c b/configs/arm64/jetson-tx1-demo.c
> index 446b1a6d..b16b9ba7 100644
> --- a/configs/arm64/jetson-tx1-demo.c
> +++ b/configs/arm64/jetson-tx1-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
> index 4a643873..b8698259 100644
> --- a/configs/arm64/jetson-tx1-linux-demo.c
> +++ b/configs/arm64/jetson-tx1-linux-demo.c
> @@ -18,8 +18,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   #ifndef CONFIG_INMATE_BASE
>   #define CONFIG_INMATE_BASE 0x0
>   #endif
> diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
> index d4a00daf..d1fb21b8 100644
> --- a/configs/arm64/jetson-tx1.c
> +++ b/configs/arm64/jetson-tx1.c
> @@ -18,8 +18,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/jetson-tx2-demo.c b/configs/arm64/jetson-tx2-demo.c
> index 6e09226c..d500e124 100644
> --- a/configs/arm64/jetson-tx2-demo.c
> +++ b/configs/arm64/jetson-tx2-demo.c
> @@ -11,8 +11,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/jetson-tx2.c b/configs/arm64/jetson-tx2.c
> index 814a4b08..c2e17e67 100644
> --- a/configs/arm64/jetson-tx2.c
> +++ b/configs/arm64/jetson-tx2.c
> @@ -21,8 +21,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/k3-am654-gic-demo.c b/configs/arm64/k3-am654-gic-demo.c
> index fc9deb75..556b0b4a 100644
> --- a/configs/arm64/k3-am654-gic-demo.c
> +++ b/configs/arm64/k3-am654-gic-demo.c
> @@ -17,8 +17,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
> index 23824890..5eab1502 100644
> --- a/configs/arm64/k3-am654-idk-linux-demo.c
> +++ b/configs/arm64/k3-am654-idk-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   #ifndef CONFIG_INMATE_BASE
>   #define CONFIG_INMATE_BASE 0x0000000
>   #endif
> diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
> index edc31b8b..a951a461 100644
> --- a/configs/arm64/k3-am654-idk.c
> +++ b/configs/arm64/k3-am654-idk.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/k3-am654-uart-demo.c b/configs/arm64/k3-am654-uart-demo.c
> index 10cc0365..29a022e9 100644
> --- a/configs/arm64/k3-am654-uart-demo.c
> +++ b/configs/arm64/k3-am654-uart-demo.c
> @@ -17,8 +17,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/macchiatobin-gic-demo.c b/configs/arm64/macchiatobin-gic-demo.c
> index 713319d2..63e1e433 100644
> --- a/configs/arm64/macchiatobin-gic-demo.c
> +++ b/configs/arm64/macchiatobin-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
> index 63fbbba7..6e18f62f 100644
> --- a/configs/arm64/macchiatobin-linux-demo.c
> +++ b/configs/arm64/macchiatobin-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
> index c0df0572..4811e8dd 100644
> --- a/configs/arm64/macchiatobin.c
> +++ b/configs/arm64/macchiatobin.c
> @@ -17,8 +17,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c b/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
> index 614b572e..6a93935f 100644
> --- a/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
> +++ b/configs/arm64/miriac-sbc-ls1046a-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
> index 1c63ae0e..ec2531b2 100644
> --- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
> +++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
> @@ -17,8 +17,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
> index 9597500d..6f3ad198 100644
> --- a/configs/arm64/miriac-sbc-ls1046a.c
> +++ b/configs/arm64/miriac-sbc-ls1046a.c
> @@ -17,8 +17,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/qemu-arm64-gic-demo.c b/configs/arm64/qemu-arm64-gic-demo.c
> index 2a50ef3f..9e51e821 100644
> --- a/configs/arm64/qemu-arm64-gic-demo.c
> +++ b/configs/arm64/qemu-arm64-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
> index be88e107..ed89413b 100644
> --- a/configs/arm64/qemu-arm64-linux-demo.c
> +++ b/configs/arm64/qemu-arm64-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
> index 0570a1dd..6eff7403 100644
> --- a/configs/arm64/qemu-arm64.c
> +++ b/configs/arm64/qemu-arm64.c
> @@ -17,8 +17,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/ultra96-gic-demo.c b/configs/arm64/ultra96-gic-demo.c
> index 12556335..403c6972 100644
> --- a/configs/arm64/ultra96-gic-demo.c
> +++ b/configs/arm64/ultra96-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
> index e6b33466..7cbfd772 100644
> --- a/configs/arm64/ultra96-linux-demo.c
> +++ b/configs/arm64/ultra96-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
> index 1fc54356..bcf08772 100644
> --- a/configs/arm64/ultra96.c
> +++ b/configs/arm64/ultra96.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/zynqmp-zcu102-gic-demo.c b/configs/arm64/zynqmp-zcu102-gic-demo.c
> index 6ca18686..15767396 100644
> --- a/configs/arm64/zynqmp-zcu102-gic-demo.c
> +++ b/configs/arm64/zynqmp-zcu102-gic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
> index 2fcc86c6..02ec89e8 100644
> --- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
> +++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
> index ca80535d..c30ed924 100644
> --- a/configs/arm64/zynqmp-zcu102-linux-demo.c
> +++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
> index 65515e56..9de04d6c 100644
> --- a/configs/arm64/zynqmp-zcu102.c
> +++ b/configs/arm64/zynqmp-zcu102.c
> @@ -17,8 +17,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof(a[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/x86/apic-demo.c b/configs/x86/apic-demo.c
> index 969f9527..8840c632 100644
> --- a/configs/x86/apic-demo.c
> +++ b/configs/x86/apic-demo.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
> index 1c602883..09ca9eac 100644
> --- a/configs/x86/e1000-demo.c
> +++ b/configs/x86/e1000-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
> index d5320d7b..e73cbb06 100644
> --- a/configs/x86/f2a88xm-hd3.c
> +++ b/configs/x86/f2a88xm-hd3.c
> @@ -20,8 +20,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/x86/imb-a180.c b/configs/x86/imb-a180.c
> index 9073a4ac..4faa0b41 100644
> --- a/configs/x86/imb-a180.c
> +++ b/configs/x86/imb-a180.c
> @@ -19,8 +19,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/x86/ioapic-demo.c b/configs/x86/ioapic-demo.c
> index 8b47a335..30e0ac98 100644
> --- a/configs/x86/ioapic-demo.c
> +++ b/configs/x86/ioapic-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
> index 501d722f..b3a12a9d 100644
> --- a/configs/x86/ivshmem-demo.c
> +++ b/configs/x86/ivshmem-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
> index af8c6da4..c8f18701 100644
> --- a/configs/x86/linux-x86-demo.c
> +++ b/configs/x86/linux-x86-demo.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
> index c5719459..0b8c1aad 100644
> --- a/configs/x86/pci-demo.c
> +++ b/configs/x86/pci-demo.c
> @@ -16,8 +16,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> index 68b8f18d..4d671cb2 100644
> --- a/configs/x86/qemu-x86.c
> +++ b/configs/x86/qemu-x86.c
> @@ -19,8 +19,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[1];
> diff --git a/configs/x86/smp-demo.c b/configs/x86/smp-demo.c
> index a9625353..d175c618 100644
> --- a/configs/x86/smp-demo.c
> +++ b/configs/x86/smp-demo.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/configs/x86/tiny-demo.c b/configs/x86/tiny-demo.c
> index 426333f6..493059ae 100644
> --- a/configs/x86/tiny-demo.c
> +++ b/configs/x86/tiny-demo.c
> @@ -15,8 +15,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> -
>   struct {
>   	struct jailhouse_cell_desc cell;
>   	__u64 cpus[1];
> diff --git a/hypervisor/include/jailhouse/utils.h b/hypervisor/include/jailhouse/utils.h
> index eae0f390..411f6365 100644
> --- a/hypervisor/include/jailhouse/utils.h
> +++ b/hypervisor/include/jailhouse/utils.h
> @@ -12,7 +12,14 @@
>    * Partly derived from Linux kernel code.
>    */
>   
> +/*
> + * We need guards around ARRAY_SIZE as there is a duplicate definition in
> + * jailhouse/cell-config.h due to header license incompatibility. Once
> + * ARRAY_SIZE is replaced in cell-config.h, this guard can be removed.
> + */
> +#ifndef ARRAY_SIZE
>   #define ARRAY_SIZE(array)	(sizeof(array) / sizeof((array)[0]))
> +#endif
>   
>   /* sizeof() for a structure/union field */
>   #define FIELD_SIZEOF(type, fld)	(sizeof(((type *)0)->fld))
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 66e13c3d..63eb5fa5 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -41,6 +41,10 @@
>   
>   #include <jailhouse/console.h>
>   
> +#ifndef ARRAY_SIZE
> +#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])
> +#endif
> +
>   /*
>    * Incremented on any layout or semantic change of system or cell config.
>    * Also update HEADER_REVISION in tools.
> diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
> index 5a8e1412..b80d7889 100644
> --- a/tools/root-cell-config.c.tmpl
> +++ b/tools/root-cell-config.c.tmpl
> @@ -42,8 +42,6 @@
>   #include <jailhouse/types.h>
>   #include <jailhouse/cell-config.h>
>   
> -#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
> -
>   struct {
>   	struct jailhouse_system header;
>   	__u64 cpus[${int((cpucount + 63) / 64)}];
> 

Thanks, applied to next.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/344b281a-30b9-80c9-d1e4-a57c2f89928c%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
