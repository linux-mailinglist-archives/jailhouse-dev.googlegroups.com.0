Return-Path: <jailhouse-dev+bncBDWL7NVN6MHRBBGA3OOQMGQEQAFI4YA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F3E65EECF
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Jan 2023 15:34:45 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id r15-20020a05600c35cf00b003d9a14517b2sf1073433wmq.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Jan 2023 06:34:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672929285; cv=pass;
        d=google.com; s=arc-20160816;
        b=BzScze/wIq655wLZ71LM4BVfx/Eq1nCVCvQENx54XvGojLkW3vJAHamEMG3vlEHzuN
         aCkzVwV30VEvlJ2TIOU1g6BktgZ78NLYXnFZnsI1sz7PbCFIykaBq9HxCJzgTG08xdYQ
         I1Zgj3HEfgMZC9vfqal6NzmdB1RyEZQFK/NodUWopM3mBFbHL+jFNFMpmcpwyt4Ey8lI
         NcMM63Q1qkjtn9wlKzQFEHdaaBVKk12adZcpDZtPKE2S8libSFKbv8rl7BivhX1ICFui
         mPATyeaYCJ08P3VVZ4WWHa5x6oI8ZO3S1LUjFIInxYtSvlWfukPafM/hKG4M7CJkrCWM
         k61w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=3WF0QSjY3WvVxhtB5kAq4St9T5s3wh7Bla26hVFBbCk=;
        b=RpHonHuubAQ6GMluC4sCyrvc428rp5X/+wgJrm8ZZcOBqtpeMC3FeNEsf7BT9kj8TL
         8vfmPXgDE4Aen65+ECBoF7g9k6XoiJNKuXXEJxl3JA6jgkgvdQTpp6detmR59zfruRXl
         KxsWG0OUQwZ1Fdvg+cyaNE84HEmxbUvOWY8yLlhGEWeitPbDB7baObS4c2QvX2DN1p7c
         4QafKdfgJeWr2HsH7craFrWfxDbugKDWI2x/RITGhlYCVSF15l9UPtgSHWcb2Jd3zsoh
         ozCyN0SV7ipCn5u9oJyrvO638jlXRC1aUmihSxNoQso7g6DWgZrHT4mUt3bTPe2pBczE
         /LoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=naJKP4a4;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::42d as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WF0QSjY3WvVxhtB5kAq4St9T5s3wh7Bla26hVFBbCk=;
        b=FBOCYf/TZnw7EL2/aPjOkVY4l0DN6ViwRTQEPAZR/cBwoWXD8nqv8L6R1pScro3HJK
         3Nb6QTKpKHn5oc2H+lmnGbMfV3zEZZXsX6t8Xf4zuKyGsSpoOusseGO+MtJ/F5+nmNyP
         P/O7ULu0ay943Ol5a7rWpNHqL3pT5XuJPF/7hnx4V2mPjgyzkQO5HbeOeNLA7IkFfM6O
         BhO5ZEkU4Dd0VYZjIolyVVoGuNJDj8SxUsRC+yEDfEkruDoz3DT3U5376uc9RAw6vmAv
         EDyksFlagL5Lc0KJ0LCAqrzNBUy5XfMco3odYdwDsocRUoTg7rsPz55b783BJxfvJT1T
         uEYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3WF0QSjY3WvVxhtB5kAq4St9T5s3wh7Bla26hVFBbCk=;
        b=XNAcLtoPVAuKpfsQI9DE5UNAM39pM/UcbBAr6kbUSqbuzPZHNt438I1j7fw5iLd59/
         I4eGk1Za+hGDTJhJgs8O/npasig9usHajpEx/teDCQ34sdrRicB6pBiS/CaZHtcTn84T
         8Fn8VS4jXoLnuT8JTwCJIwzAlRMrL6O44WuHmrM23l5MQnSOfJW5bTvTng8IfCnKMXKK
         NkwUFoRZ1tLbXjvVt6yQupeM994/KGDfInd2v40MG0UPhLvFpij3O0r/r161gZFxhdod
         NB7dzHZ558CCmcUG8ZHGR+W2RoSDf5Ocg0LKTvcV3sgfINtEJw5KNC58DyqtUhKZ8Zun
         IoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WF0QSjY3WvVxhtB5kAq4St9T5s3wh7Bla26hVFBbCk=;
        b=1sEmi1lXY7acV9DQ1z1c+Lz1Lw49s+Olb12QM3uDfLHCFXtIJ/Pzmwfg1x8jSxpW45
         /Uw4j2fsYnC9TK16yAZ3q4XUpEqXk0s0CEJjWvEBF+7/O8hqhS4bLneB8miZ2OG3/OyN
         ale6QbwxdC7pxy81cKpgDi1khe9wM20EE8Z0ZloEYZw+pPvEiGnKtwC9E9hvX7+Rmc20
         xv0pQS0DaVQ4/0H/1U1Y6dS+afy0wpBGQg+GT0PPcd1DsKQTmBoVXiTHLL+cc54jPc2I
         QhSUiFRLDzqOcgrnuj3LPgag1HIStmboAOpE/YOfz2g4VsSeNf4D3kLa82UvWsuSrJR0
         4t/Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krcIRzI9f6J+jw1LIJ1WXnQ7thqlUZ1X3USGB0aouO+zJxpX3PU
	teNS/NgrEB8zxDhyONpkHF8=
