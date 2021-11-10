Return-Path: <jailhouse-dev+bncBCIJHPG524PBB3XKV2GAMGQEW7HPWVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x738.google.com (mail-qk1-x738.google.com [IPv6:2607:f8b0:4864:20::738])
	by mail.lfdr.de (Postfix) with ESMTPS id C31EF44C0B9
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 13:05:03 +0100 (CET)
Received: by mail-qk1-x738.google.com with SMTP id br11-20020a05620a460b00b004630d0237f2sf1646307qkb.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Nov 2021 04:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nSITXQBwiXZD7CJKtQcnDgrvtJlgGr8t59EvHYqgKSw=;
        b=RtO66mnjK3W8/sFxO6yJTfL1D6HtvK3YRz0uSEzqVYw2vhUqEPtLh+iUaccIOewKBv
         BuhAJXSrO2i+/d5w1C9+2nTgWfpDE5slWhNYmRoQPpDjFEeFxto17y67PBuCKdqqRhrT
         cx+5rNzGUdf59fLt1hPAv6gN0JO/Y3M7Hn4jHad1bPZ4twUXeDUzzfZbatsP/1CZwzMn
         PvIirMdyVgu/KEgOIZ8Ywg6Cj1VYK7+kPLR3nsoTYoGZDQ/OifvflZ1pHFyFoEXPVSxx
         FqYppFGJsrzS5ayzCPMn8bXtOT19llzkny58o9FmUVNtmWGfgQkMOwevi8Kb4YIQnJFL
         a0zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nSITXQBwiXZD7CJKtQcnDgrvtJlgGr8t59EvHYqgKSw=;
        b=MEdGfov4Alavteaod56BYJspKKlDCVjLBwtE8BlWqzqUfok4c/Aikv3GWu7cSOI8LD
         OQk6Lbeoe1Nc7bM3VRBXUytDkB+JOGtThHmzU/H4PVXR3FRf9HcC5yASmLHvhreUi3xb
         VzL2zk4q/XGXDoPn2mg6fNUxIsuTsI4nPTHoAcDrVwFJ8vMqPZZgVayxuQ7q9uew9H7D
         h+eHxzti535vJU6Nx3VkC6/krqAqa6kby6tFTctChkE4PSz4T++UDTVDfvyP5c9KUbKf
         c6efkhAQ12t6UTVNJRQid7qWx7iHTJU/vgFwVS1D0oWkPIQtkyjDwkFnQKQRTNzVD9qX
         kQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nSITXQBwiXZD7CJKtQcnDgrvtJlgGr8t59EvHYqgKSw=;
        b=JNGNhUlgpjao2zfk4ZWkF2AN74WDHU3oEK3BW4+P8ksJfm3fxaKRW/mSw+n5hnbJC9
         35Y/TUBd7bTG0u+kyRk3uDAnShID9lrCCLfzHg/Eima87bnIv3YAJywCt4LpAhuWdJFY
         C+bp2SRsX4ezTmi7zAIk7/cnWNPAm7L+BlbNDOP2sjkyO0lq9rnb+y9uIayRPP1CS+Gb
         OsTSgu2v2+82JCZFSJI6G2RxqU4TEwH8M4RcVyFK7bAEM17ZB/CfcgjDKiwJigdFmXwH
         aMsPmT706pb1PZBuJM7VyOecfb56TRDG/ef8FxemlQ2mNx4L9Uv/i7XEV911U8j+AenD
         N9Lg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530H8L5R4c5Gk5maJfdd8VVvYgdbrP8j0Yluj3mo8IWp7Ob/j+RO
	LixVmBaKGQfuFV/jiyZS5Os=
X-Google-Smtp-Source: ABdhPJxbstwxIvMTQ2ZStjPkM6AAvlXRRMnVdQ3tNwnKaiv8ihuWw4hg8vQVjykGISrJVM4lGo66Zg==
X-Received: by 2002:a05:622a:11d6:: with SMTP id n22mr17070956qtk.3.1636545902597;
        Wed, 10 Nov 2021 04:05:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1926:: with SMTP id bj38ls3093320qkb.7.gmail; Wed,
 10 Nov 2021 04:05:02 -0800 (PST)
X-Received: by 2002:ae9:de02:: with SMTP id s2mr12223060qkf.215.1636545901873;
        Wed, 10 Nov 2021 04:05:01 -0800 (PST)
Date: Wed, 10 Nov 2021 04:05:01 -0800 (PST)
From: Andrea Marchetta <marchetta.andrea@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <5e84c231-838f-433d-b584-5876c477087dn@googlegroups.com>
Subject: implicit declaration of add_cpu and remove_cpu
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5628_1390786771.1636545901255"
X-Original-Sender: marchetta.andrea@gmail.com
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

------=_Part_5628_1390786771.1636545901255
Content-Type: multipart/alternative; 
	boundary="----=_Part_5629_2032163944.1636545901255"

------=_Part_5629_2032163944.1636545901255
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi, i'm currently using the 5.10 version of jailhouse enabling linux and=20
the master branch of jailhouse. when trying to compile jailhouse in the=20
linux kernel i get the following error:
error: implicit declaration of
function =E2=80=98remove_cpu=E2=80=99 [-Werror=3Dimplicit-function-declarat=
ion]=20
 243 |    err =3D remove_cpu(cpu);=20
     |          ^~~~~~~~~~=20
error: implicit declaration of
function =E2=80=98add_cpu=E2=80=99 [-Werror=3Dimplicit-function-declaration=
]=20
 272 |   if (!cpu_online(cpu) && add_cpu(cpu) =3D=3D 0)=20
     |                           ^~~~~~~=20
cc1: some warnings being treated as errors

any clue what's the issue?

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5e84c231-838f-433d-b584-5876c477087dn%40googlegroups.com.

------=_Part_5629_2032163944.1636545901255
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hi, i'm currently using the 5.10 version of jailhouse enabling linux and th=
e master branch of jailhouse. when trying to compile jailhouse in the linux=
 kernel i get the following error:<br><span style=3D"font-weight: bold;">er=
ror: </span>implicit declaration of<br> function =E2=80=98<span style=3D"fo=
nt-weight: bold;">remove_cpu</span>=E2=80=99 [<span style=3D"font-weight: b=
old;">-Werror=3Dimplicit-function-declaration</span>]
<br> &nbsp;243 | &nbsp;&nbsp;&nbsp;err =3D <span style=3D"font-weight: bold=
;">remove_cpu</span>(cpu);
<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;<span style=3D"font-weight: bold;">^~~~~~~~~~</span>
<br><span style=3D"font-weight: bold;">error: </span>implicit declaration o=
f<br> function =E2=80=98<span style=3D"font-weight: bold;">add_cpu</span>=
=E2=80=99 [<span style=3D"font-weight: bold;">-Werror=3Dimplicit-function-d=
eclaration</span>]
<br> &nbsp;272 | &nbsp;&nbsp;if (!cpu_online(cpu) &amp;&amp; <span style=3D=
"font-weight: bold;">add_cpu</span>(cpu) =3D=3D 0)
<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=3D"font-weight: bold=
;">^~~~~~~</span>
<br>cc1: some warnings being treated as errors<br>
<br><div>any clue what's the issue?</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5e84c231-838f-433d-b584-5876c477087dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/5e84c231-838f-433d-b584-5876c477087dn%40googlegroups.co=
m</a>.<br />

------=_Part_5629_2032163944.1636545901255--

------=_Part_5628_1390786771.1636545901255--
