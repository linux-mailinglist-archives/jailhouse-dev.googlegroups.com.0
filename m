Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBDM2ZXUQKGQE3LLAYII@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB16F026
	for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Jul 2019 19:19:11 +0200 (CEST)
Received: by mail-oi1-x240.google.com with SMTP id 189sf13752191oii.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Jul 2019 10:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1in+0gfdbpdBjLzPa4P5VotxupLAf8ii1kSrThjX46c=;
        b=NGRGVt2zXdZiNJ9H6KO6fD6vxwNvj+J+nEe3nUXEoZfeuWiHOi6jKZy+qNOwyYNLNg
         gpK/jXv09vwH7VbPB11mn97bDRxzyDizpoYQZtO2ddbAuEnh/p3PoOuKC/UZg8I0ayIj
         9RTVsdwrvYdS2NEz9jzBiEZZLMs+Gbv1AEROdJwExPZvLy+/JRcB+neIAaqbS77j8++S
         BpKL9MX8Uq+z84qsxU5SRuIF8NYzpysF1x4gFFNdQyXoORxJWrQGFtK1zPjRhFJuXXae
         334sMg11+4Tp3mPzY0Wz4zR3ISy6s1CJFlBojaPglG7Nb84YdOFpKXSOydKtXXovCDdl
         uasg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1in+0gfdbpdBjLzPa4P5VotxupLAf8ii1kSrThjX46c=;
        b=sSbqmz7OX/cZA4nyjaNGhD6xhz+s8rfKLx8QzEeO/IxHksJZVGA3Yx2Q3hqHUeei7+
         gUer8o0ju/v2s3Oam/MSM24oCzLnRwm+bKuy4pHYwUOr/q8ruNPAwpdawqtd3N8v9BWk
         noSr+ULmuO3Vxb08b46hi7Q5eM+4ng1BSfsBUxYZlqM2TJNrjW0CKLD++h0oe8knCxzu
         3P+YokL3dVmZ8kLnwVvASA725DPEAXdSLDTcWKRyHxXBORGxTBvuQPEY7ikc1En34fHI
         nx5+PSIhrcsL+WaucBizBhM+q3TJIr05YreM7YO7Jluxk3sX4Nwql8QZIjYXFMUbPUKF
         AKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1in+0gfdbpdBjLzPa4P5VotxupLAf8ii1kSrThjX46c=;
        b=AtyiFCzHV1P/Of/APvcSpr1nQlbBiJIE1qaSRUO4k00uBfOAypQ8oUyC4zVP8Xc9H7
         yesAyN1BEjDYXvFxoEM0qHXoS5pCAHzA01A5dFhUvb0ZUFc9wS1Rj5ZOhrFUvEdkCKEN
         L7sVK5rYdeJccssOc3FkzNLasdTci+xYll5SyW3KWtKiVLlfjAUx8zPz87dXq8o+8R0Z
         lw7FOUT9jo2c0XzGN0/38cX/J9a5k0y3Zwh2vH4LcQbgTEjQgFW65R/5PQhArIb4B0zC
         awanDgIHcEbb/X+WrK2+hnchfxMc9QLxvn9zXchla6jrLB2go4c3Mz/P++U+SOie14vH
         PKUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXgPU76EsRO2b8CGSiPv9oEzZi3Qu07yr2uk7OGS5BRKwARFcPZ
	Js6HeYAPgvVtFnDXOlZnEME=
X-Google-Smtp-Source: APXvYqykpekoeSG/Ny2a+tdNP3T99hdACKYj6fC4XHconzSrK9dh+wBTXrSQtbpOFgYXUarK7oazzg==
X-Received: by 2002:a9d:2c47:: with SMTP id f65mr44832931otb.185.1563643149603;
        Sat, 20 Jul 2019 10:19:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:3a44:: with SMTP id h65ls4546792oia.1.gmail; Sat, 20 Jul
 2019 10:19:09 -0700 (PDT)
X-Received: by 2002:aca:dc86:: with SMTP id t128mr30308237oig.130.1563643148963;
        Sat, 20 Jul 2019 10:19:08 -0700 (PDT)
Date: Sat, 20 Jul 2019 10:19:08 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a8a5bcdc-c3b7-459b-9116-fd4a04f2f02a@googlegroups.com>
Subject: JAILHOUSE_ENABLE: invalid argument error
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5034_525793296.1563643148240"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_5034_525793296.1563643148240
Content-Type: multipart/alternative; 
	boundary="----=_Part_5035_510634793.1563643148240"

------=_Part_5035_510634793.1563643148240
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to use coloring on my board, using branch wip/coloring, but 
when i issue "jailhouse enable root_cell.cell", the console outputs 
"JAILHOUSE_ENABLE: invalid argument".

I've modified drivers/main.c to printk some steps, and i've noticied that 
the jailhouse.ko generated from wip/coloring branch doesn't get the right 
value for config_header.root_cell.cpu_set_size on jailhouse_cmd_enable() 
function.
The value for config_header.root_cell.cpu_set_size should be 8 bytes (it 
comes from root cell config file) but somehow it reads 0 bytes.

root cell config file.c

> ....
> __u64 cpus[1];
> ...
> .cpu_set_size = sizeof(config.cpus);
> ...
>


When i use the master branch, within jailhouse_cmd_enable(), it reads 
correctly 8 bytes from config_header.root_cell.cpu_set_size, but with 
wip/coloring branch, it reads 0 bytes from the same config file.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a8a5bcdc-c3b7-459b-9116-fd4a04f2f02a%40googlegroups.com.

------=_Part_5035_510634793.1563643148240
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I am trying to use coloring on m=
y board, using branch wip/coloring, but when i issue &quot;jailhouse enable=
 root_cell.cell&quot;, the console outputs &quot;JAILHOUSE_ENABLE: invalid =
argument&quot;.</div><div><br></div><div>I&#39;ve modified drivers/main.c t=
o printk some steps, and i&#39;ve noticied that the jailhouse.ko generated =
from wip/coloring branch doesn&#39;t get the right value for=C2=A0config_he=
ader.root_cell.cpu_set_size on=C2=A0jailhouse_cmd_enable() function.</div><=
div>The value for config_header.root_cell.cpu_set_size should be 8 bytes (i=
t comes from root cell config file) but somehow it reads 0 bytes.</div><div=
><br></div><div>root cell config file.c</div><blockquote class=3D"gmail_quo=
te" style=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204=
, 204); padding-left: 1ex;">....<br>__u64 cpus[1];<br>...<br>.cpu_set_size =
=3D sizeof(config.cpus);<br>...<br></blockquote><div><br></div><div><br></d=
iv><div>When i use the master branch, within jailhouse_cmd_enable(), it rea=
ds correctly 8 bytes from config_header.root_cell.cpu_set_size, but with wi=
p/coloring branch, it reads 0 bytes from the same config file.</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a8a5bcdc-c3b7-459b-9116-fd4a04f2f02a%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/a8a5bcdc-c3b7-459b-9116-fd4a04f2f02a%40googlegroups.com<=
/a>.<br />

------=_Part_5035_510634793.1563643148240--

------=_Part_5034_525793296.1563643148240--