X-Google-Smtp-Source: AMrXdXttpF6iTD5qNdB1phhBWxOtDG/pVtjxwnQB8U3umy6rtq0k9sB6jBLija10YVjK1HVBn/Oeiw==
X-Received: by 2002:a7b:c450:0:b0:3c2:7211:732e with SMTP id l16-20020a7bc450000000b003c27211732emr3218444wmi.191.1672929285352;
        Thu, 05 Jan 2023 06:34:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:251:b0:269:604b:a0dd with SMTP id
 m17-20020a056000025100b00269604ba0ddls1749742wrz.0.-pod-prod-gmail; Thu, 05
 Jan 2023 06:34:43 -0800 (PST)
X-Received: by 2002:adf:f7c2:0:b0:2ad:df97:5da2 with SMTP id a2-20020adff7c2000000b002addf975da2mr2751320wrq.3.1672929283620;
        Thu, 05 Jan 2023 06:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672929283; cv=none;
        d=google.com; s=arc-20160816;
        b=E8qgW6LhhJHBi1YPT9BhA/Kuv2lhPWQjgPBvZLN7JnYE2D1dOmD0Jd1OD3QsMurT2R
         aljhfnjREFmUUdmZNE+XOWtdjMZ/sNVAp3+Qxoqw3BLCfjRz0HMIimQDqPleVYWmZY3p
         OKffXvSbIQYDcTAy9615175plX5mmGRWO91SI2lr8wcawQn4A1mUhCyRm3GEf06H4A2t
         LsRqcj5Y80KOsea1/vnzZpRBMxu6CAfH6ZP7IOBvvc6q6iVZ9HtGFra32MJSM/K0CsBC
         wxO0zes6HLYmN/9YwjfwYQtXo2tumJptZmQUTYpiljv3mCTJGyhZSG744xciKzU5s48h
         CJxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GUGtq9d5Wuog/2ryTuXfRhFaB0++GbmMx6dRLUSPWZY=;
        b=ulrkQnQekzZmPizDM6FdgPul7bLIFyv1B/WUXLusLfol1zGTUHhq5pvHBMlWkoc5BW
         MFIcnfvDdLlMgRwDSldS12SwIyFqqPlFQ4aEdGTxV3QtPXrMWYnu9V/BHOMKdSQkbSzx
         jaJJRnxzwDNv1l1UhDgfqW8NOB1qiAL03BA912cOdYhMYIY7wVrDv2pDsw5Bt4cDH8DR
         tXQpWR8IPzFJmk41fkC6uq1gxZzbtPxrNmBumEEBO5A6nBH/e4EEh4f2U3UBNqwLTtWq
         XR3fvkXsQkNUCtGriSNuF9DUJVHJO3P+sbVxVx5c+hOs8f2adq3zVm+0u+QrmqYHyPlJ
         TAUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=naJKP4a4;
       spf=pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::42d as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com. [2a00:1450:4864:20::42d])
        by gmr-mx.google.com with ESMTPS id q12-20020adfdfcc000000b002b57bae7176si47467wrn.1.2023.01.05.06.34.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 06:34:43 -0800 (PST)
