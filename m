Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBDVG2WOQMGQEH24SVRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113f.google.com (mail-yw1-x113f.google.com [IPv6:2607:f8b0:4864:20::113f])
	by mail.lfdr.de (Postfix) with ESMTPS id 340A565D089
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Jan 2023 11:21:04 +0100 (CET)
Received: by mail-yw1-x113f.google.com with SMTP id 00721157ae682-473b193ada5sf260718207b3.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Jan 2023 02:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0POHmeb+eXvJz3LN0vc2xj1f3+3Y2WR46lMi04En16U=;
        b=rJ5Mpue1YIdF5IwiJ9oqdtO1zFTC/VPYnan+LOUKdJ0+johqz7Z/eSwDNcQTCqklYw
         BZaMeejST1ECHurE+HOGOWT3L+N4tmiZNkUhek5UVmSFjQV83CmDWK3W9Nxot4jMWm0b
         ya1UJ8cLky/jrZWANGlkj7NG2VMMRi0ZUQEBU8F/jlwt2a6W4tEnBxogzVmoACDiF8GO
         rfGep+8JTGPqHvRQrq6QLLhiuVKbIa83qKOqF0JPddqFJTQWj0t+TILlFgs0J75LsgWH
         JWsRaP/mVn7njcbPIGhE4SZIkExbmsr++OLSgHfYLeiMYildaLiBdZHnnjvG9bMn/NwP
         JAMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0POHmeb+eXvJz3LN0vc2xj1f3+3Y2WR46lMi04En16U=;
        b=HwbJeRVLcYLs70BMxgwVa4LJIp4vjBJUK+VH/L6OG13590b//JT7HDnzeXytIyV/fi
         qZo69KjaxFFPO7YMhspjTJgyafFdWwvBlrqGbj1iflXzwLSjPgZwpbsu1SAvKM5Gdcgc
         IIzwAG8RTHh2b+D/6IDUvp0YmvKaBhUTHjdLo9CG87GIAxiP4FLaIEUmqLLkLj2TATEN
         hH+b7v/ZlAVdyraYH2S3vc2dfwOD9CCoDsESdaV7s1/Dc9N/cL5NHcYn8PlRk9LagjKu
         xYvu5OkDgBzapbXo5JKyZVKMys5KPW+qSRNFMq7sqLoxsH23lZvJSts3nzBvUd/lFLnJ
         F7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0POHmeb+eXvJz3LN0vc2xj1f3+3Y2WR46lMi04En16U=;
        b=t8fTpndN2e0OFTYBtursEbjPrujYpPq6tr6KYiCOibVIjWIuPnFKhB8Wc/oJHh8v0E
         irRlii/zQrUP3XDjzd04ei8G8dJ7jRb25FwWMoG9dToiCK58qmEhcJmMrBfUZFeNNdTD
         COtmWwQ4ZrHCUQETUFh8ysXcMgHYbfy7PN4YUitVld6aNsOAQqo1J/r3nhPz+xdnpz++
         RWh25aih/lfUlxLUJ2ziqgIUk978Xe5hwMTpvhG3SOigbVl+plT1t2xQy2EaCWikTjKb
         tpf3WHBE30iSjh0GnRO71CWMvb4jbfcwPjuANt0VJDQ0Jy+mFqh2pk/b+XR8xqVp2ay2
         4zvw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqCXdYf2F5jycxwW9ZOHberZkiW5DbFJJQYIh8elEPuq21B8iwT
	7jsLBR82imoDAGZ4ZPvU0ho=
X-Google-Smtp-Source: AMrXdXtrNRWn13xpIdmjiWHBfSf/ThOsejzcrc9k7EmvhAVdJ12Njl0JWA5YC6Taa/VWTo4T2f2OVw==
X-Received: by 2002:a25:d941:0:b0:725:a880:3f8e with SMTP id q62-20020a25d941000000b00725a8803f8emr4280967ybg.187.1672827662673;
        Wed, 04 Jan 2023 02:21:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:690c:607:b0:462:6db8:ed52 with SMTP id
 bq7-20020a05690c060700b004626db8ed52ls16774840ywb.1.-pod-prod-gmail; Wed, 04
 Jan 2023 02:21:01 -0800 (PST)
X-Received: by 2002:a81:1948:0:b0:46c:6733:1360 with SMTP id 69-20020a811948000000b0046c67331360mr4798284ywz.310.1672827661668;
        Wed, 04 Jan 2023 02:21:01 -0800 (PST)
