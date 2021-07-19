Return-Path: <jailhouse-dev+bncBCOLRK6AS4IRBBFM22DQMGQEQCFEZOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73c.google.com (mail-qk1-x73c.google.com [IPv6:2607:f8b0:4864:20::73c])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C493CD966
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jul 2021 17:11:01 +0200 (CEST)
Received: by mail-qk1-x73c.google.com with SMTP id u14-20020a05620a120eb02903b8bd5c7d95sf9125656qkj.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Jul 2021 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tSZu77kzUUL0LKwo+anGngtCKiXpz6fKGUEMROhx6GE=;
        b=exK983ZDy9UChGw6slYo0bO48BR0fzZLaT5u9tRBFp264qVQfal98IXJdzpdRT35TD
         97X+Bl0E24ZD6cGMAbz+0v5zWHD+N+3G1peQ3PJJU9jLuf/joISPj0o3FKmLAGCILfGK
         QPMO8rHYk4pWVfKqPCNte/2p2p+QJ7sMK5YcE5vsz3hV5+UaaAAxBosEmvS3QCFrhHgY
         u7aNYC/azKDahfzuhFJqupgplJRUyEUcaGIEStqmJpTAw7dx2my8WOwTv/YT2zLsXnUN
         aLuF7r8/MHkzt9FG4GhbNrXv51fLlIiDykeQzHBhvm8N6vHAQdxoMmR1+2j/VSfdtSH2
         PpDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tSZu77kzUUL0LKwo+anGngtCKiXpz6fKGUEMROhx6GE=;
        b=fhCrc9luGvgnl7tRyV2LaLpIpA2MZRj/Iu3MO5XhAC/ce3JSlMpULibT+BCgtPOapO
         iD4Os8UyVTxXg8D4c4M0d10PLg8Kk+jz7AvsnIZQtTR40OwyzU9gr505jJRcg1VFGWER
         ZlD+33Jd+wQQyuxB/sPMkyovvDt4U/n+xpLhF4mLtVIIGEuK2BDBeZgsjdAhMJnqfEAv
         JSWU2eXn/kzZUlWDDSiNgQ5fBgNQlIZ80aEdjN0sCQ8rO2D0DSQQyadvFYIQjgWo1vP8
         vJTA8yx30uERNZYVzm3ldINsi4AXvLWnCwwRkSH56Q5xCR5KrWDznO0n4CIDmE9MDPnN
         hF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tSZu77kzUUL0LKwo+anGngtCKiXpz6fKGUEMROhx6GE=;
        b=of56/y18VG0sXyJYOEBCEK+9gNvY/zrrbf+Uq6BC5isd+XWIhb0SXRoiYGNWFVaaC+
         xAmG2IdrG5wTiCb9wbQkSKYqVRdc76954/2mlVtmFYI99lK2tJAtkifdvrWErxp+AOCT
         lCvnkvTP/1yhMYiVhgBttyrBk9v0MAQ/uBfmSSswgNZVnpFassqhQfwhU2Rrj43lGR/p
         ZIFf7X0W6GLU2olWym1oezSSCRoys1eVF7iXi5sN92ElIWc5qGWVazFKuAyuVYyeKOaH
         0sqEidA+HXZxNIhrBfhN9cNUYsJu72qqwJGu36JknwwE2rzx9O81tZEjpKgBH5jj5NBz
         xyqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531q7OX9Q+vgCTz1oUcJQyLnr02g4KX3BQ7h2SLEvDwJ2PEDccLI
	dnOH365t58bWp4r2jYE3Rz8=
X-Google-Smtp-Source: ABdhPJyGbleGH2m0QEUwDueM4emnSzsVtqqOyPKUDaliKxBjBi3dlyIJFM/OpzGe8jV76nny0/HEyA==
X-Received: by 2002:a05:620a:749:: with SMTP id i9mr24624002qki.307.1626707460706;
        Mon, 19 Jul 2021 08:11:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5c15:: with SMTP id i21ls10552226qti.2.gmail; Mon, 19
 Jul 2021 08:11:00 -0700 (PDT)
X-Received: by 2002:ac8:521a:: with SMTP id r26mr21512567qtn.361.1626707460029;
        Mon, 19 Jul 2021 08:11:00 -0700 (PDT)
