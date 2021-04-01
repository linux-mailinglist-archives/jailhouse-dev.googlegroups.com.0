Return-Path: <jailhouse-dev+bncBAABBEEGS6BQMGQEDRZOWYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D88E3514F0
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Apr 2021 14:56:49 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id t28sf2108787ljo.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Apr 2021 05:56:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617281808; cv=pass;
        d=google.com; s=arc-20160816;
        b=ERZPbtX4CovvTK3/ze93QxR5ehbyebNb/IghfGjOmXlF3vkn4GuCm72/xMqrTmlVZA
         jR+McOFDOWT7bbJn03hJaXvvp71xZdthRI9zt6TvjOS8U+nsdnjHZW+5Y//kr9IsRDjA
         2qfWrLY+xoHE4n4/k75HcG6fH0vr47n6Px3bbpXiqqVXA5qAZjKu+nJ2ATtQ7hPo/YGX
         IlPJTfwHSGdCFWdKzsYFLu7eHdmEE8nx/d1/hUMtl9ojy/z7j4h+NDwA2vPaLnjPoBTs
         Kq8ZhMd5HEntBpV1uFgyiQokGIgFIx0ZTmtimmqJMJ8rSHUARCfVB9Y5v1B9MJZ/q4zi
         vEKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version:subject:cc
         :to:from:date:sender:dkim-signature;
        bh=a1vZ7+wZFZrB2lPYOfIriU9MSD39EUlob5oL0GzF4W0=;
        b=fd6To12nCh+PIrd+nmj0GJ23y5GBHFsVpf2UiPcryRJNakDYfy4H0UA1Mrybt/Y2Fw
         TpIqhLXPRFWzz+Ao6mZwgMGgRaKZM5UyuiH5Qib8RW/0A0rUp1QQ/FyoeSBEgngbzqlX
         xMGobMPKWNtNUqgm6gYfZKdQaM7SaoYiBYS7p6U02hRQyxP5KK9NSoHQlft1Dscy/qoU
         Mvavi4A+weaeGP5ogwzGI5v83FeICs6FgVSVDN9YTLqnQR7aVXkEpdEqa60bmgbNx5XX
         jhZ6k4P55AAA4MA6dQYLgIat8yy4lr6wCnzlM0hPMuMs38Q3E+taGmynU1b94j44kTdz
         R0lw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:mime-version:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a1vZ7+wZFZrB2lPYOfIriU9MSD39EUlob5oL0GzF4W0=;
        b=lcGHL0/wd74+wsXHoXYRtXHKb5+Iy7qPhPtfOLcioooXGKZ1TUp+WBqbNv4PvmT/e+
         OjtgXaRWM7I4aZLwf5AvBkIIMNdSkmSh2nusM/rzg7wI/bfo/1YGEqjVY7CyJs2N+CeU
         bpGqUaUIKA0jikiOUa3owHG2tUeMZnKKJHB1vbBzbwZgUqTDMQQcMbAOaJdaJG2xYJX8
         rTwpPcHGjvI7LcpmBDcz2sGLZV86tvZBaNh+qkFPFM8pQ8TmznGaU3/cyYy/gVZH92vQ
         2YsbS3oHN54oEs2JcM8Kl4wHqxeZTiJDNG5AdErX/d97mpO5BeV+5KhIAEKFpAvsp8Mk
         805w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:mime-version
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=a1vZ7+wZFZrB2lPYOfIriU9MSD39EUlob5oL0GzF4W0=;
        b=GDY/pYsxDXd4bvh2nFn1vzfXp2RsEArmRPTJOUKOP0uTzxGkN05Vi71w+6Cde4OhWY
         XYqR1UsAEsjhZZQBQkHeVVIizPzP6BVb73CEo9giUf0FmLUJMCI3geBMqHB61biATMNS
         GRZD8QFRAApJ97bYT3Rju5Z1YkuqjeVJBRnTcvflEu9RVqCJH7ACQfLm8SdTbvtWq0P1
         6RmxpKPwzkim0x7XYz1fFaE11BZIMn15JYQf9/EOMqxIXIwjmzsQyrX4z6kOMlBwrojX
         KosRfvEZf1UVvbvb5indDf/cat/lP+BWPuShRmk8GOjEJLcJy+rLucr+SMsM02h4pMdY
         9/Ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532vXriCSB8Ud/4gAe6Zp8j1MpEv3e7libs3oD12zCbvFDlMJVBL
	z6Iv6jFcP9317zRBlH/nXMM=
X-Google-Smtp-Source: ABdhPJzd2o8iDf+LJi2Za+j0XHkODWH/oZy5sXFclPmTww8K1C82bqbBvPsBwvTpfcSnnoKpzeqMpA==
X-Received: by 2002:a19:b81:: with SMTP id 123mr5313519lfl.553.1617281808805;
        Thu, 01 Apr 2021 05:56:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:e86:: with SMTP id 128ls362459lfo.0.gmail; Thu, 01 Apr
 2021 05:56:47 -0700 (PDT)
