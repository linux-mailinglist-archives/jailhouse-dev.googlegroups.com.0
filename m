Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXFVY7YQKGQEZW7QJIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEB614D123
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 20:19:56 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id g20sf385074edt.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 11:19:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580325596; cv=pass;
        d=google.com; s=arc-20160816;
        b=D6d7OjaLcal2SKCwiPc3V0ygAWdcCbiderXntGMfx4B8OSpWCeDAdLPpbRTx8aJvoh
         Z4P372CHXE6v9sPWtiV600WEk2stkyxiYXYHeT3Sma9GGAxMmeFrvh21gtqW6GGJZ3G6
         HNh59fbTHna4nSYV40LIAbVBfMu4f/IShITLyDnfCZbFE7IwdRYdtJ/s8paaqwTnqBRo
         41xqVBXbJLJZKjs7TEqTk5moGwokGg+R3TBerCwHGMou0XXGo5PmdsxWVwGGEiEk6N80
         8KMoaNCeL61djy2bbEBfxo5OC0hRu4ZWo9b4gdTv5qGXUszBo4uwj393WN9R/UO9wvLi
         ES3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=TmdE/Hv/Ol2gXTPPIR88qeuVUiIK/cChLmRhfgQBa0c=;
        b=HJePN1dCEwSXXxA1vyJ44ba3KJnBZW3Y6gVEmxZcU6RcX0JvWBNwHTEfAZTDw5UmoW
         0njqW+bjqZTFW+MSX5Zgv1oCtozFQEU3uHjBxJBJIfKUXPLZVXwwyU0WDF/WbpJZDKVz
         /B8c+iviNtHSyEVp65b5VLcwavHRP65umdglfSCPKjfVglULMUA+j6HRBUiQq+C+rQOX
         n1s6rexe02bz9c3UrlE7FoBEVxcz8vK0V1DrxZCzfa5nc5jWdD09CLAk4Rvwaxyr1Y3p
         gsFcvD9dd5jkbliNIM2MaoF1SFZ+iVVSt8MiRuRUqWh5aT6TPprVPz8Vs/M8XrbBbbvk
         +kcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TmdE/Hv/Ol2gXTPPIR88qeuVUiIK/cChLmRhfgQBa0c=;
        b=SHonAnUrqMRzfdod+H5N5gBgnGRzxGUtNbZYnAg+k9dZjLHSZ5umnRanp450pEfXkW
         mt7ToT4cf8JlHbNY3QDXvrhsSKsHsTh/iKYPEOMesS+SWC/beI9MiajQEhJKR7pMJcUf
         LjbWg6Q2gNHqaJ257tesWjktNHHek8QrlbRLVOaH0OcgVbYo8kIztar6DrPUV78kQJ3j
         TfQwahAIOFz9RWaHByatz0sf5nz5eo0KJeqQYLkKW0PRzdHg78bcot8mEjCXG1l7fTcb
         R1hNsWsLpgS6iOx0iZBZlq3NTmaXVSS67IMytONnJGdkbIwU/K6lgVCfA4JE6YH3CGxQ
         sKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TmdE/Hv/Ol2gXTPPIR88qeuVUiIK/cChLmRhfgQBa0c=;
        b=exC13xzkSGAzu/7cUYH8RqFLjrn+byz3rj+Vz1c2W0nacW7Kttn+8rfH+CMcn+F/NB
         z8aLHzo5BU6NCzOgqlbIYfAJQr0WCCp0RyTOvYhggEB88jvNnLanJvjwvUrlcOPP+tZ8
         BFrYcYz9TqXNHpijh5Ulr8Lwty+yJvdCFTh0rJaA07bHlpq69PO3R8ju0ym84qcL2ZZP
         AuXTaCBXsVdScD1p4Eso4jtVDJd5zSWCTJ+cLA8FE+P1/JJrfH7EzyaqDHs89YArIQXp
         U2ESbE4HaycK0Oj92odJDg+Gj9989K8PH0HSqEG2RN08MKn1bPO8vNl4mcyPYkxel2/y
         IMig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUEgAvH5fIqwNXFccVHn7W8x17l4w8BWz08v6AqoM5GCXnRbBn+
	pUv5FLGqA9EkHJRZHciwwk8=
X-Google-Smtp-Source: APXvYqxQeTFXHO9qRuErPgy+jKDdb9t1SlDbC5o1owu8fheF71gF2y+HkoZrS1feJJTWp5c/3tXkKA==
X-Received: by 2002:aa7:d1d0:: with SMTP id g16mr500666edp.56.1580325596185;
        Wed, 29 Jan 2020 11:19:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:8c1:: with SMTP id o1ls235576eje.4.gmail; Wed, 29
 Jan 2020 11:19:55 -0800 (PST)