Date: Mon, 19 Jul 2021 08:10:59 -0700 (PDT)
From: =?UTF-8?B?546L5paH56u5?= <wenzhuw@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <fc0f1d1e-0132-4c13-a98f-eb50679447a0n@googlegroups.com>
Subject: =?UTF-8?Q?cell.c:243:10:_error:_implicit_dec?=
 =?UTF-8?Q?laration_of_function_=E2=80=98remove=5Fcpu=E2=80=99;?=
 =?UTF-8?Q?_did_you_mean_=E2=80=98register=5Fcpu=E2=80=99=3F_[-We?=
 =?UTF-8?Q?rror=3Dimplicit-function-declaration]?=
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4464_8979387.1626707459404"
X-Original-Sender: WenzhuW@gmail.com
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

------=_Part_4464_8979387.1626707459404
Content-Type: multipart/alternative; 
	boundary="----=_Part_4465_983677892.1626707459405"

------=_Part_4465_983677892.1626707459405
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm working with Jailhouse for linux 5.10.50, which is downloaded by "git=
=20
clone --depth=3D1 https://github.com/raspberrypi/linux".

However, when I try "make KDIR=3D../linux" in jailhouse, the following=20
information output:

CC [M]  /home/pi/Downloads/jailhouse/driver/cell.o

*/home/pi/Downloads/jailhouse/driver/cell.c:* In function =E2=80=98
*jailhouse_cmd_cell_create*=E2=80=99:

*/home/pi/Downloads/jailhouse/driver/cell.c:243:10:* *error: *implicit=20
declaration of function =E2=80=98*remove_cpu*=E2=80=99; did you mean =E2=80=
=98*register_cpu*=E2=80=99? [
*-Werror=3Dimplicit-function-declaration*]

    err =3D *remove_cpu*(cpu);

          *^~~~~~~~~~*

          register_cpu

cc1: some warnings being treated as errors

make[3]: *** [scripts/Makefile.build:280:=20
/home/pi/Downloads/jailhouse/driver/cell.o] Error 1

make[2]: *** [scripts/Makefile.build:497:=20
/home/pi/Downloads/jailhouse/driver] Error 2

make[1]: *** [Makefile:1824: /home/pi/Downloads/jailhouse] Error 2

make: *** [Makefile:40: modules] Error 2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/fc0f1d1e-0132-4c13-a98f-eb50679447a0n%40googlegroups.com.

------=_Part_4465_983677892.1626707459405
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm working with Jailhouse for linux 5.10.50, which is downloaded by "git c=
lone --depth=3D1 https://github.com/raspberrypi/linux".<div><br></div><div>=
However, when I try "make KDIR=3D../linux" in jailhouse, the following info=
rmation output:</div><div><br></div><div>CC [M]&nbsp; /home/pi/Downloads/ja=
ilhouse/driver/cell.o<br></div><div>
<p><b>/home/pi/Downloads/jailhouse/driver/cell.c:</b> In function =E2=80=98=
<b>jailhouse_cmd_cell_create</b>=E2=80=99:</p>
<p><b>/home/pi/Downloads/jailhouse/driver/cell.c:243:10:</b> <b>error: </b>=
implicit declaration of function =E2=80=98<b>remove_cpu</b>=E2=80=99; did y=
ou mean =E2=80=98<b>register_cpu</b>=E2=80=99? [<b>-Werror=3Dimplicit-funct=
ion-declaration</b>]</p>
<p>&nbsp; &nbsp; err =3D <b>remove_cpu</b>(cpu);</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <b>^~~~~~~~~~</b></p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; register_cpu</p>
<p>cc1: some warnings being treated as errors</p>
<p>make[3]: *** [scripts/Makefile.build:280: /home/pi/Downloads/jailhouse/d=
river/cell.o] Error 1</p>
<p>make[2]: *** [scripts/Makefile.build:497: /home/pi/Downloads/jailhouse/d=
river] Error 2</p>
<p>make[1]: *** [Makefile:1824: /home/pi/Downloads/jailhouse] Error 2</p>
<p>make: *** [Makefile:40: modules] Error 2</p></div>





<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/fc0f1d1e-0132-4c13-a98f-eb50679447a0n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/fc0f1d1e-0132-4c13-a98f-eb50679447a0n%40googlegroups.co=
m</a>.<br />

------=_Part_4465_983677892.1626707459405--

------=_Part_4464_8979387.1626707459404--
