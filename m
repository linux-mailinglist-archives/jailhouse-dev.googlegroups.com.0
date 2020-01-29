Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN4TY7YQKGQEFSF5BSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 815EB14D01A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 19:06:48 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id u18sf241820wrn.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 10:06:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580321208; cv=pass;
        d=google.com; s=arc-20160816;
        b=xtw17V4icF/el6Fw//JrSgyF869kk50UU4Gh3R8E3uBgUUtkcbeg2BW7g51wz0CZiH
         y6QUrbWk+7BHgh2cAHg+rtb1zF+umW061IwsaEv2Thl+sILnfSqxImYVqb/RjiEaHM0G
         H8pDDFtx5SozC0l3/AfMdwUSGGU+sSDZ6JCg8SCFgo4h4DMb6blryVSkgo0wraDDsmRB
         1thP94TR1/6KZcEjSIeYO5ZRI6ahIxadKJhWsvOyHUwFeQLNLUlZzpDamjGxWYqNLrhG
         nPLGbyD4cNaguRUWjlvW0u9Z0nDBSpIZ6uCK9bAE2IjP0vePlMZUFz2cDJNC8XyjUTca
         qVYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=AMh9zVxh8NqDaCxa3KscJ8UJOXY1/Ws/JQGA3THBklw=;
        b=TrgPq++0BpKY9lnkhj9T+YOv6iVEoV17GQcwIhrBPQfKVda49dgvomZaZsrtizKCVt
         ZwzI6+U6IOsi/mH7vdvWd5SW8VVXKGa+oZP5qkIlIVskIs7coJcvj+JCq0nZ6SxRGbkz
         wei/U0q2rG/40A3m3zjpodV3kCqWdWtZKAHMTcnMR3/MQqJRRLiMXfCa6Wfy0PaVqXmm
         A2tfPuP7jhheFnKcjcBT/nSZzn01tHtii3BkacUY7QOiaCkh53Xn4YCgv+/HUD7enJKo
         vvQdIa4q0zYP+vHkouR3gfM12qu53jKqTOUqLynmnMAT/XqgfppWOQ9zI9Dk/jpoN3FH
         l0Rg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AMh9zVxh8NqDaCxa3KscJ8UJOXY1/Ws/JQGA3THBklw=;
        b=dCfNuCzoBlaPKI9fSIiM1Y1o/DHaHBixEDj8NvEZbLwhrwfMjeRBJq/c6ukyeqCnbU
         598pjumEzpV/JWrtP1OcKc5ba2ozED/k6UqnFaOg5BZOAB0TkECdmHde1N13DBI/lNVe
         9JgC6G7gwvFVu3YV3oUm+7JgulNa8NRh6VVyzTD/kcCcemqIbIBiClIgOJM7qTUm1iiu
         Eu8ytWGjpoUe2AneRE69Tdqe0JevmgmnKlrWL4I54JL2HSMYepehcVVgqEpzDFrqU6Cu
         4TzZRV3VZ74OVlnbHfzVpGEZAov5HZVCUkZsCnHS4NOGXOnnVOBIHiCXUalQHnKGEYC4
         MLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=AMh9zVxh8NqDaCxa3KscJ8UJOXY1/Ws/JQGA3THBklw=;
        b=nJn0nFb77C5A8juUiHcebnu8zck25ycfYC/c8inDTenQk9lAtfgymbG/s4lPTxJ3KV
         w5OOeB0XdZbSeV6iNLxTiHTXZjuMF/PUSw/JUbZ/cNal6kjAxHUPn2Wl5S1BtsE9gbQu
         aiUlQue19TZsRKJ3CUK5Fa/q+5DQzc7R07sMprIXqruo9dJTWkDY4lVj+NcOs4YZIdFO
         24EUkQahlrVrTxu0QscaXPtDn29ZmPAZAUNILEqw+MFOLp5+gwLqQdePgu6hvBeLnV1a
         RDvr3+IU8Qc6WNz/JNr0fL9wK6hSPEXmgW4F3eoMQMDbobZ14MFICCQs3YlRwDyRuGYD
         zxrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWLzZ0wfF9m7sfARcydbOqOp1IznLDLtdB/ukhuLCAzFtAHHM6R
	1OlfeBbZ4OFJbAj2oVn2+lI=