X-Received: by 2002:a17:906:244e:: with SMTP id a14mr881411ejb.43.1580325595392;
        Wed, 29 Jan 2020 11:19:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580325595; cv=none;
        d=google.com; s=arc-20160816;
        b=YFeq05b5rnu60nyQyOfI+1LAYPOCfeB5HNi47lTmcG7zP8rip0QKOfiMIVF8f78IfR
         tcMixrVwECgDIdvEtZu5i4c3rhQ4/H+0Lu5rpirS2RALYgTWeyaQ0JRoHmA3ECs6igOX
         8Sp4OKEfZ91GvCIhuF0rINvRGUnd9xS1MDizIuajxJ4KP91YrtvjATu2krFsOunACxnM
         2yHag7qNbdw+l1671FqWOwwMvZvJ1aLms1ifhCCoIK95bM+ACdU6pkD5Q0WdJVVDNqUY
         4ToTEnpvtebJIE+WChbpJIpB6rqjAftN0+Ge+UFfmJB6pEbQlmiVNJFh/w44GiFSjYiW
         VbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=2ejqsa2mOrXi6oOKoRFzfmezAnPZjEv9+811Jieta2o=;
        b=tVwzvkw7Vk1L9fMoBJJRkXC62YFUWgTv5jL2t4iLb6EXhtMHCg1+TvxMjtPxVxhwBu
         USAJfiIDQfsBTj97tYeIFkcsmvcteHdL7wg1+bGfbgZll0beWCJ6QnUndcIyoLj0K/ea
         EvNnLfmOWGxTdx/xp1yaG2oK+iSQOYAPXHvLjjLgJIlWJWX9R+SvjtuvewBUZrck7tVF
         6+QDkRf7DTMQ9fv7lpxkYZvy9S4nsw/npoeh5RFQvkVM7wXybAYlptkay1FPU5lIV8qp
         LfizNuMTqFPqm0Z1IL6rovaZW5iggSdwRLUlSzMjyOexe+Ala1n+h6MMxZWjoeQqB8Jg
         Pk5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id ba12si100798edb.3.2020.01.29.11.19.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jan 2020 11:19:55 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 00TJJsvk031153
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jan 2020 20:19:54 +0100
Received: from [139.22.38.109] ([139.22.38.109])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00TJJrRQ027247;
	Wed, 29 Jan 2020 20:19:54 +0100
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2 kit
To: Saroj Sapkota <samirroj2016@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
 <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
 <72876f0a-4d50-45e3-cd21-751f8bf223fb@siemens.com>
 <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <77fe6716-0d3b-8547-ba86-3797a33706e2@siemens.com>
Date: Wed, 29 Jan 2020 20:19:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 29.01.20 19:52, Saroj Sapkota wrote:
> I have attached jetson-tx2.c and serial console output that is obtained=
=20
> after jailhouse enable command.
>=20

I think I'm starting to under (I don't have access to any TX2 to=20
validate): We are crashing while enabling Jailhouse, thus not messages=20
from that side. And that crash might be because you are using the=20
4GB-version of the TX2 while the config is targeting the 8GB-version.

If that is true, you can likely resolve the issue by shrinking the mem=3D=
=20
reservation by 4G and also moving the hypervisor range in the config=20
down by 4G.

Jan

