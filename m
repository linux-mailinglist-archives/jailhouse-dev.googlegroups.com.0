Return-Path: <jailhouse-dev+bncBCALNYGP4YHRBJMJWD6QKGQEZAX6W4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf38.google.com (mail-qv1-xf38.google.com [IPv6:2607:f8b0:4864:20::f38])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2192AF4CC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Nov 2020 16:35:07 +0100 (CET)
Received: by mail-qv1-xf38.google.com with SMTP id 12sf1654010qvr.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Nov 2020 07:35:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605108901; cv=pass;
        d=google.com; s=arc-20160816;
        b=VvUUSDZJDbrLB7IGVx6b94jipsVJxa1MGg9U0ABxyg9iopopyEg0Mf0FyD4BEoz9Dd
         l/JQ9DM3DK+uKumVPBsb7u3nnu7u0SJ41wyNdnBmqDdk5OtTXwz6uSKByI6KPYvRhxee
         VKc3n699+dAjErVbABysBZ+7Sjh+EiUUk24OwLjHZcbMrJSInMgS+9LkUWNxp4LmOg6d
         p9JIxW3DtJGv3sw9TzExKSyLDuJyMJq+mO8k56QM0RVsFzTgpG+PnuYT4c2rwYXvkbyS
         c6UaPDyhdfksOVzz6dA77fm8Q81hCLS8/MKwdlvVHfJYCzzMk2GKD8zcDLLh4j4BNL7m
         XXJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=xw3MUkgqR3VSS4xdVpPXyQBGlbwIlsweFfqfh8CIjSo=;
        b=KuwlWvwij+Pauz/nsTpYvkL3kBCiIaO/Ew4KDleNXn0S0ywc6rOPTVFX6gRWlLigqK
         mXHFTUVrtVxWeiFEWEP/jmhPGNCIXhrdqwo6lgtUGvRtR4jZlZDlpoQ3u3BGQ7d5TsmY
         e+xAw8bA/odiHjbeATAqg31vtag2qHUeHSos+1vTJjE01lYKaDvGfc1KcVM4ia8rMp50
         AgWnRgSpx+HQGuVHR2rFHOf7lX9HvhF/TKuHrVv2w3STy503mSa9npVc0M7nMcxKwIL8
         OAYIW3NmUaj0gxZ780YQOESLuL67gne1yCptOJEIuV92uOnBO2XttBkKFTp4TQjHF6dK
         un3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EJ8t0KsI;
       spf=pass (google.com: domain of mapleelpam@gmail.com designates 2607:f8b0:4864:20::12f as permitted sender) smtp.mailfrom=mapleelpam@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xw3MUkgqR3VSS4xdVpPXyQBGlbwIlsweFfqfh8CIjSo=;
        b=eLrhB+L2rvdHfGF7l++YNzx5RgGfHMzIJba6csjk0PvoCY/UHzKA7DWtkJcrAd+uHb
         o+pYaX+IiOjF0kWVdwnW7ZwzdGh87V/ZGcKjmZv6kttyGs7ZLbBPkaHNU07P8Ntc9RVT
         a6r3tSrfVpdc2IIEySLgXJQyevcHkoxRLkiYqd24qxmAyhoQYVp6KEPPxvwMOZW27eja
         imyOJ0igqFWk0+MkQciDrieRX/8bfuN0tUcwA0d4rA+fomYmrrb6tfuOQg8ks5D6tPNB
         nfM3FlFuT0yvZLZdDGDsc6yRjy0BClMPj6M8VND9jW/B4W6qTdVkAx3/U7Hq0LvgFVys
         9tvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xw3MUkgqR3VSS4xdVpPXyQBGlbwIlsweFfqfh8CIjSo=;
        b=KroTgyXkCoJFlA7hTPLbKcsQA12tB5ZUOuiPOX+1hcOBLsN/RRS2vPEAMK/M+0JRIL
         KQwFprm6uX8Z8w5muoNZKBh5biw8NOn7ctkfbe5E7VIILbfrqV2K66US3uSQG5KMBlqI
         APICE06bOQHbUanMGKGvg2fL0CDncZRBFe+iWPIFJynUP61mhQMZb2Tlo1HUG6h1u2Of
         nckLlHdsvCRx13PeI56ZaQaaCwcz0yYGnHcT7A6ofBXusLmswRkZ3VMLj45qLgIylrBb
         nbddb1Xj+eoMoab7YZTItpDHWP/DKikG38lwOlQUcxEmCq5NPkbAjYj6I0Sgus04zkWg
         uUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xw3MUkgqR3VSS4xdVpPXyQBGlbwIlsweFfqfh8CIjSo=;
        b=OQ/Q0XuD0ChSB1mph2LJFS4W9ZBeo1RCxOVWsOYi9SYCt3ehWKQ0y191Hqc8VIQW0R
         D73J/1K54ypOJFOQFkrD6HdKb2FdzsnhnXSprE5hWtDaq7CeeIusBfLB38GR80NnYAPo
         FGI6Umha1fKGvIsLEWA4Tt/0k3ztey6v42ZAMi7IbBEdhEdKqaftrg2uzZ2LQfw4JrCN
         1aUd+bRINFRbqFJqYsCBNtBbAFCFPqwMY0noDxpWw2x5K+XzwTC3iDaBeFlkcgrZwZ9F
         J6OwfpkMDM03S64SqBgYQi7cRToMgtSn4xp4uIl2ynLh6vuYATnpjzgh+U5RlHlQicBT
         qHsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5327cKKvlmZ1/Hmv+OTilmsjE/0+ag1F4W5mI+7aYNCa5qzG7ymX
	uZUiXEuWHbWlBoWjJGj9Aw4=
