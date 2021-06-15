Return-Path: <jailhouse-dev+bncBCF23YV2QAERBB5XUCDAMGQEFSGLEHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3e.google.com (mail-qv1-xf3e.google.com [IPv6:2607:f8b0:4864:20::f3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 736A03A74DC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Jun 2021 05:16:24 +0200 (CEST)
Received: by mail-qv1-xf3e.google.com with SMTP id br4-20020ad446a40000b029021addf7b587sf28949271qvb.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Jun 2021 20:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iAdw+XcGOrecCS0PywnnGiMGfUdWq4/yCyOZkQKtfgk=;
        b=Bns6j02DS7At7sJ03Ko8QJA5tUVCiGBhslh7TOe42zBFjIZCv45QghvBzBWcNDli12
         Em0KQdKxro49dbWfy2F5AtyYEIC8dRzyovH7YqlPtaQ2pzdVtuSLJPUn0IMVQy15WrSh
         DLypbMevlGTGyoM/dQ2efbuVRGG9uzE6EWCGC2LiCpoEK7KM5554z5qNrs2gn4U+7Qp3
         tp0ryJ7PMoVNBqJkABSQO+wPKtQn7E1dmD3tjh9roPP/E1m9/wSG4bxKxx1LFgVYN5EO
         o1EInoxnYJWcF3wUSFDDs0Jaxx8Gm2gmB2Xn7ddPuHSdIn94IXrJ7MyB2zzp7wWtk7qU
         Hfdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iAdw+XcGOrecCS0PywnnGiMGfUdWq4/yCyOZkQKtfgk=;
        b=W6lKNypG50JDo2gxhLZ+miw1H/qDQNKrXLvhFK8AJ8H3ERR5vmY0IdY5pgInyYSkO8
         +tW1ijdkStrAVNbis1/cAr/YqbbuX96cVSx5HSeGIdsSqs2MEIvQdIG9FaoIGE4JYFSn
         O+IO4GC+aBV8L362vy7Uw6Gk4XBOXXB7xmiNyl/iTNUEEidyucwEycDxoh/DWwd9RQGJ
         WqivqYAEj1lWdnjkwxHVCmHy2YT5PnL9+7xPus7G+BOlEGFsdCIJvmrOZT4BRJbpfmMw
         e4ubIdnLyUSP4A3cZRpbKTGT4SrdjZcCbMVjhsK2oVtdcLVFuV83aec/aQO3tHT+0Lj4
         lZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iAdw+XcGOrecCS0PywnnGiMGfUdWq4/yCyOZkQKtfgk=;
        b=e3+HoyFigsysmWy6epfC93tuCYetTNBq4bvdoKXnGJ4l4plb15xVW7UNn8lVYt6If2
         8DbVCV5uvFvVwFdFlG0l1SJl4v3YYrTu8v5Z1RyWXDTfUczM1YeLTMYw+VRMOaewuxXo
         w4l5XJrRD50+AGzzKB4PR93Yh36+WYqgXvb1M1Oqaey/jIH7/PWj/zgCQHm4oo8CLicj
         Z1v8lgnnycAZKCG0o12ApBvsUvbAfrXWwooHm4Iv2J1rL+B/p1LA3oKXoIhSX2kVTMGC
         AByCx0YH8CPcbbxjlpw2h36hyQgvJy7Vw8q9b5cm6Ja01+RXHUkdj8xprnZhFqW6Z3EC
         FFZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ZK61KKQaGzEzZ1ttxItJa0jy2oQHV7S2eEXkFG7zLcBb2W/IW
	EB7x/dugLLgomp4ezzNARYw=
X-Google-Smtp-Source: ABdhPJw567ZbVoFJP8zLDG9n3V7fiHsX7i837Sco89lfipbZPYYWvbT4ugp54pfUktNzTz1L5mRcYA==
X-Received: by 2002:ac8:7ee9:: with SMTP id r9mr1760105qtc.68.1623726983450;
        Mon, 14 Jun 2021 20:16:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:46cf:: with SMTP id t198ls3633093qka.0.gmail; Mon, 14
 Jun 2021 20:16:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2f3:: with SMTP id a19mr19549275qko.272.1623726982928;
        Mon, 14 Jun 2021 20:16:22 -0700 (PDT)
Date: Mon, 14 Jun 2021 20:16:22 -0700 (PDT)
From: =?UTF-8?B?5pyx6Iul5Yeh?= <zhuzhuzhuzai@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cff6a936-9db1-4edd-bf86-236b7277dea9n@googlegroups.com>
Subject: arm64 config of jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4002_1531167543.1623726982345"
X-Original-Sender: zhuzhuzhuzai@gmail.com
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

------=_Part_4002_1531167543.1623726982345
Content-Type: multipart/alternative; 
	boundary="----=_Part_4003_1696776473.1623726982345"

------=_Part_4003_1696776473.1623726982345
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can someone have ability to write the config of dragonboard 845c or via the=
=20
/proc/iomem and dts .I use the autojail to get the config automatically=EF=
=BC=8Cbut=20
fail to enable jailhouse .=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cff6a936-9db1-4edd-bf86-236b7277dea9n%40googlegroups.com.

------=_Part_4003_1696776473.1623726982345
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can someone have ability to write the config of dragonboard 845c or via the=
 /proc/iomem and dts .I use the autojail to get the config automatically=EF=
=BC=8Cbut fail to enable jailhouse .&nbsp;

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cff6a936-9db1-4edd-bf86-236b7277dea9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cff6a936-9db1-4edd-bf86-236b7277dea9n%40googlegroups.co=
m</a>.<br />

------=_Part_4003_1696776473.1623726982345--

------=_Part_4002_1531167543.1623726982345--