Received-SPF: pass (google.com: domain of tommi.parkkila@gmail.com designates 2a00:1450:4864:20::42d as permitted sender) client-ip=2a00:1450:4864:20::42d;
Received: by mail-wr1-x42d.google.com with SMTP id z16so19833450wrw.1
        for <jailhouse-dev@googlegroups.com>; Thu, 05 Jan 2023 06:34:43 -0800 (PST)
X-Received: by 2002:a05:6000:4006:b0:271:4a95:242a with SMTP id
 cy6-20020a056000400600b002714a95242amr1840363wrb.554.1672929282879; Thu, 05
 Jan 2023 06:34:42 -0800 (PST)
MIME-Version: 1.0
References: <bfb4732c-21e8-4a5d-8a0d-382041e7554cn@googlegroups.com> <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com>
In-Reply-To: <3071214a-b5a8-4096-8ad4-3a79b6634de5@siemens.com>
From: Tommi Parkkila <tommi.parkkila@gmail.com>
Date: Thu, 5 Jan 2023 09:34:32 -0500
Message-ID: <CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ=Qu4d-TMV+wVQ@mail.gmail.com>
Subject: Re: STM32MP1 hangs on when entering hypervisor
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000a3f5d805f185337b"
X-Original-Sender: Tommi.Parkkila@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=naJKP4a4;       spf=pass
 (google.com: domain of tommi.parkkila@gmail.com designates
 2a00:1450:4864:20::42d as permitted sender) smtp.mailfrom=tommi.parkkila@gmail.com;
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

--000000000000a3f5d805f185337b
Content-Type: text/plain; charset="UTF-8"

Thanks for your reply, Jan. I managed to get forward from the 'hang'
condition. There were several misdefinitions on my root-cell configuration.
Now I get the root-cell started sometimes, but more often I get two types
of issues after enable command. Any help or ideas where to continue my
debugging would be greatly appreciated. Please, see the issues explained
below.

Thanks,
-tommi

+++++++++++++++++++++++++++++++++

1. Terminal hangs
-- After the enable command for the root cell, jailhouse gets started but
then the terminal goes unresponsive. Below, example log, where I give ls
cmd, which then causes terminal to go unresponsive...:
















*root@stm32mp1:~# modprobe jailhouse[ 1315.034414] jailhouse: loading
out-of-tree module taints kernel.root@stm32mp1:~# jailhouse enable
~/jailhouse/configs/arm/itron_stm32mp157.cellInitializing Jailhouse
hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 0Code location:
0xf0000040Page pool usage after early setup: mem 28/1514, remap
0/131072Initializing processors: CPU 0... OK CPU 1... OKInitializing unit:
irqchipInitializing unit: PCIPage pool usage after late setup: mem 50/1514,
remap 5/131072[0] Activating hypervisor[ 1355.352714] The Jailhouse is
opening.root@stm32mp1:~# ls*

2. Issue with setting CPU clock
-- The second issue I see is related to i2c bus and system clock. Terminal
starts printing error statements infinitely after Jailhouse opening. Below,
is a snippet of an example logs.