X-Google-Smtp-Source: ABdhPJxeI4ktmq/jOSjNxWFVqEYjmKydR8eSeiHKmc1zIHKt1gSRL0fY7bR+Qy13wsv250yyZj6sAw==
X-Received: by 2002:ac8:594:: with SMTP id a20mr14903626qth.98.1605108901477;
        Wed, 11 Nov 2020 07:35:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:572:: with SMTP id p18ls7235865qkp.0.gmail; Wed, 11
 Nov 2020 07:35:00 -0800 (PST)
X-Received: by 2002:a37:ac19:: with SMTP id e25mr19598381qkm.344.1605108900643;
        Wed, 11 Nov 2020 07:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605108900; cv=none;
        d=google.com; s=arc-20160816;
        b=g9NtGyP2qj+dP2Id+bdYiYBD2pZYp7PNtbD0LQ2v2/NC07i/MD5e7YWfzwrXXhLti4
         +7v002LSo6KzT7dmmZf7tFSdATwPd35ip8uMWnn+Z+DZcgwqBuHTX3rhS2kTl9F+fnu+
         5Q/m/NV5qu8d217+mp61oDjBFH6VrOcWbl8mCNWN17HeVfZsOSJDmmzBTEh04Tq+TbAT
         6eHM+WKqwtcak1Cs8pGMCshArp8UIW4ObYR1DYS1suKCngJI/jT25MQAwJfvWylp8iqB
         mdDdPjUDNXIT0xpKHEYicicr3qeq/qwbBNfPIkeSM8u5+0V1QIxgU9WWWCQ7Mto5n3xu
         34Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vh3RFkySE1B84CQMxozwDqQwy5ueItQ4krN5xuI1THA=;
        b=0WdoyV6FUIXLGk5+1l77jubowcD0BwWpSdwf5x/hEGDz1JzGoVMRuv6U8rkc5HWohQ
         neojmirbw1eOCnitWD3F/DDEShWIiPvps0STnCIdcDITJrEYv8SZNkkMyqbStfuJ+Ow2
         IB4uJijl4E5u/I7dXgAj9M2WQEzMzFg9bQsgbw+jqm40XSoL/ThYl0F2hN9S7yKViaFY
         z1n1Cx4My0OwgkByVdy3M5zNR68JuREpe91P7LlgoZULReUqInAMoZ48YDUOGxG2O8ET
         im65fg8Bwh2uZoR149RIIZ383gvk6HUeHD1v7V9NrXbwgMTn68uXwAlM6OyulYncDrX5
         D1iw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=EJ8t0KsI;
       spf=pass (google.com: domain of mapleelpam@gmail.com designates 2607:f8b0:4864:20::12f as permitted sender) smtp.mailfrom=mapleelpam@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com. [2607:f8b0:4864:20::12f])
        by gmr-mx.google.com with ESMTPS id z205si171793qkb.1.2020.11.11.07.35.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 07:35:00 -0800 (PST)