X-Google-Smtp-Source: APXvYqzMlSCG+BIrb1yn0OmfVGmKYRmoQSeWZAg1tgP3CoCcaXKZUksjdZCJD3C0nuM3syM+5HxT8w==
X-Received: by 2002:adf:a746:: with SMTP id e6mr5150wrd.329.1580321208159;
        Wed, 29 Jan 2020 10:06:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fc89:: with SMTP id g9ls268485wrr.5.gmail; Wed, 29 Jan
 2020 10:06:47 -0800 (PST)
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr72541wrs.92.1580321207327;
        Wed, 29 Jan 2020 10:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580321207; cv=none;
        d=google.com; s=arc-20160816;
        b=ubmXDghkImhxMkD8tlA9RnK2ZAjaORjQsuqnO+Ehinomb/qvOKA/JFRfhG9m94JBKP
         fZdkyK7xiK8o6cDA34oxbhIY8MuuMwWt1OjiF5Pe4HBlH46axqu6SYLT7qbIXRGfO545
         rS7QOj+nb8mSsMCeJUvrjYCraJbaOa18+4iOPsWTINnK8NFGBeB1FOZOCqSl3Rnu3Cow
         YvCOoW6ewWn5iwZ4+WCL3li5JOq2TscKUr2kQkYbC2hMiAYfGM5pB2uZh988eQm7UNbq
         hnVo8iYNBsDh8EeqWY7ZzmmY2AGf0FaknaSIuQ/P5uD/ds90bWjBCK83KBRgyMvoS1xR
         AsQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=wgX5xL6ypQnVVPc6GUJSGI8Jm8SUeiRHkwPIw/u12sA=;
        b=L7pVe5/GeOVI0/bzjEDaQjJYK1T/PNGS1Lf9tdNb5mGnl4d1Zgpm7orKiVlsQtcVLy
         fSEy1JALfnXzVNnGgnyUWzK2rvD4chwLLAIejvRBSrNvWdDNXuFDMlmNMggXJtCZ84sD
         ImERMfIDq0VgvmLRcU39CnMHCmy+N71hRufSYxJ2pOhabIOoiMicU+Jbi/ZFgashP06O
         bXuEcYABswZlAeKIju4DApi4muRe+qDm7SHVdTxuHJXR4qJzzzogVPsjgWJln60veBMo
         xfIvh/t9wLcHtmdGzypvo9HZUzVI8HTzHu7VW8E2ddwVaoM1IO0IPoAmhoJHPPj2ko9c
         VC0Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id e21si309394wme.1.2020.01.29.10.06.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2020 10:06:47 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00TI6kUO028831
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2020 19:06:46 +0100
Received: from [167.87.35.150] ([167.87.35.150])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00TI6jsP024996;
	Wed, 29 Jan 2020 19:06:45 +0100
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2 kit
To: Saroj Sapkota <samirroj2016@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
 <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <72876f0a-4d50-45e3-cd21-751f8bf223fb@siemens.com>
Date: Wed, 29 Jan 2020 19:06:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 29.01.20 18:04, Saroj Sapkota wrote:
> I changed the extlinux as suggested by Henning schild, as
> attached file:
> and rebooted the system and checked the following:
> printenv gives:
> tx2@tx2 $ sudo printenv
> [sudo] password for tx2:
> LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;35:do=
=3D01;35:bd=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:sg=3D=
30;43:ca=3D30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01;31:=
*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*.lz4=
=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=3D0=
1;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.Z=3D01;31:*.dz=3D01;31:*.gz=
=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D01;3=
1:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31:*.=
tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=3D=
01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01;31=
:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.swm=
=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=3D=
01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D01;=
35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35:*.=
tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.pcx=
=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=3D0=
1;35:*.webm=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D01;3=
5:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:*.rm=
=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=3D0=
1;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;35:*.=
cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.au=3D=
00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=3D00;=
36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;36:*.o=
ga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:
> LANG=3Den_US.UTF-8
> HOME=3D/home/tx2
> TERM=3Dxterm-256color
> PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap=
/bin
> MAIL=3D/var/mail/root
> LOGNAME=3Droot
> USER=3Droot
> USERNAME=3Droot
> SHELL=3D/bin/bash
> SUDO_COMMAND=3D/usr/bin/printenv
> SUDO_USER=3Dtx2
> SUDO_UID=3D1000
> SUDO_GID=3D1000
> Similarly output of cat /proc/cmdline is :
> root=3D/dev/mmcblk0p1 rw rootwait rootfstype=3Dext4 console=3DttyS0,11520=
0n8=20
> console=3Dtty0 fbcon=3Dmap:0 net.ifnames=3D0 video=3Dtegrafb=20
> no_console_suspend=3D1 earlycon=3Duart8250,mmio32,0x3100000=20
> nvdumper_reserved=3D0x2772e0000 gpt tegra_fbmem2=3D0x140000@0x9607d000=20
> lut_mem2=3D0x2008@0x9607a000 usbcore.old_scheme_first=3D1 tegraid=3D18.1.=
2.0.0=20
> maxcpus=3D6 boot.slot_suffix=3D boot.ratchetvalues=3D0.2031647.1=20
> bl_prof_dataptr=3D0x10000@0x275840000 sdhci_tegra.en_boot_part_access=3D1=
=20
> quiet mem=3D7808M vmalloc=3D512M
>=20
> when i again tried to enable jailhouse through command sudo jailhouse=20
> enable Downloads/linux-jetson/configs/arm64/jetson-tx2.cell
> terminal cell hangs and debug cell gives following output:

We need the output on the serial console configured in jetson-tx2.c as=20
Jailhouse debug channel.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/72876f0a-4d50-45e3-cd21-751f8bf223fb%40siemens.com.