Date: Wed, 4 Jan 2023 02:21:01 -0800 (PST)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <6d20589e-d410-40e4-b964-24f8f2911c70n@googlegroups.com>
In-Reply-To: <fecd57a3-ce2d-f2ff-d2a0-a1d70fdfb43c@siemens.com>
References: <9dd4fcde-efe8-41f1-9c71-b50e6d3c0dafn@googlegroups.com>
 <fecd57a3-ce2d-f2ff-d2a0-a1d70fdfb43c@siemens.com>
Subject: Re: Sensitivity of hypervisor configurations to HW changes (x86
 target)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7734_1364785558.1672827661016"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_7734_1364785558.1672827661016
Content-Type: multipart/alternative; 
	boundary="----=_Part_7735_1643194164.1672827661016"

------=_Part_7735_1643194164.1672827661016
Content-Type: text/plain; charset="UTF-8"

Thanks for the tip!

I also had a quite similar idea:
Hash values are calculated over the outputs of "lspci" and further files 
(e.g. /proc/iomem, /proc/ioports, ...) (e.g. with "sha1sum").
These hash values are linked to the hypervisor configuration.
Before the hypervisor or a guest cell is started, the hash values are 
calculated again and compared with the hash values stored for this 
configuration.

In practical use, however, it is sometimes necessary to adjust the 
hypervisor configuration on site (in the field).
The tools required for this (build essentials) and a make file could 
already be installed in the root file system of the target, so that the 
compilation of the configuration could be performed on the target.

However, the current situation is that to effectively control whether the 
hypervisor or the guest system starts, a "real" serial port is needed; 
otherwise, you don't really see where a successful startup fails.

Unfortunately, redirecting /dev/jailhouse to a file only works if the 
system does not crash.

It would be better if the hypervisor directly creates a file with these 
outputs and completes it before the system crashed.
Then, on a subsequent reboot, the contents of this file could be analyzed 
and the hypervisor configuration corrected.

Jan-Marc
j.kiszka...@gmail.com schrieb am Mittwoch, 4. Januar 2023 um 10:42:02 UTC+1:

> On 03.01.23 14:39, Jan-Marc Stranz wrote:
> > For the productive use of the hypervisor "Jailhouse" I am concerned
> > about another topic: "Sensitivity of the hypervisor configurations to HW
> > changes".
> >  
> > I have already created the hypervisor configurations for 8 different x86
> > HW targets (evaluation boards, industrial PC's, single board computers,
> > ...) for the root cell and for up to 2 guest cells.
> >  
> > I also "cloned" some HW targets; however, I was scrupulously careful
> > that the HW (RAM, PCI devices, BIOS version, ...) was identical.
> >  
> > To duplicate an x86 HW target, in my experience, the following
> > components must remain the same so that the hypervisor configurations
> > already created can still be used:
> > 
> > 1. CPU model and architecture
> > 2. RAM memory size
> > 3. PCI devices (including M.2 NVME SSD!)
> > 4. BIOS version
> >  
> > For mass production based on a Single Board Computer (SBC) some points
> > can easily be kept (e.g. CPU model and architecture, PCI devices (except
> > M.2 NVME SSD), BIOS version).
> >  
> > On the other hand, you can't guarantee that you can always use the same
> > type for the M.2 NVME SSD, for example.
> > However, the change of the type of the M.2 NVME SSD, which is actually
> > imperceptible for the user, will possibly be noticeable in the
> > hypervisor configuration (e.g. different PCI capabilities).
> >  
> > Another problem is the deviations that creep into memory and I/O layouts.
> > 
> > Are there any experiences and practical solutions regarding this topic?
> > I would appreciate any advice on this!
> > 
>
> As I suggested offline already:
>
> If you don't have control over checking new hardware combinations
> /before/ they go into production, I would consider adding a
> post-production check that runs 'jailhouse config create' on the device
> (or outside, against what 'jailhouse config collect' provided) and
> compares the generated reference config against an earlier version. On
> deviations, an engineer would have to look at the details.
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6d20589e-d410-40e4-b964-24f8f2911c70n%40googlegroups.com.