*[   85.322027] The Jailhouse is opening.[   85.322648] stm32f7-i2c
5c002000.i2c: failed to prepare_enable clockroot@stm32mp1:~# [   85.339233]
cpu cpu0: _set_opp_voltage: failed to set voltage (1350000 1350000 1350000
mV): -22[   85.350413] cpufreq: __target_index: Failed to change cpu
frequency: -22[   85.357706] cpu cpu0: _set_opp_voltage: failed to set
voltage (1350000 1350000 1350000 mV): -22[   85.365124] cpufreq:
__target_index: Failed to change cpu frequency: -22[   85.381985] cpu cpu0:
_set_opp_voltage: failed to set voltage (1350000 1350000 1350000 mV): -22*-
- -
+++++++++++++++++++++++++++++++++


ma 2. tammik. 2023 klo 2.17 Jan Kiszka (jan.kiszka@siemens.com) kirjoitti:

> On 13.12.22 20:33, Tommi Parkkila wrote:
> > Hi all - I am trying to configure and deploy Jailhouse on STM32MP1 w/
> > dual Cortex-A7. I get Jailhouse built and installed on target, and
> > kernel module installed successfully, but when enabling Jailhouse the
> > whole system hangs and restarts after several seconds by WDT. I have
> > hunted the last executed line of code to:
> >
> > /err = entry(cpu);/
> >
> > on /jailhouse/driver/main.c::enter_hypervisor(). The process tries the
> > both CPUs and both hangs. Here are some debug prints I added about the
> > jailhouse header data before the entry call, if they help any: (/number
> > inside [ ] is cpu-id/)
> >
> > /[  280.734679] - [1] header.core_size               = 0x16000
> > [  280.734687] - [1] header.percpu_size             = 0x4000
> > [  280.738521] - [0] header.core_size               = 0x16000
> > [  280.742961] - [1] header.entry                   = 0x3720
> > [  280.747400] - [0] header.percpu_size             = 0x4000
> > [  280.751840] - [1] entry                          = 0xF0003720
> > [  280.755775] - [0] header.entry                   = 0x3720
> > [  280.760215] - [1] header.console_page            = 0x10000
> > [  280.764049] - [0] entry                          = 0xF0003720
> > [  280.767986] - [1] header.gcov_info_head          = 0x0
> > [  280.772627] - [0] header.console_page            = 0x10000
> > [  280.776462] - [1] header.max_cpus                = 2
> > [  280.780902] - [0] header.gcov_info_head          = 0x0
> > [  280.785443] - [1] header.online_cpus             = 2
> > [  280.789278] - [0] header.max_cpus                = 2
> > [  280.793718] - [1] header.debug_console_base      = 0xDF96D000
> > [  280.797653] - [0] header.online_cpus             = 2
> > [  280.801488] - [1] header.arm_linux_hyp_vectors     = 0xC0114BE0
> > [  280.806935] - [0] header.debug_console_base      = 0xDF96D000
> > [  280.810871] - [1] header.arm_linux_hyp_abi       = 1
> > [  280.816419] - [0] header.arm_linux_hyp_vectors     = 0xC0114BE0
> > [  280.826307] - [0] header.arm_linux_hyp_abi       = 1/
> >
> > Where and how should I start looking for the issue? All and any help
> > will be highly appreciated. Below, a snapshot of memory region
> > allocation in kernel device tree and a snapshot of jailhouse root-cell
> > configuration that I use as an argument when enabling jailhouse.
>
> Did you enable the debug UART properly already? That will give you
> fairly early output from Jailhouse and possibly hints on where it fails
> - or at least where it still passes by.
>
> If the hang is actually much earlier, you could instrument the entry
> code, make entry() return early with a special error to see if this path
> is taken at least.
>
> Jan
>
> --
> Siemens AG, Technology
> Competence Center Embedded Linux
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ%3DQu4d-TMV%2BwVQ%40mail.gmail.com.