X-Received: by 2002:ac2:5963:: with SMTP id h3mr5473734lfp.636.1617281807899;
        Thu, 01 Apr 2021 05:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617281807; cv=none;
        d=google.com; s=arc-20160816;
        b=oLTG10sFyG5hcIR7T2V0TIA4eiqUYyuUEGGSxoCkRnhzS568cFFN/E2waPckq1tXpZ
         n0Y6Ea59EQuXK0BOFZ8Rewc48qVmmBHHClkqepgtPHma3oQ1raS/B5lPiNEYf6QCFWD5
         aRHJTpPGEo+CbgvTLqru1V/kcdljzR8a28rg0sdR9GHQ1tftz0LKe7Rn4Ui8B4ECtKYa
         0sloENILkW61irnuLMxpjm1p+DDUh6BGopWw5d1XffgufSy9sp1KAmHSScSHOdHxFFhO
         HoNopwo5uV9WLHWQ3C+wtDt+1+87cuMuHOaIIRlfzTX2R3sypEKG5+Gf50fTkvYWxjXH
         3kpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:content-transfer-encoding:subject:cc:to
         :from:date;
        bh=i8ZGNj02C0XUEzdo3ba3Wk8llTVgQbWm7whwIymcrV0=;
        b=a6ck3v40us4MjveV9EASE2U7VppFHEksX39EzOJKDKHmT1AnLPA0wDU6PCHQJiLUAl
         Qbfr2ADB4R0lErchne6ouaqXXQAJHoF7CBwD+d0YRoxgiC4LepNF7JzdQqcM4tfr7l+L
         Kl7Sz4ha267+lQJTFSD/iu5go+XaPELV0bcLWIlNF4AQVWXjJUcJq5Kh2bq6gQC5OGzl
         Ow6XqPeah+QI68+jKIKKa4yYOLjFjhiH6KeGZCFDSSvg9wLq8Nlyx6nqI2YQWz3NnLMu
         nPReH5kZ539N1Dv0jFZXKShne8zqn3WRTXYs9ZhEDZlGD5zJ22zTx/n8yl/jFGh3yfUg
         7W3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net (zg8tmty1ljiyny4xntqumjca.icoremail.net. [165.227.154.27])
        by gmr-mx.google.com with SMTP id l11si291736lfg.13.2021.04.01.05.56.46
        for <jailhouse-dev@googlegroups.com>;
        Thu, 01 Apr 2021 05:56:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as permitted sender) client-ip=165.227.154.27;
Received: by ajax-webmail-app2 (Coremail) ; Thu, 1 Apr 2021 20:56:17 +0800
 (GMT+08:00)
X-Originating-IP: [210.26.59.142]
Date: Thu, 1 Apr 2021 20:56:17 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5pu55a6P6bmP?= <caohp19@lzu.edu.cn>
To: jailhouse-dev@googlegroups.com, nikhildevshatwar@gmail.com, 
	ralf@binary-kitchen.de
Cc: "Jan kiszka" <jan.kiszka@siemens.com>
Subject: HELP
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2021 www.mailtech.cn lzu.edu.cn
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Message-ID: <321eddc.40ef8.1788d817ec9.Coremail.caohp19@lzu.edu.cn>
X-Coremail-Locale: en_US
X-CM-TRANSID: zQmowACnlYjywmVg_jA4AQ--.22220W
X-CM-SenderInfo: hfdrx1arz6z6vxohv3gofq/1tbiAQ0SBl2vOvI5FgAEsJ
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Original-Sender: caohp19@lzu.edu.cn
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of caohp19@lzu.edu.cn designates 165.227.154.27 as
 permitted sender) smtp.mailfrom=caohp19@lzu.edu.cn
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

Dear sir,

I wanted to know how to write my own config files about non-root cell. By the way, I tried to alter the 
rpi4-linux-demo.c and compiled it. Of course, it was successful in that way. 

1. But I don't understand why there are several memory regions definitions.
2. How to know the memory addresses.
3. How many memory regions should be defined. 

Whether should I reference the Raspberry Pi 4 model B's manual to resolve three questions.
Here is the part of rpi4-linux-demo.c about memory definitions.(I didn't why there are 5 memory regions, 2 RAM definitions).
 
.mem_regions = {
 /* IVSHMEM shared memory regions (demo) */
 {
 .phys_start = 0x3faf0000,
 .virt_start = 0x3faf0000,
 .size = 0x1000,
 .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 },
 {
 .phys_start = 0x3faf1000,
 .virt_start = 0x3faf1000,
 .size = 0x9000,
 .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 JAILHOUSE_MEM_ROOTSHARED,
 },
 {
 .phys_start = 0x3fafa000,
 .virt_start = 0x3fafa000,
 .size = 0x2000,
 .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 },
 {
 .phys_start = 0x3fafc000,
 .virt_start = 0x3fafc000,
 .size = 0x2000,
 .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
 },
 {
 .phys_start = 0x3fafe000,
 .virt_start = 0x3fafe000,
 .size = 0x2000,
 .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 JAILHOUSE_MEM_ROOTSHARED,
 },
 /* IVSHMEM shared memory region */
 JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 1),
 /* UART */ {
 .phys_start = 0xfe215040,
 .virt_start = 0xfe215040,
 .size = 0x40,
 .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_8 |
 JAILHOUSE_MEM_IO_32 | JAILHOUSE_MEM_ROOTSHARED,
 },
 /* RAM */ {
 .phys_start = 0x3f900000,
 .virt_start = 0,
 .size = 0x10000,
 .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 },
 /* RAM */ {
 .phys_start = 0x30000000,
 .virt_start = 0x30000000,
 .size = 0x8000000,
 .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 JAILHOUSE_MEM_LOADABLE,
 },
 /* communication region */ {
 .virt_start = 0x80000000,
 .size = 0x00001000,
 .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 JAILHOUSE_MEM_COMM_REGION,
 },
 }

By the way, what information should I obtained so that I can  write my own cell config.
If I can get your generous help, I will appreciate.
Thank you again !

Yours sincerely,
Hongpeng Cao.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/321eddc.40ef8.1788d817ec9.Coremail.caohp19%40lzu.edu.cn.