Received-SPF: pass (google.com: domain of mapleelpam@gmail.com designates 2607:f8b0:4864:20::12f as permitted sender) client-ip=2607:f8b0:4864:20::12f;
Received: by mail-il1-x12f.google.com with SMTP id t13so2354231ilp.2
        for <jailhouse-dev@googlegroups.com>; Wed, 11 Nov 2020 07:35:00 -0800 (PST)
X-Received: by 2002:a92:cb8d:: with SMTP id z13mr18152456ilo.182.1605108900160;
 Wed, 11 Nov 2020 07:35:00 -0800 (PST)
MIME-Version: 1.0
References: <345ef7c0-f01c-4032-811d-dbd1318da92a@googlegroups.com>
 <69a501bc-e164-8ee2-f1a0-dac5f896401e@web.de> <7a9814a6-dd4b-453a-977b-3e2f86119176n@googlegroups.com>
 <7253133c-e79b-4ae7-93bb-7d58e76ed1cdn@googlegroups.com> <38b5b700-e09d-6f36-1dda-2310b5465771@siemens.com>
In-Reply-To: <38b5b700-e09d-6f36-1dda-2310b5465771@siemens.com>
From: maple Chou <mapleelpam@gmail.com>
Date: Wed, 11 Nov 2020 23:34:47 +0800
Message-ID: <CAMh94uNz0G2-4HXuiArECtNYjSQ-a-GDRdfUcNXfTOj4Mt7eYQ@mail.gmail.com>
Subject: Re: Jailhouse support on Arrow SoCKit Evaluation Board
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000d1e8b805b3d6896e"
X-Original-Sender: mapleelpam@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=EJ8t0KsI;       spf=pass
 (google.com: domain of mapleelpam@gmail.com designates 2607:f8b0:4864:20::12f
 as permitted sender) smtp.mailfrom=mapleelpam@gmail.com;       dmarc=pass
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

--000000000000d1e8b805b3d6896e
Content-Type: text/plain; charset="UTF-8"

"
Last login: Mon May 11 15:35:01 +0000 2020 on /dev/ttyS0.
root@stratix10:~# cat /proc/iomem
01000000-7fffffff : System RAM
  02080000-02eaffff : Kernel code
  02eb0000-0309ffff : reserved
  030a0000-031bbfff : Kernel data
  79800000-7f7fffff : reserved
  7fa30000-7fa34fff : reserved
ff800000-ff801fff : ff800000.ethernet
ff808000-ff808fff : ff808000.dwmmc0
ff8d2000-ff8d20ff : ff8d2000.spi
ff900000-ff9fffff : ff8d2000.spi
ffb00000-ffb3ffff : ffb00000.usb
ffc02000-ffc0201f : serial
ffc02900-ffc029ff : ffc02900.i2c
ffc03300-ffc033ff : ffc03300.gpio
ffd00200-ffd002ff : ffd00200.watchdog
ffd10000-ffd10fff : ffd10000.clock-controller
ffd11000-ffd11fff : ffd11000.rstmgr
ffda0000-ffda0fff : pdma@ffda0000
  ffda0000-ffda0fff : ffda0000.pdma