--000000000000a3f5d805f185337b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your reply, Jan. I managed to get forward from =
the &#39;hang&#39; condition. There were several misdefinitions on my root-=
cell configuration. Now I get the root-cell started sometimes, but more oft=
en I get two types of issues after enable command. Any help or ideas where =
to continue my debugging would be greatly appreciated. Please, see the issu=
es explained below.<div><br></div><div>Thanks,</div><div>-tommi</div><div><=
br></div><div><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0">+++++++++=
++++++++++++++++++++++++</a><br><div><br></div><div>1. Terminal hangs</div>=
<div>-- After the enable command for the root cell, jailhouse gets started =
but then the terminal goes unresponsive. Below, example log, where I give l=
s cmd, which then causes terminal to go unresponsive...:</div><div><br></di=
v><div><i><b>root@stm32mp1:~# modprobe jailhouse<br>[ 1315.034414] jailhous=
e: loading out-of-tree module taints kernel.<br>root@stm32mp1:~# jailhouse =
enable ~/jailhouse/configs/arm/itron_stm32mp157.cell<br><br>Initializing Ja=
ilhouse hypervisor v0.12 (314-gc7a1b697-dirty) on CPU 0<br>Code location: 0=
xf0000040<br>Page pool usage after early setup: mem 28/1514, remap 0/131072=
<br>Initializing processors:<br>=C2=A0CPU 0... OK<br>=C2=A0CPU 1... OK<br>I=
nitializing unit: irqchip<br>Initializing unit: PCI<br>Page pool usage afte=
r late setup: mem 50/1514, remap 5/131072<br>[0] Activating hypervisor<br>[=
 1355.352714] The Jailhouse is opening.<br>root@stm32mp1:~# ls</b></i><br><=