------=_Part_7735_1643194164.1672827661016
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the tip!<br><br>I also had a quite similar idea:<br>Hash values =
are calculated over the outputs of "lspci" and further files (e.g. /proc/io=
mem, /proc/ioports, ...) (e.g. with "sha1sum").<br>These hash values are li=
nked to the hypervisor configuration.<br>Before the hypervisor or a guest c=
ell is started, the hash values are calculated again and compared with the =
hash values stored for this configuration.<br><br>In practical use, however=
, it is sometimes necessary to adjust the hypervisor configuration on site =
(in the field).<br>The tools required for this (build essentials) and a mak=
e file could already be installed in the root file system of the target, so=
 that the compilation of the configuration could be performed on the target=
.<br><br>However, the current situation is that to effectively control whet=
her the hypervisor or the guest system starts, a "real" serial port is need=
ed; otherwise, you don't really see where a successful startup fails.<br><b=
r>Unfortunately, redirecting /dev/jailhouse to a file only works if the sys=
tem does not crash.<br><br>It would be better if the hypervisor directly cr=
eates a file with these outputs and completes it before the system crashed.=
<br>Then, on a subsequent reboot, the contents of this file could be analyz=
ed and the hypervisor configuration corrected.<br><br>Jan-Marc<div class=3D=
"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">j.kiszka...@gmail.com =
schrieb am Mittwoch, 4. Januar 2023 um 10:42:02 UTC+1:<br/></div><blockquot=
e class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; border-left: 1px soli=
d rgb(204, 204, 204); padding-left: 1ex;">On 03.01.23 14:39, Jan-Marc Stran=
z wrote:
<br>&gt; For the productive use of the hypervisor &quot;Jailhouse&quot; I a=
m concerned
<br>&gt; about another topic: &quot;Sensitivity of the hypervisor configura=
tions to HW
<br>&gt; changes&quot;.
<br>&gt; =C2=A0
<br>&gt; I have already created the hypervisor configurations for 8 differe=
nt x86
<br>&gt; HW targets (evaluation boards, industrial PC&#39;s, single board c=
omputers,
<br>&gt; ...) for the root cell and for up to 2 guest cells.
<br>&gt; =C2=A0
<br>&gt; I also &quot;cloned&quot; some HW targets; however, I was scrupulo=
usly careful
<br>&gt; that the HW (RAM, PCI devices, BIOS version, ...) was identical.
<br>&gt; =C2=A0
<br>&gt; To duplicate an x86 HW target, in my experience, the following
<br>&gt; components must remain the same so that the hypervisor configurati=
ons
<br>&gt; already created can still be used:
<br>&gt;=20
<br>&gt; 1. CPU model and architecture
<br>&gt; 2. RAM memory size
<br>&gt; 3. PCI devices (including M.2 NVME SSD!)
<br>&gt; 4. BIOS version
<br>&gt; =C2=A0
<br>&gt; For mass production based on a Single Board Computer (SBC) some po=
ints
<br>&gt; can easily be kept (e.g. CPU model and architecture, PCI devices (=
except
<br>&gt; M.2 NVME SSD), BIOS version).
<br>&gt; =C2=A0
<br>&gt; On the other hand, you can&#39;t guarantee that you can always use=
 the same
<br>&gt; type for the M.2 NVME SSD, for example.
<br>&gt; However, the change of the type of the M.2 NVME SSD, which is actu=
ally
<br>&gt; imperceptible for the user, will possibly be noticeable in the
<br>&gt; hypervisor configuration (e.g. different PCI capabilities).
<br>&gt; =C2=A0
<br>&gt; Another problem is the deviations that creep into memory and I/O l=
ayouts.
<br>&gt;=20
<br>&gt; Are there any experiences and practical solutions regarding this t=
opic?
<br>&gt; I would appreciate any advice on this!
<br>&gt;=20
<br>
<br>As I suggested offline already:
<br>
<br>If you don&#39;t have control over checking new hardware combinations
<br>/before/ they go into production, I would consider adding a
<br>post-production check that runs &#39;jailhouse config create&#39; on th=
e device
<br>(or outside, against what &#39;jailhouse config collect&#39; provided) =
and
<br>compares the generated reference config against an earlier version. On
<br>deviations, an engineer would have to look at the details.
<br>
<br>Jan
<br>
<br>--=20
<br>Siemens AG, Technology
<br>Competence Center Embedded Linux
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/6d20589e-d410-40e4-b964-24f8f2911c70n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/6d20589e-d410-40e4-b964-24f8f2911c70n%40googlegroups.co=
m</a>.<br />

------=_Part_7735_1643194164.1672827661016--

------=_Part_7734_1364785558.1672827661016--