> On Wednesday, January 29, 2020 at 12:06:48 PM UTC-6, Jan Kiszka wrote:
>=20
>     On 29.01.20 18:04, Saroj Sapkota wrote:
>      > I changed the extlinux as suggested by Henning schild, as
>      > attached file:
>      > and rebooted the system and checked the following:
>      > printenv gives:
>      > tx2@tx2 $ sudo printenv
>      > [sudo] password for tx2:
>      >
>     LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;36:mh=3D00:pi=3D40;33:so=3D01;3=
5:do=3D01;35:bd=3D40;33;01:cd=3D40;33;01:or=3D40;31;01:mi=3D00:su=3D37;41:s=
g=3D30;43:ca=3D30;41:tw=3D30;42:ow=3D34;42:st=3D37;44:ex=3D01;32:*.tar=3D01=
;31:*.tgz=3D01;31:*.arc=3D01;31:*.arj=3D01;31:*.taz=3D01;31:*.lha=3D01;31:*=
.lz4=3D01;31:*.lzh=3D01;31:*.lzma=3D01;31:*.tlz=3D01;31:*.txz=3D01;31:*.tzo=
=3D01;31:*.t7z=3D01;31:*.zip=3D01;31:*.z=3D01;31:*.Z=3D01;31:*.dz=3D01;31:*=
.gz=3D01;31:*.lrz=3D01;31:*.lz=3D01;31:*.lzo=3D01;31:*.xz=3D01;31:*.zst=3D0=
1;31:*.tzst=3D01;31:*.bz2=3D01;31:*.bz=3D01;31:*.tbz=3D01;31:*.tbz2=3D01;31=
:*.tz=3D01;31:*.deb=3D01;31:*.rpm=3D01;31:*.jar=3D01;31:*.war=3D01;31:*.ear=
=3D01;31:*.sar=3D01;31:*.rar=3D01;31:*.alz=3D01;31:*.ace=3D01;31:*.zoo=3D01=
;31:*.cpio=3D01;31:*.7z=3D01;31:*.rz=3D01;31:*.cab=3D01;31:*.wim=3D01;31:*.=
swm=3D01;31:*.dwm=3D01;31:*.esd=3D01;31:*.jpg=3D01;35:*.jpeg=3D01;35:*.mjpg=
=3D01;35:*.mjpeg=3D01;35:*.gif=3D01;35:*.bmp=3D01;35:*.pbm=3D01;35:*.pgm=3D=
01;35:*.ppm=3D01;35:*.tga=3D01;35:*.xbm=3D01;35:*.xpm=3D01;35:*.tif=3D01;35=
:*.tiff=3D01;35:*.png=3D01;35:*.svg=3D01;35:*.svgz=3D01;35:*.mng=3D01;35:*.=
pcx=3D01;35:*.mov=3D01;35:*.mpg=3D01;35:*.mpeg=3D01;35:*.m2v=3D01;35:*.mkv=
=3D01;35:*.webm=3D01;35:*.ogm=3D01;35:*.mp4=3D01;35:*.m4v=3D01;35:*.mp4v=3D=
01;35:*.vob=3D01;35:*.qt=3D01;35:*.nuv=3D01;35:*.wmv=3D01;35:*.asf=3D01;35:=
*.rm=3D01;35:*.rmvb=3D01;35:*.flc=3D01;35:*.avi=3D01;35:*.fli=3D01;35:*.flv=
=3D01;35:*.gl=3D01;35:*.dl=3D01;35:*.xcf=3D01;35:*.xwd=3D01;35:*.yuv=3D01;3=
5:*.cgm=3D01;35:*.emf=3D01;35:*.ogv=3D01;35:*.ogx=3D01;35:*.aac=3D00;36:*.a=
u=3D00;36:*.flac=3D00;36:*.m4a=3D00;36:*.mid=3D00;36:*.midi=3D00;36:*.mka=
=3D00;36:*.mp3=3D00;36:*.mpc=3D00;36:*.ogg=3D00;36:*.ra=3D00;36:*.wav=3D00;=
36:*.oga=3D00;36:*.opus=3D00;36:*.spx=3D00;36:*.xspf=3D00;36:
>=20
>      > LANG=3Den_US.UTF-8
>      > HOME=3D/home/tx2
>      > TERM=3Dxterm-256color
>      >
>     PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/=
snap/bin
>=20
>      > MAIL=3D/var/mail/root
>      > LOGNAME=3Droot
>      > USER=3Droot
>      > USERNAME=3Droot
>      > SHELL=3D/bin/bash
>      > SUDO_COMMAND=3D/usr/bin/printenv
>      > SUDO_USER=3Dtx2
>      > SUDO_UID=3D1000
>      > SUDO_GID=3D1000
>      > Similarly output of cat /proc/cmdline is :
>      > root=3D/dev/mmcblk0p1 rw rootwait rootfstype=3Dext4
>     console=3DttyS0,115200n8
>      > console=3Dtty0 fbcon=3Dmap:0 net.ifnames=3D0 video=3Dtegrafb
>      > no_console_suspend=3D1 earlycon=3Duart8250,mmio32,0x3100000
>      > nvdumper_reserved=3D0x2772e0000 gpt tegra_fbmem2=3D0x140000@0x9607=
d000
>      > lut_mem2=3D0x2008@0x9607a000 usbcore.old_scheme_first=3D1
>     tegraid=3D18.1.2.0.0
>      > maxcpus=3D6 boot.slot_suffix=3D boot.ratchetvalues=3D0.2031647.1
>      > bl_prof_dataptr=3D0x10000@0x275840000
>     sdhci_tegra.en_boot_part_access=3D1
>      > quiet mem=3D7808M vmalloc=3D512M
>      >
>      > when i again tried to enable jailhouse through command sudo
>     jailhouse
>      > enable Downloads/linux-jetson/configs/arm64/jetson-tx2.cell
>      > terminal cell hangs and debug cell gives following output:
>=20
>     We need the output on the serial console configured in jetson-tx2.c a=
s
>     Jailhouse debug channel.
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/3f267078-10bf-4a5c-86df-9=
a2cf0d4abd4%40googlegroups.com=20
> <https://groups.google.com/d/msgid/jailhouse-dev/3f267078-10bf-4a5c-86df-=
9a2cf0d4abd4%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/77fe6716-0d3b-8547-ba86-3797a33706e2%40siemens.com.