/div><div><br></div><div>2. Issue with setting CPU clock</div><div>-- The s=
econd issue I see is related to i2c bus and system clock. Terminal starts p=
rinting error statements infinitely after Jailhouse opening. Below, is a sn=
ippet of an example logs.=C2=A0</div><div><br></div><div><b><i>[ =C2=A0 85.=
322027] The Jailhouse is opening.<br>[ =C2=A0 85.322648] stm32f7-i2c 5c0020=
00.i2c: failed to prepare_enable clock<br>root@stm32mp1:~# [ =C2=A0 85.3392=
33] cpu cpu0: _set_opp_voltage: failed to set voltage (1350000 1350000 1350=
000 mV): -22<br>[ =C2=A0 85.350413] cpufreq: __target_index: Failed to chan=
ge cpu frequency: -22<br>[ =C2=A0 85.357706] cpu cpu0: _set_opp_voltage: fa=
iled to set voltage (1350000 1350000 1350000 mV): -22<br>[ =C2=A0 85.365124=
] cpufreq: __target_index: Failed to change cpu frequency: -22<br>[ =C2=A0 =
85.381985] cpu cpu0: _set_opp_voltage: failed to set voltage (1350000 13500=
00 1350000 mV): -22<br></i></b>- - -</div></div><div><a class=3D"gmail_plus=
reply" id=3D"gmail-plusReplyChip-0">+++++++++++++++++++++++++++++++++</a><b=
r><div><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">ma 2. tammik. 2023 klo 2.17 Jan Kiszka (<a href=3D"m=
ailto:jan.kiszka@siemens.com">jan.kiszka@siemens.com</a>) kirjoitti:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">On 13.12.22 20:33, Tom=
mi Parkkila wrote:<br>
&gt; Hi all - I am trying to configure and deploy Jailhouse on STM32MP1 w/<=
br>
&gt; dual Cortex-A7. I get Jailhouse built and installed on target, and<br>
&gt; kernel module installed successfully, but when enabling Jailhouse the<=
br>
&gt; whole system hangs and restarts after several seconds by WDT. I have<b=
r>
&gt; hunted the last executed line of code to:<br>
&gt; <br>
&gt; /err =3D entry(cpu);/=C2=A0<br>
&gt; <br>
&gt; on /jailhouse/driver/main.c::enter_hypervisor(). The process tries the=
<br>
&gt; both CPUs and both hangs. Here are some debug prints I added about the=
<br>
&gt; jailhouse header data before the entry call, if they help any: (/numbe=
r<br>
&gt; inside [ ] is cpu-id/)<br>
&gt; <br>
&gt; /[ =C2=A0280.734679] - [1] header.core_size =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x16000<br>
&gt; [ =C2=A0280.734687] - [1] header.percpu_size =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 0x4000<br>
&gt; [ =C2=A0280.738521] - [0] header.core_size =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D 0x16000<br>
&gt; [ =C2=A0280.742961] - [1] header.entry =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x3720<br>
&gt; [ =C2=A0280.747400] - [0] header.percpu_size =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 0x4000<br>
&gt; [ =C2=A0280.751840] - [1] entry =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xF0003720<br>
&gt; [ =C2=A0280.755775] - [0] header.entry =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x3720<br>
&gt; [ =C2=A0280.760215] - [1] header.console_page =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0x10000<br>
&gt; [ =C2=A0280.764049] - [0] entry =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0xF0003720<br>
&gt; [ =C2=A0280.767986] - [1] header.gcov_info_head =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D 0x0<br>
&gt; [ =C2=A0280.772627] - [0] header.console_page =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0x10000<br>
&gt; [ =C2=A0280.776462] - [1] header.max_cpus =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 2<br>
&gt; [ =C2=A0280.780902] - [0] header.gcov_info_head =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D 0x0<br>
&gt; [ =C2=A0280.785443] - [1] header.online_cpus =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 2<br>
&gt; [ =C2=A0280.789278] - [0] header.max_cpus =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 2<br>
&gt; [ =C2=A0280.793718] - [1] header.debug_console_base =C2=A0 =C2=A0 =C2=
=A0=3D 0xDF96D000<br>
&gt; [ =C2=A0280.797653] - [0] header.online_cpus =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D 2<br>
&gt; [ =C2=A0280.801488] - [1] header.arm_linux_hyp_vectors =C2=A0 =C2=A0 =
=3D 0xC0114BE0<br>
&gt; [ =C2=A0280.806935] - [0] header.debug_console_base =C2=A0 =C2=A0 =C2=
=A0=3D 0xDF96D000<br>
&gt; [ =C2=A0280.810871] - [1] header.arm_linux_hyp_abi =C2=A0 =C2=A0 =C2=
=A0 =3D 1<br>
&gt; [ =C2=A0280.816419] - [0] header.arm_linux_hyp_vectors =C2=A0 =C2=A0 =
=3D 0xC0114BE0<br>
&gt; [ =C2=A0280.826307] - [0] header.arm_linux_hyp_abi =C2=A0 =C2=A0 =C2=
=A0 =3D 1/<br>
&gt; <br>
&gt; Where and how should I start looking for the issue? All and any help<b=
r>
&gt; will be highly appreciated. Below, a snapshot of memory region<br>
&gt; allocation in kernel device tree and a snapshot of jailhouse root-cell=
<br>
&gt; configuration that I use as an argument when enabling jailhouse.<br>
<br>
Did you enable the debug UART properly already? That will give you<br>
fairly early output from Jailhouse and possibly hints on where it fails<br>
- or at least where it still passes by.<br>
<br>
If the hang is actually much earlier, you could instrument the entry<br>
code, make entry() return early with a special error to see if this path<br=
>
is taken at least.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Technology<br>
Competence Center Embedded Linux<br>
<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ%3DQu4d-TMV%=
2BwVQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAP8Rr63c3LS3Z_OU201aSokZ8NCUdoeXeAMGZ%=
3DQu4d-TMV%2BwVQ%40mail.gmail.com</a>.<br />

--000000000000a3f5d805f185337b--