ffe00000-ffefffff : ffe00000.sram
180000000-1ffffffff : System RAM
  1fae00000-1fb5fffff : reserved
  1fb7fe000-1ff5fffff : reserved
  1ff72d000-1ff78cfff : reserved
  1ff78d000-1ff78dfff : reserved
  1ff78e000-1ff7e5fff : reserved
  1ff7e8000-1ff7e8fff : reserved
  1ff7e9000-1ff7edfff : reserved
  1ff7ee000-1ffffffff : reserved
root@stratix10:~#

"

and I'd reference this -
https://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAMh94uNz0G2-4HXuiArECtNYjSQ-a-GDRdfUcNXfTOj4Mt7eYQ%40mail.gmail.com.

--000000000000d1e8b805b3d6896e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&quot;<div>Last login: Mon May 11 15:35:01 +0000 2020 on /=
dev/ttyS0.<br>root@stratix10:~# cat /proc/iomem<br>01000000-7fffffff : Syst=
em RAM<br>=C2=A0 02080000-02eaffff : Kernel code<br>=C2=A0 02eb0000-0309fff=
f : reserved<br>=C2=A0 030a0000-031bbfff : Kernel data<br>=C2=A0 79800000-7=
f7fffff : reserved<br>=C2=A0 7fa30000-7fa34fff : reserved<br>ff800000-ff801=
fff : ff800000.ethernet<br>ff808000-ff808fff : ff808000.dwmmc0<br>ff8d2000-=
ff8d20ff : ff8d2000.spi<br>ff900000-ff9fffff : ff8d2000.spi<br>ffb00000-ffb=
3ffff : ffb00000.usb<br>ffc02000-ffc0201f : serial<br>ffc02900-ffc029ff : f=
fc02900.i2c<br>ffc03300-ffc033ff : ffc03300.gpio<br>ffd00200-ffd002ff : ffd=
00200.watchdog<br>ffd10000-ffd10fff : ffd10000.clock-controller<br>ffd11000=
-ffd11fff : ffd11000.rstmgr<br>ffda0000-ffda0fff : pdma@ffda0000<br>=C2=A0 =
ffda0000-ffda0fff : ffda0000.pdma<br>ffe00000-ffefffff : ffe00000.sram<br>1=
80000000-1ffffffff : System RAM<br>=C2=A0 1fae00000-1fb5fffff : reserved<br=
>=C2=A0 1fb7fe000-1ff5fffff : reserved<br>=C2=A0 1ff72d000-1ff78cfff : rese=
rved<br>=C2=A0 1ff78d000-1ff78dfff : reserved<br>=C2=A0 1ff78e000-1ff7e5fff=
 : reserved<br>=C2=A0 1ff7e8000-1ff7e8fff : reserved<br>=C2=A0 1ff7e9000-1f=
f7edfff : reserved<br>=C2=A0 1ff7ee000-1ffffffff : reserved<br>root@stratix=
10:~#<br></div><div><br></div><div>&quot;</div><div><br></div><div>and I&#3=
9;d reference this -=C2=A0<a href=3D"https://github.com/altera-opensource/u=
-boot-socfpga/blob/socfpga_v2020.04/arch/arm/mach-socfpga/mmu-arm64_s10.c">=
https://github.com/altera-opensource/u-boot-socfpga/blob/socfpga_v2020.04/a=
rch/arm/mach-socfpga/mmu-arm64_s10.c</a></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAMh94uNz0G2-4HXuiArECtNYjSQ-a-GDRdfUcNXfTOj4Mt7eY=
Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.g=
oogle.com/d/msgid/jailhouse-dev/CAMh94uNz0G2-4HXuiArECtNYjSQ-a-GDRdfUcNXfTO=
j4Mt7eYQ%40mail.gmail.com</a>.<br />

--000000000000d1e8b805b3d6896e--
