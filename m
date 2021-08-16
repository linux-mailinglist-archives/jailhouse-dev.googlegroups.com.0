Return-Path: <jailhouse-dev+bncBCDKXZOSXMDRBB4B5OEAMGQEDYPA3TY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5EC3EDE03
	for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Aug 2021 21:46:16 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id r13-20020ac85c8d0000b029028efef0404csf9812967qta.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 16 Aug 2021 12:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4WtEovdjRjZ/vpEdzvfZJRbU70c5RnWkMPz6sCEk8Is=;
        b=W7Z/YV6UMPgHtFe4UV1EylRsov2jag6hWLuFOTO64tRu5j19W9db/j95RzYRpB9hff
         0epJB/bmf/5sjZh+QR2cO8pnji4eEhcHyQTPhBHd3bPjoH7Wkoasl93wTUZcCDN9t5gt
         7jdWyTJgW/LiQaqlqTX9ASKvJ0YZvWQag8uEKY3++H92PnCGv17JwDw+0XqLaAOdpSlU
         dbgwwx4wSByhZX/KoroIF9pxPfjuCFc4t5eLTz9kDlpZ3nCSdoFpHMd4NEJy/0m1NxaK
         E8N1OKnziA/fus45d6GF9L/TpmblXBL7h8YVBsVt+KtNmjFx0Np1yjLMQ5Dsa2kdX0AH
         dicw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4WtEovdjRjZ/vpEdzvfZJRbU70c5RnWkMPz6sCEk8Is=;
        b=ApfDsklCnAXOlTdKyYXpfTH7BBaE1krlKHqRuTmC1335x9e3RiCeitnHlqdOxch/3T
         aqghuuWJ7VD9AXj/v3NEiOhBIpgQV5fFcUri5cRbjWvQrkWmBc8KWUE1Tu6K+6OBz+3/
         7MdiEo7atnm/PpZdPB3pl0uVf7Pwd0rRgmgeUkzZf8UVU9RoTtmkA3bFvH9fqSTfwy+J
         ctOleBTxNOYNc6j68KebnTggWOLjMAIJN4MqIxQxCDLDOdnE5zKvdpGsYUYThoNXT5Nb
         rjMb0WVRPcL5FwKaRqz6vZV2sJhzqmv9GkobfBNb5sCswswmWidKCM54HGXxfxG+MVlE
         NjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4WtEovdjRjZ/vpEdzvfZJRbU70c5RnWkMPz6sCEk8Is=;
        b=JSumhTd0q+/toaT9o9Xs++rAyYqSqN2J0OJwHcgMb3g6K3aAk0EB1sAMc8B3g4T1fz
         /myqQCfbRACO2eUxPIW6zHwzWNasQMHC2dwRSj1KuD9vTI/+z8l6nqAfs8PV21XMsvg9
         6jrXI3VXk9Ef6RWAzq6fBOy0x9/t2Rx2FudJvmXCaEz91plJwgXs6TheHi9pnmH3oD8s
         k7/SLmnhctD/pPjhJT8DKBdH9cTY9DsJwpjfs8yeJa9RiAkiaemnQQma4/E3N7kwa/lX
         KB+0qo8wCPHMO2KeRNuwcx1h6m+KBIHH7QR38J7134tOle2fUqg1xt88AMA5f4U9Mom3
         nMDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533f7RaF9yTytSaRTuSi7EOySj9xBLic4f9tB9zu7M6i3wFFMkQB
	SiSRGZa3DU9wLtAX23BAl+w=
X-Google-Smtp-Source: ABdhPJyxej/g+bwcl4mPsdihELm6uWSqF4lfQno6kx8ID6g5aRQF7rZLAPYMlYYjBwK4HYMRc0GIrQ==
X-Received: by 2002:a05:622a:138c:: with SMTP id o12mr517072qtk.315.1629143175329;
        Mon, 16 Aug 2021 12:46:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:e605:: with SMTP id z5ls222459qkf.8.gmail; Mon, 16 Aug
 2021 12:46:14 -0700 (PDT)
X-Received: by 2002:a05:620a:c53:: with SMTP id u19mr628370qki.144.1629143174553;
        Mon, 16 Aug 2021 12:46:14 -0700 (PDT)
Date: Mon, 16 Aug 2021 12:46:14 -0700 (PDT)
From: Cri Vitali <cccrrriii95@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <7b26fdc8-3ea6-4275-9c1e-bc8de873f906n@googlegroups.com>
Subject: Share Memory beetween Linux & FreeRTOS
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_200_481726335.1629143174042"
X-Original-Sender: cccrrriii95@gmail.com
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

------=_Part_200_481726335.1629143174042
Content-Type: multipart/alternative; 
	boundary="----=_Part_201_1097822023.1629143174042"

------=_Part_201_1097822023.1629143174042
Content-Type: text/plain; charset="UTF-8"

Hello everyone! 

I have a Jetson tx2, where three cores are assigned to linux kernel and one 
core to FreeRTOS using jailhouse hypervisor. I need to share a buffer 
between one process in FreeRTOS and another one running in Linux. 

I read this slide [1], but it is not clear to me which solution I have to 
choose. Can you give me some advise or documentation for start in this 
topic. 

Thank you so much! 

[1] 
https://events.static.linuxfound.org/sites/events/files/slides/LinuxConJapan-2016-Jailhouse-IPC.pdf 2 
<https://events.static.linuxfound.org/sites/events/files/slides/LinuxConJapan-2016-Jailhouse-IPC.pdf>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7b26fdc8-3ea6-4275-9c1e-bc8de873f906n%40googlegroups.com.

------=_Part_201_1097822023.1629143174042
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone!&nbsp;<div><br></div><div>I have a Jetson tx2, where three c=
ores are assigned to linux kernel and one core to FreeRTOS using jailhouse =
hypervisor. I need to share a buffer between one process in FreeRTOS and an=
other one running in Linux.&nbsp;</div><div><br></div><div>I read this slid=
e [1], but it is not clear to me which solution I have to choose. Can you g=
ive me some advise or documentation for start in this topic.&nbsp;</div><di=
v><br></div><div>Thank you so much!&nbsp;</div><div><br></div><div>[1]&nbsp=
;<a href=3D"https://events.static.linuxfound.org/sites/events/files/slides/=
LinuxConJapan-2016-Jailhouse-IPC.pdf" style=3D"text-decoration-line: underl=
ine;">https://events.static.linuxfound.org/sites/events/files/slides/LinuxC=
onJapan-2016-Jailhouse-IPC.pdf&nbsp;2</a><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/7b26fdc8-3ea6-4275-9c1e-bc8de873f906n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/7b26fdc8-3ea6-4275-9c1e-bc8de873f906n%40googlegroups.co=
m</a>.<br />

------=_Part_201_1097822023.1629143174042--

------=_Part_200_481726335.1629143174042--
